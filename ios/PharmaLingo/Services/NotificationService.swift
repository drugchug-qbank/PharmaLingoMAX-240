import Foundation
import UserNotifications

@Observable
class NotificationService {
    static let shared = NotificationService()

    private(set) var isAuthorized: Bool = false

    private let center = UNUserNotificationCenter.current()
    private let eveningIdentifier = "streak_reminder_evening"
    private let lateNightIdentifier = "streak_reminder_late"

    func requestPermissionIfNeeded() {
        Task {
            let settings = await center.notificationSettings()
            switch settings.authorizationStatus {
            case .notDetermined:
                do {
                    let granted = try await center.requestAuthorization(options: [.alert, .sound, .badge])
                    isAuthorized = granted
                } catch {
                    isAuthorized = false
                }
            case .authorized, .provisional:
                isAuthorized = true
            default:
                isAuthorized = false
            }
        }
    }

    func rescheduleStreakReminders(currentStreak: Int, isStreakSafeToday: Bool) {
        cancelStreakReminders()

        guard currentStreak > 0, !isStreakSafeToday else { return }

        Task {
            let settings = await center.notificationSettings()
            guard settings.authorizationStatus == .authorized || settings.authorizationStatus == .provisional else { return }

            scheduleEveningReminder()
            scheduleLateNightReminder()
        }
    }

    func cancelStreakReminders() {
        center.removePendingNotificationRequests(withIdentifiers: [eveningIdentifier, lateNightIdentifier])
    }

    private func scheduleEveningReminder() {
        let content = UNMutableNotificationContent()
        content.title = "Your streak is on the line 🔥"
        content.body = "Complete 1 lesson tonight to protect your streak."
        content.sound = .default

        var components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        components.hour = 20
        components.minute = 0
        components.second = 0

        guard let fireDate = Calendar.current.date(from: components), fireDate > Date() else { return }

        let trigger = UNCalendarNotificationTrigger(
            dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: fireDate),
            repeats: false
        )

        let request = UNNotificationRequest(identifier: eveningIdentifier, content: content, trigger: trigger)
        center.add(request)
    }

    private func scheduleLateNightReminder() {
        let content = UNMutableNotificationContent()
        content.title = "Last chance to save your streak 🔥"
        content.body = "Do one quick quiz before midnight to keep it alive."
        content.sound = .default

        var components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        components.hour = 22
        components.minute = 30
        components.second = 0

        guard let fireDate = Calendar.current.date(from: components), fireDate > Date() else { return }

        let trigger = UNCalendarNotificationTrigger(
            dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: fireDate),
            repeats: false
        )

        let request = UNNotificationRequest(identifier: lateNightIdentifier, content: content, trigger: trigger)
        center.add(request)
    }
}
