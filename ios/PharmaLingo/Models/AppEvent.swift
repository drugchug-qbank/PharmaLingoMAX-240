import Foundation

nonisolated enum AppEventType: String, Codable, Sendable {
    case streakSaveUsed = "streak_save_used"
    case streakBroken = "streak_broken"
    case weeklyLeagueResult = "weekly_league_result"
    case monthlyProfessionResult = "monthly_profession_result"
    case promotionZoneLost = "promotion_zone_lost"
    case duoStarted = "duo_started"
    case duoProgress = "duo_progress"
    case duoCompleted = "duo_completed"

    var priority: Int {
        switch self {
        case .streakBroken: 1
        case .streakSaveUsed: 2
        case .weeklyLeagueResult: 3
        case .monthlyProfessionResult: 4
        case .promotionZoneLost: 5
        case .duoStarted: 6
        case .duoProgress: 7
        case .duoCompleted: 8
        }
    }

    var isFullScreenModal: Bool {
        switch self {
        case .streakSaveUsed, .streakBroken, .weeklyLeagueResult, .monthlyProfessionResult:
            return true
        case .promotionZoneLost, .duoStarted, .duoProgress, .duoCompleted:
            return false
        }
    }
}

nonisolated struct AppEvent: Codable, Identifiable, Sendable {
    let id: String
    let userId: String
    let eventType: String
    let payload: [String: AnyCodableValue]
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case eventType = "event_type"
        case payload
        case createdAt = "created_at"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        userId = (try? container.decode(String.self, forKey: .userId)) ?? ""
        eventType = (try? container.decode(String.self, forKey: .eventType)) ?? ""
        createdAt = try? container.decode(String.self, forKey: .createdAt)

        if let dictPayload = try? container.decode([String: AnyCodableValue].self, forKey: .payload) {
            payload = dictPayload
        } else if let strPayload = try? container.decode(String.self, forKey: .payload),
                  let data = strPayload.data(using: .utf8),
                  let dict = try? JSONDecoder().decode([String: AnyCodableValue].self, from: data) {
            payload = dict
        } else {
            payload = [:]
        }
    }

    var parsedType: AppEventType? {
        AppEventType(rawValue: eventType)
    }

    func stringValue(_ key: String) -> String? {
        payload[key]?.stringValue
    }

    func intValue(_ key: String) -> Int? {
        payload[key]?.intValue
    }

    func boolValue(_ key: String) -> Bool? {
        if case .bool(let v) = payload[key] { return v }
        return nil
    }
}
