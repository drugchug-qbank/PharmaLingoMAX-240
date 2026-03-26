import SwiftUI

enum AchievementTier: Int, CaseIterable, Comparable, Sendable {
    case bronze = 1
    case silver = 2
    case gold = 3
    case platinum = 4
    case diamond = 5

    static func < (lhs: AchievementTier, rhs: AchievementTier) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    var label: String {
        switch self {
        case .bronze: "Bronze"
        case .silver: "Silver"
        case .gold: "Gold"
        case .platinum: "Platinum"
        case .diamond: "Diamond"
        }
    }

    var color: Color {
        switch self {
        case .bronze: Color(hex: "CD7F32")
        case .silver: Color(hex: "A8B0B8")
        case .gold: Color(hex: "FFD700")
        case .platinum: Color(hex: "7DD3FC")
        case .diamond: Color(hex: "C084FC")
        }
    }

    var glowColor: Color {
        switch self {
        case .bronze: Color(hex: "CD7F32").opacity(0.4)
        case .silver: Color(hex: "A8B0B8").opacity(0.4)
        case .gold: Color(hex: "FFD700").opacity(0.5)
        case .platinum: Color(hex: "7DD3FC").opacity(0.5)
        case .diamond: Color(hex: "C084FC").opacity(0.6)
        }
    }

    var bgGradient: [Color] {
        switch self {
        case .bronze: [Color(hex: "92400E").opacity(0.15), Color(hex: "CD7F32").opacity(0.08)]
        case .silver: [Color(hex: "64748B").opacity(0.12), Color(hex: "A8B0B8").opacity(0.08)]
        case .gold: [Color(hex: "A16207").opacity(0.15), Color(hex: "FFD700").opacity(0.10)]
        case .platinum: [Color(hex: "0284C7").opacity(0.12), Color(hex: "7DD3FC").opacity(0.08)]
        case .diamond: [Color(hex: "7C3AED").opacity(0.15), Color(hex: "C084FC").opacity(0.10)]
        }
    }
}

struct AchievementLevel: Identifiable {
    let id: Int
    let tier: AchievementTier
    let threshold: Int
    let description: String
}

struct AchievementDefinition: Identifiable {
    let id: String
    let title: String
    let category: AchievementCategory
    let levels: [AchievementLevel]

    func icons(for tier: AchievementTier) -> String {
        AchievementIconMap.icon(for: id, tier: tier)
    }

    func currentTier(value: Int) -> AchievementTier? {
        var best: AchievementTier? = nil
        for level in levels where value >= level.threshold {
            best = level.tier
        }
        return best
    }

    func nextLevel(value: Int) -> AchievementLevel? {
        levels.first { value < $0.threshold }
    }

    func progress(value: Int) -> Double {
        guard let next = nextLevel(value: value) else { return 1.0 }
        let prevThreshold = levels.last(where: { value >= $0.threshold })?.threshold ?? 0
        let range = next.threshold - prevThreshold
        guard range > 0 else { return 0 }
        return Double(value - prevThreshold) / Double(range)
    }

    var isMaxed: Bool { false }
}

struct SpecialAchievementDefinition: Identifiable {
    let id: String
    let title: String
    let description: String
    let icon: String
    let threshold: Int
    let color: Color
    let glowColor: Color

    func isUnlocked(value: Int) -> Bool {
        value >= threshold
    }

    func progress(value: Int) -> Double {
        min(Double(value) / Double(threshold), 1.0)
    }
}

nonisolated enum AchievementCategory: String, CaseIterable, Sendable {
    case dedication = "Dedication"
    case knowledge = "Knowledge"
    case performance = "Performance"
    case collection = "Collection"
}

