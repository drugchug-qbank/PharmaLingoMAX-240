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
    var avatarBodyColor: String
    var avatarBgColor: String
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
        case avatarBodyColor = "avatar_body_color"
        case avatarBgColor = "avatar_bg_color"
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

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        username = try container.decode(String.self, forKey: .username)
        profession = try container.decode(String.self, forKey: .profession)
        school = try container.decode(String.self, forKey: .school)
        avatarAnimal = try container.decode(String.self, forKey: .avatarAnimal)
        avatarEyes = try container.decode(String.self, forKey: .avatarEyes)
        avatarMouth = try container.decode(String.self, forKey: .avatarMouth)
        avatarAccessory = try container.decode(String.self, forKey: .avatarAccessory)
        avatarBodyColor = (try? container.decode(String.self, forKey: .avatarBodyColor)) ?? ""
        avatarBgColor = (try? container.decode(String.self, forKey: .avatarBgColor)) ?? ""
        totalXP = try container.decode(Int.self, forKey: .totalXP)
        coins = try container.decode(Int.self, forKey: .coins)
        currentStreak = try container.decode(Int.self, forKey: .currentStreak)
        streakSaves = try container.decode(Int.self, forKey: .streakSaves)
        hearts = try container.decode(Int.self, forKey: .hearts)
        level = try container.decode(Int.self, forKey: .level)
        weeklyXP = try container.decode(Int.self, forKey: .weeklyXP)
        monthlyXP = try container.decode(Int.self, forKey: .monthlyXP)
        completedSubsections = try container.decode(String.self, forKey: .completedSubsections)
        subsectionStars = try container.decode(String.self, forKey: .subsectionStars)
        hasSeenLearning = try container.decode(String.self, forKey: .hasSeenLearning)
        questionsAnswered = try container.decode(Int.self, forKey: .questionsAnswered)
        questionsCorrect = try container.decode(Int.self, forKey: .questionsCorrect)
        lastActiveDate = try container.decodeIfPresent(String.self, forKey: .lastActiveDate)
        lastHeartLossDate = try container.decodeIfPresent(String.self, forKey: .lastHeartLossDate)
        ownedAvatars = try container.decode(String.self, forKey: .ownedAvatars)
        ownedEyes = try container.decode(String.self, forKey: .ownedEyes)
        ownedMouths = try container.decode(String.self, forKey: .ownedMouths)
        ownedAccessories = try container.decode(String.self, forKey: .ownedAccessories)
        professionDonations = try container.decode(Int.self, forKey: .professionDonations)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
    }

    init(id: String, username: String, profession: String, school: String, avatarAnimal: String, avatarEyes: String, avatarMouth: String, avatarAccessory: String, avatarBodyColor: String, avatarBgColor: String, totalXP: Int, coins: Int, currentStreak: Int, streakSaves: Int, hearts: Int, level: Int, weeklyXP: Int, monthlyXP: Int, completedSubsections: String, subsectionStars: String, hasSeenLearning: String, questionsAnswered: Int, questionsCorrect: Int, lastActiveDate: String?, lastHeartLossDate: String?, ownedAvatars: String, ownedEyes: String, ownedMouths: String, ownedAccessories: String, professionDonations: Int, createdAt: String?, updatedAt: String?) {
        self.id = id
        self.username = username
        self.profession = profession
        self.school = school
        self.avatarAnimal = avatarAnimal
        self.avatarEyes = avatarEyes
        self.avatarMouth = avatarMouth
        self.avatarAccessory = avatarAccessory
        self.avatarBodyColor = avatarBodyColor
        self.avatarBgColor = avatarBgColor
        self.totalXP = totalXP
        self.coins = coins
        self.currentStreak = currentStreak
        self.streakSaves = streakSaves
        self.hearts = hearts
        self.level = level
        self.weeklyXP = weeklyXP
        self.monthlyXP = monthlyXP
        self.completedSubsections = completedSubsections
        self.subsectionStars = subsectionStars
        self.hasSeenLearning = hasSeenLearning
        self.questionsAnswered = questionsAnswered
        self.questionsCorrect = questionsCorrect
        self.lastActiveDate = lastActiveDate
        self.lastHeartLossDate = lastHeartLossDate
        self.ownedAvatars = ownedAvatars
        self.ownedEyes = ownedEyes
        self.ownedMouths = ownedMouths
        self.ownedAccessories = ownedAccessories
        self.professionDonations = professionDonations
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

nonisolated struct LeaderboardRecord: Codable, Sendable {
    let id: String
    let username: String
    let avatarAnimal: String
    let avatarEyes: String
    let avatarMouth: String
    let avatarAccessory: String
    let avatarBodyColor: String
    let avatarBgColor: String
    let weeklyXP: Int
    let currentStreak: Int
    let level: Int
    let profession: String
    let school: String

    enum CodingKeys: String, CodingKey {
        case id, username
        case avatarAnimal = "avatar_animal"
        case avatarEyes = "avatar_eyes"
        case avatarMouth = "avatar_mouth"
        case avatarAccessory = "avatar_accessory"
        case avatarBodyColor = "avatar_body_color"
        case avatarBgColor = "avatar_bg_color"
        case weeklyXP = "weekly_xp"
        case currentStreak = "current_streak"
        case level, profession, school
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        username = try container.decode(String.self, forKey: .username)
        avatarAnimal = try container.decode(String.self, forKey: .avatarAnimal)
        avatarEyes = try container.decode(String.self, forKey: .avatarEyes)
        avatarMouth = try container.decode(String.self, forKey: .avatarMouth)
        avatarAccessory = try container.decode(String.self, forKey: .avatarAccessory)
        avatarBodyColor = (try? container.decode(String.self, forKey: .avatarBodyColor)) ?? ""
        avatarBgColor = (try? container.decode(String.self, forKey: .avatarBgColor)) ?? ""
        weeklyXP = try container.decode(Int.self, forKey: .weeklyXP)
        currentStreak = try container.decode(Int.self, forKey: .currentStreak)
        level = try container.decode(Int.self, forKey: .level)
        profession = try container.decode(String.self, forKey: .profession)
        school = try container.decode(String.self, forKey: .school)
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
            avatarAnimal: "beaver",
            avatarEyes: "normal",
            avatarMouth: "smile",
            avatarAccessory: "none",
            avatarBodyColor: "",
            avatarBgColor: "",
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
            ownedAvatars: "[\"beaver\",\"bird\",\"bunny\",\"cat\"]",
            ownedEyes: "[\"normal\",\"happy\",\"big\"]",
            ownedMouths: "[\"smile\",\"bigSmile\",\"tiny\"]",
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
        await fetchProfile()
        isAuthenticated = true
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
        let ownedAvatarsData = (try? encoder.encode(Array(gameVM.ownedAvatars))) ?? Data()
        let ownedEyesData = (try? encoder.encode(Array(gameVM.ownedEyes))) ?? Data()
        let ownedMouthsData = (try? encoder.encode(Array(gameVM.ownedMouths))) ?? Data()
        let ownedAccessoriesData = (try? encoder.encode(Array(gameVM.ownedAccessories))) ?? Data()

        profile.username = gameVM.username
        profile.profession = gameVM.selectedProfession.rawValue
        profile.school = gameVM.schoolName
        profile.avatarAnimal = gameVM.avatarAnimal
        profile.avatarEyes = gameVM.avatarEyes
        profile.avatarMouth = gameVM.avatarMouth
        profile.avatarAccessory = gameVM.avatarAccessory
        profile.avatarBodyColor = gameVM.avatarBodyColor
        profile.avatarBgColor = gameVM.avatarBgColor
        profile.totalXP = gameVM.totalXP
        profile.coins = gameVM.coins
        profile.currentStreak = gameVM.currentStreak
        profile.streakSaves = gameVM.streakSaves
        profile.hearts = gameVM.hearts
        profile.level = gameVM.level
        profile.weeklyXP = gameVM.totalXP
        profile.monthlyXP = gameVM.totalXP
        profile.questionsAnswered = gameVM.questionsAnswered
        profile.questionsCorrect = gameVM.questionsCorrect
        profile.completedSubsections = String(data: completedData, encoding: .utf8) ?? "[]"
        profile.subsectionStars = String(data: starsData, encoding: .utf8) ?? "{}"
        profile.hasSeenLearning = String(data: learningData, encoding: .utf8) ?? "[]"
        profile.ownedAvatars = String(data: ownedAvatarsData, encoding: .utf8) ?? "[]"
        profile.ownedEyes = String(data: ownedEyesData, encoding: .utf8) ?? "[]"
        profile.ownedMouths = String(data: ownedMouthsData, encoding: .utf8) ?? "[]"
        profile.ownedAccessories = String(data: ownedAccessoriesData, encoding: .utf8) ?? "[]"

        await updateProfile(profile)
    }

    func fetchLeaderboard() async -> [LeaderboardRecord] {
        do {
            let records: [LeaderboardRecord] = try await client.from("profiles")
                .select("id, username, avatar_animal, avatar_eyes, avatar_mouth, avatar_accessory, avatar_body_color, avatar_bg_color, weekly_xp, current_streak, level, profession, school")
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
        guard let userId = currentUser?.id.uuidString.lowercased() else { return [] }
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
                .select("id, username, avatar_animal, avatar_eyes, avatar_mouth, avatar_accessory, avatar_body_color, avatar_bg_color, weekly_xp, current_streak, level, profession, school")
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
        guard let userId = currentUser?.id.uuidString.lowercased() else { return }

        let targetProfiles: [UserProfile] = try await client.from("profiles")
            .select()
            .eq("username", value: toUsername)
            .limit(1)
            .execute()
            .value

        guard let target = targetProfiles.first else {
            throw NSError(domain: "PharmaQuest", code: 404, userInfo: [NSLocalizedDescriptionKey: "User not found"])
        }

        guard target.id != userId else {
            throw NSError(domain: "PharmaQuest", code: 400, userInfo: [NSLocalizedDescriptionKey: "You can't add yourself"])
        }

        let existing: [FriendRecord] = try await client.from("friends")
            .select()
            .or("and(user_id.eq.\(userId),friend_id.eq.\(target.id)),and(user_id.eq.\(target.id),friend_id.eq.\(userId))")
            .execute()
            .value

        guard existing.isEmpty else {
            let status = existing.first?.status ?? "pending"
            if status == "accepted" {
                throw NSError(domain: "PharmaQuest", code: 409, userInfo: [NSLocalizedDescriptionKey: "Already friends with this user"])
            }
            throw NSError(domain: "PharmaQuest", code: 409, userInfo: [NSLocalizedDescriptionKey: "Friend request already pending"])
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

    func fetchPendingRequests() async -> [PendingFriendInfo] {
        guard let userId = currentUser?.id.uuidString.lowercased() else { return [] }
        do {
            let requests: [FriendRecord] = try await client.from("friends")
                .select()
                .eq("friend_id", value: userId)
                .eq("status", value: "pending")
                .execute()
                .value

            guard !requests.isEmpty else { return [] }

            let senderIds = requests.map { $0.userId }
            let profiles: [LeaderboardRecord] = try await client.from("profiles")
                .select("id, username, avatar_animal, avatar_eyes, avatar_mouth, avatar_accessory, avatar_body_color, avatar_bg_color, weekly_xp, current_streak, level, profession, school")
                .in("id", values: senderIds)
                .execute()
                .value

            let profileMap = Dictionary(uniqueKeysWithValues: profiles.map { ($0.id, $0) })

            return requests.compactMap { req in
                guard let profile = profileMap[req.userId] else { return nil }
                return PendingFriendInfo(
                    requestId: req.id,
                    userId: req.userId,
                    username: profile.username,
                    avatarAnimal: profile.avatarAnimal,
                    avatarEyes: profile.avatarEyes,
                    avatarMouth: profile.avatarMouth,
                    avatarAccessory: profile.avatarAccessory,
                    avatarBodyColor: profile.avatarBodyColor,
                    avatarBgColor: profile.avatarBgColor,
                    level: profile.level,
                    profession: profile.profession
                )
            }
        } catch {
            print("Failed to fetch pending requests: \(error)")
            return []
        }
    }

    func declineFriendRequest(requestId: String) async throws {
        try await client.from("friends")
            .delete()
            .eq("id", value: requestId)
            .execute()
    }

    func removeFriend(friendId: String) async throws {
        guard let userId = currentUser?.id.uuidString.lowercased() else { return }
        try await client.from("friends")
            .delete()
            .or("and(user_id.eq.\(userId),friend_id.eq.\(friendId)),and(user_id.eq.\(friendId),friend_id.eq.\(userId))")
            .execute()
    }

    func fetchFriendProfile(friendId: String) async -> FriendDetailProfile? {
        do {
            let profile: UserProfile = try await client.from("profiles")
                .select()
                .eq("id", value: friendId)
                .single()
                .execute()
                .value
            return FriendDetailProfile(
                id: profile.id,
                username: profile.username,
                avatarAnimal: profile.avatarAnimal,
                avatarEyes: profile.avatarEyes,
                avatarMouth: profile.avatarMouth,
                avatarAccessory: profile.avatarAccessory,
                avatarBodyColor: profile.avatarBodyColor,
                avatarBgColor: profile.avatarBgColor,
                totalXP: profile.totalXP,
                weeklyXP: profile.weeklyXP,
                currentStreak: profile.currentStreak,
                level: profile.level,
                profession: profile.profession,
                school: profile.school,
                questionsAnswered: profile.questionsAnswered,
                questionsCorrect: profile.questionsCorrect
            )
        } catch {
            print("Failed to fetch friend profile: \(error)")
            return nil
        }
    }

    func fetchSchoolRankings() async -> [SchoolRanking] {
        do {
            let profiles: [UserProfile] = try await client.from("profiles")
                .select()
                .neq("school", value: "")
                .execute()
                .value

            var schoolXP: [String: Int] = [:]
            for profile in profiles {
                guard !profile.school.isEmpty else { continue }
                schoolXP[profile.school, default: 0] += profile.monthlyXP
            }

            return schoolXP.map { SchoolRanking(school: $0.key, totalXP: $0.value) }
                .sorted { $0.totalXP > $1.totalXP }
        } catch {
            print("Failed to fetch school rankings: \(error)")
            return []
        }
    }

    func fetchProfessionRankings() async -> [ProfessionRanking] {
        do {
            let profiles: [UserProfile] = try await client.from("profiles")
                .select()
                .execute()
                .value

            var profDonations: [String: Int] = [:]
            for profile in profiles {
                guard !profile.profession.isEmpty, profile.professionDonations > 0 else { continue }
                profDonations[profile.profession, default: 0] += profile.professionDonations
            }

            return profDonations.map { ProfessionRanking(profession: $0.key, totalDonations: $0.value) }
                .sorted { $0.totalDonations > $1.totalDonations }
        } catch {
            print("Failed to fetch profession rankings: \(error)")
            return []
        }
    }

    func donateToProfession(amount: Int, currentCoins: Int) async -> Bool {
        guard var profile = currentProfile else { return false }
        guard currentCoins >= amount else { return false }
        profile.coins = currentCoins - amount
        profile.professionDonations += amount
        do {
            try await client.from("profiles")
                .update(["coins": profile.coins, "profession_donations": profile.professionDonations])
                .eq("id", value: profile.id)
                .execute()
            currentProfile = profile
            return true
        } catch {
            print("Failed to donate: \(error)")
            return false
        }
    }

    func searchUsers(query: String) async -> [LeaderboardRecord] {
        guard let userId = currentUser?.id.uuidString.lowercased() else { return [] }
        do {
            let results: [LeaderboardRecord] = try await client.from("profiles")
                .select("id, username, avatar_animal, avatar_eyes, avatar_mouth, avatar_accessory, avatar_body_color, avatar_bg_color, weekly_xp, current_streak, level, profession, school")
                .ilike("username", pattern: "%\(query)%")
                .neq("id", value: userId)
                .limit(20)
                .execute()
                .value
            return results
        } catch {
            return []
        }
    }
}
