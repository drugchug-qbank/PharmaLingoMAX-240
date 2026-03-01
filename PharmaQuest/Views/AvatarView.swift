import SwiftUI

struct AvatarDisplayView: View {
    let animal: String
    let eyes: String
    let mouth: String
    let accessory: String
    let size: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [AppTheme.primaryBlue.opacity(0.2), AppTheme.xpPurple.opacity(0.15)],
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
                .frame(width: size, height: size)

            Image(systemName: animal)
                .font(.system(size: size * 0.4))
                .foregroundStyle(AppTheme.primaryBlue)

            if accessory != "none", let acc = AvatarShop.accessories.first(where: { $0.id == accessory }) {
                Image(systemName: acc.iconName)
                    .font(.system(size: size * 0.18))
                    .foregroundStyle(AppTheme.warningYellow)
                    .offset(x: size * 0.25, y: -size * 0.3)
            }

            if eyes != "default", let eyeItem = AvatarShop.eyes.first(where: { $0.id == eyes }) {
                Image(systemName: eyeItem.iconName)
                    .font(.system(size: size * 0.12))
                    .foregroundStyle(AppTheme.accentOrange)
                    .offset(y: -size * 0.08)
            }
        }
    }
}

struct AvatarCustomizationView: View {
    let gameVM: GameViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTab: AvatarTab = .animals
    @State private var selectedAnimal: String
    @State private var selectedEyes: String
    @State private var selectedMouth: String
    @State private var selectedAccessory: String
    @State private var showPurchaseAlert: Bool = false
    @State private var purchaseMessage: String = ""

    enum AvatarTab: String, CaseIterable {
        case animals = "Animals"
        case eyes = "Eyes"
        case mouths = "Mouths"
        case accessories = "Accessories"

        var icon: String {
            switch self {
            case .animals: "hare.fill"
            case .eyes: "eyes"
            case .mouths: "mouth.fill"
            case .accessories: "crown.fill"
            }
        }
    }

