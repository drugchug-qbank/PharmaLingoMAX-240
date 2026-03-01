import SwiftUI

@Observable
class AuthViewModel {
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var username: String = ""
    var selectedProfession: Profession = .pharmacy
    var isSignUp: Bool = false
    var isLoading: Bool = false
    var errorMessage: String?
    var showError: Bool = false

    private let supabase = SupabaseService.shared

    var isSignUpValid: Bool {
        !email.isEmpty && !password.isEmpty && !username.isEmpty && password == confirmPassword && password.count >= 6
    }

    var isSignInValid: Bool {
        !email.isEmpty && !password.isEmpty
    }

    func signUp() async {
        guard isSignUpValid else {
            errorMessage = "Please fill in all fields. Password must be at least 6 characters."
            showError = true
            return
        }

        isLoading = true
        defer { isLoading = false }

        do {
            try await supabase.signUp(
                email: email,
                password: password,
                username: username,
                profession: selectedProfession.rawValue
            )
        } catch {
            errorMessage = error.localizedDescription
            showError = true
        }
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
