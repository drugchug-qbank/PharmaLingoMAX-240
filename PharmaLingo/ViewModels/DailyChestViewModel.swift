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
    var hasLoadedFromCloud: Bool = false

    private let maxOpensPerDay = 4
    private let supabase = SupabaseService.shared

    init() {
        loadLocalState()
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
        saveLocalState()
        withAnimation(.spring(duration: 0.3)) {
            showChestReveal = true
        }
        Task {
            let result = await supabase.openDailyChest(
                rewardType: reward.type.rawValue,
                rewardAmount: reward.amount,
                wasApplied: applied
            )
            if result.success {
                opensUsedToday = result.opensUsed
                saveLocalState()
            }
            await supabase.fetchProfile()
        }
        gameVM.syncToCloud()
    }

    func openChestFromView(gameVM: GameViewModel, reward: MysteryChestReward, applied: Bool) {
        opensUsedToday += 1
        saveLocalState()
        Task {
            let result = await supabase.openDailyChest(
                rewardType: reward.type.rawValue,
                rewardAmount: reward.amount,
                wasApplied: applied
            )
            if result.success {
                opensUsedToday = result.opensUsed
                saveLocalState()
            }
            await supabase.fetchProfile()
        }
        gameVM.syncToCloud()
    }

    private func resetIfNewDay() {
        let today = todayString
        if lastOpenDate != today {
            opensUsedToday = 0
            lastOpenDate = today
            xpAtSessionStart = 0
            saveLocalState()
        }
    }

    func initializeSessionXP(_ totalXP: Int) {
        resetIfNewDay()
        if xpAtSessionStart == 0 {
            xpAtSessionStart = totalXP
            saveLocalState()
            Task {
                await supabase.saveDailyChestXPStart(xp: totalXP)
            }
        }
    }

    func loadFromCloud() async {
        guard supabase.isAuthenticated else { return }
        if let state = await supabase.fetchDailyChestState() {
            let today = todayString
            let cloudDate = state.lastOpenDate ?? ""
            let cloudDateTrimmed = String(cloudDate.prefix(10))

            if cloudDateTrimmed == today {
                opensUsedToday = state.opensUsed
                lastOpenDate = today
                xpAtSessionStart = state.xpAtSessionStart
            } else {
                opensUsedToday = 0
                lastOpenDate = today
                xpAtSessionStart = 0
            }
            saveLocalState()
            hasLoadedFromCloud = true
        }
    }

    func saveStatePublic() {
        saveLocalState()
    }

    private func saveLocalState() {
        UserDefaults.standard.set(opensUsedToday, forKey: "daily_chest_opens_used")
        UserDefaults.standard.set(lastOpenDate, forKey: "daily_chest_last_date")
        UserDefaults.standard.set(xpAtSessionStart, forKey: "daily_chest_xp_start")
    }

    private func loadLocalState() {
        opensUsedToday = UserDefaults.standard.integer(forKey: "daily_chest_opens_used")
        lastOpenDate = UserDefaults.standard.string(forKey: "daily_chest_last_date") ?? ""
        xpAtSessionStart = UserDefaults.standard.integer(forKey: "daily_chest_xp_start")
        resetIfNewDay()
    }
}