    init(gameVM: GameViewModel) {
        self.gameVM = gameVM
        _selectedAnimal = State(initialValue: gameVM.avatarAnimal)
        _selectedEyes = State(initialValue: gameVM.avatarEyes)
        _selectedMouth = State(initialValue: gameVM.avatarMouth)
        _selectedAccessory = State(initialValue: gameVM.avatarAccessory)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack(spacing: 16) {
                    AvatarDisplayView(
                        animal: selectedAnimal,
                        eyes: selectedEyes,
                        mouth: selectedMouth,
                        accessory: selectedAccessory,
                        size: 120
                    )
                    .padding(.top, 8)

                    CoinDisplay(amount: gameVM.coins)
                }
                .padding(.vertical, 16)

                HStack(spacing: 0) {
                    ForEach(AvatarTab.allCases, id: \.self) { tab in
                        Button {
                            withAnimation(.spring(duration: 0.25)) { selectedTab = tab }
                        } label: {
                            VStack(spacing: 4) {
                                Image(systemName: tab.icon)
                                    .font(.subheadline)
                                Text(tab.rawValue)
                                    .font(.caption2.bold())
                            }
                            .foregroundStyle(selectedTab == tab ? AppTheme.primaryBlue : .secondary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(selectedTab == tab ? AppTheme.primaryBlue.opacity(0.1) : .clear)
                            .clipShape(.rect(cornerRadius: 10))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(4)
                .background(Color(.tertiarySystemFill))
                .clipShape(.rect(cornerRadius: 14))
                .padding(.horizontal)

                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))], spacing: 12) {
                        switch selectedTab {
                        case .animals:
                            ForEach(AvatarShop.animals) { animal in
                                AvatarItemCard(
                                    iconName: animal.iconName,
                                    name: animal.name,
                                    price: animal.price,
                                    isSelected: selectedAnimal == animal.id,
                                    isOwned: gameVM.ownedAvatars.contains(animal.id)
                                ) {
                                    handlePurchase(itemId: animal.id, price: animal.price, category: .animals)
                                }
                            }
                        case .eyes:
                            ForEach(AvatarShop.eyes) { eye in
                                AvatarItemCard(
                                    iconName: eye.iconName,
                                    name: eye.name,
                                    price: eye.price,
                                    isSelected: selectedEyes == eye.id,
                                    isOwned: gameVM.ownedEyes.contains(eye.id)
                                ) {
                                    handlePurchase(itemId: eye.id, price: eye.price, category: .eyes)
                                }
                            }
                        case .mouths:
                            ForEach(AvatarShop.mouths) { mouth in
                                AvatarItemCard(
                                    iconName: mouth.iconName,
                                    name: mouth.name,
                                    price: mouth.price,
                                    isSelected: selectedMouth == mouth.id,
                                    isOwned: gameVM.ownedMouths.contains(mouth.id)
                                ) {
                                    handlePurchase(itemId: mouth.id, price: mouth.price, category: .mouths)
                                }
                            }
                        case .accessories:
                            ForEach(AvatarShop.accessories) { acc in
                                AvatarItemCard(
                                    iconName: acc.iconName,
                                    name: acc.name,
                                    price: acc.price,
                                    isSelected: selectedAccessory == acc.id,
                                    isOwned: gameVM.ownedAccessories.contains(acc.id)
                                ) {
                                    handlePurchase(itemId: acc.id, price: acc.price, category: .accessories)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Customize Avatar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        gameVM.avatarAnimal = selectedAnimal
                        gameVM.avatarEyes = selectedEyes
                        gameVM.avatarMouth = selectedMouth
                        gameVM.avatarAccessory = selectedAccessory
                        gameVM.save()
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
            .alert("Purchase", isPresented: $showPurchaseAlert) {
                Button("OK") {}
            } message: {
                Text(purchaseMessage)
            }
        }
    }

    private func handlePurchase(itemId: String, price: Int, category: AvatarTab) {
        let isOwned: Bool
        switch category {
        case .animals: isOwned = gameVM.ownedAvatars.contains(itemId)
        case .eyes: isOwned = gameVM.ownedEyes.contains(itemId)
        case .mouths: isOwned = gameVM.ownedMouths.contains(itemId)
        case .accessories: isOwned = gameVM.ownedAccessories.contains(itemId)
        }

        if isOwned {
            switch category {
            case .animals: selectedAnimal = itemId
            case .eyes: selectedEyes = itemId
            case .mouths: selectedMouth = itemId
            case .accessories: selectedAccessory = itemId
            }
            return
        }

        guard gameVM.spendCoins(price) else {
            purchaseMessage = "Not enough coins! You need \(price) coins."
            showPurchaseAlert = true
            return
        }

        switch category {
        case .animals:
            gameVM.ownedAvatars.insert(itemId)
            selectedAnimal = itemId
        case .eyes:
            gameVM.ownedEyes.insert(itemId)
            selectedEyes = itemId
        case .mouths:
            gameVM.ownedMouths.insert(itemId)
            selectedMouth = itemId
        case .accessories:
            gameVM.ownedAccessories.insert(itemId)
            selectedAccessory = itemId
        }
        gameVM.save()
        purchaseMessage = "Purchased! Tap Save to apply."
        showPurchaseAlert = true
    }
}

struct AvatarItemCard: View {
    let iconName: String
    let name: String
    let price: Int
    let isSelected: Bool
    let isOwned: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                ZStack {
                    Circle()
                        .fill(isSelected ? AppTheme.primaryBlue.opacity(0.15) : Color(.tertiarySystemFill))
                        .frame(width: 56, height: 56)
                    Image(systemName: iconName)
                        .font(.title2)
                        .foregroundStyle(isSelected ? AppTheme.primaryBlue : .primary)
                }

                Text(name)
                    .font(.caption2.bold())
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                if isOwned {
                    Text("Owned")
                        .font(.caption2)
                        .foregroundStyle(AppTheme.successGreen)
                } else if price > 0 {
                    HStack(spacing: 2) {
                        Image(systemName: "bitcoinsign.circle.fill")
                            .font(.caption2)
                            .foregroundStyle(AppTheme.accentOrange)
                        Text("\(price)")
                            .font(.caption2.bold())
                    }
                } else {
                    Text("Free")
                        .font(.caption2)
                        .foregroundStyle(AppTheme.successGreen)
                }
            }
            .padding(8)
            .background(isSelected ? AppTheme.primaryBlue.opacity(0.05) : .clear)
            .clipShape(.rect(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? AppTheme.primaryBlue : .clear, lineWidth: 2)
            )
        }
        .buttonStyle(.plain)
    }
}
