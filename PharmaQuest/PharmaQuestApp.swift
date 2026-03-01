import SwiftUI

@main
struct PharmaQuestApp: App {
    @State private var supabase = SupabaseService.shared

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(supabase)
        }
    }
}
