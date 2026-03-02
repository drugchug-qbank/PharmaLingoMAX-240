import SwiftUI

@Observable
class GameViewModel {
    var hearts: Int = 5
    let maxHearts: Int = 5
    var coins: Int = 50
    var totalXP: Int = 0
    var currentStreak: Int = 0
    var streakSaves: Int = 0

    var subsectionStars: [String: Int] = [:]
    var completedSubsections: Set<String> = []
    var hasSeenLearning: Set<String> = []
    var questionsAnswered: Int = 0
    var questionsCorrect: Int = 0
    var consecutiveCorrect: Int = 0

    var lastActiveDate: Date?
    var lastHeartLossDate: Date?

    var avatarAnimal: String = "beaver"
    var avatarEyes: String = "normal"
    var avatarMouth: String = "smile"
    var avatarAccessory: String = "none"
    var avatarBodyColor: String = ""
    var avatarBgColor: String = ""
    var ownedAvatars: Set<String> = ["beaver", "bird", "bunny", "cat"]
    var ownedEyes: Set<String> = ["normal", "happy", "big"]
    var ownedMouths: Set<String> = ["smile", "bigSmile", "tiny"]
    var ownedAccessories: Set<String> = ["none"]

    var username: String = "Student"
    var selectedProfession: Profession = .pharmacy
    var schoolName: String = ""

    var dailyQuests: [DailyQuest] = []
    private var lastQuestDate: String = ""

    private static let allQuestPool: [[DailyQuest]] = [
        [
            DailyQuest(id: "dq_lesson1", title: "Complete 1 Lesson", description: "Finish any lesson", iconName: "book.fill", target: 1, current: 0, coinReward: 20),
            DailyQuest(id: "dq_combo5", title: "5 Combo Streak", description: "Get 5 correct in a row", iconName: "flame.fill", target: 5, current: 0, coinReward: 10),
            DailyQuest(id: "dq_practice1", title: "Practice Session", description: "Complete a practice quiz", iconName: "brain.fill", target: 1, current: 0, coinReward: 15),
        ],
        [
            DailyQuest(id: "dq_lesson2", title: "Complete 2 Lessons", description: "Finish two lessons", iconName: "book.fill", target: 2, current: 0, coinReward: 30),
            DailyQuest(id: "dq_perfect", title: "Get a Perfect Quiz", description: "Score 100% on any quiz", iconName: "star.fill", target: 1, current: 0, coinReward: 25),
            DailyQuest(id: "dq_answer10", title: "Answer 10 Questions", description: "Answer 10 questions total", iconName: "questionmark.circle.fill", target: 10, current: 0, coinReward: 15),
        ],
        [
            DailyQuest(id: "dq_brandblitz2", title: "2 Brand Blitz Quizzes", description: "Complete 2 Brand Blitz rounds", iconName: "bolt.circle.fill", target: 2, current: 0, coinReward: 20),
            DailyQuest(id: "dq_combo3", title: "3 Combo Streak", description: "Get 3 correct in a row", iconName: "flame.fill", target: 3, current: 0, coinReward: 10),
            DailyQuest(id: "dq_lesson1b", title: "Complete 1 Lesson", description: "Finish any lesson", iconName: "book.fill", target: 1, current: 0, coinReward: 20),
        ],
        [
            DailyQuest(id: "dq_donate50", title: "Donate 50 Coins", description: "Donate at least 50 coins to your profession", iconName: "gift.fill", target: 50, current: 0, coinReward: 15),
            DailyQuest(id: "dq_answer20", title: "Answer 20 Questions", description: "Answer 20 questions total", iconName: "questionmark.circle.fill", target: 20, current: 0, coinReward: 25),
            DailyQuest(id: "dq_combo7", title: "7 Combo Streak", description: "Get 7 correct in a row", iconName: "flame.fill", target: 7, current: 0, coinReward: 20),
        ],
        [
            DailyQuest(id: "dq_practice2", title: "2 Practice Sessions", description: "Complete 2 practice quizzes", iconName: "brain.fill", target: 2, current: 0, coinReward: 25),
            DailyQuest(id: "dq_perfect2", title: "Get a Perfect Quiz", description: "Score 100% on any quiz", iconName: "star.fill", target: 1, current: 0, coinReward: 25),
            DailyQuest(id: "dq_brandblitz1", title: "Brand Blitz Quiz", description: "Complete a Brand Blitz round", iconName: "bolt.circle.fill", target: 1, current: 0, coinReward: 15),
        ],
        [
            DailyQuest(id: "dq_lesson3", title: "Complete 3 Lessons", description: "Finish three lessons", iconName: "book.fill", target: 3, current: 0, coinReward: 40),
            DailyQuest(id: "dq_correct15", title: "15 Correct Answers", description: "Get 15 questions right", iconName: "checkmark.circle.fill", target: 15, current: 0, coinReward: 20),
            DailyQuest(id: "dq_combo10", title: "10 Combo Streak", description: "Get 10 correct in a row", iconName: "flame.fill", target: 10, current: 0, coinReward: 30),
        ],
        [
            DailyQuest(id: "dq_brandblitz3", title: "3 Brand Blitz Quizzes", description: "Complete 3 Brand Blitz rounds", iconName: "bolt.circle.fill", target: 3, current: 0, coinReward: 30),
            DailyQuest(id: "dq_donate100", title: "Donate 100 Coins", description: "Donate at least 100 coins to your profession", iconName: "gift.fill", target: 100, current: 0, coinReward: 25),
            DailyQuest(id: "dq_practice1b", title: "Practice Session", description: "Complete a practice quiz", iconName: "brain.fill", target: 1, current: 0, coinReward: 15),
        ],
    ]

