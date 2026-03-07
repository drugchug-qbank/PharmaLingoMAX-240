// PharmaLingo — Mastering Pain & Rheum
// Curated Add-On Question Pack (45 questions)
// IDs: q5f_add_001 ... q5f_add_045
//
// IMPORTANT INTEGRATION NOTE
// - 5f is a review-only mastery subsection in the outline and current repo.
// - These questions should be appended AFTER the app auto-builds the mastery pool in DrugDataService.init().
// - This pack mirrors the integration pattern used for earlier mastery sections.
//
// Integration (recommended):
// 1) Add this file to your project.
// 2) In DrugDataService.init(), inside the mastery-generation loop:
//        for sub in mod.subsections where sub.isMasteryQuiz { ... }
//    immediately after:
//        bank[sub.id] = mastery
//    append:
//        if sub.id == Self.masteringPainRheumSubsectionId {
//            bank[sub.id]?.append(contentsOf: Self.curatedAddOnQuestions_5fMastery)
//        }
//
// Notes:
// - Single-best-answer multiple choice (5 options each).
// - Review-only across 5a–5e with a few earlier-module crossover questions.
// - No clinical-trial questions.
//
// Generated on: 2026-03-07

import Foundation

extension DrugDataService {
    /// Target subsection for the Module 5 mastery quiz.
    static let masteringPainRheumSubsectionId: String = "5f"

