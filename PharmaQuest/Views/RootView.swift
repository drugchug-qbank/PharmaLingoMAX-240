import SwiftUI

struct RootView: View {
    @Environment(SupabaseService.self) private var supabase
    @State private var hasCheckedSession: Bool = false

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
            } else if supabase.isAuthenticated {
                ContentView()
            } else {
                AuthView()
            }
        }
        .task {
            await supabase.checkSession()
            hasCheckedSession = true
        }
    }
}
