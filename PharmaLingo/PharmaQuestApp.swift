import SwiftUI
import RevenueCat

@main
struct PharmaQuestApp: App {
    @State private var supabase = SupabaseService.shared
    @State private var didInitialize: Bool = false

    init() {
        Self.configureRevenueCat()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(supabase)
                .task {
                    guard !didInitialize else { return }
                    didInitialize = true
                    AdService.shared.initializeSDK()
                }
        }
    }

    private static func configureRevenueCat() {
        #if DEBUG
        Purchases.logLevel = .debug
        let apiKey = Config.EXPO_PUBLIC_REVENUECAT_TEST_API_KEY
        #else
        let apiKey = Config.EXPO_PUBLIC_REVENUECAT_IOS_API_KEY
        #endif
        if !apiKey.isEmpty {
            Purchases.configure(withAPIKey: apiKey)
        }
    }
}
