import Foundation

nonisolated struct MasteryRecord: Sendable {
    var level: Int
    var lastSeenDate: Date
    var nextDueDate: Date
    var totalAttempts: Int
    var correctAttempts: Int
    var currentStreak: Int

    static let intervals: [TimeInterval] = [
        60 * 10,
        86400 * 1,
        86400 * 3,
        86400 * 7,
        86400 * 14,
        86400 * 30,
    ]

    init(level: Int = 0, lastSeenDate: Date = .distantPast, nextDueDate: Date = .distantPast, totalAttempts: Int = 0, correctAttempts: Int = 0, currentStreak: Int = 0) {
        self.level = level
        self.lastSeenDate = lastSeenDate
        self.nextDueDate = nextDueDate
        self.totalAttempts = totalAttempts
        self.correctAttempts = correctAttempts
        self.currentStreak = currentStreak
    }

    var accuracy: Double {
        guard totalAttempts > 0 else { return 0 }
        return Double(correctAttempts) / Double(totalAttempts)
    }

    var isDue: Bool {
        Date() >= nextDueDate
    }

    mutating func recordCorrect(now: Date = Date()) {
        totalAttempts += 1
        correctAttempts += 1
        currentStreak += 1
        level = min(level + 1, 5)
        lastSeenDate = now
        let interval = Self.intervals[min(level, Self.intervals.count - 1)]
        nextDueDate = now.addingTimeInterval(interval)
    }

    mutating func recordWrong(now: Date = Date()) {
        totalAttempts += 1
        currentStreak = 0
        level = max(level - 1, 0)
        lastSeenDate = now
        nextDueDate = now.addingTimeInterval(60 * 10)
    }

    func toDictionary() -> [String: Any] {
        [
            "level": level,
            "lastSeenDate": lastSeenDate.timeIntervalSince1970,
            "nextDueDate": nextDueDate.timeIntervalSince1970,
            "totalAttempts": totalAttempts,
            "correctAttempts": correctAttempts,
            "currentStreak": currentStreak,
        ]
    }

    static func from(_ dict: [String: Any]) -> MasteryRecord {
        MasteryRecord(
            level: dict["level"] as? Int ?? 0,
            lastSeenDate: Date(timeIntervalSince1970: dict["lastSeenDate"] as? Double ?? 0),
            nextDueDate: Date(timeIntervalSince1970: dict["nextDueDate"] as? Double ?? 0),
            totalAttempts: dict["totalAttempts"] as? Int ?? 0,
            correctAttempts: dict["correctAttempts"] as? Int ?? 0,
            currentStreak: dict["currentStreak"] as? Int ?? 0
        )
    }
}
