import SwiftUI

@Observable
class AppEventService {
    static let shared = AppEventService()

    var pendingEvents: [AppEvent] = []
    var currentEvent: AppEvent? = nil
    var isShowingEvent: Bool = false

    private var eventsShownThisLaunch: Int = 0
    private let maxEventsPerLaunch: Int = 2
    private var hasFetched: Bool = false

    func fetchUnseenEvents() async {
        guard !hasFetched else { return }
        hasFetched = true

        let events = await SupabaseService.shared.fetchUnseenAppEvents()
        let sorted = events.sorted { a, b in
            let pA = AppEventType(rawValue: a.eventType)?.priority ?? 99
            let pB = AppEventType(rawValue: b.eventType)?.priority ?? 99
            return pA < pB
        }
        pendingEvents = sorted
        showNextIfNeeded()
    }

    func dismissCurrent() {
        guard let event = currentEvent else { return }
        isShowingEvent = false
        currentEvent = nil

        Task {
            await SupabaseService.shared.dismissAppEvent(eventId: event.id)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.showNextIfNeeded()
        }
    }

    private func showNextIfNeeded() {
        guard eventsShownThisLaunch < maxEventsPerLaunch,
              !pendingEvents.isEmpty else { return }

        let next = pendingEvents.removeFirst()
        currentEvent = next
        eventsShownThisLaunch += 1

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.isShowingEvent = true
        }
    }

    func reset() {
        pendingEvents = []
        currentEvent = nil
        isShowingEvent = false
        eventsShownThisLaunch = 0
        hasFetched = false
    }
}
