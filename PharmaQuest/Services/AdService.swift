import SwiftUI
import GoogleMobileAds

@Observable
class AdService: NSObject {
    static let shared = AdService()

    var isAdLoaded: Bool = false
    var isLoadingAd: Bool = false
    var adError: String?

    private var rewardedAd: RewardedAd?
    private var rewardCompletion: ((Bool) -> Void)?

    private var adUnitID: String {
        let configID = Config.EXPO_PUBLIC_ADMOB_REWARDED_AD_UNIT_ID
        if !configID.isEmpty { return configID }
        return "ca-app-pub-3940256099942544/1712485313"
    }

    override private init() {
        super.init()
    }

    func initializeSDK() {
        MobileAds.shared.start()
        Task { await loadAd() }
    }

    func loadAd() async {
        guard !isLoadingAd else { return }
        isLoadingAd = true
        adError = nil
        do {
            rewardedAd = try await RewardedAd.load(with: adUnitID, request: Request())
            rewardedAd?.fullScreenContentDelegate = self
            isAdLoaded = true
        } catch {
            adError = error.localizedDescription
            isAdLoaded = false
        }
        isLoadingAd = false
    }

    func showRewardedAd(completion: @escaping (Bool) -> Void) {
        guard let rewardedAd, isAdLoaded else {
            completion(false)
            Task { await loadAd() }
            return
        }

        guard let windowScene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene }).first,
              let rootVC = windowScene.windows.first?.rootViewController else {
            completion(false)
            return
        }

        var topVC = rootVC
        while let presented = topVC.presentedViewController {
            topVC = presented
        }

        rewardCompletion = completion
        rewardedAd.present(from: topVC) { [weak self] in
            self?.rewardCompletion?(true)
            self?.rewardCompletion = nil
        }
    }
}

extension AdService: FullScreenContentDelegate {
    nonisolated func adDidDismissFullScreenContent(_ ad: any FullScreenPresentingAd) {
        Task { @MainActor in
            isAdLoaded = false
            rewardedAd = nil
            if rewardCompletion != nil {
                rewardCompletion?(false)
                rewardCompletion = nil
            }
            await loadAd()
        }
    }

    nonisolated func ad(_ ad: any FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        Task { @MainActor in
            isAdLoaded = false
            rewardedAd = nil
            rewardCompletion?(false)
            rewardCompletion = nil
            await loadAd()
        }
    }
}
