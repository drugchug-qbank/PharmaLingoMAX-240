import Foundation
import Supabase

nonisolated struct UserProfile: Codable, Sendable {
    let id: String
    var username: String
    var profession: String
    var school: String
    var avatarAnimal: String
    var avatarEyes: String
    var avatarMouth: String
    var avatarAccessory: String
    var totalXP: Int
    var coins: Int
    var currentStreak: Int
    var streakSaves: Int
    var hearts: Int
    var level: Int
    var weeklyXP: Int
    var monthlyXP: Int
    var completedSubsections: String
    var subsectionStars: String
    var hasSeenLearning: String
    var questionsAnswered: Int
    var questionsCorrect: Int
    var lastActiveDate: String?
    var lastHeartLossDate: String?
    var ownedAvatars: String
    var ownedEyes: String
    var ownedMouths: String
    var ownedAccessories: String
    var professionDonations: Int
    var createdAt: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, username, profession, school
        case avatarAnimal = "avatar_animal"
        case avatarEyes = "avatar_eyes"
        case avatarMouth = "avatar_mouth"
        case avatarAccessory = "avatar_accessory"
        case totalXP = "total_xp"
        case coins
        case currentStreak = "current_streak"
        case streakSaves = "streak_saves"
        case hearts, level
        case weeklyXP = "weekly_xp"
        case monthlyXP = "monthly_xp"
        case completedSubsections = "completed_subsections"
        case subsectionStars = "subsection_stars"
        case hasSeenLearning = "has_seen_learning"
        case questionsAnswered = "questions_answered"
        case questionsCorrect = "questions_correct"
        case lastActiveDate = "last_active_date"
        case lastHeartLossDate = "last_heart_loss_date"
        case ownedAvatars = "owned_avatars"
        case ownedEyes = "owned_eyes"
        case ownedMouths = "owned_mouths"
        case ownedAccessories = "owned_accessories"
        case professionDonations = "profession_donations"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

nonisolated struct LeaderboardRecord: Codable, Sendable {
    let id: String
    let username: String
    let avatarAnimal: String
    let weeklyXP: Int
    let currentStreak: Int
    let level: Int
    let profession: String
    let school: String

    enum CodingKeys: String, CodingKey {
        case id, username
        case avatarAnimal = "avatar_animal"
        case weeklyXP = "weekly_xp"
        case currentStreak = "current_streak"
        case level, profession, school
    }
}

nonisolated struct FriendRecord: Codable, Sendable {
    let id: String
    let userId: String
    let friendId: String
    let status: String

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case friendId = "friend_id"
        case status
    }
}

nonisolated struct FriendRequest: Codable, Sendable {
    let userId: String
    let friendId: String
    let status: String

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case friendId = "friend_id"
        case status
    }
}

nonisolated enum SupabaseServiceError: Error, LocalizedError, Sendable {
    case emailConfirmationRequired
    case userNotFound
    case profileCreateFailed

    nonisolated var errorDescription: String? {
        switch self {
        case .emailConfirmationRequired:
            return "Please check your email to confirm your account, then sign in."
        case .userNotFound:
            return "User not found."
        case .profileCreateFailed:
            return "Failed to create profile. Please try again."
        }
    }
}

nonisolated struct SchoolRanking: Codable, Sendable {
    let school: String
    let totalXP: Int

    enum CodingKeys: String, CodingKey {
        case school
        case totalXP = "total_xp"
    }
}

nonisolated struct ProfessionRanking: Codable, Sendable {
    let profession: String
    let totalDonations: Int

    enum CodingKeys: String, CodingKey {
        case profession
        case totalDonations = "total_donations"
    }
}

@Observable
class SupabaseService {
    static let shared = SupabaseService()

    let client: SupabaseClient
    var currentUser: Supabase.User?
    var currentProfile: UserProfile?
    var isAuthenticated: Bool = false
    var isLoading: Bool = true

    private init() {
        let url = Config.EXPO_PUBLIC_SUPABASE_URL.isEmpty
            ? "https://placeholder.supabase.co"
            : Config.EXPO_PUBLIC_SUPABASE_URL
        let key = Config.EXPO_PUBLIC_SUPABASE_ANON_KEY.isEmpty
            ? "placeholder-key"
            : Config.EXPO_PUBLIC_SUPABASE_ANON_KEY

        client = SupabaseClient(
            supabaseURL: URL(string: url)!,
            supabaseKey: key
        )
    }

    func checkSession() async {
        isLoading = true
        defer { isLoading = false }

        do {
            let session = try await client.auth.session
            currentUser = session.user
            isAuthenticated = true
            await fetchProfile()
        } catch {
            isAuthenticated = false
            currentUser = nil
        }
    }

    func signUp(email: String, password: String, username: String, profession: String) async throws {
        let response = try await client.auth.signUp(
            email: email,
            password: password
        )

        guard let session = response.session else {
            throw SupabaseServiceError.emailConfirmationRequired
        }

        currentUser = session.user
        isAuthenticated = true

        let profile = UserProfile(
            id: session.user.id.uuidString.lowercased(),
            username: username,
            profession: profession,
            school: "",
            avatarAnimal: "hare.fill",
            avatarEyes: "default",
            avatarMouth: "default",
            avatarAccessory: "none",
            totalXP: 0,
            coins: 50,
            currentStreak: 0,
            streakSaves: 0,
            hearts: 5,
            level: 1,
            weeklyXP: 0,
            monthlyXP: 0,
            completedSubsections: "[]",
            subsectionStars: "{}",
            hasSeenLearning: "[]",
            questionsAnswered: 0,
            questionsCorrect: 0,
            lastActiveDate: nil,
            lastHeartLossDate: nil,
            ownedAvatars: "[\"hare.fill\"]",
            ownedEyes: "[\"default\"]",
            ownedMouths: "[\"default\"]",
            ownedAccessories: "[\"none\"]",
            professionDonations: 0,
            createdAt: nil,
            updatedAt: nil
        )

        try await client.from("profiles").insert(profile).execute()
        currentProfile = profile
    }

