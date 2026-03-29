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
    var clinicalAuraPoints: Int
    var activityDates: String
    var streakSaveDates: String
    var seenQuestionIds: String
    var shownMilestoneFlags: String
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
        case clinicalAuraPoints = "clinical_aura_points"
        case activityDates = "activity_dates"
        case streakSaveDates = "streak_save_dates"
        case seenQuestionIds = "seen_question_ids"
        case shownMilestoneFlags = "shown_milestone_flags"
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
        clinicalAuraPoints = (try? container.decode(Int.self, forKey: .clinicalAuraPoints)) ?? 0
        activityDates = (try? container.decode(String.self, forKey: .activityDates)) ?? "[]"
        streakSaveDates = (try? container.decode(String.self, forKey: .streakSaveDates)) ?? "[]"
        seenQuestionIds = (try? container.decode(String.self, forKey: .seenQuestionIds)) ?? "{}"
        shownMilestoneFlags = (try? container.decode(String.self, forKey: .shownMilestoneFlags)) ?? "[]"
        createdAt = try? container.decode(String.self, forKey: .createdAt)
        updatedAt = try? container.decode(String.self, forKey: .updatedAt)
    }

    init(id: String, username: String, profession: String, school: String, avatarAnimal: String, avatarEyes: String, avatarMouth: String, avatarAccessory: String, avatarBodyColor: String, avatarBgColor: String, totalXP: Int, coins: Int, currentStreak: Int, streakSaves: Int, hearts: Int, level: Int, weeklyXP: Int, monthlyXP: Int, completedSubsections: String, subsectionStars: String, hasSeenLearning: String, questionsAnswered: Int, questionsCorrect: Int, lastActiveDate: String?, lastHeartLossDate: String?, ownedAvatars: String, ownedEyes: String, ownedMouths: String, ownedAccessories: String, professionDonations: Int, clinicalAuraPoints: Int, activityDates: String = "[]", streakSaveDates: String = "[]", seenQuestionIds: String = "{}", shownMilestoneFlags: String = "[]", createdAt: String?, updatedAt: String?) {
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
        self.clinicalAuraPoints = clinicalAuraPoints
        self.activityDates = activityDates
        self.streakSaveDates = streakSaveDates
        self.seenQuestionIds = seenQuestionIds
        self.shownMilestoneFlags = shownMilestoneFlags
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

nonisolated struct SchoolXPRow: Codable, Sendable {
    let school: String
    let monthlyXP: Int

    enum CodingKeys: String, CodingKey {
        case school
        case monthlyXP = "monthly_xp"
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        school = (try? c.decode(String.self, forKey: .school)) ?? ""
        monthlyXP = (try? c.decode(Int.self, forKey: .monthlyXP)) ?? 0
    }
}

nonisolated struct ProfessionDonationRow: Codable, Sendable {
    let profession: String
    let professionDonations: Int

    enum CodingKeys: String, CodingKey {
        case profession
        case professionDonations = "profession_donations"
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        profession = (try? c.decode(String.self, forKey: .profession)) ?? ""
        professionDonations = (try? c.decode(Int.self, forKey: .professionDonations)) ?? 0
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

    init(profession: String, totalDonations: Int) {
        self.profession = profession
        self.totalDonations = totalDonations
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        profession = (try? c.decode(String.self, forKey: .profession)) ?? ""
        totalDonations = (try? c.decode(Int.self, forKey: .totalDonations)) ?? 0
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
    let weeklyXPResetWeek: Int
    let weeklyXPResetYear: Int
    let monthlyXPResetMonth: Int
    let monthlyXPResetYear: Int
    let completedSubsections: String
    let subsectionStars: String
    let hasSeenLearning: String
    let questionsAnswered: Int
    let questionsCorrect: Int
    let lastActiveDate: String?
    let lastHeartLossDate: String?
    let ownedAvatars: String
    let ownedEyes: String
    let ownedMouths: String
    let ownedAccessories: String
    let professionDonations: Int
    let clinicalAuraPoints: Int
    let activityDates: String
    let streakSaveDates: String
    let seenQuestionIds: String
    let shownMilestoneFlags: String

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
        case weeklyXPResetWeek = "weekly_xp_reset_week"
        case weeklyXPResetYear = "weekly_xp_reset_year"
        case monthlyXPResetMonth = "monthly_xp_reset_month"
        case monthlyXPResetYear = "monthly_xp_reset_year"
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
        case clinicalAuraPoints = "clinical_aura_points"
        case activityDates = "activity_dates"
        case streakSaveDates = "streak_save_dates"
        case seenQuestionIds = "seen_question_ids"
        case shownMilestoneFlags = "shown_milestone_flags"
    }
}

nonisolated struct SignUpProfileData: Encodable, Sendable {
    let id: String
    let username: String
    let profession: String
    let school: String = ""
    let avatarAnimal: String = "beaver"
    let avatarEyes: String = "normal"
    let avatarMouth: String = "smile"
    let avatarAccessory: String = "none"
    let avatarBodyColor: String = ""
    let avatarBgColor: String = ""
    let totalXP: Int = 0
    let coins: Int = 50
    let currentStreak: Int = 0
    let streakSaves: Int = 0
    let hearts: Int = 5
    let level: Int = 1
    let weeklyXP: Int = 0
    let monthlyXP: Int = 0
    let completedSubsections: String = "[]"
    let subsectionStars: String = "{}"
    let hasSeenLearning: String = "[]"
    let questionsAnswered: Int = 0
    let questionsCorrect: Int = 0
    let ownedAvatars: String = "[\"beaver\",\"octopus\",\"bunny\",\"cat\"]"
    let ownedEyes: String = "[\"normal\",\"happy\",\"big\"]"
    let ownedMouths: String = "[\"smile\",\"bigSmile\",\"tiny\"]"
    let ownedAccessories: String = "[\"none\"]"
    let professionDonations: Int = 0
    let clinicalAuraPoints: Int = 0
    let activityDates: String = "[]"
    let streakSaveDates: String = "[]"
    let seenQuestionIds: String = "{}"
    let shownMilestoneFlags: String = "[]"

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
        case ownedAvatars = "owned_avatars"
        case ownedEyes = "owned_eyes"
        case ownedMouths = "owned_mouths"
        case ownedAccessories = "owned_accessories"
        case professionDonations = "profession_donations"
        case clinicalAuraPoints = "clinical_aura_points"
        case activityDates = "activity_dates"
        case streakSaveDates = "streak_save_dates"
        case seenQuestionIds = "seen_question_ids"
        case shownMilestoneFlags = "shown_milestone_flags"
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

        let userId = session.user.id.uuidString.lowercased()

        do {
            let profile: UserProfile = try await client.rpc("ensure_profile", params: [
                "p_username": username,
                "p_profession": profession,
            ]).execute().value
            currentProfile = profile
        } catch {
            let insertData = SignUpProfileData(
                id: userId,
                username: username,
                profession: profession
            )
            try await client.from("profiles").insert(insertData).execute()
            await fetchProfile()
        }
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
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        let now = Date()
        let cal = Calendar.current
        let curWeek = cal.component(.weekOfYear, from: now)
        let curYear = cal.component(.yearForWeekOfYear, from: now)
        let curMonth = cal.component(.month, from: now)

        let updateData = ProfileUpdateData(
            username: profile.username,
            profession: profile.profession,
            school: profile.school,
            avatarAnimal: profile.avatarAnimal,
            avatarEyes: profile.avatarEyes,
            avatarMouth: profile.avatarMouth,
            avatarAccessory: profile.avatarAccessory,
            avatarBodyColor: profile.avatarBodyColor,
            avatarBgColor: profile.avatarBgColor,
            totalXP: profile.totalXP,
            coins: profile.coins,
            currentStreak: profile.currentStreak,
            streakSaves: profile.streakSaves,
            hearts: profile.hearts,
            level: profile.level,
            weeklyXP: profile.weeklyXP,
            monthlyXP: profile.monthlyXP,
            weeklyXPResetWeek: curWeek,
            weeklyXPResetYear: curYear,
            monthlyXPResetMonth: curMonth,
            monthlyXPResetYear: curYear,
            completedSubsections: profile.completedSubsections,
            subsectionStars: profile.subsectionStars,
            hasSeenLearning: profile.hasSeenLearning,
            questionsAnswered: profile.questionsAnswered,
            questionsCorrect: profile.questionsCorrect,
            lastActiveDate: profile.lastActiveDate,
            lastHeartLossDate: profile.lastHeartLossDate,
            ownedAvatars: profile.ownedAvatars,
            ownedEyes: profile.ownedEyes,
            ownedMouths: profile.ownedMouths,
            ownedAccessories: profile.ownedAccessories,
            professionDonations: profile.professionDonations,
            clinicalAuraPoints: profile.clinicalAuraPoints,
            activityDates: profile.activityDates,
            streakSaveDates: profile.streakSaveDates,
            seenQuestionIds: profile.seenQuestionIds,
            shownMilestoneFlags: profile.shownMilestoneFlags
        )
        do {
            try await client.from("profiles")
                .update(updateData)
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

        do {
            let result: UserProfile = try await client.rpc("save_avatar_selection", params: [
                "p_animal": animal,
                "p_eyes": eyes,
                "p_mouth": mouth,
                "p_accessory": accessory,
                "p_body_color": bodyColor,
                "p_bg_color": bgColor,
            ]).execute().value
            currentProfile = result
            return true
        } catch {
            let data: [String: String] = [
                "avatar_animal": animal,
                "avatar_eyes": eyes,
                "avatar_mouth": mouth,
                "avatar_accessory": accessory,
                "avatar_body_color": bodyColor,
                "avatar_bg_color": bgColor,
            ]
            do {
                try await client.from("profiles")
                    .update(data)
                    .eq("id", value: profile.id)
                    .execute()
                currentProfile = profile
                return true
            } catch {
                print("Failed to save avatar: \(error)")
                return false
            }
        }
    }

    func completeOnboarding(school: String, animal: String, eyes: String, mouth: String, accessory: String, bodyColor: String, bgColor: String) async {
        guard let profile = currentProfile else { return }
        do {
            let result: UserProfile = try await client.rpc("complete_onboarding", params: [
                "p_school": school,
                "p_animal": animal,
                "p_eyes": eyes,
                "p_mouth": mouth,
                "p_accessory": accessory,
                "p_body_color": bodyColor,
                "p_bg_color": bgColor,
            ]).execute().value
            currentProfile = result
        } catch {
            let data: [String: String] = [
                "school": school,
                "avatar_animal": animal,
                "avatar_eyes": eyes,
                "avatar_mouth": mouth,
                "avatar_accessory": accessory,
                "avatar_body_color": bodyColor,
                "avatar_bg_color": bgColor,
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
    }

    func applyQuizCompletion(
        subsectionId: String,
        score: Double,
        correctCount: Int,
        totalCount: Int,
        xpEarned: Int,
        coinsEarned: Int,
        idempotencyKey: String,
        markLearningSeen: Bool = false
    ) async -> UserProfile? {
        do {
            let result: UserProfile = try await client.rpc("apply_quiz_completion", params: [
                "p_subsection_id": AnyEncodableValue.string(subsectionId),
                "p_score": AnyEncodableValue.double(score),
                "p_correct_count": AnyEncodableValue.int(correctCount),
                "p_total_count": AnyEncodableValue.int(totalCount),
                "p_xp_earned": AnyEncodableValue.int(xpEarned),
                "p_coins_earned": AnyEncodableValue.int(coinsEarned),
                "p_idempotency_key": AnyEncodableValue.string(idempotencyKey),
                "p_mark_learning_seen": AnyEncodableValue.bool(markLearningSeen),
            ]).execute().value
            currentProfile = result
            return result
        } catch {
            print("RPC apply_quiz_completion failed: \(error)")
            return nil
        }
    }

    func applyHeartLoss() async -> UserProfile? {
        do {
            let result: UserProfile = try await client.rpc("apply_heart_loss", params: EmptyParams()).execute().value
            currentProfile = result
            return result
        } catch {
            print("RPC apply_heart_loss failed: \(error)")
            return nil
        }
    }

    func applyAddHeart() async -> UserProfile? {
        do {
            let result: UserProfile = try await client.rpc("add_heart", params: EmptyParams()).execute().value
            currentProfile = result
            return result
        } catch {
            print("RPC add_heart failed: \(error)")
            return nil
        }
    }

    func applyRefillHearts(cost: Int) async -> UserProfile? {
        do {
            let data: [String: Int] = ["p_cost": cost]
            let resultData = try await client.rpc("refill_hearts", params: data).execute().data
            let decoder = JSONDecoder()
            let result = try decoder.decode(UserProfile.self, from: resultData)
            currentProfile = result
            return result
        } catch {
            print("RPC refill_hearts failed: \(error)")
            return nil
        }
    }

    func applyClinicalQOTD(questionId: String, isCorrect: Bool, answerDate: String) async -> CQOTDResult? {
        do {
            let result: CQOTDResult = try await client.rpc("apply_clinical_qotd", params: [
                "p_question_id": AnyEncodableValue.string(questionId),
                "p_is_correct": AnyEncodableValue.bool(isCorrect),
                "p_answer_date": AnyEncodableValue.string(answerDate),
            ]).execute().value
            return result
        } catch {
            print("RPC apply_clinical_qotd failed: \(error)")
            return nil
        }
    }

    func fetchCQOTDHistory() async -> [String: Bool] {
        do {
            let result: [String: Bool] = try await client.rpc("fetch_cqotd_history", params: EmptyParams()).execute().value
            return result
        } catch {
            print("RPC fetch_cqotd_history failed: \(error)")
            return [:]
        }
    }

    func purchaseAvatarItem(itemType: String, itemName: String, cost: Int) async -> UserProfile? {
        do {
            let resultData = try await client.rpc("purchase_avatar_item", params: [
                "p_item_type": AnyEncodableValue.string(itemType),
                "p_item_name": AnyEncodableValue.string(itemName),
                "p_cost": AnyEncodableValue.int(cost),
            ]).execute().data
            let decoder = JSONDecoder()
            let profile = try decoder.decode(UserProfile.self, from: resultData)
            currentProfile = profile
            return profile
        } catch {
            print("RPC purchase_avatar_item failed: \(error)")
            return nil
        }
    }

    func saveProfileInfo(username: String, profession: String, school: String) async -> UserProfile? {
        do {
            let result: UserProfile = try await client.rpc("save_profile_info", params: [
                "p_username": username,
                "p_profession": profession,
                "p_school": school,
            ]).execute().value
            currentProfile = result
            return result
        } catch {
            print("RPC save_profile_info failed, using fallback: \(error)")
            guard let profile = currentProfile else { return nil }
            let data: [String: String] = [
                "username": username,
                "profession": profession,
                "school": school,
            ]
            do {
                try await client.from("profiles")
                    .update(data)
                    .eq("id", value: profile.id)
                    .execute()
                await fetchProfile()
                return currentProfile
            } catch {
                print("Fallback update failed: \(error)")
                return nil
            }
        }
    }

    func purchasePowerup(type: String, cost: Int, maxCapacity: Int) async -> (success: Bool, coins: Int?, inventory: InventoryRecord?) {
        do {
            let resultData = try await client.rpc("purchase_powerup", params: [
                "p_type": AnyEncodableValue.string(type),
                "p_cost": AnyEncodableValue.int(cost),
                "p_max_capacity": AnyEncodableValue.int(maxCapacity),
            ]).execute().data

            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let success = json?["success"] as? Bool ?? false
            let coins = json?["coins"] as? Int
            if success {
                let inv = try JSONDecoder().decode(InventoryRecord.self, from: resultData)
                await fetchProfile()
                return (true, coins, inv)
            }
            return (false, nil, nil)
        } catch {
            print("RPC purchase_powerup failed: \(error)")
            return (false, nil, nil)
        }
    }

    func consumePowerup(type: String) async -> InventoryRecord? {
        do {
            let resultData = try await client.rpc("consume_powerup", params: ["p_type": type]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let success = json?["success"] as? Bool ?? false
            if success {
                return try JSONDecoder().decode(InventoryRecord.self, from: resultData)
            }
            return nil
        } catch {
            print("RPC consume_powerup failed: \(error)")
            return nil
        }
    }

    func enhancePowerup(type: String, cost: Int) async -> (success: Bool, coins: Int?) {
        do {
            let resultData = try await client.rpc("enhance_powerup", params: [
                "p_type": AnyEncodableValue.string(type),
                "p_cost": AnyEncodableValue.int(cost),
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let success = json?["success"] as? Bool ?? false
            let coins = json?["coins"] as? Int
            return (success, coins)
        } catch {
            print("RPC enhance_powerup failed: \(error)")
            return (false, nil)
        }
    }

    func fetchInventory() async -> InventoryRecord? {
        do {
            let result: InventoryRecord = try await client.rpc("fetch_inventory", params: EmptyParams()).execute().value
            return result
        } catch {
            print("RPC fetch_inventory failed: \(error)")
            return nil
        }
    }

    func saveDailyState(
        questProgress: [[String: Any]],
        brandBlitzCount: Int,
        quickPracticeCount: Int,
        spacedReviewCount: Int,
        doubleXP: Bool,
        activeBoosts: [[String: Any]],
        questSetIndex: Int
    ) async {
        do {
            let questJSON = try JSONSerialization.data(withJSONObject: questProgress)
            let boostJSON = try JSONSerialization.data(withJSONObject: activeBoosts)
            let questStr = String(data: questJSON, encoding: .utf8) ?? "[]"
            let boostStr = String(data: boostJSON, encoding: .utf8) ?? "[]"

            try await client.rpc("save_daily_state", params: [
                "p_quest_progress": AnyEncodableValue.string(questStr),
                "p_brand_blitz_count": AnyEncodableValue.int(brandBlitzCount),
                "p_quick_practice_count": AnyEncodableValue.int(quickPracticeCount),
                "p_spaced_review_count": AnyEncodableValue.int(spacedReviewCount),
                "p_double_xp": AnyEncodableValue.bool(doubleXP),
                "p_active_boosts": AnyEncodableValue.string(boostStr),
                "p_quest_set_index": AnyEncodableValue.int(questSetIndex),
            ]).execute()
        } catch {
            print("RPC save_daily_state failed: \(error)")
        }
    }

    func saveMasteryBatch(records: [[String: Any]]) async {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: records)
            let jsonStr = String(data: jsonData, encoding: .utf8) ?? "[]"
            try await client.rpc("save_mastery_batch", params: ["p_records": jsonStr]).execute()
        } catch {
            print("RPC save_mastery_batch failed: \(error)")
        }
    }

    func fetchMastery() async -> [String: [String: Any]]? {
        do {
            let resultData = try await client.rpc("fetch_mastery", params: EmptyParams()).execute().data
            let result = try JSONSerialization.jsonObject(with: resultData) as? [String: [String: Any]]
            return result
        } catch {
            print("RPC fetch_mastery failed: \(error)")
            return nil
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
        let activityDatesData = (try? encoder.encode(Array(gameVM.activityDates))) ?? Data()
        let streakSaveDatesData = (try? encoder.encode(Array(gameVM.streakSaveDates))) ?? Data()
        let seenQidsMap = gameVM.seenQuestionIdsBySubsection.mapValues { Array($0) }
        let seenQidsData = (try? encoder.encode(seenQidsMap)) ?? Data()
        let milestoneData = (try? encoder.encode(Array(gameVM.shownMilestoneFlags))) ?? Data()

        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        let now = Date()
        let cal = Calendar.current
        let curWeek = cal.component(.weekOfYear, from: now)
        let curYear = cal.component(.yearForWeekOfYear, from: now)
        let curMonth = cal.component(.month, from: now)

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
            weeklyXP: gameVM.weeklyXP,
            monthlyXP: gameVM.monthlyXP,
            weeklyXPResetWeek: curWeek,
            weeklyXPResetYear: curYear,
            monthlyXPResetMonth: curMonth,
            monthlyXPResetYear: curYear,
            completedSubsections: String(data: completedData, encoding: .utf8) ?? "[]",
            subsectionStars: String(data: starsData, encoding: .utf8) ?? "{}",
            hasSeenLearning: String(data: learningData, encoding: .utf8) ?? "[]",
            questionsAnswered: gameVM.questionsAnswered,
            questionsCorrect: gameVM.questionsCorrect,
            lastActiveDate: gameVM.lastActiveDate.map { isoFormatter.string(from: $0) },
            lastHeartLossDate: gameVM.lastHeartLossDate.map { isoFormatter.string(from: $0) },
            ownedAvatars: String(data: ownedAvatarsData, encoding: .utf8) ?? "[]",
            ownedEyes: String(data: ownedEyesData, encoding: .utf8) ?? "[]",
            ownedMouths: String(data: ownedMouthsData, encoding: .utf8) ?? "[]",
            ownedAccessories: String(data: ownedAccessoriesData, encoding: .utf8) ?? "[]",
            professionDonations: profile.professionDonations,
            clinicalAuraPoints: gameVM.clinicalAuraPoints,
            activityDates: String(data: activityDatesData, encoding: .utf8) ?? "[]",
            streakSaveDates: String(data: streakSaveDatesData, encoding: .utf8) ?? "[]",
            seenQuestionIds: String(data: seenQidsData, encoding: .utf8) ?? "{}",
            shownMilestoneFlags: String(data: milestoneData, encoding: .utf8) ?? "[]"
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
        do {
            let resultData = try await client.rpc("enroll_weekly_league", params: EmptyParams()).execute().data
            let records = try JSONDecoder().decode([LeaderboardRecord].self, from: resultData)
            return records
        } catch {
            print("RPC enroll_weekly_league failed, using fallback: \(error)")
            return await fetchLeaderboardFallback()
        }
    }

    private func fetchLeaderboardFallback() async -> [LeaderboardRecord] {
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
            print("Failed to fetch leaderboard fallback: \(error)")
            return []
        }
    }

    func fetchAllTimeLeaderboard() async -> (top300: [AllTimeLeaderboardRecord], myRank: Int?) {
        guard let userId = currentUser?.id.uuidString.lowercased() else { return ([], nil) }
        do {
            let allProfiles: [AllTimeLeaderboardRecord] = try await client.from("profiles")
                .select("id,username,avatar_animal,avatar_eyes,avatar_mouth,avatar_accessory,avatar_body_color,avatar_bg_color,total_xp,current_streak,level,clinical_aura_points")
                .order("total_xp", ascending: false)
                .limit(300)
                .execute()
                .value

            var myRank: Int? = nil
            if let idx = allProfiles.firstIndex(where: { $0.id == userId }) {
                myRank = idx + 1
            } else {
                let countData = try await client.from("profiles")
                    .select("id", head: false, count: .exact)
                    .gt("total_xp", value: allProfiles.last?.totalXP ?? 0)
                    .execute()
                let totalAbove = countData.count ?? allProfiles.count
                myRank = totalAbove + 1
            }

            return (allProfiles, myRank)
        } catch {
            print("Failed to fetch all-time leaderboard: \(error)")
            return ([], nil)
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

        do {
            let resultData = try await client.rpc("send_friend_request", params: [
                "p_friend_username": toUsername,
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let success = json?["success"] as? Bool ?? false
            if !success {
                let errorMsg = json?["error"] as? String ?? "Request failed"
                throw NSError(domain: "PharmaQuest", code: 400, userInfo: [NSLocalizedDescriptionKey: errorMsg])
            }
        } catch let error as NSError where error.domain == "PharmaQuest" {
            throw error
        } catch {
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
    }

    func acceptFriendRequest(requestId: String) async throws {
        do {
            try await client.rpc("accept_friend_request", params: ["p_request_id": requestId]).execute()
        } catch {
            try await client.from("friends")
                .update(["status": "accepted"])
                .eq("id", value: requestId)
                .execute()
        }
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
        do {
            try await client.rpc("remove_friend", params: ["p_friend_id": friendId]).execute()
        } catch {
            try await client.from("friends")
                .delete()
                .or("and(user_id.eq.\(userId),friend_id.eq.\(friendId)),and(user_id.eq.\(friendId),friend_id.eq.\(userId))")
                .execute()
        }
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
            let rows: [SchoolXPRow] = try await client.from("profiles")
                .select("school,monthly_xp")
                .neq("school", value: "")
                .execute()
                .value

            var schoolXP: [String: Int] = [:]
            for row in rows {
                guard !row.school.isEmpty else { continue }
                schoolXP[row.school, default: 0] += row.monthlyXP
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
            let resultData = try await client.rpc("get_monthly_profession_standings", params: EmptyParams()).execute().data
            let records = try JSONDecoder().decode([ProfessionRanking].self, from: resultData)
            if !records.isEmpty {
                return records
            }
            return await fetchProfessionRankingsFallback()
        } catch {
            print("RPC get_monthly_profession_standings failed, using fallback: \(error)")
            return await fetchProfessionRankingsFallback()
        }
    }

    private func fetchProfessionRankingsFallback() async -> [ProfessionRanking] {
        do {
            let rows: [ProfessionDonationRow] = try await client.from("profiles")
                .select("profession,profession_donations")
                .neq("profession", value: "")
                .gt("profession_donations", value: 0)
                .execute()
                .value

            var profDonations: [String: Int] = [:]
            for row in rows {
                guard !row.profession.isEmpty, row.professionDonations > 0 else { continue }
                profDonations[row.profession, default: 0] += row.professionDonations
            }

            return profDonations.map { ProfessionRanking(profession: $0.key, totalDonations: $0.value) }
                .sorted { $0.totalDonations > $1.totalDonations }
        } catch {
            print("Failed to fetch profession rankings fallback: \(error)")
            return []
        }
    }

    func donateToProfession(amount: Int, currentCoins: Int) async -> Bool {
        do {
            let resultData = try await client.rpc("donate_profession", params: [
                "p_amount": amount,
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let success = json?["success"] as? Bool ?? false
            if success {
                await fetchProfile()
            }
            return success
        } catch {
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
    }

    func spendCoins(amount: Int, reason: String) async -> Int? {
        do {
            let resultData = try await client.rpc("spend_coins", params: [
                "p_amount": AnyEncodableValue.int(amount),
                "p_reason": AnyEncodableValue.string(reason),
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let success = json?["success"] as? Bool ?? false
            if success {
                let coins = json?["coins"] as? Int
                await fetchProfile()
                return coins
            }
            return nil
        } catch {
            print("RPC spend_coins failed: \(error)")
            return nil
        }
    }

    func addCoins(amount: Int, reason: String, idempotencyKey: String? = nil) async -> Int? {
        do {
            var params: [String: AnyEncodableValue] = [
                "p_amount": .int(amount),
                "p_reason": .string(reason),
            ]
            if let key = idempotencyKey {
                params["p_idempotency_key"] = .string(key)
            }
            let resultData = try await client.rpc("add_coins", params: params).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let coins = json?["coins"] as? Int
            await fetchProfile()
            return coins
        } catch {
            print("RPC add_coins failed: \(error)")
            return nil
        }
    }

    @discardableResult
    func recordContentCompletion(contentKey: String, contentType: String) async -> (runCountToday: Int, isFirstCompletion: Bool)? {
        do {
            let resultData = try await client.rpc("record_content_completion", params: [
                "p_content_key": AnyEncodableValue.string(contentKey),
                "p_content_type": AnyEncodableValue.string(contentType),
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let runCount = json?["run_count_today"] as? Int ?? 1
            let isFirst = json?["is_first_completion"] as? Bool ?? false
            return (runCount, isFirst)
        } catch {
            print("RPC record_content_completion failed: \(error)")
            return nil
        }
    }

    func fetchDailyRunCounts() async -> [String: Int] {
        do {
            let resultData = try await client.rpc("fetch_daily_run_counts", params: EmptyParams()).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Int]
            return json ?? [:]
        } catch {
            print("RPC fetch_daily_run_counts failed: \(error)")
            return [:]
        }
    }

    func logStreakActivity(date: String, eventType: String, streakCount: Int, streakSavesRemaining: Int) async {
        do {
            try await client.rpc("log_streak_activity", params: [
                "p_activity_date": AnyEncodableValue.string(date),
                "p_event_type": AnyEncodableValue.string(eventType),
                "p_streak_count": AnyEncodableValue.int(streakCount),
                "p_streak_saves_remaining": AnyEncodableValue.int(streakSavesRemaining),
            ]).execute()
        } catch {
            print("RPC log_streak_activity failed: \(error)")
        }
    }

    func fetchStreakActivity() async -> [StreakActivityRecord] {
        do {
            let resultData = try await client.rpc("fetch_streak_activity", params: EmptyParams()).execute().data
            let decoder = JSONDecoder()
            let records = try decoder.decode([StreakActivityRecord].self, from: resultData)
            return records
        } catch {
            print("RPC fetch_streak_activity failed: \(error)")
            return []
        }
    }

    func syncStreakDates(activityDates: Set<String>, streakSaveDates: Set<String>) async {
        do {
            let encoder = JSONEncoder()
            let activityData = (try? encoder.encode(Array(activityDates))) ?? Data()
            let saveData = (try? encoder.encode(Array(streakSaveDates))) ?? Data()
            let activityStr = String(data: activityData, encoding: .utf8) ?? "[]"
            let saveStr = String(data: saveData, encoding: .utf8) ?? "[]"

            try await client.rpc("sync_streak_dates", params: [
                "p_activity_dates": AnyEncodableValue.string(activityStr),
                "p_streak_save_dates": AnyEncodableValue.string(saveStr),
            ]).execute()
        } catch {
            print("RPC sync_streak_dates failed: \(error)")
        }
    }

    private static func stableHash(_ string: String) -> UInt64 {
        var hash: UInt64 = 5381
        for byte in string.utf8 {
            hash = ((hash &<< 5) &+ hash) &+ UInt64(byte)
        }
        return hash
    }

    func fetchDailyChestState() async -> (opensUsed: Int, lastOpenDate: String?, xpAtSessionStart: Int)? {
        do {
            let resultData = try await client.rpc("fetch_daily_chest_state", params: EmptyParams()).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let opensUsed = json?["opens_used"] as? Int ?? 0
            let lastOpenDate = json?["last_open_date"] as? String
            let xpStart = json?["xp_at_session_start"] as? Int ?? 0
            return (opensUsed, lastOpenDate, xpStart)
        } catch {
            print("RPC fetch_daily_chest_state failed: \(error)")
            return nil
        }
    }

    func openDailyChest(rewardType: String, rewardAmount: Int, wasApplied: Bool) async -> (success: Bool, opensUsed: Int) {
        do {
            let resultData = try await client.rpc("open_daily_chest", params: [
                "p_reward_type": AnyEncodableValue.string(rewardType),
                "p_reward_amount": AnyEncodableValue.int(rewardAmount),
                "p_was_applied": AnyEncodableValue.bool(wasApplied),
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let success = json?["success"] as? Bool ?? false
            let opensUsed = json?["opens_used"] as? Int ?? 0
            return (success, opensUsed)
        } catch {
            print("RPC open_daily_chest failed: \(error)")
            return (false, 0)
        }
    }

    func saveDailyChestXPStart(xp: Int) async {
        do {
            try await client.rpc("save_daily_chest_xp_start", params: [
                "p_xp": xp,
            ]).execute()
        } catch {
            print("RPC save_daily_chest_xp_start failed: \(error)")
        }
    }

    func fetchUnseenAppEvents() async -> [AppEvent] {
        do {
            let resultData = try await client.rpc("fetch_unseen_app_events", params: EmptyParams()).execute().data
            let decoder = JSONDecoder()
            let events = try decoder.decode([AppEvent].self, from: resultData)
            return events
        } catch {
            print("RPC fetch_unseen_app_events failed: \(error)")
            return []
        }
    }

    func dismissAppEvent(eventId: String) async {
        do {
            try await client.rpc("dismiss_app_event", params: ["p_event_id": eventId]).execute()
        } catch {
            print("RPC dismiss_app_event failed: \(error)")
        }
    }

    func upsertDailyXP(amount: Int) async {
        guard amount > 0 else { return }
        do {
            try await client.rpc("upsert_daily_xp", params: [
                "p_xp_amount": AnyEncodableValue.int(amount),
            ]).execute()
        } catch {
            print("RPC upsert_daily_xp failed: \(error)")
        }
    }

    func fetchDailyXP(userId: String, days: Int = 7) async -> [DailyXPRecord] {
        do {
            let resultData = try await client.rpc("get_daily_xp", params: [
                "p_user_id": AnyEncodableValue.string(userId),
                "p_days": AnyEncodableValue.int(days),
            ]).execute().data
            let decoder = JSONDecoder()
            let records = try decoder.decode([DailyXPRecord].self, from: resultData)
            return records
        } catch {
            print("RPC get_daily_xp failed: \(error)")
            return []
        }
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

nonisolated struct StreakActivityRecord: Codable, Sendable {
    let date: String
    let eventType: String
    let streakCount: Int
    let streakSavesRemaining: Int

    enum CodingKeys: String, CodingKey {
        case date
        case eventType = "event_type"
        case streakCount = "streak_count"
        case streakSavesRemaining = "streak_saves_remaining"
    }
}

nonisolated struct EmptyParams: Encodable, Sendable {}

nonisolated enum AnyEncodableValue: Encodable, Sendable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)

    nonisolated func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let v): try container.encode(v)
        case .int(let v): try container.encode(v)
        case .double(let v): try container.encode(v)
        case .bool(let v): try container.encode(v)
        }
    }
}