enum AchievementIconMap {
    static func icon(for achievementId: String, tier: AchievementTier) -> String {
        switch achievementId {
        case "streak_master":
            switch tier {
            case .bronze: return "flame"
            case .silver: return "flame.fill"
            case .gold: return "flame.circle.fill"
            case .platinum: return "bolt.heart.fill"
            case .diamond: return "flame.circle"
            }
        case "scholar":
            switch tier {
            case .bronze: return "book.closed"
            case .silver: return "book.closed.fill"
            case .gold: return "books.vertical.fill"
            case .platinum: return "graduationcap.fill"
            case .diamond: return "brain.fill"
            }
        case "xp_collector":
            switch tier {
            case .bronze: return "bolt"
            case .silver: return "bolt.fill"
            case .gold: return "bolt.circle.fill"
            case .platinum: return "bolt.shield.fill"
            case .diamond: return "bolt.badge.checkmark.fill"
            }
        case "question_warrior":
            switch tier {
            case .bronze: return "questionmark.circle"
            case .silver: return "questionmark.circle.fill"
            case .gold: return "questionmark.diamond.fill"
            case .platinum: return "questionmark.app.fill"
            case .diamond: return "brain"
            }
        case "accuracy_ace":
            switch tier {
            case .bronze: return "checkmark"
            case .silver: return "checkmark.circle.fill"
            case .gold: return "checkmark.seal.fill"
            case .platinum: return "target"
            case .diamond: return "scope"
            }
        case "aura_sage":
            switch tier {
            case .bronze: return "sparkle"
            case .silver: return "sparkles"
            case .gold: return "wand.and.stars"
            case .platinum: return "sun.max.fill"
            case .diamond: return "moonphase.full.moon"
            }
        case "star_hunter":
            switch tier {
            case .bronze: return "star"
            case .silver: return "star.fill"
            case .gold: return "star.circle.fill"
            case .platinum: return "star.square.fill"
            case .diamond: return "medal.star.fill"
            }
        case "combo_king":
            switch tier {
            case .bronze: return "hand.thumbsup"
            case .silver: return "hand.thumbsup.fill"
            case .gold: return "hand.raised.fingers.spread.fill"
            case .platinum: return "trophy"
            case .diamond: return "trophy.fill"
            }
        case "coin_tycoon":
            switch tier {
            case .bronze: return "bitcoinsign.circle"
            case .silver: return "bitcoinsign.circle.fill"
            case .gold: return "banknote"
            case .platinum: return "banknote.fill"
            case .diamond: return "dollarsign.circle.fill"
            }
        case "module_conqueror":
            switch tier {
            case .bronze: return "flag"
            case .silver: return "flag.fill"
            case .gold: return "flag.2.crossed.fill"
            case .platinum: return "crown"
            case .diamond: return "crown.fill"
            }
        default:
            return "questionmark"
        }
    }
}

