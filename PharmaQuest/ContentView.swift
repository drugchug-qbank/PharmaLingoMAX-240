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
        .task {
            if let profile = supabase.currentProfile {
                gameVM.loadFromProfile(profile)
            }
        }
    }
}
