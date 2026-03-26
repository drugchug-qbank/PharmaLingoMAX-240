// PharmaLingo — Module 9e (Parkinson's Disease Medications)
// Curated Add-On Question Pack (45 questions)
// IDs: q9e_add_001 ... q9e_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 9e exists, then append:
//
//    if bank["9e"] == nil { bank["9e"] = [] }
//    bank["9e"]?.append(contentsOf: Self.curatedAddOnQuestions_9e)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs:
//   d272 (Pramipexole / Mirapex), d273 (Ropinirole / Requip).
//
// Generated on: 2026-03-10

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_9e: [Question] = [
        .multipleChoice(
            id: "q9e_add_001",
            subsectionId: "9e",
            difficulty: .easy,
            question: "Mirapex is a dopamine agonist used in Parkinson’s disease and also in restless legs syndrome. What is the generic name of Mirapex?",
            options: ["Pramipexole", "Ropinirole", "Primidone", "Phenytoin", "Pravastatin"],
            answer: "Pramipexole",
            explanation: "Mirapex is the brand name for pramipexole, a dopamine agonist used in Parkinson’s disease and restless legs syndrome.",
            objective: .brandGeneric,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_002",
            subsectionId: "9e",
            difficulty: .easy,
            question: "Pramipexole is the renally eliminated dopamine agonist in this subsection that can be used for Parkinson’s disease or restless legs syndrome. Which brand name matches pramipexole?",
            options: ["Mirapex", "Requip", "Lamictal", "Tegretol", "Aricept"],
            answer: "Mirapex",
            explanation: "Pramipexole corresponds to the brand name Mirapex.",
            objective: .genericBrand,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_003",
            subsectionId: "9e",
            difficulty: .easy,
            question: "A student is trying to classify pramipexole correctly instead of confusing it with levodopa, a triptan, or an anticholinergic. Which drug class best describes pramipexole?",
            options: ["Dopamine agonist", "Dopamine antagonist", "MAO-B inhibitor", "Triptan", "Cholinesterase inhibitor"],
            answer: "Dopamine agonist",
            explanation: "Pramipexole is a dopamine agonist, not a dopamine antagonist or triptan.",
            objective: .classId,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "class"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_004",
            subsectionId: "9e",
            difficulty: .easy,
            question: "A patient with tremor, rigidity, and bradykinesia is started on a dopamine agonist as part of Parkinson’s disease management. Which classic indication fits pramipexole?",
            options: ["Parkinson’s disease", "Ulcerative colitis", "Acute migraine", "Overactive bladder", "Heart failure"],
            answer: "Parkinson’s disease",
            explanation: "Pramipexole is indicated for Parkinson’s disease and is commonly taught as a dopamine agonist option in PD.",
            objective: .indication,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "parkinsons"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_005",
            subsectionId: "9e",
            difficulty: .medium,
            question: "Not every Parkinson’s medication is limited to Parkinson’s disease. Which additional high-yield indication is also associated with pramipexole?",
            options: ["Restless legs syndrome", "Bacterial pneumonia", "Gastroesophageal reflux disease", "Atrial fibrillation", "BPH"],
            answer: "Restless legs syndrome",
            explanation: "Pramipexole is also indicated for restless legs syndrome, which is a classic pearl for this drug.",
            objective: .indication,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "rls"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_006",
            subsectionId: "9e",
            difficulty: .medium,
            question: "Pramipexole improves Parkinsonian symptoms by acting more like dopamine than by blocking dopamine. Which mechanism best describes pramipexole?",
            options: ["Direct stimulation of dopamine receptors as a dopamine agonist", "Irreversible inhibition of acetylcholinesterase", "Blockade of dopamine receptors in the basal ganglia", "Inhibition of serotonin reuptake", "Direct replacement of GABA in the CNS"],
            answer: "Direct stimulation of dopamine receptors as a dopamine agonist",
            explanation: "Pramipexole is a dopamine agonist, so it directly stimulates dopamine receptors rather than blocking them.",
            objective: .moa,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "moa"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_007",
            subsectionId: "9e",
            difficulty: .hard,
            question: "A clinician wants to start immediate-release pramipexole for Parkinson’s disease using the label-based low-and-slow approach. Which starting regimen is best?",
            options: ["0.125 mg three times daily", "0.25 mg three times daily", "1 mg once daily", "0.5 mg at bedtime as needed", "2 mg twice daily"],
            answer: "0.125 mg three times daily",
            explanation: "For Parkinson’s disease, immediate-release pramipexole is started at 0.125 mg three times daily and then titrated gradually.",
            objective: .dosing,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "dosing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_008",
            subsectionId: "9e",
            difficulty: .hard,
            question: "Because dopamine agonists can cause orthostasis, hallucinations, and somnolence, pramipexole is not rushed upward. Which titration pearl is most accurate?",
            options: ["Increase gradually and generally not more often than every 5 to 7 days", "Double the dose every day until symptoms disappear", "Start at the final maintenance dose on day 1", "Use only once-weekly dose changes after six months of therapy", "Take it only as needed for bad tremor days"],
            answer: "Increase gradually and generally not more often than every 5 to 7 days",
            explanation: "Pramipexole is titrated gradually, typically no more often than every 5 to 7 days in Parkinson’s disease.",
            objective: .dosing,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "titration"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_009",
            subsectionId: "9e",
            difficulty: .medium,
            question: "Pramipexole is the dopamine agonist in this subsection that is handled largely by the kidneys rather than by CYP1A2 metabolism. Which monitoring concept follows from that pearl?",
            options: ["Kidney function matters because pramipexole is largely renally eliminated", "Routine INR monitoring is required because pramipexole is a vitamin K antagonist", "Baseline ANC monitoring is mandatory because agranulocytosis is expected", "Weekly LFTs are the main concern because pramipexole is strongly hepatotoxic", "TSH monitoring is required because pramipexole is a thyroid hormone"],
            answer: "Kidney function matters because pramipexole is largely renally eliminated",
            explanation: "Pramipexole is largely renally eliminated, so renal function is a high-yield consideration when dosing and monitoring therapy.",
            objective: .monitoring,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "renal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_010",
            subsectionId: "9e",
            difficulty: .hard,
            question: "A patient with Parkinson’s disease develops worsening dizziness and somnolence after kidney function declines. Which 9e drug is most likely to be affected because it depends more on renal elimination than ropinirole does?",
            options: ["Pramipexole", "Ropinirole", "Sumatriptan", "Carbamazepine", "Memantine"],
            answer: "Pramipexole",
            explanation: "Compared with ropinirole, pramipexole is the more renally eliminated dopamine agonist and is therefore more affected by reduced kidney function.",
            objective: .pearl,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "ckd"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_011",
            subsectionId: "9e",
            difficulty: .hard,
            question: "A patient taking pramipexole says, \"I nearly dozed off while talking to someone and once felt myself drifting while driving.\" Which high-yield dopamine agonist adverse effect best explains this?",
            options: ["Sudden onset of sleep and marked somnolence", "Tardive dyskinesia from chronic dopamine blockade", "Red man syndrome from infusion-related histamine release", "Severe bronchospasm from beta-2 blockade", "Acute urinary retention from alpha agonism"],
            answer: "Sudden onset of sleep and marked somnolence",
            explanation: "Pramipexole can cause significant somnolence and sudden sleep episodes, which is a major counseling point for dopamine agonists.",
            objective: .adverseEffect,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "sleep-attacks"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_012",
            subsectionId: "9e",
            difficulty: .hard,
            question: "Several months after starting pramipexole, a patient develops new gambling and compulsive online shopping behaviors. Which adverse-effect category should come to mind first?",
            options: ["Impulse control and compulsive behaviors", "Drug-induced lupus", "Ototoxicity", "Serotonin syndrome", "Stevens-Johnson syndrome"],
            answer: "Impulse control and compulsive behaviors",
            explanation: "Pramipexole and other dopamine agonists can trigger impulse control problems such as gambling, compulsive shopping, binge eating, and hypersexuality.",
            objective: .adverseEffect,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "impulse-control"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_013",
            subsectionId: "9e",
            difficulty: .medium,
            question: "A patient newly started on pramipexole feels dizzy and sweaty when standing up quickly from a chair. Which counseling point best fits this common dopamine agonist issue?",
            options: ["Rise slowly because orthostatic hypotension can occur", "Take the drug with grapefruit juice to reduce dizziness", "Increase salt restriction immediately because hypertension is expected", "Skip every other dose because this means the drug is curing Parkinson’s disease", "Double the next dose to overcome tolerance"],
            answer: "Rise slowly because orthostatic hypotension can occur",
            explanation: "Orthostatic hypotension is a classic dopamine agonist adverse effect, so patients should be taught to rise slowly.",
            objective: .adverseEffect,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "orthostasis"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_014",
            subsectionId: "9e",
            difficulty: .hard,
            question: "An older adult with Parkinson’s disease starts reporting visual hallucinations after pramipexole was added. Which explanation is most accurate?",
            options: ["Dopamine agonists can cause hallucinations and psychotic-like behavior, especially in susceptible patients", "Pramipexole predictably causes retinal detachment in all older adults", "This confirms the patient has serotonin syndrome", "This is the expected sign that the dose is too low", "Hallucinations prove the patient is withdrawing from levodopa"],
            answer: "Dopamine agonists can cause hallucinations and psychotic-like behavior, especially in susceptible patients",
            explanation: "Hallucinations are a high-yield dopamine agonist warning and may be more problematic in older or more vulnerable patients.",
            objective: .adverseEffect,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "hallucinations"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_015",
            subsectionId: "9e",
            difficulty: .hard,
            question: "A patient already taking levodopa has pramipexole added and then develops more involuntary writhing movements. Which label-based pearl best explains this change?",
            options: ["Adding pramipexole can increase dyskinesia in patients also taking levodopa", "Pramipexole directly depletes acetylcholine and causes cholinergic rebound", "Pramipexole blocks NMDA receptors and causes vertigo", "Pramipexole irreversibly lowers serotonin and causes akathisia", "Pramipexole causes red blood cell hemolysis when combined with levodopa"],
            answer: "Adding pramipexole can increase dyskinesia in patients also taking levodopa",
            explanation: "In patients receiving levodopa, adding a dopamine agonist like pramipexole can worsen dyskinesia.",
            objective: .interaction,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "levodopa", "dyskinesia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_016",
            subsectionId: "9e",
            difficulty: .hard,
            question: "During taper or soon after stopping pramipexole, a patient develops apathy, anxiety, depression, fatigue, sweating, and pain that do not improve with extra levodopa. What high-yield phenomenon does this suggest?",
            options: ["Dopamine agonist withdrawal symptoms", "Opioid withdrawal from hidden morphine use", "Acute serotonin syndrome", "Neuroleptic malignant syndrome from haloperidol", "Metformin-associated lactic acidosis"],
            answer: "Dopamine agonist withdrawal symptoms",
            explanation: "Withdrawal symptoms such as apathy, anxiety, depression, fatigue, insomnia, sweating, and pain can occur during taper or after discontinuing dopamine agonists like pramipexole.",
            objective: .pearl,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "withdrawal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_017",
            subsectionId: "9e",
            difficulty: .hard,
            question: "A hospitalized patient on pramipexole for Parkinson’s disease is given metoclopramide for nausea. Which interaction pearl is most accurate?",
            options: ["Dopamine antagonists such as metoclopramide may diminish the effect of pramipexole and can worsen Parkinsonian control", "Metoclopramide safely boosts pramipexole efficacy because both are dopamine agonists", "The combination predictably causes C. difficile colitis", "Metoclopramide prevents all dopamine agonist hallucinations without any tradeoff", "There is no pharmacologic reason to worry because the drugs act on unrelated pathways"],
            answer: "Dopamine antagonists such as metoclopramide may diminish the effect of pramipexole and can worsen Parkinsonian control",
            explanation: "Because pramipexole is a dopamine agonist, dopamine antagonists like metoclopramide may counteract its effect and worsen Parkinsonian symptoms.",
            objective: .interaction,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "metoclopramide"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_018",
            subsectionId: "9e",
            difficulty: .hard,
            question: "A patient is prescribed pramipexole for restless legs syndrome rather than daytime Parkinson’s dosing. Which label-consistent instruction is best?",
            options: ["Take 0.125 mg once daily about 2 to 3 hours before bedtime", "Take 0.125 mg three times daily with meals", "Take 0.25 mg once every morning only", "Take 2 mg once daily at lunch", "Use it only as needed after leg symptoms wake you up"],
            answer: "Take 0.125 mg once daily about 2 to 3 hours before bedtime",
            explanation: "For restless legs syndrome, pramipexole is started once daily 2 to 3 hours before bedtime rather than three times daily Parkinson’s dosing.",
            objective: .dosing,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "rls", "bedtime"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_019",
            subsectionId: "9e",
            difficulty: .medium,
            question: "Which adverse-effect cluster best matches a patient who has just started pramipexole for early Parkinson’s disease?",
            options: ["Nausea, dizziness, somnolence, constipation, and hallucinations", "Cough, angioedema, and hyperkalemia", "Tinnitus, salicylism, and GI ulceration", "Myalgia, rhabdomyolysis, and dark urine", "Severe diarrhea, pancreatitis, and thyroid cancer risk"],
            answer: "Nausea, dizziness, somnolence, constipation, and hallucinations",
            explanation: "Common early adverse effects with pramipexole include nausea, dizziness, somnolence, constipation, and sometimes hallucinations.",
            objective: .adverseEffect,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "adverse-cluster"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_020",
            subsectionId: "9e",
            difficulty: .hard,
            question: "A patient with Parkinson’s disease and significant chronic kidney disease is being started on pramipexole. Which principle is most accurate?",
            options: ["A lower starting and/or maintenance dose may be needed because clearance falls in renal impairment", "Renal impairment has no meaningful effect on pramipexole exposure", "Pramipexole should be doubled because dialysis removes it completely", "Only liver tests matter because the drug is mainly hepatically metabolized", "Kidney disease matters only for ropinirole, not for pramipexole"],
            answer: "A lower starting and/or maintenance dose may be needed because clearance falls in renal impairment",
            explanation: "Because pramipexole is largely renally eliminated, lower starting or maintenance doses may be needed in renal impairment.",
            objective: .dosing,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "renal-dosing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_021",
            subsectionId: "9e",
            difficulty: .medium,
            question: "Which counseling statement is best when dispensing pramipexole to a patient who still drives regularly?",
            options: ["Do not ignore new daytime sleepiness or sudden sleep episodes; driving may become unsafe", "Take extra caffeine with every dose so sleep attacks cannot happen", "Unexpected sleepiness is impossible once the dose is stable", "Driving risk only applies to patients taking warfarin", "The only reason to avoid driving is if urine turns orange"],
            answer: "Do not ignore new daytime sleepiness or sudden sleep episodes; driving may become unsafe",
            explanation: "Patients on pramipexole should be counseled about significant sleepiness and sudden sleep episodes because these can make driving unsafe.",
            objective: .pearl,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "driving"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_022",
            subsectionId: "9e",
            difficulty: .hard,
            question: "Which summary statement best matches pramipexole?",
            options: ["Mirapex is a renally eliminated dopamine agonist used in Parkinson’s disease and restless legs syndrome", "Mirapex is a dopamine blocker metabolized by CYP1A2 and used only for nausea", "Mirapex is a triptan used only for acute migraine", "Mirapex is a cholinesterase inhibitor used for Alzheimer’s disease", "Mirapex is a proton pump inhibitor used for GERD"],
            answer: "Mirapex is a renally eliminated dopamine agonist used in Parkinson’s disease and restless legs syndrome",
            explanation: "Pramipexole (Mirapex) is the renally eliminated dopamine agonist in this subsection and is used for both Parkinson’s disease and restless legs syndrome.",
            objective: .mixedReview,
            relatedDrugIds: ["d272"],
            tags: ["9e", "pramipexole", "summary"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_023",
            subsectionId: "9e",
            difficulty: .easy,
            question: "Requip is a dopamine agonist used for Parkinson’s disease and also for restless legs syndrome. What is the generic name of Requip?",
            options: ["Ropinirole", "Pramipexole", "Primidone", "Rimegepant", "Risperidone"],
            answer: "Ropinirole",
            explanation: "Requip is the brand name for ropinirole.",
            objective: .brandGeneric,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_024",
            subsectionId: "9e",
            difficulty: .easy,
            question: "Ropinirole is the dopamine agonist in this subsection whose metabolism is linked to CYP1A2. Which brand name matches ropinirole?",
            options: ["Requip", "Mirapex", "Lamictal", "Topamax", "Namenda"],
            answer: "Requip",
            explanation: "Ropinirole corresponds to the brand name Requip.",
            objective: .genericBrand,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_025",
            subsectionId: "9e",
            difficulty: .easy,
            question: "A student wants to identify ropinirole by pharmacologic class rather than by brand name. Which class best describes ropinirole?",
            options: ["Dopamine agonist", "D2 antagonist antipsychotic", "NMDA receptor antagonist", "Selective serotonin reuptake inhibitor", "Triptan"],
            answer: "Dopamine agonist",
            explanation: "Ropinirole is a dopamine agonist used in Parkinson’s disease and restless legs syndrome.",
            objective: .classId,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "class"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_026",
            subsectionId: "9e",
            difficulty: .easy,
            question: "A patient with Parkinson’s disease is started on a non-ergot dopamine agonist to improve bradykinesia and rigidity. Which classic indication matches ropinirole?",
            options: ["Parkinson’s disease", "Ulcerative colitis", "Bacterial sinusitis", "Overactive bladder", "Insomnia"],
            answer: "Parkinson’s disease",
            explanation: "Ropinirole is indicated for Parkinson’s disease.",
            objective: .indication,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "parkinsons"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_027",
            subsectionId: "9e",
            difficulty: .medium,
            question: "Which additional high-yield indication is also associated with ropinirole besides Parkinson’s disease?",
            options: ["Restless legs syndrome", "Status epilepticus", "Chronic gout prevention", "Acute angina rescue", "H. pylori eradication"],
            answer: "Restless legs syndrome",
            explanation: "Ropinirole is also indicated for restless legs syndrome, which is a classic teaching pearl.",
            objective: .indication,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "rls"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_028",
            subsectionId: "9e",
            difficulty: .medium,
            question: "Ropinirole improves Parkinsonian symptoms by boosting dopaminergic signaling without being levodopa itself. Which mechanism best explains this?",
            options: ["Direct dopamine receptor agonism", "Irreversible COX-1 inhibition", "Blockade of muscarinic receptors in the basal ganglia", "Inhibition of COMT only in the periphery", "NMDA antagonism"],
            answer: "Direct dopamine receptor agonism",
            explanation: "Ropinirole is a dopamine agonist, so it directly stimulates dopamine receptors.",
            objective: .moa,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "moa"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_029",
            subsectionId: "9e",
            difficulty: .hard,
            question: "Immediate-release ropinirole for Parkinson’s disease is started low to reduce adverse effects while titrating to benefit. Which starting regimen is correct?",
            options: ["0.25 mg three times daily", "0.125 mg three times daily", "2 mg once daily", "1 mg at bedtime only", "4 mg once weekly"],
            answer: "0.25 mg three times daily",
            explanation: "For Parkinson’s disease, immediate-release ropinirole is started at 0.25 mg three times daily and then titrated upward gradually.",
            objective: .dosing,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "dosing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_030",
            subsectionId: "9e",
            difficulty: .hard,
            question: "When ropinirole is used for restless legs syndrome rather than Parkinson’s disease, which instruction best matches the label?",
            options: ["Start 0.25 mg once daily 1 to 3 hours before bedtime", "Start 0.25 mg three times daily with meals", "Start 2 mg every morning", "Take 0.125 mg once daily 2 to 3 hours before bedtime", "Use only as needed after awakening from sleep"],
            answer: "Start 0.25 mg once daily 1 to 3 hours before bedtime",
            explanation: "For restless legs syndrome, ropinirole is started at 0.25 mg once daily 1 to 3 hours before bedtime.",
            objective: .dosing,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "rls", "bedtime"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_031",
            subsectionId: "9e",
            difficulty: .hard,
            question: "Which pharmacokinetic pearl best distinguishes ropinirole from pramipexole?",
            options: ["Ropinirole is more tied to hepatic CYP1A2 metabolism and related interactions", "Ropinirole is excreted almost completely unchanged in urine", "Ropinirole is a biologic monoclonal antibody with no CYP interactions", "Ropinirole is a long-acting nitrate prodrug", "Ropinirole is activated only by intestinal bacteria"],
            answer: "Ropinirole is more tied to hepatic CYP1A2 metabolism and related interactions",
            explanation: "Compared with pramipexole, ropinirole is the dopamine agonist more associated with hepatic CYP1A2 metabolism and interaction pearls.",
            objective: .pearl,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "cyp1a2"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_032",
            subsectionId: "9e",
            difficulty: .hard,
            question: "A patient on stable ropinirole is prescribed ciprofloxacin. Which interaction teaching point is most accurate?",
            options: ["Ciprofloxacin can increase ropinirole exposure because it inhibits CYP1A2", "Ciprofloxacin prevents all ropinirole-related sleepiness by speeding clearance", "Ciprofloxacin is used to reverse ropinirole hallucinations", "The combination is helpful because ciprofloxacin converts ropinirole into pramipexole", "Ropinirole blocks ciprofloxacin absorption only if taken with food"],
            answer: "Ciprofloxacin can increase ropinirole exposure because it inhibits CYP1A2",
            explanation: "Ropinirole is affected by CYP1A2 inhibitors such as ciprofloxacin, which can increase ropinirole exposure and side effects.",
            objective: .interaction,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "ciprofloxacin"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_033",
            subsectionId: "9e",
            difficulty: .hard,
            question: "A smoker reports that ropinirole seems less effective after returning to smoking regularly. Which high-yield explanation fits best?",
            options: ["Smoking can increase ropinirole clearance because CYP1A2 is induced", "Smoking blocks renal secretion of ropinirole and therefore always increases toxicity", "Smoking converts ropinirole into an inactive patch formulation", "Smoking has no relevance because ropinirole is not metabolized", "Smoking directly antagonizes dopamine receptors"],
            answer: "Smoking can increase ropinirole clearance because CYP1A2 is induced",
            explanation: "Smoking induces CYP1A2, so it can increase ropinirole clearance and lower exposure.",
            objective: .interaction,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "smoking"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_034",
            subsectionId: "9e",
            difficulty: .hard,
            question: "A patient taking ropinirole says, \"I don’t always feel sleepy first, but I suddenly nod off.\" Which adverse-effect warning does this describe?",
            options: ["Sudden onset of sleep and marked somnolence", "Black hairy tongue", "ACE-inhibitor cough", "Red man syndrome", "Photosensitivity due to tetracycline therapy"],
            answer: "Sudden onset of sleep and marked somnolence",
            explanation: "Ropinirole, like other dopamine agonists, can cause pronounced somnolence and sudden sleep episodes.",
            objective: .adverseEffect,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "sleep-attacks"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_035",
            subsectionId: "9e",
            difficulty: .hard,
            question: "A spouse reports that a patient on ropinirole has developed new binge eating and unusually risky spending. Which adverse-effect category best fits?",
            options: ["Impulse control and compulsive behaviors", "Irreversible ototoxicity", "Pancreatitis", "Photosensitive blistering rash", "Statin-induced rhabdomyolysis"],
            answer: "Impulse control and compulsive behaviors",
            explanation: "Ropinirole can cause impulse control problems such as gambling, binge eating, and compulsive spending.",
            objective: .adverseEffect,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "impulse-control"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_036",
            subsectionId: "9e",
            difficulty: .hard,
            question: "An elderly patient with Parkinson’s disease starts seeing people in the room who are not there after ropinirole titration. Which label-based pearl is most accurate?",
            options: ["Ropinirole can cause hallucinations and other psychotic-like behavior", "This proves the patient has Alzheimer’s disease rather than Parkinson’s disease", "Hallucinations are expected and mean the dose should always be increased further", "This is the hallmark of hepatic failure from ropinirole", "Ropinirole only causes GI side effects, so another cause must be assumed"],
            answer: "Ropinirole can cause hallucinations and other psychotic-like behavior",
            explanation: "Hallucinations are a recognized adverse effect with ropinirole and other dopamine agonists.",
            objective: .adverseEffect,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "hallucinations"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_037",
            subsectionId: "9e",
            difficulty: .medium,
            question: "Which counseling point best fits ropinirole when a patient complains of lightheadedness after standing?",
            options: ["Stand up slowly because orthostatic symptoms can occur with dopamine agonists", "Add an antacid because the drug is probably causing an ulcer", "Skip all future doses because this means the drug has stopped working", "Take the next dose with warfarin to stabilize blood pressure", "This is unrelated because ropinirole never affects blood pressure"],
            answer: "Stand up slowly because orthostatic symptoms can occur with dopamine agonists",
            explanation: "Orthostatic symptoms are a high-yield counseling issue with dopamine agonists like ropinirole.",
            objective: .adverseEffect,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "orthostasis"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_038",
            subsectionId: "9e",
            difficulty: .hard,
            question: "A clinician wants to stop ropinirole in a patient with Parkinson’s disease without abruptly withdrawing therapy. Which taper pearl is most accurate?",
            options: ["Reduce from three times daily to twice daily for 4 days, then once daily for 3 days before stopping", "Stop immediately because tapering is never recommended", "Cut the tablet in half and continue only every other week", "Double the levodopa first, then stop ropinirole that same day", "Replace it with metoclopramide for one week"],
            answer: "Reduce from three times daily to twice daily for 4 days, then once daily for 3 days before stopping",
            explanation: "For Parkinson’s disease, immediate-release ropinirole is tapered over 7 days by reducing frequency from TID to BID for 4 days, then daily for 3 days.",
            objective: .dosing,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "taper"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_039",
            subsectionId: "9e",
            difficulty: .hard,
            question: "Which renal-dosing pearl is most accurate for immediate-release ropinirole in Parkinson’s disease?",
            options: ["In patients on regular hemodialysis, the recommended initial dose is 0.25 mg three times daily and supplemental post-dialysis doses are not required", "Ropinirole is absolutely contraindicated in all dialysis patients", "Ropinirole must always be started at 2 mg three times daily in dialysis", "The drug is removed completely by dialysis, so a full extra dose is always required after each session", "Ropinirole dosing is based only on bilirubin, not renal status"],
            answer: "In patients on regular hemodialysis, the recommended initial dose is 0.25 mg three times daily and supplemental post-dialysis doses are not required",
            explanation: "For Parkinson’s disease, ropinirole has specific hemodialysis dosing guidance: start at 0.25 mg three times daily, and supplemental doses after dialysis are not required.",
            objective: .pearl,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "dialysis"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_040",
            subsectionId: "9e",
            difficulty: .medium,
            question: "Which adverse-effect cluster most closely matches ropinirole therapy in Parkinson’s disease?",
            options: ["Nausea, somnolence, hallucinations, and orthostatic symptoms", "Cough, angioedema, and hyperkalemia", "Constipation from anticholinergic blockade only", "Photosensitivity and esophagitis from tetracycline exposure", "Severe hypoglycemia from pancreatic beta-cell stimulation"],
            answer: "Nausea, somnolence, hallucinations, and orthostatic symptoms",
            explanation: "Common high-yield ropinirole issues include nausea, somnolence, hallucinations, and orthostatic symptoms.",
            objective: .adverseEffect,
            relatedDrugIds: ["d273"],
            tags: ["9e", "ropinirole", "adverse-cluster"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_041",
            subsectionId: "9e",
            difficulty: .medium,
            question: "A learner wants to remember the unifying idea for subsection 9e before memorizing details. What do pramipexole and ropinirole have most in common?",
            options: ["Both are dopamine agonists used in Parkinson’s disease and also in restless legs syndrome", "Both are dopamine antagonists used only for schizophrenia", "Both are cholinesterase inhibitors used for dementia", "Both are triptans used only for acute migraine", "Both are sodium-channel blockers used only for seizures"],
            answer: "Both are dopamine agonists used in Parkinson’s disease and also in restless legs syndrome",
            explanation: "Pramipexole and ropinirole are the two dopamine agonists in subsection 9e, and both can be used for Parkinson’s disease and restless legs syndrome.",
            objective: .classId,
            relatedDrugIds: ["d272", "d273"],
            tags: ["9e", "comparison", "class"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_042",
            subsectionId: "9e",
            difficulty: .hard,
            question: "Which comparison is correctly matched to the two dopamine agonists in this subsection?",
            options: ["Pramipexole is more renally eliminated, whereas ropinirole is more tied to CYP1A2 interactions and smoking status", "Pramipexole is the CYP1A2 drug, whereas ropinirole is excreted almost completely unchanged in urine", "Both drugs are cleared only by dialysis and have no interaction differences", "Neither drug can cause somnolence or impulse control problems", "Only pramipexole treats restless legs syndrome"],
            answer: "Pramipexole is more renally eliminated, whereas ropinirole is more tied to CYP1A2 interactions and smoking status",
            explanation: "The high-yield PK distinction is pramipexole = renal emphasis, ropinirole = CYP1A2/smoking/ciprofloxacin emphasis.",
            objective: .mixedReview,
            relatedDrugIds: ["d272", "d273"],
            tags: ["9e", "comparison", "pk"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_043",
            subsectionId: "9e",
            difficulty: .easy,
            question: "Which brand-generic pairing is fully correct for the two Parkinson’s dopamine agonists in subsection 9e?",
            options: ["Mirapex = pramipexole; Requip = ropinirole", "Mirapex = ropinirole; Requip = pramipexole", "Mirapex = primidone; Requip = lamotrigine", "Mirapex = memantine; Requip = donepezil", "Mirapex = topiramate; Requip = rizatriptan"],
            answer: "Mirapex = pramipexole; Requip = ropinirole",
            explanation: "Mirapex is pramipexole and Requip is ropinirole.",
            objective: .mixedReview,
            relatedDrugIds: ["d272", "d273"],
            tags: ["9e", "comparison", "brands"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_044",
            subsectionId: "9e",
            difficulty: .hard,
            question: "Which counseling point applies to both pramipexole and ropinirole and is especially important to mention early in therapy?",
            options: ["Report new gambling, compulsive shopping, binge eating, or hypersexual behavior", "Take the medication only when chest pain occurs", "Do not mix with acetaminophen because liver failure is guaranteed", "Orange-red urine is expected and harmless", "Always take with antacids because absorption otherwise fails completely"],
            answer: "Report new gambling, compulsive shopping, binge eating, or hypersexual behavior",
            explanation: "Both dopamine agonists can cause impulse control and compulsive behaviors, so this counseling point is high yield for both drugs.",
            objective: .mixedReview,
            relatedDrugIds: ["d272", "d273"],
            tags: ["9e", "comparison", "counseling"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9e_add_045",
            subsectionId: "9e",
            difficulty: .hard,
            question: "A patient is starting either pramipexole or ropinirole for Parkinson’s disease. Which counseling summary is best?",
            options: ["Rise slowly, avoid driving if unusual sleepiness occurs, report hallucinations or compulsive behaviors, and do not stop suddenly without guidance", "Take extra doses whenever tremor flares and stop suddenly if nausea occurs", "Use only as a rescue medicine during off episodes and ignore mild gambling urges", "Skip counseling because both drugs are free of cognitive or behavioral adverse effects", "These drugs mainly cause cough and angioedema, so watch only for airway swelling"],
            answer: "Rise slowly, avoid driving if unusual sleepiness occurs, report hallucinations or compulsive behaviors, and do not stop suddenly without guidance",
            explanation: "The big counseling themes for dopamine agonists are orthostasis, somnolence/sleep attacks, hallucinations, impulse control problems, and the need to taper carefully rather than stopping abruptly.",
            objective: .mixedReview,
            relatedDrugIds: ["d272", "d273"],
            tags: ["9e", "comparison", "dopamine-agonists"],
            source: .curated
        )

    ]
}