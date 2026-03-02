import SwiftUI

struct AvatarDisplayView: View {
    let animal: String
    let eyes: String
    let mouth: String
    let accessory: String
    let size: CGFloat

    private var layout: AvatarFaceLayout {
        AvatarShop.faceLayout(for: animal)
    }

    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [AppTheme.primaryBlue.opacity(0.15), AppTheme.xpPurple.opacity(0.1)],
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
                .frame(width: size, height: size)

            if let url = AvatarShop.animalImageURL(for: animal), let imageURL = URL(string: url) {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: size * 0.85, height: size * 0.85)
                    } else {
                        Image(systemName: "hare.fill")
                            .font(.system(size: size * 0.35))
                            .foregroundStyle(AppTheme.primaryBlue)
                    }
                }
            } else {
                Image(systemName: "hare.fill")
                    .font(.system(size: size * 0.35))
                    .foregroundStyle(AppTheme.primaryBlue)
            }

            if let eyeURL = AvatarShop.eyesImageURL(for: eyes), let imageURL = URL(string: eyeURL) {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: size * layout.eyesWidth, height: size * layout.eyesHeight)
                            .offset(y: size * layout.eyesOffsetY)
                    }
                }
            }

            if let mouthURL = AvatarShop.mouthImageURL(for: mouth), let imageURL = URL(string: mouthURL) {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: size * layout.mouthWidth, height: size * layout.mouthHeight)
                            .offset(y: size * layout.mouthOffsetY)
                    }
                }
            }

            if accessory != "none", let acc = AvatarShop.accessories.first(where: { $0.id == accessory }) {
                Image(systemName: acc.iconName)
                    .font(.system(size: size * 0.18))
                    .foregroundStyle(AppTheme.warningYellow)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
                    .offset(x: size * 0.28, y: -size * 0.32)
            }
        }
        .clipShape(Circle())
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
        case accessories = "Extras"

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
                ZStack {
                    LinearGradient(
                        colors: [AppTheme.primaryBlue.opacity(0.15), AppTheme.xpPurple.opacity(0.1)],
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )

                    VStack(spacing: 16) {
                        AvatarDisplayView(
                            animal: selectedAnimal,
                            eyes: selectedEyes,
                            mouth: selectedMouth,
                            accessory: selectedAccessory,
                            size: 280
                        )

                        CoinDisplay(amount: gameVM.coins)
                    }
                }
                .frame(height: 380)

                HStack(spacing: 0) {
                    ForEach(AvatarTab.allCases, id: \.self) { tab in
                        Button {
                            withAnimation(.spring(duration: 0.25)) { selectedTab = tab }
                        } label: {
                            VStack(spacing: 4) {
                                Image(systemName: tab.icon)
                                    .font(.subheadline)
                                Text(tab.rawValue)
                                    .font(.caption2.weight(.bold))
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
                .padding(.top, 8)

                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))], spacing: 12) {
                        switch selectedTab {
                        case .animals:
                            ForEach(AvatarShop.animals) { animal in
                                AnimalAvatarCard(
                                    animal: animal,
                                    isSelected: selectedAnimal == animal.id,
                                    isOwned: gameVM.ownedAvatars.contains(animal.id)
                                ) {
                                    handlePurchase(itemId: animal.id, price: animal.price, category: .animals)
                                }
                            }
                        case .eyes:
                            ForEach(AvatarShop.eyes) { eye in
                                EyesMouthCard(
                                    imageURL: eye.imageURL,
                                    name: eye.name,
                                    price: eye.price,
                                    isSelected: selectedEyes == eye.id,
                                    isOwned: gameVM.ownedEyes.contains(eye.id),
                                    isNone: eye.id == "none"
                                ) {
                                    handlePurchase(itemId: eye.id, price: eye.price, category: .eyes)
                                }
                            }
                        case .mouths:
                            ForEach(AvatarShop.mouths) { mouth in
                                EyesMouthCard(
                                    imageURL: mouth.imageURL,
                                    name: mouth.name,
                                    price: mouth.price,
                                    isSelected: selectedMouth == mouth.id,
                                    isOwned: gameVM.ownedMouths.contains(mouth.id),
                                    isNone: mouth.id == "none"
                                ) {
                                    handlePurchase(itemId: mouth.id, price: mouth.price, category: .mouths)
                                }
                            }
                        case .accessories:
                            ForEach(AvatarShop.accessories) { acc in
                                AccessoryCard(
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
            .navigationTitle("Your Avatar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        gameVM.avatarAnimal = selectedAnimal
                        gameVM.avatarEyes = selectedEyes
                        gameVM.avatarMouth = selectedMouth
                        gameVM.avatarAccessory = selectedAccessory
                        gameVM.save()
                        gameVM.syncToCloud()
                        dismiss()
                    }
                    .font(.headline)
                    .foregroundStyle(AppTheme.primaryBlue)
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
            withAnimation(.spring(duration: 0.3)) {
                switch category {
                case .animals: selectedAnimal = itemId
                case .eyes: selectedEyes = itemId
                case .mouths: selectedMouth = itemId
                case .accessories: selectedAccessory = itemId
                }
            }
            return
        }

        guard gameVM.spendCoins(price) else {
            purchaseMessage = "Not enough coins! You need \(price) coins."
            showPurchaseAlert = true
            return
        }

        withAnimation(.spring(duration: 0.3)) {
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
        }
        gameVM.save()
        purchaseMessage = "Unlocked! Tap Save to keep changes."
        showPurchaseAlert = true
    }
}

struct AnimalAvatarCard: View {
    let animal: AvatarAnimal
    let isSelected: Bool
    let isOwned: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                ZStack {
                    Circle()
                        .fill(isSelected ? AppTheme.primaryBlue.opacity(0.15) : Color(.tertiarySystemFill))
                        .frame(width: 64, height: 64)

                    if let url = URL(string: animal.imageURL) {
                        AsyncImage(url: url) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 52, height: 52)
                            } else {
                                ProgressView()
                                    .frame(width: 52, height: 52)
                            }
                        }
                    }

                    if !isOwned {
                        Circle()
                            .fill(.black.opacity(0.3))
                            .frame(width: 64, height: 64)
                        Image(systemName: "lock.fill")
                            .font(.caption)
                            .foregroundStyle(.white)
                    }
                }

                Text(animal.name)
                    .font(.caption2.weight(.bold))
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                if isOwned {
                    Text(isSelected ? "Selected" : "Owned")
                        .font(.caption2)
                        .foregroundStyle(isSelected ? AppTheme.primaryBlue : AppTheme.successGreen)
                } else {
                    HStack(spacing: 2) {
                        Image(systemName: "bitcoinsign.circle.fill")
                            .font(.caption2)
                            .foregroundStyle(AppTheme.accentOrange)
                        Text("\(animal.price)")
                            .font(.caption2.weight(.bold))
                    }
                }
            }
            .padding(8)
            .background(isSelected ? AppTheme.primaryBlue.opacity(0.05) : .clear)
            .clipShape(.rect(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? AppTheme.primaryBlue : .clear, lineWidth: 2.5)
            )
        }
        .buttonStyle(.plain)
    }
}

