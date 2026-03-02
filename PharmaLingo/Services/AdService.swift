import SwiftUI

@Observable
class AdService: NSObject {
    static let shared = AdService()

    var isAdLoaded: Bool = false
    var isLoadingAd: Bool = false
    var adError: String?

    override private init() {
        super.init()
    }

    func initializeSDK() {
    }

    func loadAd() async {
    }

    func showRewardedAd(completion: @escaping (Bool) -> Void) {
        completion(false)
    }
}
