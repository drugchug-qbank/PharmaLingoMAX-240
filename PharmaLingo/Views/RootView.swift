import SwiftUI

struct RootView: View {
    @Environment(SupabaseService.self) private var supabase
    @State private var hasCheckedSession: Bool = false
    @State private var showOnboarding: Bool = false

    var body: some View {
        Group {
            if !hasCheckedSession {
                ZStack {
                    AppTheme.headerGradient.ignoresSafeArea()
                    VStack(spacing: 16) {
                        Image(systemName: "cross.case.fill")
                            .font(.system(size: 56))
                            .foregroundStyle(.white)
                            .symbolEffect(.pulse, options: .repeating)
                        Text("PharmaLingo")
                            .font(.system(.largeTitle, design: .rounded, weight: .heavy))
                            .foregroundStyle(.white)
                        ProgressView()
                            .tint(.white)
                    }
                }
            } else if showOnboarding {
                OnboardingView(
                    onSignInTapped: {
                        withAnimation(.spring(duration: 0.4)) {
                            showOnboarding = false
                        }
                    },
                    onComplete: {
                        withAnimation(.spring(duration: 0.4)) {
                            showOnboarding = false
                        }
                    }
                )
            } else if supabase.isAuthenticated {
                ContentView()
            } else {
                AuthView(onSignUpTapped: {
                    withAnimation(.spring(duration: 0.4)) {
                        showOnboarding = true
                    }
                })
            }
        }
        .animation(.spring(duration: 0.4), value: hasCheckedSession)
        .animation(.spring(duration: 0.4), value: supabase.isAuthenticated)
        .animation(.spring(duration: 0.4), value: showOnboarding)
        .task {
            await supabase.checkSession()
            hasCheckedSession = true
        }
    }
}