struct EyesMouthCard: View {
    let imageURL: String
    let name: String
    let price: Int
    let isSelected: Bool
    let isOwned: Bool
    let isNone: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(isSelected ? AppTheme.primaryBlue.opacity(0.12) : Color(.tertiarySystemFill))
                        .frame(width: 64, height: 64)

                    if isNone {
                        Image(systemName: "circle.slash")
                            .font(.title2)
                            .foregroundStyle(.secondary)
                    } else if let url = URL(string: imageURL) {
                        AsyncImage(url: url) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                            } else {
                                ProgressView()
                                    .frame(width: 50, height: 50)
                            }
                        }
                    }

                    if !isOwned && !isNone {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.black.opacity(0.25))
                            .frame(width: 64, height: 64)
                        Image(systemName: "lock.fill")
                            .font(.caption)
                            .foregroundStyle(.white)
                    }
                }

                Text(name)
                    .font(.caption2.weight(.bold))
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                if isOwned || isNone {
                    Text(isSelected ? "Selected" : (isNone ? "Free" : "Owned"))
                        .font(.caption2)
                        .foregroundStyle(isSelected ? AppTheme.primaryBlue : AppTheme.successGreen)
                } else {
                    HStack(spacing: 2) {
                        Image(systemName: "bitcoinsign.circle.fill")
                            .font(.caption2)
                            .foregroundStyle(AppTheme.accentOrange)
                        Text("\(price)")
                            .font(.caption2.weight(.bold))
                    }
                }
            }
            .padding(8)
            .background(isSelected ? AppTheme.primaryBlue.opacity(0.05) : .clear)
            .clipShape(.rect(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? AppTheme.primaryBlue : .clear, lineWidth: 2.5)
            )
        }
        .buttonStyle(.plain)
    }
}

struct AccessoryCard: View {
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
                    .font(.caption2.weight(.bold))
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                if isOwned {
                    Text(isSelected ? "Selected" : "Owned")
                        .font(.caption2)
                        .foregroundStyle(isSelected ? AppTheme.primaryBlue : AppTheme.successGreen)
                } else if price > 0 {
                    HStack(spacing: 2) {
                        Image(systemName: "bitcoinsign.circle.fill")
                            .font(.caption2)
                            .foregroundStyle(AppTheme.accentOrange)
                        Text("\(price)")
                            .font(.caption2.weight(.bold))
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