enum AchievementCatalog {
    static let tieredAchievements: [AchievementDefinition] = [
        AchievementDefinition(
            id: "streak_master",
            title: "Streak Master",
            category: .dedication,
            levels: [
                AchievementLevel(id: 1, tier: .bronze, threshold: 1, description: "Start your first streak"),
                AchievementLevel(id: 2, tier: .silver, threshold: 10, description: "Maintain a 10-day streak"),
                AchievementLevel(id: 3, tier: .gold, threshold: 30, description: "Maintain a 30-day streak"),
                AchievementLevel(id: 4, tier: .platinum, threshold: 60, description: "Maintain a 60-day streak"),
                AchievementLevel(id: 5, tier: .diamond, threshold: 100, description: "Maintain a 100-day streak"),
            ]
        ),
        AchievementDefinition(
            id: "scholar",
            title: "Scholar",
            category: .knowledge,
            levels: [
                AchievementLevel(id: 1, tier: .bronze, threshold: 1, description: "Complete your first lesson"),
                AchievementLevel(id: 2, tier: .silver, threshold: 10, description: "Complete 10 lessons"),
                AchievementLevel(id: 3, tier: .gold, threshold: 25, description: "Complete 25 lessons"),
                AchievementLevel(id: 4, tier: .platinum, threshold: 50, description: "Complete 50 lessons"),
                AchievementLevel(id: 5, tier: .diamond, threshold: 100, description: "Complete 100 lessons"),
            ]
        ),
        AchievementDefinition(
            id: "xp_collector",
            title: "XP Collector",
            category: .performance,
            levels: [
                AchievementLevel(id: 1, tier: .bronze, threshold: 100, description: "Earn 100 XP"),
                AchievementLevel(id: 2, tier: .silver, threshold: 1000, description: "Earn 1,000 XP"),
                AchievementLevel(id: 3, tier: .gold, threshold: 5000, description: "Earn 5,000 XP"),
                AchievementLevel(id: 4, tier: .platinum, threshold: 15000, description: "Earn 15,000 XP"),
                AchievementLevel(id: 5, tier: .diamond, threshold: 50000, description: "Earn 50,000 XP"),
            ]
        ),
        AchievementDefinition(
            id: "question_warrior",
            title: "Question Warrior",
            category: .knowledge,
            levels: [
                AchievementLevel(id: 1, tier: .bronze, threshold: 10, description: "Answer 10 questions"),
                AchievementLevel(id: 2, tier: .silver, threshold: 50, description: "Answer 50 questions"),
                AchievementLevel(id: 3, tier: .gold, threshold: 200, description: "Answer 200 questions"),
                AchievementLevel(id: 4, tier: .platinum, threshold: 500, description: "Answer 500 questions"),
                AchievementLevel(id: 5, tier: .diamond, threshold: 1500, description: "Answer 1,500 questions"),
            ]
        ),
        AchievementDefinition(
            id: "accuracy_ace",
            title: "Accuracy Ace",
            category: .performance,
            levels: [
                AchievementLevel(id: 1, tier: .bronze, threshold: 10, description: "Get 10 correct answers"),
                AchievementLevel(id: 2, tier: .silver, threshold: 50, description: "Get 50 correct answers"),
                AchievementLevel(id: 3, tier: .gold, threshold: 200, description: "Get 200 correct answers"),
                AchievementLevel(id: 4, tier: .platinum, threshold: 500, description: "Get 500 correct answers"),
                AchievementLevel(id: 5, tier: .diamond, threshold: 1500, description: "Get 1,500 correct answers"),
            ]
        ),
        AchievementDefinition(
            id: "aura_sage",
            title: "Aura Sage",
            category: .performance,
            levels: [
                AchievementLevel(id: 1, tier: .bronze, threshold: 5, description: "Earn 5 clinical aura points"),
                AchievementLevel(id: 2, tier: .silver, threshold: 15, description: "Earn 15 clinical aura points"),
                AchievementLevel(id: 3, tier: .gold, threshold: 30, description: "Earn 30 clinical aura points"),
                AchievementLevel(id: 4, tier: .platinum, threshold: 50, description: "Earn 50 clinical aura points"),
                AchievementLevel(id: 5, tier: .diamond, threshold: 100, description: "Earn 100 clinical aura points"),
            ]
        ),
        AchievementDefinition(
            id: "star_hunter",
            title: "Star Hunter",
            category: .collection,
            levels: [
                AchievementLevel(id: 1, tier: .bronze, threshold: 5, description: "Earn 5 total stars"),
                AchievementLevel(id: 2, tier: .silver, threshold: 25, description: "Earn 25 total stars"),
                AchievementLevel(id: 3, tier: .gold, threshold: 50, description: "Earn 50 total stars"),
                AchievementLevel(id: 4, tier: .platinum, threshold: 100, description: "Earn 100 total stars"),
                AchievementLevel(id: 5, tier: .diamond, threshold: 200, description: "Earn 200 total stars"),
            ]
        ),
        AchievementDefinition(
            id: "combo_king",
            title: "Combo King",
            category: .performance,
            levels: [
                AchievementLevel(id: 1, tier: .bronze, threshold: 5, description: "Get a 5-answer combo"),
                AchievementLevel(id: 2, tier: .silver, threshold: 10, description: "Get a 10-answer combo"),
                AchievementLevel(id: 3, tier: .gold, threshold: 15, description: "Get a 15-answer combo"),
                AchievementLevel(id: 4, tier: .platinum, threshold: 25, description: "Get a 25-answer combo"),
                AchievementLevel(id: 5, tier: .diamond, threshold: 50, description: "Get a 50-answer combo"),
            ]
        ),
        AchievementDefinition(
            id: "coin_tycoon",
            title: "Coin Tycoon",
            category: .collection,
            levels: [
                AchievementLevel(id: 1, tier: .bronze, threshold: 100, description: "Accumulate 100 coins"),
                AchievementLevel(id: 2, tier: .silver, threshold: 500, description: "Accumulate 500 coins"),
                AchievementLevel(id: 3, tier: .gold, threshold: 2000, description: "Accumulate 2,000 coins"),
                AchievementLevel(id: 4, tier: .platinum, threshold: 5000, description: "Accumulate 5,000 coins"),
                AchievementLevel(id: 5, tier: .diamond, threshold: 15000, description: "Accumulate 15,000 coins"),
            ]
        ),
        AchievementDefinition(
            id: "module_conqueror",
            title: "Module Conqueror",
            category: .knowledge,
            levels: [
                AchievementLevel(id: 1, tier: .bronze, threshold: 1, description: "Finish all lessons in 1 module"),
                AchievementLevel(id: 2, tier: .silver, threshold: 3, description: "Finish all lessons in 3 modules"),
                AchievementLevel(id: 3, tier: .gold, threshold: 5, description: "Finish all lessons in 5 modules"),
                AchievementLevel(id: 4, tier: .platinum, threshold: 7, description: "Finish all lessons in 7 modules"),
                AchievementLevel(id: 5, tier: .diamond, threshold: 10, description: "Finish all lessons in 10 modules"),
            ]
        ),
    ]

