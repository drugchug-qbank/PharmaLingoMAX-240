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
        username = (try? container.decode(String.self, forKey: .username)) ?? "Student"
        profession = (try? container.decode(String.self, forKey: .profession)) ?? ""
        school = (try? container.decode(String.self, forKey: .school)) ?? ""
        avatarAnimal = (try? container.decode(String.self, forKey: .avatarAnimal)) ?? "beaver"
        avatarEyes = (try? container.decode(String.self, forKey: .avatarEyes)) ?? "normal"
        avatarMouth = (try? container.decode(String.self, forKey: .avatarMouth)) ?? "smile"
        avatarAccessory = (try? container.decode(String.self, forKey: .avatarAccessory)) ?? "none"
        avatarBodyColor = (try? container.decode(String.self, forKey: .avatarBodyColor)) ?? ""
        avatarBgColor = (try? container.decode(String.self, forKey: .avatarBgColor)) ?? ""
        totalXP = (try? container.decode(Int.self, forKey: .totalXP)) ?? 0
        coins = (try? container.decode(Int.self, forKey: .coins)) ?? 0
        currentStreak = (try? container.decode(Int.self, forKey: .currentStreak)) ?? 0
        streakSaves = (try? container.decode(Int.self, forKey: .streakSaves)) ?? 0
        hearts = (try? container.decode(Int.self, forKey: .hearts)) ?? 5
        level = (try? container.decode(Int.self, forKey: .level)) ?? 1
        weeklyXP = (try? container.decode(Int.self, forKey: .weeklyXP)) ?? 0
        monthlyXP = (try? container.decode(Int.self, forKey: .monthlyXP)) ?? 0
        completedSubsections = (try? container.decode(String.self, forKey: .completedSubsections)) ?? "[]"
        subsectionStars = (try? container.decode(String.self, forKey: .subsectionStars)) ?? "{}"
        hasSeenLearning = (try? container.decode(String.self, forKey: .hasSeenLearning)) ?? "[]"
        questionsAnswered = (try? container.decode(Int.self, forKey: .questionsAnswered)) ?? 0
        questionsCorrect = (try? container.decode(Int.self, forKey: .questionsCorrect)) ?? 0
        lastActiveDate = try? container.decode(String.self, forKey: .lastActiveDate)
        lastHeartLossDate = try? container.decode(String.self, forKey: .lastHeartLossDate)
        ownedAvatars = (try? container.decode(String.self, forKey: .ownedAvatars)) ?? "[]"
        ownedEyes = (try? container.decode(String.self, forKey: .ownedEyes)) ?? "[]"
        ownedMouths = (try? container.decode(String.self, forKey: .ownedMouths)) ?? "[]"
        ownedAccessories = (try? container.decode(String.self, forKey: .ownedAccessories)) ?? "[]"
        professionDonations = (try? container.decode(Int.self, forKey: .professionDonations)) ?? 0
        createdAt = try? container.decode(String.self, forKey: .createdAt)
        updatedAt = try? container.decode(String.self, forKey: .updatedAt)
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
        username = (try? container.decode(String.self, forKey: .username)) ?? "User"
        avatarAnimal = (try? container.decode(String.self, forKey: .avatarAnimal)) ?? "beaver"
        avatarEyes = (try? container.decode(String.self, forKey: .avatarEyes)) ?? "normal"
        avatarMouth = (try? container.decode(String.self, forKey: .avatarMouth)) ?? "smile"
        avatarAccessory = (try? container.decode(String.self, forKey: .avatarAccessory)) ?? "none"
        avatarBodyColor = (try? container.decode(String.self, forKey: .avatarBodyColor)) ?? ""
        avatarBgColor = (try? container.decode(String.self, forKey: .avatarBgColor)) ?? ""
        weeklyXP = (try? container.decode(Int.self, forKey: .weeklyXP)) ?? 0
        currentStreak = (try? container.decode(Int.self, forKey: .currentStreak)) ?? 0
        level = (try? container.decode(Int.self, forKey: .level)) ?? 1
        profession = (try? container.decode(String.self, forKey: .profession)) ?? ""
        school = (try? container.decode(String.self, forKey: .school)) ?? ""
    }

    init(id: String, username: String, avatarAnimal: String, avatarEyes: String, avatarMouth: String, avatarAccessory: String, avatarBodyColor: String, avatarBgColor: String, weeklyXP: Int, currentStreak: Int, level: Int, profession: String, school: String) {
        self.id = id
        self.username = username
        self.avatarAnimal = avatarAnimal
        self.avatarEyes = avatarEyes
        self.avatarMouth = avatarMouth
        self.avatarAccessory = avatarAccessory
        self.avatarBodyColor = avatarBodyColor
        self.avatarBgColor = avatarBgColor
        self.weeklyXP = weeklyXP
        self.currentStreak = currentStreak
        self.level = level
        self.profession = profession
        self.school = school
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

nonisolated enum FriendshipStatus: Sendable {
    case friend
    case pendingSent
    case pendingReceived
    case notFriend
    case isSelf
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

nonisolated struct ProfileUpdateData: Encodable, Sendable {
    let username: String
    let profession: String
    let school: String
    let avatarAnimal: String
    let avatarEyes: String
    let avatarMouth: String
    let avatarAccessory: String
    let avatarBodyColor: String
    let avatarBgColor: String
    let totalXP: Int
    let coins: Int
    let currentStreak: Int
    let streakSaves: Int
    let hearts: Int
    let level: Int
    let weeklyXP: Int
    let monthlyXP: Int
    let completedSubsections: String
    let subsectionStars: String
    let hasSeenLearning: String
    let questionsAnswered: Int
    let questionsCorrect: Int
    let ownedAvatars: String
    let ownedEyes: String
    let ownedMouths: String
    let ownedAccessories: String
    let professionDonations: Int

    enum CodingKeys: String, CodingKey {
        case username, profession, school
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
        case ownedAvatars = "owned_avatars"
        case ownedEyes = "owned_eyes"
        case ownedMouths = "owned_mouths"
        case ownedAccessories = "owned_accessories"
        case professionDonations = "profession_donations"
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
        let urlString = Config.EXPO_PUBLIC_SUPABASE_URL.isEmpty
            ? "https://placeholder.supabase.co"
            : Config.EXPO_PUBLIC_SUPABASE_URL
        let key = Config.EXPO_PUBLIC_SUPABASE_ANON_KEY.isEmpty
            ? "placeholder-key"
            : Config.EXPO_PUBLIC_SUPABASE_ANON_KEY

        let url = URL(string: urlString) ?? URL(string: "https://placeholder.supabase.co")!
        client = SupabaseClient(
            supabaseURL: url,
            supabaseKey: key
        )
    }

    func checkSession() async {
        isLoading = true
        defer { isLoading = false }

        do {
            let session = try await client.auth.session
            currentUser = session.user
            await fetchProfile()
            isAuthenticated = true
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

    @discardableResult
    func saveAvatarToCloud(animal: String, eyes: String, mouth: String, accessory: String, bodyColor: String, bgColor: String) async -> Bool {
        guard var profile = currentProfile else { return false }
        profile.avatarAnimal = animal
        profile.avatarEyes = eyes
        profile.avatarMouth = mouth
        profile.avatarAccessory = accessory
        profile.avatarBodyColor = bodyColor
        profile.avatarBgColor = bgColor
        currentProfile = profile
        let avatarData: [String: String] = [
            "avatar_animal": animal,
            "avatar_eyes": eyes,
            "avatar_mouth": mouth,
            "avatar_accessory": accessory,
            "avatar_body_color": bodyColor,
            "avatar_bg_color": bgColor
        ]
        do {
            try await client.from("profiles")
                .update(avatarData)
                .eq("id", value: profile.id)
                .execute()
            await fetchProfile()
            return true
        } catch {
            print("Failed to save avatar: \(error)")
            return false
        }
    }

    func completeOnboarding(school: String, animal: String, eyes: String, mouth: String, accessory: String, bodyColor: String, bgColor: String) async {
        guard let profile = currentProfile else { return }
        let data: [String: String] = [
            "school": school,
            "avatar_animal": animal,
            "avatar_eyes": eyes,
            "avatar_mouth": mouth,
            "avatar_accessory": accessory,
            "avatar_body_color": bodyColor,
            "avatar_bg_color": bgColor
        ]
        do {
            try await client.from("profiles")
                .update(data)
                .eq("id", value: profile.id)
                .execute()
            await fetchProfile()
        } catch {
            print("Failed to complete onboarding: \(error)")
        }
    }

    func syncGameState(from gameVM: GameViewModel) async {
        guard let profile = currentProfile else { return }

        let encoder = JSONEncoder()
        let completedData = (try? encoder.encode(Array(gameVM.completedSubsections))) ?? Data()
        let starsData = (try? encoder.encode(gameVM.subsectionStars)) ?? Data()
        let learningData = (try? encoder.encode(Array(gameVM.hasSeenLearning))) ?? Data()
        let ownedAvatarsData = (try? encoder.encode(Array(gameVM.ownedAvatars))) ?? Data()
        let ownedEyesData = (try? encoder.encode(Array(gameVM.ownedEyes))) ?? Data()
        let ownedMouthsData = (try? encoder.encode(Array(gameVM.ownedMouths))) ?? Data()
        let ownedAccessoriesData = (try? encoder.encode(Array(gameVM.ownedAccessories))) ?? Data()

        let updateData = ProfileUpdateData(
            username: gameVM.username,
            profession: gameVM.selectedProfession.rawValue,
            school: gameVM.schoolName,
            avatarAnimal: gameVM.avatarAnimal,
            avatarEyes: gameVM.avatarEyes,
            avatarMouth: gameVM.avatarMouth,
            avatarAccessory: gameVM.avatarAccessory,
            avatarBodyColor: gameVM.avatarBodyColor,
            avatarBgColor: gameVM.avatarBgColor,
            totalXP: gameVM.totalXP,
            coins: gameVM.coins,
            currentStreak: gameVM.currentStreak,
            streakSaves: gameVM.streakSaves,
            hearts: gameVM.hearts,
            level: gameVM.level,
            weeklyXP: gameVM.totalXP,
            monthlyXP: gameVM.totalXP,
            completedSubsections: String(data: completedData, encoding: .utf8) ?? "[]",
            subsectionStars: String(data: starsData, encoding: .utf8) ?? "{}",
            hasSeenLearning: String(data: learningData, encoding: .utf8) ?? "[]",
            questionsAnswered: gameVM.questionsAnswered,
            questionsCorrect: gameVM.questionsCorrect,
            ownedAvatars: String(data: ownedAvatarsData, encoding: .utf8) ?? "[]",
            ownedEyes: String(data: ownedEyesData, encoding: .utf8) ?? "[]",
            ownedMouths: String(data: ownedMouthsData, encoding: .utf8) ?? "[]",
            ownedAccessories: String(data: ownedAccessoriesData, encoding: .utf8) ?? "[]",
            professionDonations: profile.professionDonations
        )

        do {
            try await client.from("profiles")
                .update(updateData)
                .eq("id", value: profile.id)
                .execute()
            await fetchProfile()
        } catch {
            print("Failed to sync game state: \(error)")
        }
    }

    func fetchLeaderboard() async -> [LeaderboardRecord] {
        guard let userId = currentUser?.id.uuidString.lowercased() else { return [] }
        do {
            let allProfiles: [UserProfile] = try await client.from("profiles")
                .select()
                .execute()
                .value

            let allRecords = allProfiles.map { p in
                LeaderboardRecord(
                    id: p.id, username: p.username,
                    avatarAnimal: p.avatarAnimal, avatarEyes: p.avatarEyes,
                    avatarMouth: p.avatarMouth, avatarAccessory: p.avatarAccessory,
                    avatarBodyColor: p.avatarBodyColor, avatarBgColor: p.avatarBgColor,
                    weeklyXP: p.weeklyXP, currentStreak: p.currentStreak,
                    level: p.level, profession: p.profession, school: p.school
                )
            }

            let leagueSize = 30
            let calendar = Calendar.current
            let weekOfYear = calendar.component(.weekOfYear, from: Date())
            let year = calendar.component(.yearForWeekOfYear, from: Date())
            let weeklySeed = year * 100 + weekOfYear

            var levelGroups: [Int: [LeaderboardRecord]] = [:]
            for record in allRecords {
                let bracket = max(1, record.level / 3)
                levelGroups[bracket, default: []].append(record)
            }

            var currentUserBracket = 1
            if let myRecord = allRecords.first(where: { $0.id == userId }) {
                currentUserBracket = max(1, myRecord.level / 3)
            }

            var pool = levelGroups[currentUserBracket] ?? []
            if pool.isEmpty {
                pool = allRecords
            }

            if !pool.contains(where: { $0.id == userId }) {
                if let myRecord = allRecords.first(where: { $0.id == userId }) {
                    pool.append(myRecord)
                }
            }

            pool.sort { a, b in
                let hashA = Self.stableHash("\(a.id)-\(weeklySeed)")
                let hashB = Self.stableHash("\(b.id)-\(weeklySeed)")
                return hashA < hashB
            }

            let myIndex = pool.firstIndex(where: { $0.id == userId }) ?? 0
            let leagueIndex = myIndex / leagueSize
            let startIdx = leagueIndex * leagueSize
            let endIdx = min(startIdx + leagueSize, pool.count)

            var leagueMembers = Array(pool[startIdx..<endIdx])

            if !leagueMembers.contains(where: { $0.id == userId }) {
                if let myRecord = allRecords.first(where: { $0.id == userId }) {
                    leagueMembers.append(myRecord)
                }
            }

            leagueMembers.sort { a, b in
                if a.weeklyXP != b.weeklyXP {
                    return a.weeklyXP > b.weeklyXP
                }
                return a.id < b.id
            }

            return leagueMembers
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

            let friendProfiles: [UserProfile] = try await client.from("profiles")
                .select()
                .in("id", values: friendIds)
                .execute()
                .value
            let records = friendProfiles.map { p in
                LeaderboardRecord(
                    id: p.id, username: p.username,
                    avatarAnimal: p.avatarAnimal, avatarEyes: p.avatarEyes,
                    avatarMouth: p.avatarMouth, avatarAccessory: p.avatarAccessory,
                    avatarBodyColor: p.avatarBodyColor, avatarBgColor: p.avatarBgColor,
                    weeklyXP: p.weeklyXP, currentStreak: p.currentStreak,
                    level: p.level, profession: p.profession, school: p.school
                )
            }.sorted { $0.weeklyXP > $1.weeklyXP }
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
            let senderProfiles: [UserProfile] = try await client.from("profiles")
                .select()
                .in("id", values: senderIds)
                .execute()
                .value
            let profiles = senderProfiles.map { p in
                LeaderboardRecord(
                    id: p.id, username: p.username,
                    avatarAnimal: p.avatarAnimal, avatarEyes: p.avatarEyes,
                    avatarMouth: p.avatarMouth, avatarAccessory: p.avatarAccessory,
                    avatarBodyColor: p.avatarBodyColor, avatarBgColor: p.avatarBgColor,
                    weeklyXP: p.weeklyXP, currentStreak: p.currentStreak,
                    level: p.level, profession: p.profession, school: p.school
                )
            }

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

    func checkFriendshipStatus(userId: String) async -> FriendshipStatus {
        guard let currentId = currentUser?.id.uuidString.lowercased() else { return .notFriend }
        guard currentId != userId else { return .isSelf }
        do {
            let records: [FriendRecord] = try await client.from("friends")
                .select()
                .or("and(user_id.eq.\(currentId),friend_id.eq.\(userId)),and(user_id.eq.\(userId),friend_id.eq.\(currentId))")
                .execute()
                .value
            guard let record = records.first else { return .notFriend }
            if record.status == "accepted" { return .friend }
            if record.userId == currentId { return .pendingSent }
            return .pendingReceived
        } catch {
            return .notFriend
        }
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

    private static func stableHash(_ string: String) -> UInt64 {
        var hash: UInt64 = 5381
        for byte in string.utf8 {
            hash = ((hash &<< 5) &+ hash) &+ UInt64(byte)
        }
        return hash
    }

    func searchUsers(query: String) async -> [LeaderboardRecord] {
        guard let userId = currentUser?.id.uuidString.lowercased() else { return [] }
        let trimmed = query.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return [] }
        do {
            let allUserProfiles: [UserProfile] = try await client.from("profiles")
                .select()
                .neq("id", value: userId)
                .execute()
                .value
            let lowered = trimmed.lowercased()
            let filtered = allUserProfiles.filter { $0.username.lowercased().contains(lowered) }
            return Array(filtered.prefix(20)).map { p in
                LeaderboardRecord(
                    id: p.id, username: p.username,
                    avatarAnimal: p.avatarAnimal, avatarEyes: p.avatarEyes,
                    avatarMouth: p.avatarMouth, avatarAccessory: p.avatarAccessory,
                    avatarBodyColor: p.avatarBodyColor, avatarBgColor: p.avatarBgColor,
                    weeklyXP: p.weeklyXP, currentStreak: p.currentStreak,
                    level: p.level, profession: p.profession, school: p.school
                )
            }
        } catch {
            print("Failed to search users: \(error)")
            return []
        }
    }
}
