import SwiftUI

struct ContentView: View {
    @State private var gameVM = GameViewModel()
    @State private var selectedTab: Int = 0
    @Environment(SupabaseService.self) private var supabase

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Learn", systemImage: "book.fill", value: 0) {
                LearnView(gameVM: gameVM)
            }
            Tab("Practice", systemImage: "brain.head.profile.fill", value: 1) {
                PracticeView(gameVM: gameVM)
            }
            Tab("Ranks", systemImage: "trophy.fill", value: 2) {
                RanksView(gameVM: gameVM)
            }
            Tab("Shop", systemImage: "bag.fill", value: 3) {
                ShopView(gameVM: gameVM)
            }
            Tab("Profile", systemImage: "person.fill", value: 4) {
                ProfileView(gameVM: gameVM)
            }
        }
        .tint(AppTheme.primaryBlue)
        .overlay {
            AppEventHost(selectedTab: $selectedTab)
        }
        .task {
            if let profile = supabase.currentProfile {
                gameVM.loadFromProfile(profile)
            }
        }
        .onChange(of: supabase.currentProfile?.id) { _, newId in
            if let profile = supabase.currentProfile, newId != nil {
                gameVM.loadFromProfile(profile)
            }
        }
        .onChange(of: supabase.currentProfile?.avatarAnimal) { _, _ in
            if let profile = supabase.currentProfile {
                gameVM.avatarAnimal = profile.avatarAnimal
                gameVM.avatarEyes = profile.avatarEyes
                gameVM.avatarMouth = profile.avatarMouth
                gameVM.avatarAccessory = profile.avatarAccessory
                gameVM.avatarBodyColor = profile.avatarBodyColor
                gameVM.avatarBgColor = profile.avatarBgColor
                gameVM.save()
            }
        }
    }
}
