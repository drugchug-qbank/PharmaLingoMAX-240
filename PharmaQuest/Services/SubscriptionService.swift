import SwiftUI
import RevenueCat

@Observable
class SubscriptionService {
    static let shared = SubscriptionService()

    var isProUser: Bool = false
    var offerings: Offerings?
    var isLoading: Bool = false
    var errorMessage: String?

    private init() {
        Task { await checkSubscriptionStatus() }
    }

    func checkSubscriptionStatus() async {
        do {
            let customerInfo = try await Purchases.shared.customerInfo()
            isProUser = customerInfo.entitlements["pro"]?.isActive == true
        } catch {
            isProUser = false
        }
    }

    func fetchOfferings() async {
        isLoading = true
        errorMessage = nil
        do {
            offerings = try await Purchases.shared.offerings()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func purchase(package: Package) async -> Bool {
        do {
            let result = try await Purchases.shared.purchase(package: package)
            let active = result.customerInfo.entitlements["pro"]?.isActive == true
            isProUser = active
            return active
        } catch {
            errorMessage = error.localizedDescription
            return false
        }
    }

    func restorePurchases() async -> Bool {
        do {
            let customerInfo = try await Purchases.shared.restorePurchases()
            let active = customerInfo.entitlements["pro"]?.isActive == true
            isProUser = active
            return active
        } catch {
            errorMessage = error.localizedDescription
            return false
        }
    }
}
