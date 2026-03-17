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

    private var configuration: AvatarConfiguration {
        AvatarConfiguration(
            animal: animal,
            eyes: eyes,
            mouth: mouth,
            accessory: accessory,
            bodyHex: bodyColor,
            bgHex: backgroundColor
        )
    }

    var body: some View {
        AvatarRendererView(configuration: configuration, size: size)
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
    @State private var previewBounce: Bool = false
    @State private var isSaving: Bool = false

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

    private var previewConfig: AvatarConfiguration {
        AvatarConfiguration(
            animal: selectedAnimal.rawValue,
            eyes: selectedEyes.rawValue,
            mouth: selectedMouth.rawValue,
            accessory: selectedAccessory.rawValue,
            bodyHex: selectedBodyColor,
            bgHex: selectedBgColor
        )
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
                        AvatarRendererView(
                            configuration: previewConfig,
                            size: 220,
                            showIdleAnimation: true
                        )
                        .shadow(color: .black.opacity(0.18), radius: 16, x: 0, y: 8)
                        .shadow(color: Color(hex: selectedBgColor).opacity(0.3), radius: 24, x: 0, y: 4)
                        .scaleEffect(previewBounce ? 1.04 : 1.0)
                        .animation(.spring(duration: 0.3, bounce: 0.5), value: previewBounce)

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
                        isSaving = true
                        gameVM.avatarAnimal = selectedAnimal.rawValue
                        gameVM.avatarEyes = selectedEyes.rawValue
                        gameVM.avatarMouth = selectedMouth.rawValue
                        gameVM.avatarAccessory = selectedAccessory.rawValue
                        gameVM.avatarBodyColor = selectedBodyColor
                        gameVM.avatarBgColor = selectedBgColor
                        gameVM.save()
                        Task {
                            _ = await gameVM.syncAvatarToCloud()
                            isSaving = false
                            dismiss()
                        }
                    }
                    .font(.headline)
                    .foregroundStyle(AppTheme.primaryBlue)
                    .disabled(isSaving)
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
            .onChange(of: selectedAnimal) { _, newAnimal in
                if newAnimal == .bunny && !RiveBunnyAvatarView.supportedEyes.contains(selectedEyes) {
                    selectedEyes = .normal
                }
                if newAnimal == .cat && !RiveCatAvatarView.supportedEyes.contains(selectedEyes) {
                    selectedEyes = .normal
                }
                if newAnimal == .bear {
                    if !RiveBearAvatarView.supportedEyes.contains(selectedEyes) {
                        selectedEyes = .normal
                    }
                    if !RiveBearAvatarView.supportedMouths.contains(selectedMouth) {
                        selectedMouth = .smile
                    }
                    if !RiveBearAvatarView.supportedAccessories.contains(selectedAccessory) {
                        selectedAccessory = .none
                    }
                    let bearHex = RiveBearAvatarView.bearBodyColorHexes.first(where: { $0.hex == selectedBodyColor })
                    if bearHex == nil {
                        selectedBodyColor = RiveBearAvatarView.bearBodyColorHexes[0].hex
                    }
                }
            }
        }
    }

    private func triggerBounce() {
        previewBounce = true
        Task {
            try? await Task.sleep(for: .seconds(0.15))
            previewBounce = false
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
                            CachedAvatarView(
                                configuration: AvatarConfiguration(
                                    animal: animal.rawValue,
                                    eyes: "normal",
                                    mouth: "smile",
                                    accessory: "none",
                                    bodyHex: animal.defaultColorHex,
                                    bgHex: "F5F5F5"
                                ),
                                size: 60
                            )

                            if !isOwned {
                                RoundedRectangle(cornerRadius: AnimalAvatarView.tileCornerRadius(for: 60))
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
                    .background(isSelected ? AppTheme.primaryBlue.opacity(0.10) : Color(.tertiarySystemFill).opacity(0.5))
                    .clipShape(.rect(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? AppTheme.primaryBlue : .clear, lineWidth: 2.5)
                    )
                    .scaleEffect(isSelected ? 1.03 : 1.0)
                    .animation(.spring(duration: 0.25, bounce: 0.4), value: isSelected)
                }
                .buttonStyle(.plain)
                .sensoryFeedback(.selection, trigger: isSelected)
            }
        }
        .padding()
    }

    private var isBearSelected: Bool {
        selectedAnimal == .bear
    }

    private var colorGrid: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Body Color")
                .font(AppTheme.funFont(.subheadline, weight: .bold))
                .padding(.horizontal)

            if isBearSelected {
                bearColorGrid
            } else {
                genericColorGrid
            }
        }
        .padding(.vertical)
    }

    private var bearColorGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 52))], spacing: 10) {
            ForEach(Array(RiveBearAvatarView.bearBodyColorHexes.enumerated()), id: \.offset) { _, color in
                Button {
                    withAnimation(.spring(duration: 0.2)) {
                        selectedBodyColor = color.hex
                    }
                    triggerBounce()
                } label: {
                    colorCell(hex: color.hex, name: color.name, isSelected: selectedBodyColor == color.hex)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal)
    }

    private var genericColorGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 52))], spacing: 10) {
            Button {
                withAnimation(.spring(duration: 0.2)) {
                    selectedBodyColor = selectedAnimal.defaultColorHex
                }
                triggerBounce()
            } label: {
                colorCell(hex: selectedAnimal.defaultColorHex, name: "Default", isSelected: selectedBodyColor == selectedAnimal.defaultColorHex)
            }
            .buttonStyle(.plain)

            ForEach(AvatarColorPalette.bodyColors, id: \.hex) { color in
                Button {
                    withAnimation(.spring(duration: 0.2)) {
                        selectedBodyColor = color.hex
                    }
                    triggerBounce()
                } label: {
                    colorCell(hex: color.hex, name: color.name, isSelected: selectedBodyColor == color.hex)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal)
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
                        triggerBounce()
                    } label: {
                        colorCell(hex: color.hex, name: color.name, isSelected: selectedBgColor == color.hex, showBorder: true)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }

    private func colorCell(hex: String, name: String, isSelected: Bool, showBorder: Bool = false) -> some View {
        VStack(spacing: 4) {
            ZStack {
                Circle()
                    .fill(Color(hex: hex))
                    .frame(width: 44, height: 44)
                    .overlay(
                        Circle().stroke(showBorder ? Color(.systemGray4) : .clear, lineWidth: 0.5)
                    )
                    .shadow(color: Color(hex: hex).opacity(isSelected ? 0.4 : 0.15), radius: isSelected ? 5 : 2)
                if isSelected {
                    Circle().stroke(AppTheme.primaryBlue, lineWidth: 3).frame(width: 50, height: 50)
                    Image(systemName: "checkmark")
                        .font(.caption.bold())
                        .foregroundStyle(.white)
                        .shadow(color: .black.opacity(0.3), radius: 1)
                }
            }
            .scaleEffect(isSelected ? 1.08 : 1.0)
            .animation(.spring(duration: 0.2, bounce: 0.4), value: isSelected)
            Text(name)
                .font(.system(size: 9, weight: .medium))
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
    }

    private var availableEyes: [EyeStyle] {
        if selectedAnimal == .bunny {
            return RiveBunnyAvatarView.supportedEyes
        }
        if selectedAnimal == .cat {
            return RiveCatAvatarView.supportedEyes
        }
        if selectedAnimal == .bear {
            return RiveBearAvatarView.supportedEyes
        }
        return EyeStyle.allCases.map { $0 }
    }

    private var availableMouths: [MouthStyle] {
        if selectedAnimal == .bear {
            return RiveBearAvatarView.supportedMouths
        }
        return MouthStyle.allCases.map { $0 }
    }

    private var availableAccessories: [AccessoryType] {
        if selectedAnimal == .bear {
            return RiveBearAvatarView.supportedAccessories
        }
        return AccessoryType.allCases.map { $0 }
    }

    private var eyeGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10) {
            ForEach(availableEyes, id: \.self) { eye in
                let isOwned = gameVM.ownedEyes.contains(eye.rawValue)
                let isSelected = selectedEyes == eye
                Button {
                    handleEyePurchase(eye: eye, isOwned: isOwned)
                } label: {
                    VStack(spacing: 6) {
                        ZStack {
                            if isBearSelected {
                                riveOptionTile(icon: "eyes", label: eye.displayName)
                            } else {
                                CachedAvatarView(
                                    configuration: AvatarConfiguration(
                                        animal: selectedAnimal.rawValue,
                                        eyes: eye.rawValue,
                                        mouth: selectedMouth.rawValue,
                                        accessory: "none",
                                        bodyHex: selectedBodyColor,
                                        bgHex: selectedBgColor
                                    ),
                                    size: 60
                                )
                            }
                            if !isOwned {
                                RoundedRectangle(cornerRadius: AnimalAvatarView.tileCornerRadius(for: 60)).fill(.black.opacity(0.3)).frame(width: 60, height: 60)
                                Image(systemName: "lock.fill").font(.caption).foregroundStyle(.white)
                            }
                        }
                        Text(eye.displayName)
                            .font(.caption2.weight(.bold))
                            .foregroundStyle(.primary)
                        priceLabel(price: eye.price, isOwned: isOwned, isSelected: isSelected)
                    }
                    .padding(6)
                    .background(isSelected ? AppTheme.primaryBlue.opacity(0.10) : Color(.tertiarySystemFill).opacity(0.5))
                    .clipShape(.rect(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? AppTheme.primaryBlue : .clear, lineWidth: 2.5)
                    )
                    .scaleEffect(isSelected ? 1.03 : 1.0)
                    .animation(.spring(duration: 0.25, bounce: 0.4), value: isSelected)
                }
                .buttonStyle(.plain)
                .sensoryFeedback(.selection, trigger: isSelected)
            }
        }
        .padding()
    }

    private var mouthGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10) {
            ForEach(availableMouths, id: \.self) { mouth in
                let isOwned = gameVM.ownedMouths.contains(mouth.rawValue)
                let isSelected = selectedMouth == mouth
                Button {
                    handleMouthPurchase(mouth: mouth, isOwned: isOwned)
                } label: {
                    VStack(spacing: 6) {
                        ZStack {
                            if isBearSelected {
                                riveOptionTile(icon: "mouth.fill", label: mouth.displayName)
                            } else {
                                CachedAvatarView(
                                    configuration: AvatarConfiguration(
                                        animal: selectedAnimal.rawValue,
                                        eyes: selectedEyes.rawValue,
                                        mouth: mouth.rawValue,
                                        accessory: "none",
                                        bodyHex: selectedBodyColor,
                                        bgHex: selectedBgColor
                                    ),
                                    size: 60
                                )
                            }
                            if !isOwned {
                                RoundedRectangle(cornerRadius: AnimalAvatarView.tileCornerRadius(for: 60)).fill(.black.opacity(0.3)).frame(width: 60, height: 60)
                                Image(systemName: "lock.fill").font(.caption).foregroundStyle(.white)
                            }
                        }
                        Text(mouth.displayName)
                            .font(.caption2.weight(.bold))
                            .foregroundStyle(.primary)
                        priceLabel(price: mouth.price, isOwned: isOwned, isSelected: isSelected)
                    }
                    .padding(6)
                    .background(isSelected ? AppTheme.primaryBlue.opacity(0.10) : Color(.tertiarySystemFill).opacity(0.5))
                    .clipShape(.rect(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? AppTheme.primaryBlue : .clear, lineWidth: 2.5)
                    )
                    .scaleEffect(isSelected ? 1.03 : 1.0)
                    .animation(.spring(duration: 0.25, bounce: 0.4), value: isSelected)
                }
                .buttonStyle(.plain)
                .sensoryFeedback(.selection, trigger: isSelected)
            }
        }
        .padding()
    }

    private var accessoryGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10) {
            ForEach(availableAccessories, id: \.self) { acc in
                let isOwned = gameVM.ownedAccessories.contains(acc.rawValue)
                let isSelected = selectedAccessory == acc
                Button {
                    handleAccessoryPurchase(accessory: acc, isOwned: isOwned)
                } label: {
                    VStack(spacing: 6) {
                        ZStack {
                            if isBearSelected {
                                riveOptionTile(icon: acc == .none ? "xmark.circle" : "crown.fill", label: acc.displayName)
                            } else {
                                CachedAvatarView(
                                    configuration: AvatarConfiguration(
                                        animal: selectedAnimal.rawValue,
                                        eyes: selectedEyes.rawValue,
                                        mouth: selectedMouth.rawValue,
                                        accessory: acc.rawValue,
                                        bodyHex: selectedBodyColor,
                                        bgHex: selectedBgColor
                                    ),
                                    size: 60
                                )
                            }
                            if !isOwned && acc != .none {
                                RoundedRectangle(cornerRadius: AnimalAvatarView.tileCornerRadius(for: 60)).fill(.black.opacity(0.3)).frame(width: 60, height: 60)
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
                    .background(isSelected ? AppTheme.primaryBlue.opacity(0.10) : Color(.tertiarySystemFill).opacity(0.5))
                    .clipShape(.rect(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? AppTheme.primaryBlue : .clear, lineWidth: 2.5)
                    )
                    .scaleEffect(isSelected ? 1.03 : 1.0)
                    .animation(.spring(duration: 0.25, bounce: 0.4), value: isSelected)
                }
                .buttonStyle(.plain)
                .sensoryFeedback(.selection, trigger: isSelected)
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

    private func riveOptionTile(icon: String, label: String) -> some View {
        RoundedRectangle(cornerRadius: AnimalAvatarView.tileCornerRadius(for: 60))
            .fill(Color(.tertiarySystemBackground))
            .frame(width: 60, height: 60)
            .overlay {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundStyle(.secondary)
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
            triggerBounce()
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
        triggerBounce()
        gameVM.save()
    }

    private func handleEyePurchase(eye: EyeStyle, isOwned: Bool) {
        if isOwned || eye.price == 0 {
            withAnimation(.spring(duration: 0.3)) { selectedEyes = eye }
            triggerBounce()
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
        triggerBounce()
        gameVM.save()
    }

    private func handleMouthPurchase(mouth: MouthStyle, isOwned: Bool) {
        if isOwned || mouth.price == 0 {
            withAnimation(.spring(duration: 0.3)) { selectedMouth = mouth }
            triggerBounce()
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
        triggerBounce()
        gameVM.save()
    }

    private func handleAccessoryPurchase(accessory: AccessoryType, isOwned: Bool) {
        if isOwned || accessory.price == 0 {
            withAnimation(.spring(duration: 0.3)) { selectedAccessory = accessory }
            triggerBounce()
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
        triggerBounce()
        gameVM.save()
    }
}
