import SwiftUI

struct PowerUpShopSection: View {
    let gameVM: GameViewModel
    let onPurchase: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            FunSectionHeader(icon: "bolt.circle.fill", title: "Quiz Power-Ups", color: AppTheme.warningYellow)

            Text("Use power-ups during quizzes to gain an edge!")
                .font(AppTheme.funFont(.subheadline, weight: .medium))
                .foregroundStyle(.secondary)

            ForEach(PowerUpType.allCases, id: \.rawValue) { type in
                PowerUpShopCard(
                    type: type,
                    gameVM: gameVM,
                    onPurchase: onPurchase
                )
            }
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.warningYellow.opacity(0.5))
    }
}

struct PowerUpShopCard: View {
    let type: PowerUpType
    let gameVM: GameViewModel
    let onPurchase: (String) -> Void

    private var isUnlocked: Bool { gameVM.isPowerUpUnlocked(type) }
    private var currentCount: Int { gameVM.powerUpCount(for: type) }
    private var maxCap: Int { gameVM.powerUpMaxCapacity(for: type) }
    private var isEnhanced: Bool { gameVM.powerUpInventory.isEnhanced(type) }
    private var isFull: Bool { currentCount >= maxCap }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(iconColor.opacity(0.15))
                        .frame(width: 56, height: 56)
                    if type.usesCustomImage {
                        Image(type.customImageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 144, height: 144)
                            .opacity(isUnlocked ? 1.0 : 0.5)
                    } else {
                        Image(systemName: type.iconName)
                            .font(.title2)
                            .foregroundStyle(isUnlocked ? iconColor : .secondary)
                    }
                }

                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 6) {
                        Text(type.displayName)
                            .font(AppTheme.funFont(.subheadline, weight: .bold))
                        if isEnhanced {
                            Text("ENHANCED")
                                .font(.system(size: 8, weight: .heavy, design: .rounded))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(AppTheme.xpPurple)
                                .clipShape(Capsule())
                        }
                    }
                    Text(type.description)
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                }

                Spacer()

                VStack(spacing: 2) {
                    Text("\(currentCount)/\(maxCap)")
                        .font(.system(size: 14, weight: .heavy, design: .rounded))
                        .foregroundStyle(isFull ? AppTheme.successGreen : .primary)
                    Text("Stock")
                        .font(.system(size: 9, weight: .bold, design: .rounded))
                        .foregroundStyle(.secondary)
                }
            }

            if !isUnlocked {
                HStack(spacing: 8) {
                    Image(systemName: "lock.fill")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text("Requires \(type.streakRequirement)-day streak")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(.secondary)
                    Spacer()
                    HStack(spacing: 4) {
                        Image(systemName: "flame.fill")
                            .font(.caption2)
                            .foregroundStyle(AppTheme.accentOrange)
                        Text("\(gameVM.currentStreak)/\(type.streakRequirement)")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                            .foregroundStyle(AppTheme.accentOrange)
                    }
                }
                .padding(10)
                .background(Color(.quaternarySystemFill))
                .clipShape(.rect(cornerRadius: 10))
            } else {
                HStack(spacing: 8) {
                    Button {
                        if gameVM.purchasePowerUp(type) {
                            onPurchase("Purchased \(type.displayName)! (\(gameVM.powerUpCount(for: type))/\(gameVM.powerUpMaxCapacity(for: type)))")
                        }
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "bitcoinsign.circle.fill")
                                .font(.caption)
                            Text("\(type.purchasePrice)")
                                .font(AppTheme.funFont(.caption, weight: .heavy))
                        }
                        .foregroundStyle(canBuyItem ? AppTheme.accentOrange : .secondary)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(canBuyItem ? AppTheme.accentOrange.opacity(0.12) : Color(.quaternarySystemFill))
                        .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                    .disabled(!canBuyItem)

                    if isFull {
                        Text("Full")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                            .foregroundStyle(AppTheme.successGreen)
                    }

                    Spacer()

                    if !isEnhanced {
                        Button {
                            if gameVM.purchasePowerUpEnhancement(type) {
                                onPurchase("\(type.displayName) enhanced! Max capacity increased to \(gameVM.powerUpMaxCapacity(for: type)).")
                            }
                        } label: {
                            HStack(spacing: 4) {
                                Image(systemName: "arrow.up.circle.fill")
                                    .font(.caption)
                                Image(systemName: "bitcoinsign.circle.fill")
                                    .font(.system(size: 9))
                                Text("\(type.enhancementPrice)")
                                    .font(AppTheme.funFont(.caption, weight: .heavy))
                            }
                            .foregroundStyle(canBuyEnhancement ? AppTheme.xpPurple : .secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(canBuyEnhancement ? AppTheme.xpPurple.opacity(0.12) : Color(.quaternarySystemFill))
                            .clipShape(Capsule())
                        }
                        .buttonStyle(.plain)
                        .disabled(!canBuyEnhancement)
                    }
                }
            }
        }
        .padding(14)
        .background(Color(.tertiarySystemFill))
        .clipShape(.rect(cornerRadius: 14))
        .opacity(isUnlocked ? 1.0 : 0.7)
    }

    private var canBuyItem: Bool {
        isUnlocked && !isFull && gameVM.coins >= type.purchasePrice
    }

    private var canBuyEnhancement: Bool {
        isUnlocked && !isEnhanced && gameVM.coins >= type.enhancementPrice
    }

    private var iconColor: Color {
        switch type {
        case .fiftyFifty: AppTheme.primaryBlue
        case .shieldHeart: AppTheme.successGreen
        case .pharmaVision: AppTheme.warningYellow
        }
    }
}
