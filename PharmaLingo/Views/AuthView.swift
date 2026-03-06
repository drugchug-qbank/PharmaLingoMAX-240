import SwiftUI

struct AuthView: View {
    @State private var authVM = AuthViewModel()
    var onSignUpTapped: () -> Void

    var body: some View {
        ZStack {
            MeshGradient(
                width: 3, height: 3,
                points: [
                    [0, 0], [0.5, 0], [1, 0],
                    [0, 0.5], [0.5, 0.5], [1, 0.5],
                    [0, 1], [0.5, 1], [1, 1]
                ],
                colors: [
                    AppTheme.darkBlue, AppTheme.primaryBlue, AppTheme.darkBlue,
                    AppTheme.primaryBlue, AppTheme.xpPurple, AppTheme.primaryBlue,
                    AppTheme.darkBlue, AppTheme.primaryBlue, AppTheme.darkBlue
                ]
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 32) {
                    Spacer().frame(height: 40)

                    VStack(spacing: 8) {
                        Image(systemName: "cross.case.fill")
                            .font(.system(size: 56))
                            .foregroundStyle(.white)
                            .symbolEffect(.pulse, options: .repeating)

                        Text("PharmaLingo")
                            .font(AppTheme.funFont(.largeTitle, weight: .heavy))
                            .foregroundStyle(.white)

                        Text("Master the Top 300 Drugs")
                            .font(AppTheme.funFont(.subheadline, weight: .bold))
                            .foregroundStyle(.white.opacity(0.8))
                    }

                    VStack(spacing: 16) {
                        VStack(spacing: 12) {
                            AuthTextField(icon: "envelope.fill", placeholder: "Email", text: $authVM.email, isSecure: false)
                            AuthTextField(icon: "lock.fill", placeholder: "Password", text: $authVM.password, isSecure: true)
                        }

                        Button {
                            Task { await authVM.signIn() }
                        } label: {
                            Group {
                                if authVM.isLoading {
                                    ProgressView()
                                        .tint(.white)
                                } else {
                                    Text("Sign In")
                                        .font(AppTheme.funFont(.headline, weight: .bold))
                                }
                            }
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(AppTheme.successGreen)
                            .clipShape(.rect(cornerRadius: 14))
                        }
                        .disabled(authVM.isLoading)

                        Button {
                            onSignUpTapped()
                        } label: {
                            Text("Don't have an account? Sign Up")
                                .font(AppTheme.funFont(.subheadline, weight: .bold))
                                .foregroundStyle(.white.opacity(0.9))
                        }
                    }
                    .padding(24)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.horizontal, 24)

                    Spacer()
                }
            }
            .scrollIndicators(.hidden)
        }
        .alert("Error", isPresented: $authVM.showError) {
            Button("OK") {}
        } message: {
            Text(authVM.errorMessage ?? "Something went wrong")
        }
    }
}

struct AuthTextField: View {
    let icon: String
    let placeholder: String
    @Binding var text: String
    let isSecure: Bool

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .frame(width: 20)

            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
            }
        }
        .padding(14)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(.rect(cornerRadius: 12))
    }
}
