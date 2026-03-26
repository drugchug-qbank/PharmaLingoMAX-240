import SwiftUI

@Observable
class AuthViewModel {
    var email: String = ""
    var password: String = ""
    var isLoading: Bool = false
    var errorMessage: String?
    var showError: Bool = false

    private let supabase = SupabaseService.shared

    var isSignInValid: Bool {
        !email.isEmpty && !password.isEmpty
    }

    func signIn() async {
        guard isSignInValid else {
            errorMessage = "Please enter your email and password."
            showError = true
            return
        }

        isLoading = true
        defer { isLoading = false }

        do {
            try await supabase.signIn(email: email, password: password)
        } catch {
            errorMessage = "Invalid email or password. Please try again."
            showError = true
        }
    }
}
