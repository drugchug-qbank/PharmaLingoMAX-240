import SwiftUI
import RevenueCat

@main
struct PharmaQuestApp: App {
    @State private var supabase = SupabaseService.shared
    @State private var didInitialize: Bool = false
    @Environment(\.scenePhase) private var scenePhase

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
                    NotificationService.shared.requestPermissionIfNeeded()
                }
        }
        .onChange(of: scenePhase) { _, newPhase in
            handleScenePhaseChange(newPhase)
        }
    }

    private func handleScenePhaseChange(_ phase: ScenePhase) {
        switch phase {
        case .active:
            NotificationService.shared.cancelStreakReminders()
        case .background:
            guard let profile = supabase.currentProfile else { return }
            let isActiveToday: Bool = {
                guard let lastActive = profile.lastActiveDate, !lastActive.isEmpty else { return false }
                let isoFormatter = ISO8601DateFormatter()
                isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
                guard let date = isoFormatter.date(from: lastActive) else { return false }
                return Calendar.current.isDateInToday(date)
            }()
            NotificationService.shared.rescheduleStreakReminders(
                currentStreak: profile.currentStreak,
                isStreakSafeToday: isActiveToday
            )
        default:
            break
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
