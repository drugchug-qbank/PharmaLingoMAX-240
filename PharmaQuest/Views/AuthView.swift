import SwiftUI

struct AuthView: View {
    @State private var authVM = AuthViewModel()
    @State private var animateGradient: Bool = false

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
                            .font(.system(.largeTitle, design: .rounded, weight: .heavy))
                            .foregroundStyle(.white)

                        Text("Master the Top 300 Drugs")
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.8))
                    }

                    VStack(spacing: 16) {
                        if authVM.isSignUp {
                            signUpFields
                        } else {
                            signInFields
                        }

                        Button {
                            Task {
                                if authVM.isSignUp {
                                    await authVM.signUp()
                                } else {
                                    await authVM.signIn()
                                }
                            }
                        } label: {
                            Group {
                                if authVM.isLoading {
                                    ProgressView()
                                        .tint(.white)
                                } else {
                                    Text(authVM.isSignUp ? "Create Account" : "Sign In")
                                        .font(.headline)
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
                            withAnimation(.spring(duration: 0.3)) {
                                authVM.isSignUp.toggle()
                                authVM.errorMessage = nil
                            }
                        } label: {
                            Text(authVM.isSignUp ? "Already have an account? Sign In" : "Don't have an account? Sign Up")
                                .font(.subheadline)
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
        .alert("Check Your Email", isPresented: $authVM.showConfirmation) {
            Button("OK") {
                authVM.isSignUp = false
            }
        } message: {
            Text("We sent a confirmation link to \(authVM.email). Please confirm your email, then sign in.")
        }
    }

    @ViewBuilder
    private var signInFields: some View {
        VStack(spacing: 12) {
            AuthTextField(icon: "envelope.fill", placeholder: "Email", text: $authVM.email, isSecure: false)
            AuthTextField(icon: "lock.fill", placeholder: "Password", text: $authVM.password, isSecure: true)
        }
    }

    @ViewBuilder
    private var signUpFields: some View {
        VStack(spacing: 12) {
            AuthTextField(icon: "person.fill", placeholder: "Username", text: $authVM.username, isSecure: false)
            AuthTextField(icon: "envelope.fill", placeholder: "Email", text: $authVM.email, isSecure: false)
            AuthTextField(icon: "lock.fill", placeholder: "Password", text: $authVM.password, isSecure: true)
            AuthTextField(icon: "lock.shield.fill", placeholder: "Confirm Password", text: $authVM.confirmPassword, isSecure: true)

            VStack(alignment: .leading, spacing: 8) {
                Text("I am a...")
                    .font(.subheadline.bold())
                    .foregroundStyle(.primary)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(Profession.allCases, id: \.self) { prof in
                            Button {
                                authVM.selectedProfession = prof
                            } label: {
                                HStack(spacing: 4) {
                                    Image(systemName: prof.iconName)
                                        .font(.caption)
                                    Text(prof.rawValue)
                                        .font(.caption.bold())
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(authVM.selectedProfession == prof ? AppTheme.primaryBlue : Color(.tertiarySystemFill))
                                .foregroundStyle(authVM.selectedProfession == prof ? .white : .primary)
                                .clipShape(Capsule())
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
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
