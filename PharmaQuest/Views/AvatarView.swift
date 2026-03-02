import SwiftUI

struct AvatarDisplayView: View {
    let animal: String
    let eyes: String
    let mouth: String
    let accessory: String
    let bodyColor: String
    let backgroundColor: String
    let size: CGFloat

    init(animal: String, eyes: String, mouth: String, accessory: String, bodyColor: String = "", backgroundColor: String = "", size: CGFloat) {
        self.animal = animal
        self.eyes = eyes
        self.mouth = mouth
        self.accessory = accessory
        self.bodyColor = bodyColor
        self.backgroundColor = backgroundColor
        self.size = size
    }

    private var animalType: AnimalType {
        AnimalType(rawValue: animal) ?? .beaver
    }

    private var eyeStyle: EyeStyle {
        EyeStyle(rawValue: eyes) ?? .normal
    }

    private var mouthStyleValue: MouthStyle {
        MouthStyle(rawValue: mouth) ?? .smile
    }

    private var accessoryType: AccessoryType {
        AccessoryType(rawValue: accessory) ?? .none
    }

    private var resolvedBodyColor: Color {
        if bodyColor.isEmpty {
            return Color(hex: animalType.defaultColorHex)
        }
        return Color(hex: bodyColor)
    }

    private var resolvedBgColor: Color {
        if backgroundColor.isEmpty {
            return Color(hex: "E3F2FD")
        }
        return Color(hex: backgroundColor)
    }

    var body: some View {
        AnimalAvatarView(
            animalType: animalType,
            bodyColor: resolvedBodyColor,
            backgroundColor: resolvedBgColor,
            eyeStyle: eyeStyle,
            mouthStyle: mouthStyleValue,
            accessory: accessoryType,
            size: size
        )
    }
}

struct AvatarCustomizationView: View {
    let gameVM: GameViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTab: AvatarTab = .animals
    @State private var selectedAnimal: AnimalType
    @State private var selectedEyes: EyeStyle
    @State private var selectedMouth: MouthStyle
    @State private var selectedAccessory: AccessoryType
    @State private var selectedBodyColor: String
    @State private var selectedBgColor: String
    @State private var showPurchaseAlert: Bool = false
    @State private var purchaseMessage: String = ""

    enum AvatarTab: String, CaseIterable {
        case animals = "Animal"
        case colors = "Color"
        case background = "BG"
        case eyes = "Eyes"
        case mouths = "Mouth"
        case accessories = "Extras"

        var icon: String {
            switch self {
            case .animals: "hare.fill"
            case .colors: "paintpalette.fill"
            case .background: "square.fill"
            case .eyes: "eyes"
            case .mouths: "mouth.fill"
            case .accessories: "crown.fill"
            }
        }
    }