    func signIn(email: String, password: String) async throws {
        let session = try await client.auth.signIn(
            email: email,
            password: password
        )
        currentUser = session.user
        isAuthenticated = true
        await fetchProfile()
    }

    func signOut() async throws {
        try await client.auth.signOut()
        currentUser = nil
        currentProfile = nil
        isAuthenticated = false
    }

    func fetchProfile() async {
        guard let userId = currentUser?.id.uuidString.lowercased() else { return }
        do {
            let profile: UserProfile = try await client.from("profiles")
                .select()
                .eq("id", value: userId)
                .single()
                .execute()
                .value
            currentProfile = profile
        } catch {
            print("Failed to fetch profile: \(error)")
        }
    }

    func updateProfile(_ profile: UserProfile) async {
        do {
            try await client.from("profiles")
                .update(profile)
                .eq("id", value: profile.id)
                .execute()
            currentProfile = profile
        } catch {
            print("Failed to update profile: \(error)")
        }
    }

    func syncGameState(from gameVM: GameViewModel) async {
        guard var profile = currentProfile else { return }

        let encoder = JSONEncoder()
        let completedData = (try? encoder.encode(Array(gameVM.completedSubsections))) ?? Data()
        let starsData = (try? encoder.encode(gameVM.subsectionStars)) ?? Data()
        let learningData = (try? encoder.encode(Array(gameVM.hasSeenLearning))) ?? Data()

        profile.totalXP = gameVM.totalXP
        profile.coins = gameVM.coins
        profile.currentStreak = gameVM.currentStreak
        profile.streakSaves = gameVM.streakSaves
        profile.hearts = gameVM.hearts
        profile.level = gameVM.level
        profile.weeklyXP = gameVM.totalXP
        profile.questionsAnswered = gameVM.questionsAnswered
        profile.questionsCorrect = gameVM.questionsCorrect
        profile.completedSubsections = String(data: completedData, encoding: .utf8) ?? "[]"
        profile.subsectionStars = String(data: starsData, encoding: .utf8) ?? "{}"
        profile.hasSeenLearning = String(data: learningData, encoding: .utf8) ?? "[]"

        await updateProfile(profile)
    }

    func fetchLeaderboard() async -> [LeaderboardRecord] {
        do {
            let records: [LeaderboardRecord] = try await client.from("profiles")
                .select("id, username, avatar_animal, weekly_xp, current_streak, level, profession, school")
                .order("weekly_xp", ascending: false)
                .limit(30)
                .execute()
                .value
            return records
        } catch {
            print("Failed to fetch leaderboard: \(error)")
            return []
        }
    }

    func fetchFriends() async -> [LeaderboardRecord] {
        guard let userId = currentUser?.id.uuidString else { return [] }
        do {
            let friends: [FriendRecord] = try await client.from("friends")
                .select()
                .or("user_id.eq.\(userId),friend_id.eq.\(userId)")
                .eq("status", value: "accepted")
                .execute()
                .value

            let friendIds = friends.map { $0.userId == userId ? $0.friendId : $0.userId }
            guard !friendIds.isEmpty else { return [] }

            let records: [LeaderboardRecord] = try await client.from("profiles")
                .select("id, username, avatar_animal, weekly_xp, current_streak, level, profession, school")
                .in("id", values: friendIds)
                .order("weekly_xp", ascending: false)
                .execute()
                .value
            return records
        } catch {
            print("Failed to fetch friends: \(error)")
            return []
        }
    }

    func sendFriendRequest(toUsername: String) async throws {
        guard let userId = currentUser?.id.uuidString else { return }

        let targetProfiles: [UserProfile] = try await client.from("profiles")
            .select()
            .eq("username", value: toUsername)
            .limit(1)
            .execute()
            .value

        guard let target = targetProfiles.first else {
            throw NSError(domain: "PharmaQuest", code: 404, userInfo: [NSLocalizedDescriptionKey: "User not found"])
        }

        let request = FriendRequest(
            userId: userId,
            friendId: target.id,
            status: "pending"
        )
        try await client.from("friends").insert(request).execute()
    }

    func acceptFriendRequest(requestId: String) async throws {
        try await client.from("friends")
            .update(["status": "accepted"])
            .eq("id", value: requestId)
            .execute()
    }

    func fetchPendingRequests() async -> [FriendRecord] {
        guard let userId = currentUser?.id.uuidString else { return [] }
        do {
            let requests: [FriendRecord] = try await client.from("friends")
                .select()
                .eq("friend_id", value: userId)
                .eq("status", value: "pending")
                .execute()
                .value
            return requests
        } catch {
            return []
        }
    }

    func donateToProfession(amount: Int) async -> Bool {
        guard var profile = currentProfile, profile.coins >= amount else { return false }
        profile.coins -= amount
        profile.professionDonations += amount
        await updateProfile(profile)
        return true
    }

    func searchUsers(query: String) async -> [LeaderboardRecord] {
        do {
            let results: [LeaderboardRecord] = try await client.from("profiles")
                .select("id, username, avatar_animal, weekly_xp, current_streak, level, profession, school")
                .ilike("username", pattern: "%\(query)%")
                .limit(20)
                .execute()
                .value
            return results
        } catch {
            return []
        }
    }
}