    static let curatedAddOnQuestions_5fMastery: [Question] = [
        .multipleChoice(
            id: "q5f_add_001",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .easy,
            question: "Percocet is a high-yield pain combination because patients can accidentally overdose if they also take extra Tylenol. Which generic combination is Percocet?",
            options: ["Acetaminophen/Oxycodone", "Hydrocodone/Acetaminophen", "Oxycodone alone", "Acetaminophen/Butalbital/Caffeine", "Tramadol/Acetaminophen"],
            answer: "Acetaminophen/Oxycodone",
            explanation: "Percocet is acetaminophen/oxycodone, so learners should immediately think about both opioid adverse effects and cumulative daily acetaminophen exposure.",
            objective: .brandGeneric,
            relatedDrugIds: ["d219", "d155"],
            tags: ["Mastery", "5f", "Percocet", "acetaminophen", "opioid combo"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_002",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .easy,
            question: "A patient alternates Tylenol, Percocet, and Norco after surgery. Which counseling point best teaches the key acetaminophen safety limit for most adults?",
            options: ["Keep total acetaminophen from all sources at or below 4 grams per day", "There is no daily maximum if the products are prescribed", "Acetaminophen is only dangerous when combined with NSAIDs", "Acetaminophen overdose mainly causes kidney stones", "You only need to count acetaminophen from over-the-counter products"],
            answer: "Keep total acetaminophen from all sources at or below 4 grams per day",
            explanation: "Acetaminophen is hidden in several combination products, so the safest high-yield counseling point is to total all sources and stay at or below the usual 4 g/day maximum unless a lower limit is advised.",
            objective: .dosing,
            relatedDrugIds: ["d155", "d219", "d148"],
            tags: ["Mastery", "5f", "acetaminophen", "max daily dose"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_003",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .easy,
            question: "Ketorolac is a potent NSAID often chosen when acute pain is severe enough that an opioid might otherwise be considered. What limit is most important to remember?",
            options: ["Use should not exceed 5 days", "It must always be taken with folic acid", "It is safe for chronic daily arthritis therapy", "It is preferred in active peptic ulcer disease", "It has no renal precautions"],
            answer: "Use should not exceed 5 days",
            explanation: "Ketorolac is high yield because it is effective for acute pain but should be limited to a total of 5 days due to serious GI, renal, and bleeding risk.",
            objective: .dosing,
            relatedDrugIds: ["d156"],
            tags: ["Mastery", "5f", "ketorolac", "5-day limit"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_004",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "A patient with osteoarthritis asks for an NSAID that teaches the idea of COX-2 selectivity: somewhat less GI bleeding than nonselective NSAIDs, but cardiovascular risk still remains. Which drug fits best?",
            options: ["Celecoxib", "Ibuprofen", "Ketorolac", "Naproxen", "Indomethacin"],
            answer: "Celecoxib",
            explanation: "Celecoxib is the classic COX-2 selective NSAID in this bank. It may be gentler on the GI tract than many nonselective NSAIDs, but it still carries important cardiovascular warning considerations.",
            objective: .moa,
            relatedDrugIds: ["d154"],
            tags: ["Mastery", "5f", "celecoxib", "COX-2"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_005",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "A patient takes low-dose aspirin every morning after a coronary stent and then reaches for Advil later. Which teaching point is highest yield?",
            options: ["Ibuprofen can blunt aspirin’s antiplatelet effect if timing is not managed carefully", "Ibuprofen reverses aspirin-induced tinnitus immediately", "Ibuprofen is preferred because it has stronger antiplatelet activity than aspirin", "Ibuprofen eliminates aspirin’s GI risk entirely", "Ibuprofen is the NSAID least likely to interact with aspirin"],
            answer: "Ibuprofen can blunt aspirin’s antiplatelet effect if timing is not managed carefully",
            explanation: "Ibuprofen is a classic counseling pearl because it can interfere with aspirin’s irreversible platelet effect when taken too close together.",
            objective: .interaction,
            relatedDrugIds: ["d152", "d38"],
            tags: ["Mastery", "5f", "ibuprofen", "aspirin", "interaction"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_006",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .easy,
            question: "A patient with postherpetic neuralgia wants a local option instead of another oral analgesic. Which counseling instruction matches the 5% lidocaine patch?",
            options: ["Apply to intact skin for 12 hours on and 12 hours off", "Apply over broken skin to improve absorption", "Wear the patch continuously for 72 hours", "Use it only during severe migraine aura", "Swallow the patch whole with food"],
            answer: "Apply to intact skin for 12 hours on and 12 hours off",
            explanation: "Lidocaine 5% patches are high yield for localized neuropathic pain such as postherpetic neuralgia and are used on intact skin with a 12-hours-on, 12-hours-off schedule.",
            objective: .dosing,
            relatedDrugIds: ["d223"],
            tags: ["Mastery", "5f", "lidocaine patch", "postherpetic neuralgia"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_007",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "Fioricet is often remembered in headache review because it can help tension headache but also teaches a major prescribing pitfall. What is that pitfall?",
            options: ["Medication overuse and rebound headache", "Severe hyperkalemia", "QT prolongation requiring telemetry", "Permanent tooth discoloration", "Tendon rupture"],
            answer: "Medication overuse and rebound headache",
            explanation: "Fioricet contains butalbital, and repeated use can contribute to medication-overuse or rebound headache in addition to sedation and hidden acetaminophen exposure.",
            objective: .adverseEffect,
            relatedDrugIds: ["d218"],
            tags: ["Mastery", "5f", "Fioricet", "rebound headache"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_008",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "A patient with localized hand osteoarthritis wants NSAID relief with less systemic exposure than an oral NSAID. Which drug best teaches the topical-gel option?",
            options: ["Diclofenac", "Ketorolac", "Indomethacin", "Celecoxib", "Tramadol"],
            answer: "Diclofenac",
            explanation: "Diclofenac is high yield because it exists as both oral and topical formulations, and the topical gel is commonly used when clinicians want a more localized NSAID option.",
            objective: .pearl,
            relatedDrugIds: ["d220"],
            tags: ["Mastery", "5f", "diclofenac", "topical gel"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_009",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "A patient needs a once-daily oral NSAID for chronic osteoarthritis symptoms. Which option in this module is most classically remembered for that dosing convenience?",
            options: ["Meloxicam", "Ibuprofen", "Ketorolac", "Indomethacin", "Naproxen"],
            answer: "Meloxicam",
            explanation: "Meloxicam is commonly remembered as a once-daily NSAID used for osteoarthritis and rheumatoid arthritis symptom control.",
            objective: .dosing,
            relatedDrugIds: ["d224"],
            tags: ["Mastery", "5f", "meloxicam", "once daily"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_010",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "A patient presents with an acutely swollen, intensely painful first MTP joint. Which NSAID from this module is especially high yield for acute gout flares?",
            options: ["Indomethacin", "Celecoxib", "Meloxicam", "Nabumetone", "Etodolac"],
            answer: "Indomethacin",
            explanation: "Indomethacin is a classic board-style NSAID for acute gout flares, which helps learners separate flare treatment from long-term urate lowering with allopurinol or febuxostat.",
            objective: .indication,
            relatedDrugIds: ["d222", "d176", "d177"],
            tags: ["Mastery", "5f", "indomethacin", "acute gout"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_011",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "A patient with chronic pain asks whether a fentanyl patch would be a good first opioid because it lasts for days. Which response is most appropriate?",
            options: ["No—transdermal fentanyl is for opioid-tolerant patients with severe chronic pain, and heat can dangerously increase absorption", "Yes—fentanyl patches are preferred for opioid-naive patients because they are safer than oral opioids", "Yes—fentanyl patches are the opioid of choice for tension headache", "No—fentanyl patches are only used for opioid withdrawal reversal", "Yes—heat helps release the drug more predictably"],
            answer: "No—transdermal fentanyl is for opioid-tolerant patients with severe chronic pain, and heat can dangerously increase absorption",
            explanation: "The fentanyl patch is high yield for two reasons: it is intended for opioid-tolerant patients with severe chronic pain, and external heat can raise fentanyl absorption and overdose risk.",
            objective: .contraindication,
            relatedDrugIds: ["d149"],
            tags: ["Mastery", "5f", "fentanyl patch", "opioid tolerant", "heat"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_012",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .easy,
            question: "Naloxone can rapidly reverse an opioid overdose, but responders are taught to keep watching the patient even after improvement. Why?",
            options: ["Naloxone may wear off before the opioid does, so repeat dosing can be needed", "Naloxone permanently blocks opioid receptors for 72 hours", "Naloxone commonly causes delayed kidney failure", "Naloxone is ineffective for fentanyl exposure", "Naloxone only works if given orally"],
            answer: "Naloxone may wear off before the opioid does, so repeat dosing can be needed",
            explanation: "Naloxone has a shorter duration than many opioids, so recurrent respiratory depression can occur and repeat doses or ongoing monitoring may be needed.",
            objective: .pearl,
            relatedDrugIds: ["d151"],
            tags: ["Mastery", "5f", "naloxone", "repeat dose"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_013",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "A patient has been taking baclofen for spasticity after a spinal cord injury and wants to stop it abruptly because it makes them sleepy. Which adverse outcome is most important to teach?",
            options: ["Withdrawal can cause serious symptoms including seizures", "Sudden stopping causes irreversible hearing loss", "Abrupt discontinuation mainly causes harmless hiccups", "The main risk is rebound hypoglycemia", "Stopping suddenly causes acute gout"],
            answer: "Withdrawal can cause serious symptoms including seizures",
            explanation: "Baclofen should not be stopped abruptly. Withdrawal can be severe and is classically remembered for seizures and other dangerous neurologic symptoms.",
            objective: .contraindication,
            relatedDrugIds: ["d160"],
            tags: ["Mastery", "5f", "baclofen", "withdrawal"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_014",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "Which muscle relaxant in this module is high yield because it is structurally similar to a TCA and often causes sedation plus anticholinergic effects such as dry mouth?",
            options: ["Cyclobenzaprine", "Methocarbamol", "Baclofen", "Gabapentin", "Pregabalin"],
            answer: "Cyclobenzaprine",
            explanation: "Cyclobenzaprine is commonly remembered as the TCA-like muscle relaxant, so sedation and anticholinergic effects are important teaching points.",
            objective: .pearl,
            relatedDrugIds: ["d158"],
            tags: ["Mastery", "5f", "cyclobenzaprine", "TCA-like"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_015",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "A patient needs a muscle relaxant for an acute back strain but is worried about feeling too sedated during the day. Which option is often remembered as somewhat less sedating than cyclobenzaprine?",
            options: ["Methocarbamol", "Baclofen", "Diazepam", "Fentanyl patch", "Pregabalin"],
            answer: "Methocarbamol",
            explanation: "Methocarbamol is a common comparison question because it is often remembered as a muscle relaxant that may be somewhat less sedating than cyclobenzaprine.",
            objective: .pearl,
            relatedDrugIds: ["d159", "d158"],
            tags: ["Mastery", "5f", "methocarbamol", "sedation"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_016",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "A patient with postherpetic neuralgia and chronic kidney disease is prescribed gabapentin. Which monitoring pearl matters most before pushing the dose upward?",
            options: ["Renal function should guide dosing", "The drug must be titrated by INR", "It should only be used with folic acid", "It is contraindicated by any history of rash", "Daily visual field testing is required"],
            answer: "Renal function should guide dosing",
            explanation: "Gabapentin is a go-to neuropathic pain agent, but the dose must be adjusted in renal impairment to reduce toxicity such as dizziness and sedation.",
            objective: .monitoring,
            relatedDrugIds: ["d161"],
            tags: ["Mastery", "5f", "gabapentin", "renal dosing"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_017",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "Which gabapentinoid from this module is especially high yield for fibromyalgia and is also scheduled because of misuse potential?",
            options: ["Pregabalin", "Gabapentin", "Baclofen", "Methocarbamol", "Cyclobenzaprine"],
            answer: "Pregabalin",
            explanation: "Pregabalin is high yield because it is FDA-approved for fibromyalgia and is Schedule V, unlike gabapentin in many standard teaching decks.",
            objective: .indication,
            relatedDrugIds: ["d162"],
            tags: ["Mastery", "5f", "pregabalin", "fibromyalgia"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_018",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "A patient on sertraline from an earlier module is started on tramadol for pain. Which toxicity becomes more important to remember because tramadol is not just a weak opioid?",
            options: ["Serotonin syndrome", "Severe hypoglycemia", "Torsades from pure potassium wasting", "Thyroid storm", "Ocular toxicity"],
            answer: "Serotonin syndrome",
            explanation: "Tramadol has dual action: weak mu-opioid agonism plus serotonin/norepinephrine reuptake inhibition. That makes serotonin syndrome and seizures high-yield interaction concerns.",
            objective: .interaction,
            relatedDrugIds: ["d150", "d74"],
            tags: ["Mastery", "5f", "tramadol", "sertraline", "serotonin syndrome"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_019",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "Which classic opioid in this bank deserves extra caution in renal impairment because active metabolites can accumulate and worsen toxicity?",
            options: ["Morphine", "Oxycodone", "Naloxone", "Fentanyl patch", "Hydrocodone/Acetaminophen"],
            answer: "Morphine",
            explanation: "Morphine is the classic opioid to remember for metabolite accumulation in renal impairment, which can increase sedation and respiratory depression risk.",
            objective: .monitoring,
            relatedDrugIds: ["d146"],
            tags: ["Mastery", "5f", "morphine", "renal impairment"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_020",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .easy,
            question: "A patient says, 'I know Roxicodone is the short-acting one, but which brand name usually signals extended-release oxycodone?'",
            options: ["OxyContin", "MS Contin", "Ultram", "Norco", "Duragesic"],
            answer: "OxyContin",
            explanation: "OxyContin is the extended-release brand for oxycodone, while Roxicodone is the short-acting formulation.",
            objective: .genericBrand,
            relatedDrugIds: ["d147"],
            tags: ["Mastery", "5f", "oxycodone", "OxyContin"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_021",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .easy,
            question: "Norco and Vicodin are common pain prescriptions that also teach an acetaminophen safety pearl. Which generic combination do they contain?",
            options: ["Hydrocodone/Acetaminophen", "Oxycodone/Acetaminophen", "Hydrocodone/Ibuprofen", "Tramadol/Acetaminophen", "Morphine/Acetaminophen"],
            answer: "Hydrocodone/Acetaminophen",
            explanation: "Norco and Vicodin are hydrocodone/acetaminophen combinations, so patients need opioid counseling plus reminders to avoid stacking additional acetaminophen.",
            objective: .brandGeneric,
            relatedDrugIds: ["d148", "d155"],
            tags: ["Mastery", "5f", "Norco", "Vicodin", "hydrocodone/APAP"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_022",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "A patient in the middle of an acute gout flare asks to start a drug that lowers uric acid long term. Which medication from this module is first-line for chronic urate lowering but is not the drug you start solely for immediate flare relief?",
            options: ["Allopurinol", "Colchicine", "Indomethacin", "Ketorolac", "Prednisone"],
            answer: "Allopurinol",
            explanation: "Allopurinol is a first-line xanthine oxidase inhibitor for chronic urate lowering. Acute flare relief is usually provided by agents such as colchicine, NSAIDs, or steroids instead.",
            objective: .indication,
            relatedDrugIds: ["d176", "d157", "d222", "d163"],
            tags: ["Mastery", "5f", "allopurinol", "chronic gout"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_023",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "A patient of Han Chinese ancestry is about to start allopurinol for recurrent gout. Which screening pearl is high yield because it can help identify risk for severe cutaneous reactions?",
            options: ["HLA-B*58:01 testing", "HLA-B27 testing", "APOE genotyping", "TPMT activity testing", "CYP2C19 phenotyping"],
            answer: "HLA-B*58:01 testing",
            explanation: "Allopurinol is high yield for HLA-B*58:01 because that allele is associated with severe hypersensitivity reactions such as SJS/TEN in high-risk populations.",
            objective: .monitoring,
            relatedDrugIds: ["d176"],
            tags: ["Mastery", "5f", "allopurinol", "HLA-B*58:01"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_024",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "A patient calls with an early acute gout flare and you want the classic oral colchicine regimen for a patient with normal renal and hepatic function. Which answer is correct?",
            options: ["1.2 mg now, then 0.6 mg one hour later", "0.6 mg every hour until pain stops", "1.2 mg once daily for 7 days", "2.4 mg immediately and repeat in 2 hours", "0.6 mg twice daily starting next week only"],
            answer: "1.2 mg now, then 0.6 mg one hour later",
            explanation: "The classic high-yield colchicine flare regimen is 1.2 mg at the first sign of a flare followed by 0.6 mg one hour later, with dose adjustments needed in certain patients.",
            objective: .dosing,
            relatedDrugIds: ["d157"],
            tags: ["Mastery", "5f", "colchicine", "acute flare dosing"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_025",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .easy,
            question: "Which adverse effect is so common with colchicine that it is often the first one students are taught to recognize?",
            options: ["Diarrhea", "Dry cough", "Tremor", "Bradycardia", "Hyperglycemia"],
            answer: "Diarrhea",
            explanation: "Diarrhea is the classic dose-limiting adverse effect of colchicine, which makes it a very high-yield teaching point.",
            objective: .adverseEffect,
            relatedDrugIds: ["d157"],
            tags: ["Mastery", "5f", "colchicine", "diarrhea"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_026",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "A patient could not tolerate allopurinol and is switched to Uloric. Which boxed-warning pearl should you remember for febuxostat?",
            options: ["It has an increased risk of cardiovascular death", "It causes irreversible retinal toxicity in all patients", "It must be taken only once every month", "It is the preferred first choice during pregnancy", "It has no important hepatic monitoring issues"],
            answer: "It has an increased risk of cardiovascular death",
            explanation: "Febuxostat is high yield for its boxed warning about increased cardiovascular death risk, so it is generally reserved for patients who cannot use or do not respond adequately to allopurinol.",
            objective: .contraindication,
            relatedDrugIds: ["d177", "d176"],
            tags: ["Mastery", "5f", "febuxostat", "boxed warning"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_027",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "A patient with gout is already taking azathioprine for autoimmune disease. Why does adding allopurinol demand extreme caution?",
            options: ["Allopurinol can dramatically increase azathioprine toxicity and bone marrow suppression risk", "Allopurinol blocks naloxone reversal", "Allopurinol converts azathioprine into a TNF inhibitor", "The combination always causes serotonin syndrome", "The combination makes colchicine ineffective"],
            answer: "Allopurinol can dramatically increase azathioprine toxicity and bone marrow suppression risk",
            explanation: "Allopurinol inhibits xanthine oxidase, so it can sharply increase azathioprine exposure and toxicity unless major dose adjustments or alternative therapy are used.",
            objective: .interaction,
            relatedDrugIds: ["d176", "d181"],
            tags: ["Mastery", "5f", "allopurinol", "azathioprine", "interaction"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_028",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "Which scenario most strongly increases the risk of dangerous colchicine toxicity?",
            options: ["Using colchicine with a strong CYP3A4 or P-gp inhibitor, especially in renal or hepatic impairment", "Taking colchicine with acetaminophen after a meal", "Using colchicine with topical lidocaine", "Taking colchicine once daily with folic acid", "Using colchicine in a patient on levothyroxine"],
            answer: "Using colchicine with a strong CYP3A4 or P-gp inhibitor, especially in renal or hepatic impairment",
            explanation: "Colchicine toxicity becomes much more concerning when it is combined with strong CYP3A4 or P-gp inhibitors, particularly in patients who also have renal or hepatic impairment.",
            objective: .interaction,
            relatedDrugIds: ["d157"],
            tags: ["Mastery", "5f", "colchicine", "CYP3A4", "P-gp"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_029",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "Trexall or Rheumatrex is an anchor DMARD in rheumatoid arthritis, but a common safety error makes it much more toxic than intended. What is that error?",
            options: ["Taking methotrexate daily instead of weekly for RA", "Taking it with food", "Using folic acid with it", "Monitoring CBC and LFTs", "Holding it during pregnancy"],
            answer: "Taking methotrexate daily instead of weekly for RA",
            explanation: "Methotrexate is high yield because RA dosing is weekly, not daily. Accidental daily use can cause severe toxicity, including mucositis, marrow suppression, and hepatotoxicity.",
            objective: .dosing,
            relatedDrugIds: ["d167"],
            tags: ["Mastery", "5f", "methotrexate", "weekly not daily"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_030",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "A patient on methotrexate for RA asks why folic acid was prescribed with it. What is the best teaching answer?",
            options: ["It helps reduce adverse effects such as mouth sores and GI intolerance", "It makes the methotrexate work like a TNF inhibitor", "It prevents retinal toxicity", "It is required because methotrexate always causes hypoglycemia", "It is used to reverse naloxone"],
            answer: "It helps reduce adverse effects such as mouth sores and GI intolerance",
            explanation: "Folic acid is paired with methotrexate in RA to reduce common toxicities such as mucositis and GI side effects without eliminating the drug’s clinical value.",
            objective: .pearl,
            relatedDrugIds: ["d167"],
            tags: ["Mastery", "5f", "methotrexate", "folic acid"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_031",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "A patient with RA taking methotrexate says she may try to become pregnant soon. Which counseling point is most important?",
            options: ["Methotrexate is contraindicated because it can cause embryo-fetal toxicity", "Methotrexate becomes safer during pregnancy than hydroxychloroquine", "Methotrexate should be doubled during the first trimester", "Pregnancy only matters if folic acid is stopped", "Methotrexate is the preferred DMARD for breastfeeding initiation"],
            answer: "Methotrexate is contraindicated because it can cause embryo-fetal toxicity",
            explanation: "Methotrexate is strongly associated with embryo-fetal toxicity and is contraindicated in pregnancy for non-neoplastic diseases such as RA and psoriasis.",
            objective: .contraindication,
            relatedDrugIds: ["d167"],
            tags: ["Mastery", "5f", "methotrexate", "pregnancy"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_032",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "Plaquenil is used in rheumatology partly because it is gentler than many other immunosuppressive drugs, but it has one famous organ-specific toxicity that changes monitoring. Which generic drug is Plaquenil, and what is the major toxicity?",
            options: ["Hydroxychloroquine; retinal toxicity", "Methotrexate; pulmonary fibrosis", "Tacrolimus; gingival hyperplasia", "Allopurinol; tendon rupture", "Celecoxib; ototoxicity"],
            answer: "Hydroxychloroquine; retinal toxicity",
            explanation: "Plaquenil is hydroxychloroquine, and its signature high-yield toxicity is retinal damage, which is why baseline and periodic ophthalmic monitoring matter.",
            objective: .brandGeneric,
            relatedDrugIds: ["d168"],
            tags: ["Mastery", "5f", "Plaquenil", "hydroxychloroquine", "retinal toxicity"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_033",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "Which immunosuppressant from this module is especially high yield for embryo-fetal toxicity, serious infection risk, and GI/bone marrow adverse effects in transplant and lupus-nephritis teaching?",
            options: ["Mycophenolate mofetil", "Hydroxychloroquine", "Etanercept", "Celecoxib", "Baclofen"],
            answer: "Mycophenolate mofetil",
            explanation: "Mycophenolate is a key transplant and lupus-nephritis drug to remember for embryo-fetal toxicity, infection risk, GI upset, and bone marrow suppression.",
            objective: .contraindication,
            relatedDrugIds: ["d180"],
            tags: ["Mastery", "5f", "mycophenolate", "pregnancy", "infection"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_034",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "A patient is about to start adalimumab for rheumatoid arthritis. Which screening step is most important before the first dose?",
            options: ["Test for latent tuberculosis", "Check serum uric acid goal", "Schedule a colonoscopy within 24 hours", "Perform HLA-B*58:01 testing", "Order an INR every week"],
            answer: "Test for latent tuberculosis",
            explanation: "Adalimumab is an anti-TNF biologic with major infection risk, so latent TB screening before starting therapy is a classic must-know step.",
            objective: .monitoring,
            relatedDrugIds: ["d169"],
            tags: ["Mastery", "5f", "adalimumab", "TB screening"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_035",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "One anti-TNF agent in this module is not a monoclonal antibody but a TNF receptor fusion protein. Which drug is it?",
            options: ["Etanercept", "Adalimumab", "Tacrolimus", "Azathioprine", "Mycophenolate"],
            answer: "Etanercept",
            explanation: "Etanercept is the TNF receptor fusion protein in this bank, while adalimumab is a monoclonal antibody against TNF.",
            objective: .moa,
            relatedDrugIds: ["d170", "d169"],
            tags: ["Mastery", "5f", "etanercept", "TNF fusion protein"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_036",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "A transplant patient develops gum overgrowth and unwanted hair growth while taking an immunosuppressant. Which calcineurin inhibitor best matches that adverse-effect pattern?",
            options: ["Cyclosporine", "Tacrolimus", "Methotrexate", "Adalimumab", "Hydroxychloroquine"],
            answer: "Cyclosporine",
            explanation: "Cyclosporine is the classic calcineurin inhibitor linked to gingival hyperplasia and hirsutism, in addition to nephrotoxicity and hypertension.",
            objective: .adverseEffect,
            relatedDrugIds: ["d179"],
            tags: ["Mastery", "5f", "cyclosporine", "gingival hyperplasia", "hirsutism"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_037",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "Another calcineurin inhibitor is more classically remembered for tremor and hyperglycemia than for hirsutism and gum changes. Which drug is that?",
            options: ["Tacrolimus", "Cyclosporine", "Azathioprine", "Hydroxychloroquine", "Etanercept"],
            answer: "Tacrolimus",
            explanation: "Tacrolimus is commonly contrasted with cyclosporine because tremor and hyperglycemia stand out more for tacrolimus, while gingival hyperplasia and hirsutism stand out more for cyclosporine.",
            objective: .adverseEffect,
            relatedDrugIds: ["d178", "d179"],
            tags: ["Mastery", "5f", "tacrolimus", "tremor", "hyperglycemia"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_038",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "Which counseling bundle is most accurate for tacrolimus?",
            options: ["Do not take it simultaneously with cyclosporine, avoid grapefruit, and monitor trough levels closely", "Take it with grapefruit juice to improve absorption and pair it with cyclosporine for synergy", "It does not require drug-level monitoring because it has a wide therapeutic index", "It is mainly limited by retinal toxicity and should be combined with hydroxychloroquine", "It is the preferred short-course drug for acute gout flares"],
            answer: "Do not take it simultaneously with cyclosporine, avoid grapefruit, and monitor trough levels closely",
            explanation: "Tacrolimus has a narrow therapeutic index, requires trough monitoring, should not be used simultaneously with cyclosporine, and interacts with grapefruit.",
            objective: .interaction,
            relatedDrugIds: ["d178", "d179"],
            tags: ["Mastery", "5f", "tacrolimus", "cyclosporine", "grapefruit"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_039",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "A patient with newly diagnosed RA needs rapid symptom relief today but also long-term disease modification over the next few months. Which pair best teaches the difference between bridge therapy and anchor DMARD therapy?",
            options: ["Prednisone now plus methotrexate for long-term control", "Ketorolac now plus naloxone for long-term control", "Colchicine now plus allopurinol for RA disease modification", "Hydroxychloroquine now plus fentanyl patch long term", "Baclofen now plus celecoxib long term"],
            answer: "Prednisone now plus methotrexate for long-term control",
            explanation: "Prednisone can quickly reduce inflammatory symptoms while methotrexate serves as the anchor DMARD that takes longer to deliver sustained disease control.",
            objective: .mixedReview,
            relatedDrugIds: ["d163", "d167"],
            tags: ["Mastery", "5f", "prednisone", "methotrexate", "bridge therapy"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_040",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "A learner keeps mixing up the systemic corticosteroids. Which statement is most accurate?",
            options: ["Dexamethasone has essentially no mineralocorticoid activity, while hydrocortisone has the most mineralocorticoid activity of the common systemic steroids in your bank", "Hydrocortisone is the most potent glucocorticoid and has no salt-retaining activity", "Prednisone is used as physiologic adrenal replacement instead of hydrocortisone", "Methylprednisolone has more mineralocorticoid activity than hydrocortisone", "All systemic steroids have the same glucocorticoid and mineralocorticoid profile"],
            answer: "Dexamethasone has essentially no mineralocorticoid activity, while hydrocortisone has the most mineralocorticoid activity of the common systemic steroids in your bank",
            explanation: "Dexamethasone is remembered as a very potent glucocorticoid with minimal to no mineralocorticoid activity, whereas hydrocortisone is the most 'physiologic' and has the greatest mineralocorticoid effect among these four.",
            objective: .pearl,
            relatedDrugIds: ["d165", "d166", "d163", "d164"],
            tags: ["Mastery", "5f", "dexamethasone", "hydrocortisone", "mineralocorticoid"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_041",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "A patient with atrial fibrillation on apixaban asks for something stronger than acetaminophen for a back strain. Which option from this module most clearly raises the risk of clinically important bleeding?",
            options: ["Ketorolac", "Lidocaine patch", "Baclofen", "Methocarbamol", "Gabapentin"],
            answer: "Ketorolac",
            explanation: "NSAIDs can increase bleeding risk in anticoagulated patients, and ketorolac is especially high yield because it is one of the most GI- and bleed-risk-heavy options in the module.",
            objective: .interaction,
            relatedDrugIds: ["d156", "d43"],
            tags: ["Mastery", "5f", "ketorolac", "apixaban", "bleeding"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_042",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .medium,
            question: "A patient with type 2 diabetes controlled on metformin notices glucose readings climb after starting a prednisone burst for inflammatory pain. Which explanation is best?",
            options: ["Prednisone commonly causes hyperglycemia", "Prednisone blocks metformin absorption permanently", "Prednisone directly destroys pancreatic beta cells after one dose", "Prednisone causes severe hypoglycemia before hyperglycemia", "Prednisone lowers glucose unless combined with insulin"],
            answer: "Prednisone commonly causes hyperglycemia",
            explanation: "Systemic corticosteroids commonly raise blood glucose, which is why prednisone can worsen glycemic control in patients with diabetes even if they were previously stable on metformin.",
            objective: .adverseEffect,
            relatedDrugIds: ["d163", "d45"],
            tags: ["Mastery", "5f", "prednisone", "metformin", "hyperglycemia"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_043",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "A patient has diabetic neuropathy and major depressive disorder. Which drug from earlier modules best teaches the idea that one medicine may help both mood and neuropathic pain, whereas gabapentin and pregabalin do not treat depression?",
            options: ["Duloxetine", "Sertraline", "Celecoxib", "Baclofen", "Methocarbamol"],
            answer: "Duloxetine",
            explanation: "Duloxetine is the high-yield crossover answer because it treats depression and also has an established role in neuropathic pain, unlike gabapentin and pregabalin which are not antidepressants.",
            objective: .mixedReview,
            relatedDrugIds: ["d79", "d161", "d162"],
            tags: ["Mastery", "5f", "duloxetine", "neuropathic pain", "depression"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_044",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "A patient has been taking allopurinol chronically and now develops an acute gout flare. Which management principle is most accurate?",
            options: ["Continue the chronic urate-lowering therapy and treat the flare with an acute agent such as colchicine or an NSAID if appropriate", "Stop allopurinol immediately and never restart it", "Increase febuxostat urgently for same-day pain relief", "Treat only with folic acid until the flare resolves", "Switch to tacrolimus because it lowers uric acid faster"],
            answer: "Continue the chronic urate-lowering therapy and treat the flare with an acute agent such as colchicine or an NSAID if appropriate",
            explanation: "Patients already established on chronic urate-lowering therapy usually continue it during a flare; the flare itself is treated with an acute anti-inflammatory option such as colchicine, an NSAID, or sometimes a steroid.",
            objective: .mixedReview,
            relatedDrugIds: ["d176", "d157", "d222"],
            tags: ["Mastery", "5f", "allopurinol", "colchicine", "acute flare"],
            source: .curated
        ),
        .multipleChoice(
            id: "q5f_add_045",
            subsectionId: DrugDataService.masteringPainRheumSubsectionId,
            difficulty: .hard,
            question: "A patient with a rheumatoid arthritis flare is on apixaban, has chronic kidney disease, and has a history of peptic ulcer bleeding. Which choice from this module best teaches why clinicians may reach for a short steroid bridge instead of another NSAID?",
            options: ["Prednisone", "Ketorolac", "Ibuprofen", "Indomethacin", "Naproxen"],
            answer: "Prednisone",
            explanation: "In a patient with major NSAID-related bleeding and renal concerns, a short steroid bridge may be used for inflammatory control while longer-term DMARD therapy is optimized, although steroids bring their own important risks.",
            objective: .mixedReview,
            relatedDrugIds: ["d163", "d43", "d156", "d152", "d222", "d153"],
            tags: ["Mastery", "5f", "prednisone", "NSAID alternative", "bridge"],
            source: .curated
        ),
    ]
}