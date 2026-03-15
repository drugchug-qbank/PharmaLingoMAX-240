import SwiftUI

@Observable
class DailyChestViewModel {
    var opensUsedToday: Int = 0
    var lastOpenDate: String = ""
    var showChestReveal: Bool = false
    var chestReward: MysteryChestReward?
    var chestRewardApplied: Bool = false
    var isLoadingAd: Bool = false
    var xpAtSessionStart: Int = 0

    private let maxOpensPerDay = 4

    init() {
        loadState()
    }

    var todayString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }

    func remainingOpens(isPro: Bool) -> Int {
        resetIfNewDay()
        return max(maxOpensPerDay - opensUsedToday, 0)
    }

    func canOpenFree(isPro: Bool) -> Bool {
        resetIfNewDay()
        return opensUsedToday == 0
    }

    func canOpenWithAd(isPro: Bool) -> Bool {
        resetIfNewDay()
        guard !isPro else { return false }
        return opensUsedToday >= 1 && opensUsedToday < maxOpensPerDay
    }

    func canOpenPro(isPro: Bool, currentXP: Int) -> Bool {
        resetIfNewDay()
        guard isPro else { return false }
        guard opensUsedToday >= 1 && opensUsedToday < maxOpensPerDay else { return false }
        let xpGained = currentXP - xpAtSessionStart
        let xpNeeded = opensUsedToday * 100
        return xpGained >= xpNeeded
    }

    func xpNeededForNextOpen(opensUsed: Int) -> Int {
        return opensUsed * 100
    }

    func xpProgressForNextOpen(currentXP: Int) -> Int {
        let xpGained = currentXP - xpAtSessionStart
        let needed = xpNeededForNextOpen(opensUsed: opensUsedToday)
        return min(xpGained, needed)
    }

    func openChest(gameVM: GameViewModel) {
        let reward = MysteryChestReward.roll()
        let applied = gameVM.applyMysteryChestReward(reward)
        chestReward = MysteryChestReward(type: reward.type, amount: reward.amount, wasApplied: applied)
        chestRewardApplied = applied
        opensUsedToday += 1
        saveState()
        withAnimation(.spring(duration: 0.3)) {
            showChestReveal = true
        }
        gameVM.syncToCloud()
    }

    private func resetIfNewDay() {
        let today = todayString
        if lastOpenDate != today {
            opensUsedToday = 0
            lastOpenDate = today
            xpAtSessionStart = 0
            saveState()
        }
    }

    func initializeSessionXP(_ totalXP: Int) {
        resetIfNewDay()
        if xpAtSessionStart == 0 {
            xpAtSessionStart = totalXP
            saveState()
        }
    }

    private func saveState() {
        UserDefaults.standard.set(opensUsedToday, forKey: "daily_chest_opens_used")
        UserDefaults.standard.set(lastOpenDate, forKey: "daily_chest_last_date")
        UserDefaults.standard.set(xpAtSessionStart, forKey: "daily_chest_xp_start")
    }

    private func loadState() {
        opensUsedToday = UserDefaults.standard.integer(forKey: "daily_chest_opens_used")
        lastOpenDate = UserDefaults.standard.string(forKey: "daily_chest_last_date") ?? ""
        xpAtSessionStart = UserDefaults.standard.integer(forKey: "daily_chest_xp_start")
        resetIfNewDay()
    }
}