    static let specialAchievements: [SpecialAchievementDefinition] = [
        SpecialAchievementDefinition(
            id: "year_warrior",
            title: "Year-Long Warrior",
            description: "Maintain a 365-day streak",
            icon: "calendar.badge.checkmark",
            threshold: 365,
            color: Color(hex: "F59E0B"),
            glowColor: Color(hex: "F59E0B").opacity(0.6)
        ),
        SpecialAchievementDefinition(
            id: "question_machine",
            title: "Question Machine",
            description: "Answer 5,000 questions",
            icon: "gearshape.2.fill",
            threshold: 5000,
            color: Color(hex: "6366F1"),
            glowColor: Color(hex: "6366F1").opacity(0.6)
        ),
        SpecialAchievementDefinition(
            id: "perfectionist",
            title: "Perfectionist",
            description: "Score 95%+ accuracy on 500+ questions",
            icon: "magnifyingglass.circle.fill",
            threshold: 1,
            color: Color(hex: "EC4899"),
            glowColor: Color(hex: "EC4899").opacity(0.6)
        ),
        SpecialAchievementDefinition(
            id: "five_star_general",
            title: "Five-Star General",
            description: "Earn 5 stars on 20 different subsections",
            icon: "shield.checkered",
            threshold: 20,
            color: Color(hex: "14B8A6"),
            glowColor: Color(hex: "14B8A6").opacity(0.6)
        ),
        SpecialAchievementDefinition(
            id: "aura_legend",
            title: "Aura Legend",
            description: "Reach 200 clinical aura points",
            icon: "sun.max.fill",
            threshold: 200,
            color: Color(hex: "8B5CF6"),
            glowColor: Color(hex: "8B5CF6").opacity(0.6)
        ),
        SpecialAchievementDefinition(
            id: "speed_demon",
            title: "Speed Demon",
            description: "Complete 50 lessons",
            icon: "hare.fill",
            threshold: 50,
            color: Color(hex: "EF4444"),
            glowColor: Color(hex: "EF4444").opacity(0.6)
        ),
    ]
}