    init(gameVM: GameViewModel) {
        self.gameVM = gameVM
        _selectedAnimal = State(initialValue: AnimalType(rawValue: gameVM.avatarAnimal) ?? .beaver)
        _selectedEyes = State(initialValue: EyeStyle(rawValue: gameVM.avatarEyes) ?? .normal)
        _selectedMouth = State(initialValue: MouthStyle(rawValue: gameVM.avatarMouth) ?? .smile)
        _selectedAccessory = State(initialValue: AccessoryType(rawValue: gameVM.avatarAccessory) ?? .none)
        _selectedBodyColor = State(initialValue: gameVM.avatarBodyColor.isEmpty ? (AnimalType(rawValue: gameVM.avatarAnimal) ?? .beaver).defaultColorHex : gameVM.avatarBodyColor)
        _selectedBgColor = State(initialValue: gameVM.avatarBgColor.isEmpty ? "E3F2FD" : gameVM.avatarBgColor)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    MeshGradient(
                        width: 3, height: 3,
                        points: [
                            [0, 0], [0.5, 0], [1, 0],
                            [0, 0.5], [0.5, 0.5], [1, 0.5],
                            [0, 1], [0.5, 1], [1, 1]
                        ],
                        colors: [
                            .blue.opacity(0.15), .purple.opacity(0.1), .pink.opacity(0.1),
                            .teal.opacity(0.1), .blue.opacity(0.08), .purple.opacity(0.12),
                            .cyan.opacity(0.1), .blue.opacity(0.1), .indigo.opacity(0.1)
                        ]
                    )

                    VStack(spacing: 12) {
                        AnimalAvatarView(
                            animalType: selectedAnimal,
                            bodyColor: Color(hex: selectedBodyColor),
                            backgroundColor: Color(hex: selectedBgColor),
                            eyeStyle: selectedEyes,
                            mouthStyle: selectedMouth,
                            accessory: selectedAccessory,
                            size: 220
                        )
                        .shadow(color: .black.opacity(0.15), radius: 12, x: 0, y: 6)

                        HStack(spacing: 16) {
                            CoinDisplay(amount: gameVM.coins)
                            Text(selectedAnimal.displayName)
                                .font(AppTheme.funFont(.headline, weight: .bold))
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .frame(height: 310)

                tabBar

                ScrollView {
                    switch selectedTab {
                    case .animals: animalGrid
                    case .colors: colorGrid
                    case .background: backgroundGrid
                    case .eyes: eyeGrid
                    case .mouths: mouthGrid
                    case .accessories: accessoryGrid
                    }
                }
                .scrollIndicators(.hidden)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Your Avatar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        gameVM.avatarAnimal = selectedAnimal.rawValue
                        gameVM.avatarEyes = selectedEyes.rawValue
                        gameVM.avatarMouth = selectedMouth.rawValue
                        gameVM.avatarAccessory = selectedAccessory.rawValue
                        gameVM.avatarBodyColor = selectedBodyColor
                        gameVM.avatarBgColor = selectedBgColor
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

    private var tabBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 4) {
                ForEach(AvatarTab.allCases, id: \.self) { tab in
                    Button {
                        withAnimation(.spring(duration: 0.25)) { selectedTab = tab }
                    } label: {
                        VStack(spacing: 3) {
                            Image(systemName: tab.icon)
                                .font(.caption)
                            Text(tab.rawValue)
                                .font(.caption2.weight(.bold))
                        }
                        .foregroundStyle(selectedTab == tab ? .white : .secondary)
                        .frame(width: 58, height: 46)
                        .background(selectedTab == tab ? AppTheme.primaryBlue : Color(.tertiarySystemFill))
                        .clipShape(.rect(cornerRadius: 10))
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 12)
        }
        .padding(.vertical, 8)
        .background(Color(.secondarySystemGroupedBackground))
    }

    private var animalGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10) {
            ForEach(AnimalType.allCases, id: \.self) { animal in
                let isOwned = gameVM.ownedAvatars.contains(animal.rawValue)
                let isSelected = selectedAnimal == animal
                Button {
                    handleAnimalPurchase(animal: animal, isOwned: isOwned)
                } label: {
                    VStack(spacing: 6) {
                        ZStack {
                            AnimalAvatarView(
                                animalType: animal,
                                bodyColor: Color(hex: animal.defaultColorHex),
                                backgroundColor: Color(hex: "F5F5F5"),
                                eyeStyle: .normal,
                                mouthStyle: .smile,
                                accessory: .none,
                                size: 60
                            )

                            if !isOwned {
                                Circle()
                                    .fill(.black.opacity(0.35))
                                    .frame(width: 60, height: 60)
                                Image(systemName: "lock.fill")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                            }
                        }

                        Text(animal.displayName)
                            .font(.caption2.weight(.bold))
                            .foregroundStyle(.primary)
                            .lineLimit(1)

                        if isOwned {
                            Text(isSelected ? "Selected" : "Owned")
                                .font(.system(size: 9, weight: .semibold))
                                .foregroundStyle(isSelected ? AppTheme.primaryBlue : AppTheme.successGreen)
                        } else {
                            HStack(spacing: 2) {
                                Image(systemName: "bitcoinsign.circle.fill")
                                    .font(.system(size: 9))
                                    .foregroundStyle(AppTheme.accentOrange)
                                Text("\(animal.price)")
                                    .font(.system(size: 9, weight: .bold))
                            }
                        }
                    }
                    .padding(6)
                    .background(isSelected ? AppTheme.primaryBlue.opacity(0.08) : .clear)
                    .clipShape(.rect(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? AppTheme.primaryBlue : .clear, lineWidth: 2.5)
                    )
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }

    private var colorGrid: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Body Color")
                .font(AppTheme.funFont(.subheadline, weight: .bold))
                .padding(.horizontal)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 52))], spacing: 10) {
                Button {
                    withAnimation(.spring(duration: 0.2)) {
                        selectedBodyColor = selectedAnimal.defaultColorHex
                    }
                } label: {
                    VStack(spacing: 4) {
                        ZStack {
                            Circle()
                                .fill(Color(hex: selectedAnimal.defaultColorHex))
                                .frame(width: 44, height: 44)
                            if selectedBodyColor == selectedAnimal.defaultColorHex {
                                Circle().stroke(AppTheme.primaryBlue, lineWidth: 3).frame(width: 50, height: 50)
                                Image(systemName: "checkmark").font(.caption.bold()).foregroundStyle(.white)
                            }
                        }
                        Text("Default")
                            .font(.system(size: 9, weight: .medium))
                            .foregroundStyle(.secondary)
                    }
                }
                .buttonStyle(.plain)

                ForEach(AvatarColorPalette.bodyColors, id: \.hex) { color in
                    Button {
                        withAnimation(.spring(duration: 0.2)) {
                            selectedBodyColor = color.hex
                        }
                    } label: {
                        VStack(spacing: 4) {
                            ZStack {
                                Circle()
                                    .fill(Color(hex: color.hex))
                                    .frame(width: 44, height: 44)
                                    .shadow(color: Color(hex: color.hex).opacity(0.3), radius: 3)
                                if selectedBodyColor == color.hex {
                                    Circle().stroke(AppTheme.primaryBlue, lineWidth: 3).frame(width: 50, height: 50)
                                    Image(systemName: "checkmark").font(.caption.bold()).foregroundStyle(.white)
                                }
                            }
                            Text(color.name)
                                .font(.system(size: 9, weight: .medium))
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }

    private var backgroundGrid: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Background Color")
                .font(AppTheme.funFont(.subheadline, weight: .bold))
                .padding(.horizontal)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 52))], spacing: 10) {
                ForEach(AvatarColorPalette.backgroundColors, id: \.hex) { color in
                    Button {
                        withAnimation(.spring(duration: 0.2)) {
                            selectedBgColor = color.hex
                        }
                    } label: {
                        VStack(spacing: 4) {
                            ZStack {
                                Circle()
                                    .fill(Color(hex: color.hex))
                                    .frame(width: 44, height: 44)
                                    .overlay(
                                        Circle().stroke(Color(.systemGray4), lineWidth: 0.5)
                                    )
                                if selectedBgColor == color.hex {
                                    Circle().stroke(AppTheme.primaryBlue, lineWidth: 3).frame(width: 50, height: 50)
                                    Image(systemName: "checkmark").font(.caption.bold()).foregroundStyle(AppTheme.primaryBlue)
                                }
                            }
                            Text(color.name)
                                .font(.system(size: 9, weight: .medium))
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }

    private var eyeGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10) {
            ForEach(EyeStyle.allCases, id: \.self) { eye in
                let isOwned = gameVM.ownedEyes.contains(eye.rawValue)
                let isSelected = selectedEyes == eye
                Button {
                    handleEyePurchase(eye: eye, isOwned: isOwned)
                } label: {
                    VStack(spacing: 6) {
                        ZStack {
                            AnimalAvatarView(
                                animalType: selectedAnimal,
                                bodyColor: Color(hex: selectedBodyColor),
                                backgroundColor: Color(hex: selectedBgColor),
                                eyeStyle: eye,
                                mouthStyle: selectedMouth,
                                accessory: .none,
                                size: 60
                            )
                            if !isOwned {
                                Circle().fill(.black.opacity(0.3)).frame(width: 60, height: 60)
                                Image(systemName: "lock.fill").font(.caption).foregroundStyle(.white)
                            }
                        }
                        Text(eye.displayName)
                            .font(.caption2.weight(.bold))
                            .foregroundStyle(.primary)
                        priceLabel(price: eye.price, isOwned: isOwned, isSelected: isSelected)
                    }
                    .padding(6)
                    .background(isSelected ? AppTheme.primaryBlue.opacity(0.08) : .clear)
                    .clipShape(.rect(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? AppTheme.primaryBlue : .clear, lineWidth: 2.5)
                    )
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }

    private var mouthGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10) {
            ForEach(MouthStyle.allCases, id: \.self) { mouth in
                let isOwned = gameVM.ownedMouths.contains(mouth.rawValue)
                let isSelected = selectedMouth == mouth
                Button {
                    handleMouthPurchase(mouth: mouth, isOwned: isOwned)
                } label: {
                    VStack(spacing: 6) {
                        ZStack {
                            AnimalAvatarView(
                                animalType: selectedAnimal,
                                bodyColor: Color(hex: selectedBodyColor),
                                backgroundColor: Color(hex: selectedBgColor),
                                eyeStyle: selectedEyes,
                                mouthStyle: mouth,
                                accessory: .none,
                                size: 60
                            )
                            if !isOwned {
                                Circle().fill(.black.opacity(0.3)).frame(width: 60, height: 60)
                                Image(systemName: "lock.fill").font(.caption).foregroundStyle(.white)
                            }
                        }
                        Text(mouth.displayName)
                            .font(.caption2.weight(.bold))
                            .foregroundStyle(.primary)
                        priceLabel(price: mouth.price, isOwned: isOwned, isSelected: isSelected)
                    }
                    .padding(6)
                    .background(isSelected ? AppTheme.primaryBlue.opacity(0.08) : .clear)
                    .clipShape(.rect(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? AppTheme.primaryBlue : .clear, lineWidth: 2.5)
                    )
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }

    private var accessoryGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10) {
            ForEach(AccessoryType.allCases, id: \.self) { acc in
                let isOwned = gameVM.ownedAccessories.contains(acc.rawValue)
                let isSelected = selectedAccessory == acc
                Button {
                    handleAccessoryPurchase(accessory: acc, isOwned: isOwned)
                } label: {
                    VStack(spacing: 6) {
                        ZStack {
                            AnimalAvatarView(
                                animalType: selectedAnimal,
                                bodyColor: Color(hex: selectedBodyColor),
                                backgroundColor: Color(hex: selectedBgColor),
                                eyeStyle: selectedEyes,
                                mouthStyle: selectedMouth,
                                accessory: acc,
                                size: 60
                            )
                            if !isOwned && acc != .none {
                                Circle().fill(.black.opacity(0.3)).frame(width: 60, height: 60)
                                Image(systemName: "lock.fill").font(.caption).foregroundStyle(.white)
                            }
                        }
                        Text(acc.displayName)
                            .font(.caption2.weight(.bold))
                            .foregroundStyle(.primary)
                            .lineLimit(1)
                        priceLabel(price: acc.price, isOwned: isOwned || acc == .none, isSelected: isSelected)
                    }
                    .padding(6)
                    .background(isSelected ? AppTheme.primaryBlue.opacity(0.08) : .clear)
                    .clipShape(.rect(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? AppTheme.primaryBlue : .clear, lineWidth: 2.5)
                    )
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }

    @ViewBuilder
    private func priceLabel(price: Int, isOwned: Bool, isSelected: Bool) -> some View {
        if isOwned || price == 0 {
            Text(isSelected ? "Selected" : (price == 0 ? "Free" : "Owned"))
                .font(.system(size: 9, weight: .semibold))
                .foregroundStyle(isSelected ? AppTheme.primaryBlue : AppTheme.successGreen)
        } else {
            HStack(spacing: 2) {
                Image(systemName: "bitcoinsign.circle.fill")
                    .font(.system(size: 9))
                    .foregroundStyle(AppTheme.accentOrange)
                Text("\(price)")
                    .font(.system(size: 9, weight: .bold))
            }
        }
    }

    private func handleAnimalPurchase(animal: AnimalType, isOwned: Bool) {
        if isOwned {
            withAnimation(.spring(duration: 0.3)) {
                selectedAnimal = animal
                if selectedBodyColor == (AnimalType(rawValue: gameVM.avatarAnimal) ?? .beaver).defaultColorHex || selectedBodyColor.isEmpty {
                    selectedBodyColor = animal.defaultColorHex
                }
            }
            return
        }
        guard gameVM.spendCoins(animal.price) else {
            purchaseMessage = "Not enough coins! You need \(animal.price) coins."
            showPurchaseAlert = true
            return
        }
        withAnimation(.spring(duration: 0.3)) {
            gameVM.ownedAvatars.insert(animal.rawValue)
            selectedAnimal = animal
            selectedBodyColor = animal.defaultColorHex
        }
        gameVM.save()
    }

    private func handleEyePurchase(eye: EyeStyle, isOwned: Bool) {
        if isOwned || eye.price == 0 {
            withAnimation(.spring(duration: 0.3)) { selectedEyes = eye }
            if !gameVM.ownedEyes.contains(eye.rawValue) {
                gameVM.ownedEyes.insert(eye.rawValue)
                gameVM.save()
            }
            return
        }
        guard gameVM.spendCoins(eye.price) else {
            purchaseMessage = "Not enough coins! You need \(eye.price) coins."
            showPurchaseAlert = true
            return
        }
        withAnimation(.spring(duration: 0.3)) {
            gameVM.ownedEyes.insert(eye.rawValue)
            selectedEyes = eye
        }
        gameVM.save()
    }

    private func handleMouthPurchase(mouth: MouthStyle, isOwned: Bool) {
        if isOwned || mouth.price == 0 {
            withAnimation(.spring(duration: 0.3)) { selectedMouth = mouth }
            if !gameVM.ownedMouths.contains(mouth.rawValue) {
                gameVM.ownedMouths.insert(mouth.rawValue)
                gameVM.save()
            }
            return
        }
        guard gameVM.spendCoins(mouth.price) else {
            purchaseMessage = "Not enough coins! You need \(mouth.price) coins."
            showPurchaseAlert = true
            return
        }
        withAnimation(.spring(duration: 0.3)) {
            gameVM.ownedMouths.insert(mouth.rawValue)
            selectedMouth = mouth
        }
        gameVM.save()
    }

    private func handleAccessoryPurchase(accessory: AccessoryType, isOwned: Bool) {
        if isOwned || accessory.price == 0 {
            withAnimation(.spring(duration: 0.3)) { selectedAccessory = accessory }
            if !gameVM.ownedAccessories.contains(accessory.rawValue) {
                gameVM.ownedAccessories.insert(accessory.rawValue)
                gameVM.save()
            }
            return
        }
        guard gameVM.spendCoins(accessory.price) else {
            purchaseMessage = "Not enough coins! You need \(accessory.price) coins."
            showPurchaseAlert = true
            return
        }
        withAnimation(.spring(duration: 0.3)) {
            gameVM.ownedAccessories.insert(accessory.rawValue)
            selectedAccessory = accessory
        }
        gameVM.save()
    }
}
