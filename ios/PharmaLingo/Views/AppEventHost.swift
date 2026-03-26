import SwiftUI

struct AppEventHost: View {
    @Binding var selectedTab: Int
    @State private var eventService = AppEventService.shared
    @Environment(SupabaseService.self) private var supabase

    var body: some View {
        Color.clear
            .frame(width: 0, height: 0)
            .fullScreenCover(isPresented: $eventService.isShowingEvent) {
                if let event = eventService.currentEvent {
                    eventContent(for: event)
                }
            }
            .onChange(of: supabase.currentProfile?.id) { _, newId in
                if newId != nil {
                    Task {
                        try? await Task.sleep(for: .seconds(1.5))
                        await eventService.fetchUnseenEvents()
                    }
                } else {
                    eventService.reset()
                }
            }
    }

    @ViewBuilder
    private func eventContent(for event: AppEvent) -> some View {
        switch event.parsedType {
        case .streakSaveUsed:
            StreakSaveUsedEventView(
                event: event,
                onDismiss: { eventService.dismissCurrent() },
                onNavigate: { tab in selectedTab = tab }
            )
        case .streakBroken:
            StreakBrokenEventView(
                event: event,
                onDismiss: { eventService.dismissCurrent() },
                onNavigate: { tab in selectedTab = tab }
            )
        case .weeklyLeagueResult:
            WeeklyLeagueResultEventView(
                event: event,
                onDismiss: { eventService.dismissCurrent() },
                onNavigate: { tab in selectedTab = tab }
            )
        case .monthlyProfessionResult:
            MonthlyProfessionResultEventView(
                event: event,
                onDismiss: { eventService.dismissCurrent() },
                onNavigate: { tab in selectedTab = tab }
            )
        case .promotionZoneLost, .duoStarted, .duoProgress, .duoCompleted:
            Color.clear.onAppear {
                eventService.dismissCurrent()
            }
        case nil:
            Color.clear.onAppear {
                eventService.dismissCurrent()
            }
        }
    }
}
