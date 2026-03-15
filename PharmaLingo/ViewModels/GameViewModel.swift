import SwiftUI

@Observable
class GameViewModel {
    var hearts: Int = 5
    let maxHearts: Int = 5
    var isProUser: Bool = false
    var coins: Int = 50
    var totalXP: Int = 0
    var weeklyXP: Int = 0
    var monthlyXP: Int = 0
    var currentStreak: Int = 0
    var streakSaves: Int = 0
    var activeBoosts: [ActiveBoost] = []
    var doubleXPNextAttempt: Bool = false

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
    var masteryMap: [String: MasteryRecord] = [:]
    var powerUpInventory: PowerUpInventory = .defaultInventory

    var devModeUnlockAll: Bool = false
    var clinicalAuraPoints: Int = 0

    var dailyBrandBlitzCount: Int = 0
    var dailyQuickPracticeCount: Int = 0
    var dailySpacedReviewCount: Int = 0
    private var dailyPracticeDate: String = ""

    var activityDates: Set<String> = []
    var streakSaveDates: Set<String> = []
    var accountCreatedDate: Date?

    private var hasLoadedFromCloud: Bool = false

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
        loadMastery()
        checkStreak()
        regenerateHearts()
        refreshDailyQuests()
        resetDailyPracticeCounts()
        Task { await refreshProStatus() }
    }

    private func resetDailyPracticeCounts() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let today = formatter.string(from: Date())
        if dailyPracticeDate != today {
            dailyBrandBlitzCount = 0
            dailyQuickPracticeCount = 0
            dailySpacedReviewCount = 0
            dailyPracticeDate = today
            save()
        }
    }

    func canUsePracticeMode(_ mode: PracticeMode) -> PracticeAccess {
        if isProUser { return .allowed }
        let count: Int
        switch mode {
        case .brandBlitz: count = dailyBrandBlitzCount
        case .quickPractice: count = dailyQuickPracticeCount
        case .spacedReview: count = dailySpacedReviewCount
        }
        if count == 0 { return .allowed }
        if count == 1 { return .watchAd }
        return .locked
    }

    func recordPracticeModeUse(_ mode: PracticeMode) {
        switch mode {
        case .brandBlitz: dailyBrandBlitzCount += 1
        case .quickPractice: dailyQuickPracticeCount += 1
        case .spacedReview: dailySpacedReviewCount += 1
        }
        save()
        syncDailyStateToCloud()
    }

    func mistakeQuestions() -> [Question] {
        let wrongKeys = Set(masteryMap.filter { $0.value.totalAttempts > $0.value.correctAttempts }.map(\.key))
        guard !wrongKeys.isEmpty else { return [] }
        var questions: [Question] = []
        let dataService = DrugDataService.shared
        for module in dataService.modules {
            for sub in module.subsections {
                let subQuestions = dataService.allQuestions(for: sub.id)
                for q in subQuestions {
                    if wrongKeys.contains(q.masteryKey) {
                        questions.append(q)
                    }
                }
            }
        }
        return Array(questions.shuffled().prefix(15))
    }

    func refreshProStatus() async {
        let service = SubscriptionService.shared
        await service.checkSubscriptionStatus()
        isProUser = service.isProUser
    }

    var effectiveHearts: Int {
        isProUser ? maxHearts : hearts
    }

    var hasUnlimitedHearts: Bool {
        isProUser
    }

    func xpMultiplier() -> Double {
        var multiplier = isProUser ? 1.5 : 1.0
        if doubleXPNextAttempt {
            multiplier *= 2.0
        }
        return multiplier
    }

    func coinMultiplier() -> Double {
        isProUser ? 1.5 : 1.0
    }

    func activateDoubleXP() {
        doubleXPNextAttempt = true
        save()
    }

    var hasActiveDoubleXP: Bool {
        doubleXPNextAttempt
    }

    func consumeDoubleXPIfActive() {
        guard doubleXPNextAttempt else { return }
        doubleXPNextAttempt = false
        save()
    }

    private func refreshDailyQuests() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let today = formatter.string(from: Date())
        let dayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: Date()) ?? 0
        let setIndex = dayOfYear % Self.allQuestPool.count
        let isNewDay = lastQuestDate != today
        dailyQuests = Self.allQuestPool[setIndex]
        if isNewDay {
            lastQuestDate = today
            save()
        } else {
            restoreQuestProgress()
        }
    }

    private func restoreQuestProgress() {
        guard let state = UserDefaults.standard.dictionary(forKey: userDefaultsKey),
              let questProgress = state["dailyQuestProgress"] as? [[String: Any]] else { return }
        for progress in questProgress {
            if let id = progress["id"] as? String, let current = progress["current"] as? Int {
                if let idx = dailyQuests.firstIndex(where: { $0.id == id }) {
                    dailyQuests[idx].current = current
                }
            }
        }
    }

    func starsFor(_ subsectionId: String) -> Int {
        subsectionStars[subsectionId] ?? 0
    }

    func isSubsectionUnlocked(_ subsection: Subsection) -> Bool {
        if devModeUnlockAll { return true }
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
        if devModeUnlockAll { return true }
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
        guard !isProUser else { return }
        guard hearts > 0 else { return }
        hearts -= 1
        if lastHeartLossDate == nil || hearts == maxHearts - 1 {
            lastHeartLossDate = Date()
        }
        save()
        Task {
            await SupabaseService.shared.applyHeartLoss()
        }
    }

    func addClinicalAuraPoint() {
        clinicalAuraPoints += 1
        save()
    }

    func removeClinicalAuraPoint() {
        clinicalAuraPoints -= 1
        save()
    }

    func addHeart() {
        guard hearts < maxHearts else { return }
        hearts += 1
        save()
        Task {
            await SupabaseService.shared.applyAddHeart()
        }
    }

    func refillHearts() {
        hearts = maxHearts
        save()
    }

    func earnXP(_ amount: Int) {
        let adjusted = Int(Double(amount) * xpMultiplier())
        totalXP += adjusted
        weeklyXP += adjusted
        monthlyXP += adjusted
        consumeDoubleXPIfActive()
        save()
    }

    func earnCoins(_ amount: Int) {
        let adjusted = Int(Double(amount) * coinMultiplier())
        coins += adjusted
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

    func completePracticeSession(score: Double, correctCount: Int, totalCount: Int, xpEarned: Int = 0, coinsEarned: Int = 0) {
        questionsAnswered += totalCount
        questionsCorrect += correctCount

        var finalXP: Int
        if xpEarned > 0 {
            finalXP = Int(Double(xpEarned) * xpMultiplier())
        } else {
            var xp = correctCount * 10
            if score == 1.0 { xp += 50 }
            else if score >= 0.9 { xp += 25 }
            finalXP = Int(Double(xp) * xpMultiplier())
        }

        var finalCoins: Int
        if coinsEarned > 0 {
            finalCoins = Int(Double(coinsEarned) * coinMultiplier())
        } else {
            var coinReward = 5
            if score == 1.0 { coinReward += 20 }
            else if score >= 0.9 { coinReward += 10 }
            finalCoins = Int(Double(coinReward) * coinMultiplier())
        }

        totalXP += finalXP
        weeklyXP += finalXP
        monthlyXP += finalXP
        coins += finalCoins
        consumeDoubleXPIfActive()

        if score >= 0.8 {
            updateStreak()
        }

        updateAnswerQuests(totalCount)
        updateCorrectQuests(correctCount)
        if score >= 1.0 { updatePerfectQuests() }

        save()

        reportDuoProgress(questionsAnswered: totalCount, xpEarned: finalXP, perfectQuiz: score >= 1.0)

        if hasLoadedFromCloud {
            Task {
                await SupabaseService.shared.syncGameState(from: self)
            }
        }
    }

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

        var finalXP: Int
        if xpEarned > 0 {
            finalXP = Int(Double(xpEarned) * xpMultiplier())
        } else {
            var xp = correctCount * 10
            if score == 1.0 { xp += 50 }
            else if score >= 0.9 { xp += 25 }
            finalXP = Int(Double(xp) * xpMultiplier())
        }

        var finalCoins: Int
        if coinsEarned > 0 {
            finalCoins = Int(Double(coinsEarned) * coinMultiplier())
        } else {
            var coinReward = 5
            if score == 1.0 { coinReward += 20 }
            else if score >= 0.9 { coinReward += 10 }
            finalCoins = Int(Double(coinReward) * coinMultiplier())
        }

        totalXP += finalXP
        weeklyXP += finalXP
        monthlyXP += finalXP
        coins += finalCoins
        consumeDoubleXPIfActive()

        if score >= 0.8 {
            updateStreak()
        }

        updateLessonQuests()
        updateAnswerQuests(totalCount)
        updateCorrectQuests(correctCount)
        if score >= 1.0 { updatePerfectQuests() }

        save()

        reportDuoProgress(questionsAnswered: totalCount, xpEarned: finalXP, perfectQuiz: score >= 1.0, lessonCompleted: score >= 0.8)

        let idempotencyKey = "\(subsectionId)_\(Int(Date().timeIntervalSince1970 * 1000))"
        Task {
            if let updatedProfile = await SupabaseService.shared.applyQuizCompletion(
                subsectionId: subsectionId,
                score: score,
                correctCount: correctCount,
                totalCount: totalCount,
                xpEarned: finalXP,
                coinsEarned: finalCoins,
                idempotencyKey: idempotencyKey
            ) {
                hydrateFromProfile(updatedProfile)
            } else if hasLoadedFromCloud {
                await SupabaseService.shared.syncGameState(from: self)
            }
        }
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
                    coins += dailyQuests[idx].coinReward
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
                    coins += dailyQuests[idx].coinReward
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
                    coins += dailyQuests[idx].coinReward
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
                    coins += dailyQuests[idx].coinReward
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
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                let missedDays = daysDiff - 1
                if streakSaves > 0 && missedDays > 0 {
                    let savesToUse = min(missedDays, streakSaves)
                    streakSaves -= savesToUse
                    for i in 1...missedDays {
                        if i <= savesToUse, let missedDate = calendar.date(byAdding: .day, value: -i, to: today) {
                            streakSaveDates.insert(formatter.string(from: missedDate))
                        }
                    }
                    if savesToUse == missedDays {
                        currentStreak += 1
                    } else {
                        currentStreak = 1
                    }
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
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        activityDates.insert(fmt.string(from: today))
        save()
    }

    private func backfillActivityDatesFromStreak(streakOverride: Int? = nil) {
        guard activityDates.isEmpty, let lastActive = lastActiveDate else { return }
        let streak = streakOverride ?? currentStreak
        guard streak > 0 else { return }
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let lastDay = calendar.startOfDay(for: lastActive)
        for i in 0..<streak {
            if let date = calendar.date(byAdding: .day, value: -i, to: lastDay) {
                activityDates.insert(formatter.string(from: date))
            }
        }
    }

    func syncToCloud() {
        guard hasLoadedFromCloud else { return }
        Task {
            await SupabaseService.shared.syncGameState(from: self)
        }
    }

    func syncDailyStateToCloud() {
        guard hasLoadedFromCloud else { return }
        let questProgress = dailyQuests.map { ["id": $0.id, "current": $0.current] as [String : Any] }
        let boostData = activeBoosts.filter { $0.isActive }.map { ["type": $0.type.rawValue, "expiresAt": $0.expiresAt.timeIntervalSince1970] as [String : Any] }
        let dayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: Date()) ?? 0
        let setIndex = dayOfYear % Self.allQuestPool.count

        Task {
            await SupabaseService.shared.saveDailyState(
                questProgress: questProgress,
                brandBlitzCount: dailyBrandBlitzCount,
                quickPracticeCount: dailyQuickPracticeCount,
                spacedReviewCount: dailySpacedReviewCount,
                doubleXP: doubleXPNextAttempt,
                activeBoosts: boostData,
                questSetIndex: setIndex
            )
        }
    }

    func syncMasteryToCloud() {
        guard hasLoadedFromCloud else { return }
        let records: [[String: Any]] = masteryMap.map { key, record in
            [
                "question_key": key,
                "level": record.level,
                "total_attempts": record.totalAttempts,
                "correct_attempts": record.correctAttempts,
                "current_streak": record.currentStreak,
                "last_seen_at": record.lastSeenDate.timeIntervalSince1970,
                "next_due_at": record.nextDueDate.timeIntervalSince1970,
            ] as [String: Any]
        }
        Task {
            await SupabaseService.shared.saveMasteryBatch(records: records)
        }
    }

    func syncAvatarToCloud() async -> Bool {
        await SupabaseService.shared.saveAvatarToCloud(
            animal: avatarAnimal,
            eyes: avatarEyes,
            mouth: avatarMouth,
            accessory: avatarAccessory,
            bodyColor: avatarBodyColor,
            bgColor: avatarBgColor
        )
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

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        if daysDiff >= 2 && streakSaves > 0 {
            let missedDays = daysDiff - 1
            let savesToUse = min(missedDays, streakSaves)
            streakSaves -= savesToUse

            for i in 1...savesToUse {
                if let missedDate = calendar.date(byAdding: .day, value: -i, to: today) {
                    streakSaveDates.insert(formatter.string(from: missedDate))
                }
            }

            if savesToUse == missedDays {
                let bridgeDate = calendar.date(byAdding: .day, value: -1, to: today) ?? today
                lastActiveDate = bridgeDate
            } else {
                currentStreak = 0
            }
        } else {
            currentStreak = 0
        }
        save()
    }

    private func regenerateHearts() {
        guard hearts < maxHearts else { return }
        if lastHeartLossDate == nil {
            lastHeartLossDate = Date()
            save()
            return
        }
        guard let lastLoss = lastHeartLossDate else { return }
        let hoursSinceLoss = Date().timeIntervalSince(lastLoss) / 3600
        let heartsToRegen = min(Int(hoursSinceLoss), maxHearts - hearts)
        if heartsToRegen > 0 {
            hearts = min(hearts + heartsToRegen, maxHearts)
            if hearts < maxHearts {
                lastHeartLossDate = lastLoss.addingTimeInterval(Double(heartsToRegen) * 3600)
            }
            save()
        }
    }

    private var currentUserId: String?

    private var userDefaultsKey: String {
        if let uid = currentUserId { return "pharmaquest_game_state_\(uid)" }
        return "pharmaquest_game_state"
    }
    private var masteryDefaultsKey: String {
        if let uid = currentUserId { return "pharmaquest_mastery_map_\(uid)" }
        return "pharmaquest_mastery_map"
    }

    func powerUpMaxCapacity(for type: PowerUpType) -> Int {
        powerUpInventory.maxCapacity(for: type, isPro: isProUser)
    }

    func powerUpCount(for type: PowerUpType) -> Int {
        powerUpInventory.count(for: type)
    }

    func isPowerUpUnlocked(_ type: PowerUpType) -> Bool {
        currentStreak >= type.streakRequirement
    }

    func purchasePowerUp(_ type: PowerUpType) -> Bool {
        guard isPowerUpUnlocked(type) else { return false }
        guard coins >= type.purchasePrice else { return false }
        guard powerUpInventory.add(type, isPro: isProUser) else { return false }
        coins -= type.purchasePrice
        save()
        Task {
            let result = await SupabaseService.shared.purchasePowerup(
                type: type.rawValue,
                cost: type.purchasePrice,
                maxCapacity: powerUpMaxCapacity(for: type)
            )
            if result.success, let newCoins = result.coins {
                coins = newCoins
                if let inv = result.inventory {
                    powerUpInventory = inv.toInventory()
                }
                save()
            }
        }
        return true
    }

    func purchasePowerUpEnhancement(_ type: PowerUpType) -> Bool {
        guard !powerUpInventory.isEnhanced(type) else { return false }
        guard coins >= type.enhancementPrice else { return false }
        coins -= type.enhancementPrice
        powerUpInventory.setEnhanced(type)
        save()
        Task {
            let result = await SupabaseService.shared.enhancePowerup(type: type.rawValue, cost: type.enhancementPrice)
            if result.success, let newCoins = result.coins {
                coins = newCoins
                save()
            }
        }
        return true
    }

    func consumePowerUp(_ type: PowerUpType) -> Bool {
        guard powerUpInventory.consume(type) else { return false }
        save()
        Task {
            if let inv = await SupabaseService.shared.consumePowerup(type: type.rawValue) {
                powerUpInventory = inv.toInventory()
                save()
            }
        }
        return true
    }

    func awardPowerUpFromReward(_ type: PowerUpType) -> PowerUpOverflowResult {
        let result = PowerUpRewardHandler.handleReward(type: type, inventory: &powerUpInventory, isPro: isProUser)
        switch result {
        case .added:
            save()
        case .convertedToGold(let amount):
            coins += amount
            save()
        default:
            break
        }
        return result
    }

    func resetToDefaults() {
        let oldUserId = currentUserId
        hasLoadedFromCloud = false
        currentUserId = nil
        hearts = 5
        coins = 50
        totalXP = 0
        weeklyXP = 0
        monthlyXP = 0
        currentStreak = 0
        streakSaves = 0
        subsectionStars = [:]
        completedSubsections = []
        hasSeenLearning = []
        questionsAnswered = 0
        questionsCorrect = 0
        consecutiveCorrect = 0
        lastActiveDate = nil
        lastHeartLossDate = nil
        avatarAnimal = "beaver"
        avatarEyes = "normal"
        avatarMouth = "smile"
        avatarAccessory = "none"
        avatarBodyColor = ""
        avatarBgColor = ""
        ownedAvatars = ["beaver", "bird", "bunny", "cat"]
        ownedEyes = ["normal", "happy", "big"]
        ownedMouths = ["smile", "bigSmile", "tiny"]
        ownedAccessories = ["none"]
        username = "Student"
        selectedProfession = .pharmacy
        schoolName = ""
        dailyQuests = []
        lastQuestDate = ""
        masteryMap = [:]
        clinicalAuraPoints = 0
        activeBoosts = []
        doubleXPNextAttempt = false
        streakExtended = false
        previousStreak = 0
        powerUpInventory = .defaultInventory
        activityDates = []
        streakSaveDates = []
        accountCreatedDate = nil
        UserDefaults.standard.removeObject(forKey: "pharmaquest_game_state")
        UserDefaults.standard.removeObject(forKey: "pharmaquest_mastery_map")
        if let uid = oldUserId {
            UserDefaults.standard.removeObject(forKey: "pharmaquest_game_state_\(uid)")
            UserDefaults.standard.removeObject(forKey: "pharmaquest_mastery_map_\(uid)")
        }
    }

    func recordQuestionAttempt(question: Question, isCorrect: Bool) {
        let key = question.masteryKey
        var record = masteryMap[key] ?? MasteryRecord()
        if isCorrect {
            record.recordCorrect()
        } else {
            record.recordWrong()
        }
        masteryMap[key] = record
        saveMastery()
    }

    func masteryLevel(for question: Question) -> Int {
        masteryMap[question.masteryKey]?.level ?? 0
    }

    func dueReviewKeys(now: Date = Date()) -> [String] {
        masteryMap.filter { $0.value.nextDueDate <= now }.map(\.key)
    }

    private func saveMastery() {
        let encoded = masteryMap.mapValues { $0.toDictionary() }
        UserDefaults.standard.set(encoded, forKey: masteryDefaultsKey)
    }

    private func loadMastery() {
        guard let raw = UserDefaults.standard.dictionary(forKey: masteryDefaultsKey) as? [String: [String: Any]] else { return }
        masteryMap = raw.mapValues { MasteryRecord.from($0) }
    }

    func save() {
        let state: [String: Any] = [
            "hearts": hearts,
            "coins": coins,
            "totalXP": totalXP,
            "weeklyXP": weeklyXP,
            "monthlyXP": monthlyXP,
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
            "dailyBrandBlitzCount": dailyBrandBlitzCount,
            "dailyQuickPracticeCount": dailyQuickPracticeCount,
            "dailySpacedReviewCount": dailySpacedReviewCount,
            "dailyPracticeDate": dailyPracticeDate,
            "activeBoosts": activeBoosts.filter { $0.isActive }.map { ["type": $0.type.rawValue, "expiresAt": $0.expiresAt.timeIntervalSince1970] as [String : Any] },
            "doubleXPNextAttempt": doubleXPNextAttempt,
            "powerUpInventory": powerUpInventory.toDictionary(),
            "clinicalAuraPoints": clinicalAuraPoints,
            "activityDates": Array(activityDates),
            "streakSaveDates": Array(streakSaveDates),
            "accountCreatedDate": accountCreatedDate?.timeIntervalSince1970 ?? 0,
        ]
        UserDefaults.standard.set(state, forKey: userDefaultsKey)
    }

    func load() {
        guard let state = UserDefaults.standard.dictionary(forKey: userDefaultsKey) else { return }
        hearts = state["hearts"] as? Int ?? 5
        coins = state["coins"] as? Int ?? 50
        totalXP = state["totalXP"] as? Int ?? 0
        weeklyXP = state["weeklyXP"] as? Int ?? 0
        monthlyXP = state["monthlyXP"] as? Int ?? 0
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
        dailyBrandBlitzCount = state["dailyBrandBlitzCount"] as? Int ?? 0
        dailyQuickPracticeCount = state["dailyQuickPracticeCount"] as? Int ?? 0
        dailySpacedReviewCount = state["dailySpacedReviewCount"] as? Int ?? 0
        dailyPracticeDate = state["dailyPracticeDate"] as? String ?? ""
        clinicalAuraPoints = state["clinicalAuraPoints"] as? Int ?? 0
        activityDates = Set(state["activityDates"] as? [String] ?? [])
        streakSaveDates = Set(state["streakSaveDates"] as? [String] ?? [])
        let acctCreatedInterval = state["accountCreatedDate"] as? Double ?? 0
        accountCreatedDate = acctCreatedInterval > 0 ? Date(timeIntervalSince1970: acctCreatedInterval) : nil
        doubleXPNextAttempt = state["doubleXPNextAttempt"] as? Bool ?? false
        if let puData = state["powerUpInventory"] as? [String: Any] {
            powerUpInventory = PowerUpInventory.from(puData)
        }
        if let boostData = state["activeBoosts"] as? [[String: Any]] {
            activeBoosts = boostData.compactMap { dict in
                guard let typeRaw = dict["type"] as? String,
                      let type = BoostType(rawValue: typeRaw),
                      let expiresAt = dict["expiresAt"] as? Double else { return nil }
                let boost = ActiveBoost(type: type, expiresAt: Date(timeIntervalSince1970: expiresAt))
                return boost.isActive ? boost : nil
            }
        }
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

    func hydrateFromProfile(_ profile: UserProfile) {
        username = profile.username
        if let prof = Profession(rawValue: profile.profession) {
            selectedProfession = prof
        }
        schoolName = profile.school

        avatarAnimal = profile.avatarAnimal
        avatarEyes = profile.avatarEyes
        avatarMouth = profile.avatarMouth
        avatarAccessory = profile.avatarAccessory
        avatarBodyColor = profile.avatarBodyColor
        avatarBgColor = profile.avatarBgColor

        totalXP = profile.totalXP
        coins = profile.coins
        currentStreak = profile.currentStreak
        streakSaves = profile.streakSaves
        hearts = profile.hearts
        weeklyXP = profile.weeklyXP
        monthlyXP = profile.monthlyXP
        questionsAnswered = profile.questionsAnswered
        questionsCorrect = profile.questionsCorrect
        clinicalAuraPoints = profile.clinicalAuraPoints
        professionDonationsFromProfile = profile.professionDonations

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

        if let dateStr = profile.lastActiveDate, !dateStr.isEmpty {
            let isoFormatter = ISO8601DateFormatter()
            isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            if let d = isoFormatter.date(from: dateStr) {
                lastActiveDate = d
            }
        }
        if let dateStr = profile.lastHeartLossDate, !dateStr.isEmpty {
            let isoFormatter = ISO8601DateFormatter()
            isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            if let d = isoFormatter.date(from: dateStr) {
                lastHeartLossDate = d
            }
        }

        if let dateStr = profile.createdAt, !dateStr.isEmpty {
            let isoFormatter = ISO8601DateFormatter()
            isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            if let d = isoFormatter.date(from: dateStr) {
                accountCreatedDate = d
            } else {
                let isoBasic = ISO8601DateFormatter()
                isoBasic.formatOptions = [.withInternetDateTime]
                accountCreatedDate = isoBasic.date(from: dateStr)
            }
        }

        backfillActivityDatesFromStreak(streakOverride: profile.currentStreak)

        save()
    }

    private var professionDonationsFromProfile: Int = 0

    func reportDuoProgress(questionsAnswered: Int = 0, xpEarned: Int = 0, perfectQuiz: Bool = false, lessonCompleted: Bool = false) {
        let duo = DuoQuestService.shared
        guard duo.currentPartnership != nil else { return }
        Task {
            if questionsAnswered > 0 {
                await duo.reportDuoProgress(questType: "questions", amount: questionsAnswered)
            }
            if xpEarned > 0 {
                await duo.reportDuoProgress(questType: "xp_earned", amount: xpEarned)
            }
            if perfectQuiz {
                await duo.reportDuoProgress(questType: "perfect_quizzes", amount: 1)
            }
            if lessonCompleted {
                await duo.reportDuoProgress(questType: "lessons", amount: 1)
            }
            await duo.reportDuoProgress(questType: "streak_days", amount: 1)
        }
    }

    func applyMysteryChestReward(_ reward: MysteryChestReward) -> Bool {
        switch reward.type {
        case .coins:
            coins += reward.amount
            save()
            return true
        case .maxHearts:
            if hearts >= maxHearts { return false }
            hearts = maxHearts
            save()
            return true
        case .doubleXP:
            if doubleXPNextAttempt { return false }
            doubleXPNextAttempt = true
            save()
            return true
        case .powerUpFiftyFifty:
            if powerUpInventory.isAtCapacity(for: .fiftyFifty, isPro: isProUser) { return false }
            _ = powerUpInventory.add(.fiftyFifty, isPro: isProUser)
            save()
            return true
        case .powerUpShieldHeart:
            if powerUpInventory.isAtCapacity(for: .shieldHeart, isPro: isProUser) { return false }
            _ = powerUpInventory.add(.shieldHeart, isPro: isProUser)
            save()
            return true
        case .powerUpPharmaVision:
            if powerUpInventory.isAtCapacity(for: .pharmaVision, isPro: isProUser) { return false }
            _ = powerUpInventory.add(.pharmaVision, isPro: isProUser)
            save()
            return true
        case .streakSave:
            if streakSaves >= 3 { return false }
            streakSaves += 1
            save()
            return true
        }
    }

    func loadFromProfile(_ profile: UserProfile) {
        currentUserId = profile.id

        hydrateFromProfile(profile)
        hasLoadedFromCloud = true

        let preStreak = currentStreak
        let preSaves = streakSaves
        let preLastActive = lastActiveDate

        checkStreak()
        regenerateHearts()
        refreshDailyQuests()
        resetDailyPracticeCounts()

        save()

        let streakStateChanged = currentStreak != preStreak || streakSaves != preSaves || lastActiveDate != preLastActive

        Task {
            if streakStateChanged {
                await SupabaseService.shared.syncGameState(from: self)
            }
            if let inv = await SupabaseService.shared.fetchInventory() {
                powerUpInventory = inv.toInventory()
                save()
            }

            if let cloudMastery = await SupabaseService.shared.fetchMastery() {
                for (key, dict) in cloudMastery {
                    let record = MasteryRecord.from(dict)
                    if let existing = masteryMap[key] {
                        if record.totalAttempts > existing.totalAttempts {
                            masteryMap[key] = record
                        }
                    } else {
                        masteryMap[key] = record
                    }
                }
                saveMastery()
            }

            let history = await SupabaseService.shared.fetchCQOTDHistory()
            if !history.isEmpty {
                UserDefaults.standard.set(history, forKey: "cqotd_answered_dates")
            }
        }
    }
}