    private let dataService = DrugDataService.shared

    var level: Int { totalXP / 500 + 1 }
    var xpInCurrentLevel: Int { totalXP % 500 }
    var xpForNextLevel: Int { 500 }
    var xpProgress: Double { Double(xpInCurrentLevel) / Double(xpForNextLevel) }
    var accuracy: Double {
        guard questionsAnswered > 0 else { return 0 }
        return Double(questionsCorrect) / Double(questionsAnswered)
    }
    var lessonsCompleted: Int { completedSubsections.count }

    var isStreakSafeToday: Bool {
        guard let lastActive = lastActiveDate else { return false }
        let calendar = Calendar.current
        return calendar.isDateInToday(lastActive)
    }

    var timeUntilStreakBreaks: TimeInterval {
        let calendar = Calendar.current
        let now = Date()
        guard let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: now)) else { return 0 }
        return tomorrow.timeIntervalSince(now)
    }

    var modules: [DrugModule] { dataService.modules }

    init() {
        load()
        checkStreak()
        regenerateHearts()
        refreshDailyQuests()
    }

    private func refreshDailyQuests() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let today = formatter.string(from: Date())
        if lastQuestDate != today {
            let dayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: Date()) ?? 0
            let setIndex = dayOfYear % Self.allQuestPool.count
            dailyQuests = Self.allQuestPool[setIndex]
            lastQuestDate = today
            save()
        }
    }

    func starsFor(_ subsectionId: String) -> Int {
        subsectionStars[subsectionId] ?? 0
    }

    func isSubsectionUnlocked(_ subsection: Subsection) -> Bool {
        guard let module = dataService.module(for: subsection.moduleId) else { return false }
        guard let index = module.subsections.firstIndex(of: subsection) else { return false }
        if index == 0 {
            if module.number == 1 { return true }
            let prevModuleIndex = module.number - 2
            guard prevModuleIndex >= 0, prevModuleIndex < modules.count else { return false }
            let prevModule = modules[prevModuleIndex]
            guard let lastSub = prevModule.subsections.last else { return false }
            return completedSubsections.contains(lastSub.id)
        }
        let previousSubsection = module.subsections[index - 1]
        return completedSubsections.contains(previousSubsection.id)
    }

    func isModuleUnlocked(_ module: DrugModule) -> Bool {
        guard let firstSub = module.subsections.first else { return false }
        return isSubsectionUnlocked(firstSub)
    }

    func moduleProgress(_ module: DrugModule) -> Double {
        let total = module.subsections.count
        guard total > 0 else { return 0 }
        let completed = module.subsections.filter { completedSubsections.contains($0.id) }.count
        return Double(completed) / Double(total)
    }

    func loseHeart() {
        guard hearts > 0 else { return }
        hearts -= 1
        lastHeartLossDate = Date()
        save()
    }

    func addHeart() {
        guard hearts < maxHearts else { return }
        hearts += 1
        save()
    }

    func refillHearts() {
        hearts = maxHearts
        save()
    }

    func earnXP(_ amount: Int) {
        totalXP += amount
        save()
    }

    func earnCoins(_ amount: Int) {
        coins += amount
        save()
    }

    func spendCoins(_ amount: Int) -> Bool {
        guard coins >= amount else { return false }
        coins -= amount
        save()
        return true
    }

    var streakExtended: Bool = false
    var previousStreak: Int = 0

    func completeSubsection(_ subsectionId: String, score: Double, correctCount: Int, totalCount: Int, xpEarned: Int = 0, coinsEarned: Int = 0) {
        questionsAnswered += totalCount
        questionsCorrect += correctCount

        if score >= 0.8 {
            let currentStars = subsectionStars[subsectionId] ?? 0
            if currentStars < 5 {
                subsectionStars[subsectionId] = currentStars + 1
            }
            completedSubsections.insert(subsectionId)
        }

        if xpEarned > 0 {
            earnXP(xpEarned)
        } else {
            var xp = correctCount * 10
            if score == 1.0 { xp += 50 }
            else if score >= 0.9 { xp += 25 }
            earnXP(xp)
        }

        if coinsEarned > 0 {
            earnCoins(coinsEarned)
        } else {
            var coinReward = 5
            if score == 1.0 { coinReward += 20 }
            else if score >= 0.9 { coinReward += 10 }
            earnCoins(coinReward)
        }

        updateLessonQuests()
        updateAnswerQuests(totalCount)
        updateCorrectQuests(correctCount)
        if score >= 1.0 { updatePerfectQuests() }

        save()
        syncToCloud()
    }

    func recordConsecutiveCorrect(_ count: Int) {
        consecutiveCorrect = max(consecutiveCorrect, count)
        for idx in dailyQuests.indices {
            let qid = dailyQuests[idx].id
            if qid.contains("combo") {
                let prev = dailyQuests[idx].current
                dailyQuests[idx].current = max(dailyQuests[idx].current, count)
                if dailyQuests[idx].isComplete && prev < dailyQuests[idx].target {
                    earnCoins(dailyQuests[idx].coinReward)
                }
            }
        }
        save()
    }

    func recordBrandBlitzComplete() {
        for idx in dailyQuests.indices {
            let qid = dailyQuests[idx].id
            if qid.contains("brandblitz") {
                let prev = dailyQuests[idx].current
                dailyQuests[idx].current = min(dailyQuests[idx].current + 1, dailyQuests[idx].target)
                if dailyQuests[idx].isComplete && prev < dailyQuests[idx].target {
                    earnCoins(dailyQuests[idx].coinReward)
                }
            }
        }
        save()
    }

    func recordPracticeComplete() {
        for idx in dailyQuests.indices {
            let qid = dailyQuests[idx].id
            if qid.contains("practice") {
                let prev = dailyQuests[idx].current
                dailyQuests[idx].current = min(dailyQuests[idx].current + 1, dailyQuests[idx].target)
                if dailyQuests[idx].isComplete && prev < dailyQuests[idx].target {
                    earnCoins(dailyQuests[idx].coinReward)
                }
            }
        }
        save()
    }

    func recordDonation(_ amount: Int) {
        for idx in dailyQuests.indices {
            let qid = dailyQuests[idx].id
            if qid.contains("donate") {
                let prev = dailyQuests[idx].current
                dailyQuests[idx].current = min(dailyQuests[idx].current + amount, dailyQuests[idx].target)
                if dailyQuests[idx].isComplete && prev < dailyQuests[idx].target {
                    earnCoins(dailyQuests[idx].coinReward)
                }
            }
        }
        save()
    }

    private func updateLessonQuests() {
        for idx in dailyQuests.indices {
            let qid = dailyQuests[idx].id
            if qid.contains("lesson") {
                let prev = dailyQuests[idx].current
                dailyQuests[idx].current = min(dailyQuests[idx].current + 1, dailyQuests[idx].target)
                if dailyQuests[idx].isComplete && prev < dailyQuests[idx].target {
                    earnCoins(dailyQuests[idx].coinReward)
                }
            }
        }
    }

    private func updateAnswerQuests(_ count: Int) {
        for idx in dailyQuests.indices {
            let qid = dailyQuests[idx].id
            if qid.contains("answer") {
                let prev = dailyQuests[idx].current
                dailyQuests[idx].current = min(dailyQuests[idx].current + count, dailyQuests[idx].target)
                if dailyQuests[idx].isComplete && prev < dailyQuests[idx].target {
                    earnCoins(dailyQuests[idx].coinReward)
                }
            }
        }
    }

    private func updateCorrectQuests(_ count: Int) {
        for idx in dailyQuests.indices {
            let qid = dailyQuests[idx].id
            if qid.contains("correct") {
                let prev = dailyQuests[idx].current
                dailyQuests[idx].current = min(dailyQuests[idx].current + count, dailyQuests[idx].target)
                if dailyQuests[idx].isComplete && prev < dailyQuests[idx].target {
                    earnCoins(dailyQuests[idx].coinReward)
                }
            }
        }
    }

    private func updatePerfectQuests() {
        for idx in dailyQuests.indices {
            let qid = dailyQuests[idx].id
            if qid.contains("perfect") {
                let prev = dailyQuests[idx].current
                dailyQuests[idx].current = min(dailyQuests[idx].current + 1, dailyQuests[idx].target)
                if dailyQuests[idx].isComplete && prev < dailyQuests[idx].target {
                    earnCoins(dailyQuests[idx].coinReward)
                }
            }
        }
    }

    var nextHeartRegenDate: Date? {
        guard hearts < maxHearts, let lastLoss = lastHeartLossDate else { return nil }
        let hoursSinceLoss = Date().timeIntervalSince(lastLoss) / 3600
        let heartsRegenned = Int(hoursSinceLoss)
        if heartsRegenned >= (maxHearts - hearts) { return nil }
        let nextRegenHours = Double(heartsRegenned + 1)
        return lastLoss.addingTimeInterval(nextRegenHours * 3600)
    }

    func markLearningComplete(_ subsectionId: String) {
        hasSeenLearning.insert(subsectionId)
        save()
    }

    func needsLearning(_ subsectionId: String) -> Bool {
        !hasSeenLearning.contains(subsectionId)
    }

    func updateStreak() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        previousStreak = currentStreak
        if let lastActive = lastActiveDate {
            let lastDay = calendar.startOfDay(for: lastActive)
            let daysDiff = calendar.dateComponents([.day], from: lastDay, to: today).day ?? 0
            if daysDiff == 0 {
                if currentStreak == 0 {
                    currentStreak = 1
                }
                streakExtended = true
            } else if daysDiff == 1 {
                currentStreak += 1
                streakExtended = true
            } else {
                if streakSaves > 0 && daysDiff == 2 {
                    streakSaves -= 1
                    currentStreak += 1
                } else {
                    currentStreak = 1
                }
                streakExtended = true
            }
        } else {
            currentStreak = 1
            streakExtended = true
        }
        lastActiveDate = Date()
        save()
    }

    func syncToCloud() {
        Task {
            await SupabaseService.shared.syncGameState(from: self)
        }
    }

    private func checkStreak() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        guard let lastActive = lastActiveDate else { return }

        let lastDay = calendar.startOfDay(for: lastActive)
        let daysDiff = calendar.dateComponents([.day], from: lastDay, to: today).day ?? 0

        if daysDiff <= 1 {
            return
        }

        if streakSaves > 0 && daysDiff == 2 {
            streakSaves -= 1
        } else {
            currentStreak = 0
        }
        save()
    }

    private func regenerateHearts() {
        guard hearts < maxHearts, let lastLoss = lastHeartLossDate else { return }
        let hoursSinceLoss = Date().timeIntervalSince(lastLoss) / 3600
        let heartsToRegen = min(Int(hoursSinceLoss), maxHearts - hearts)
        if heartsToRegen > 0 {
            hearts = min(hearts + heartsToRegen, maxHearts)
            save()
        }
    }

    private let userDefaultsKey = "pharmaquest_game_state"

    func save() {
        let state: [String: Any] = [
            "hearts": hearts,
            "coins": coins,
            "totalXP": totalXP,
            "currentStreak": currentStreak,
            "streakSaves": streakSaves,
            "subsectionStars": subsectionStars,
            "completedSubsections": Array(completedSubsections),
            "hasSeenLearning": Array(hasSeenLearning),
            "questionsAnswered": questionsAnswered,
            "questionsCorrect": questionsCorrect,
            "lastActiveDate": lastActiveDate?.timeIntervalSince1970 ?? 0,
            "lastHeartLossDate": lastHeartLossDate?.timeIntervalSince1970 ?? 0,
            "avatarAnimal": avatarAnimal,
            "avatarEyes": avatarEyes,
            "avatarMouth": avatarMouth,
            "avatarAccessory": avatarAccessory,
            "avatarBodyColor": avatarBodyColor,
            "avatarBgColor": avatarBgColor,
            "ownedAvatars": Array(ownedAvatars),
            "ownedEyes": Array(ownedEyes),
            "ownedMouths": Array(ownedMouths),
            "ownedAccessories": Array(ownedAccessories),
            "username": username,
            "selectedProfession": selectedProfession.rawValue,
            "schoolName": schoolName,
            "lastQuestDate": lastQuestDate,
            "dailyQuestProgress": dailyQuests.map { ["id": $0.id, "current": $0.current] as [String : Any] },
        ]
        UserDefaults.standard.set(state, forKey: userDefaultsKey)
    }

    func load() {
        guard let state = UserDefaults.standard.dictionary(forKey: userDefaultsKey) else { return }
        hearts = state["hearts"] as? Int ?? 5
        coins = state["coins"] as? Int ?? 50
        totalXP = state["totalXP"] as? Int ?? 0
        currentStreak = state["currentStreak"] as? Int ?? 0
        streakSaves = state["streakSaves"] as? Int ?? 0
        subsectionStars = state["subsectionStars"] as? [String: Int] ?? [:]
        completedSubsections = Set(state["completedSubsections"] as? [String] ?? [])
        hasSeenLearning = Set(state["hasSeenLearning"] as? [String] ?? [])
        questionsAnswered = state["questionsAnswered"] as? Int ?? 0
        questionsCorrect = state["questionsCorrect"] as? Int ?? 0
        let lastActiveInterval = state["lastActiveDate"] as? Double ?? 0
        lastActiveDate = lastActiveInterval > 0 ? Date(timeIntervalSince1970: lastActiveInterval) : nil
        let lastHeartInterval = state["lastHeartLossDate"] as? Double ?? 0
        lastHeartLossDate = lastHeartInterval > 0 ? Date(timeIntervalSince1970: lastHeartInterval) : nil
        avatarAnimal = state["avatarAnimal"] as? String ?? "beaver"
        avatarEyes = state["avatarEyes"] as? String ?? "normal"
        avatarMouth = state["avatarMouth"] as? String ?? "smile"
        avatarAccessory = state["avatarAccessory"] as? String ?? "none"
        avatarBodyColor = state["avatarBodyColor"] as? String ?? ""
        avatarBgColor = state["avatarBgColor"] as? String ?? ""
        ownedAvatars = Set(state["ownedAvatars"] as? [String] ?? ["beaver", "bird", "bunny", "cat"])
        ownedEyes = Set(state["ownedEyes"] as? [String] ?? ["normal", "happy", "big"])
        ownedMouths = Set(state["ownedMouths"] as? [String] ?? ["smile", "bigSmile", "tiny"])
        ownedAccessories = Set(state["ownedAccessories"] as? [String] ?? ["none"])
        username = state["username"] as? String ?? "Student"
        if let profRaw = state["selectedProfession"] as? String, let prof = Profession(rawValue: profRaw) {
            selectedProfession = prof
        }
        schoolName = state["schoolName"] as? String ?? ""
        lastQuestDate = state["lastQuestDate"] as? String ?? ""
        if let questProgress = state["dailyQuestProgress"] as? [[String: Any]] {
            for progress in questProgress {
                if let id = progress["id"] as? String, let current = progress["current"] as? Int {
                    if let idx = dailyQuests.firstIndex(where: { $0.id == id }) {
                        dailyQuests[idx].current = current
                    }
                }
            }
        }
    }

    func loadFromProfile(_ profile: UserProfile) {
        username = profile.username
        if let prof = Profession(rawValue: profile.profession) {
            selectedProfession = prof
        }
        schoolName = profile.school
        avatarAnimal = profile.avatarAnimal
        avatarEyes = profile.avatarEyes
        avatarMouth = profile.avatarMouth
        avatarAccessory = profile.avatarAccessory
        totalXP = profile.totalXP
        coins = profile.coins
        currentStreak = profile.currentStreak
        streakSaves = profile.streakSaves
        hearts = profile.hearts
        questionsAnswered = profile.questionsAnswered
        questionsCorrect = profile.questionsCorrect

        let decoder = JSONDecoder()
        if let data = profile.completedSubsections.data(using: .utf8),
           let arr = try? decoder.decode([String].self, from: data) {
            completedSubsections = Set(arr)
        }
        if let data = profile.subsectionStars.data(using: .utf8),
           let dict = try? decoder.decode([String: Int].self, from: data) {
            subsectionStars = dict
        }
        if let data = profile.hasSeenLearning.data(using: .utf8),
           let arr = try? decoder.decode([String].self, from: data) {
            hasSeenLearning = Set(arr)
        }
        if let data = profile.ownedAvatars.data(using: .utf8),
           let arr = try? decoder.decode([String].self, from: data) {
            ownedAvatars = Set(arr)
        }
        if let data = profile.ownedEyes.data(using: .utf8),
           let arr = try? decoder.decode([String].self, from: data) {
            ownedEyes = Set(arr)
        }
        if let data = profile.ownedMouths.data(using: .utf8),
           let arr = try? decoder.decode([String].self, from: data) {
            ownedMouths = Set(arr)
        }
        if let data = profile.ownedAccessories.data(using: .utf8),
           let arr = try? decoder.decode([String].self, from: data) {
            ownedAccessories = Set(arr)
        }
        save()
    }
}
