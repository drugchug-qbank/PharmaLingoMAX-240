// PharmaLingo — Module 9b (Classic Antiepileptics)
// Curated Add-On Question Pack (45 questions)
// IDs: q9b_add_001 ... q9b_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 9b exists, then append:
//
//    if bank["9b"] == nil { bank["9b"] = [] }
//    bank["9b"]?.append(contentsOf: Self.curatedAddOnQuestions_9b)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of current generated templates.
// - relatedDrugIds use the uploaded repo IDs:
//   d96 (Carbamazepine / Tegretol), d97 (Phenytoin / Dilantin), d93 (Valproic acid / Depakote).
//
// Generated on: 2026-03-10

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_9b: [Question] = [
        .multipleChoice(
            id: "q9b_add_001",
            subsectionId: "9b",
            difficulty: .easy,
            question: "Tegretol is a classic antiepileptic that also shows up in trigeminal neuralgia and bipolar treatment. What is the generic name of Tegretol?",
            options: ["Carbamazepine", "Phenytoin", "Valproic acid", "Lamotrigine", "Oxcarbazepine"],
            answer: "Carbamazepine",
            explanation: "Tegretol is the brand name for carbamazepine, a classic sodium-channel antiepileptic with important interaction and rash pearls.",
            objective: .brandGeneric,
            relatedDrugIds: ["d96"],
            tags: ["9b", "carbamazepine", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_002",
            subsectionId: "9b",
            difficulty: .easy,
            question: "Carbamazepine is one of the older seizure medications that is also high yield for trigeminal neuralgia. Which brand name matches carbamazepine?",
            options: ["Tegretol", "Dilantin", "Depakote", "Keppra", "Lamictal"],
            answer: "Tegretol",
            explanation: "Carbamazepine corresponds to the brand Tegretol.",
            objective: .genericBrand,
            relatedDrugIds: ["d96"],
            tags: ["9b", "carbamazepine", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_003",
            subsectionId: "9b",
            difficulty: .medium,
            question: "A student remembers that carbamazepine helps stabilize overactive neurons in focal seizures. Which mechanism best matches carbamazepine?",
            options: ["Blocks voltage-gated sodium channels", "Enhances GABA by inhibiting GABA transaminase", "Blocks NMDA receptors", "Stimulates dopamine receptors", "Blocks serotonin 5-HT3 receptors"],
            answer: "Blocks voltage-gated sodium channels",
            explanation: "Carbamazepine is classically taught as a sodium-channel blocker that reduces repetitive neuronal firing.",
            objective: .moa,
            relatedDrugIds: ["d96"],
            tags: ["9b", "carbamazepine", "moa"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_004",
            subsectionId: "9b",
            difficulty: .easy,
            question: "A patient has electric-shock facial pain from trigeminal neuralgia and the team chooses an older seizure medicine that is famously useful for that condition. Which drug fits best?",
            options: ["Carbamazepine", "Phenytoin", "Valproic acid", "Donepezil", "Meclizine"],
            answer: "Carbamazepine",
            explanation: "Carbamazepine is a classic high-yield treatment for trigeminal neuralgia in addition to seizure disorders.",
            objective: .indication,
            relatedDrugIds: ["d96"],
            tags: ["9b", "carbamazepine", "trigeminal-neuralgia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_005",
            subsectionId: "9b",
            difficulty: .medium,
            question: "Classic antiepileptics are not all used the same way outside epilepsy. Which one also has a labeled role in acute manic or mixed episodes of bipolar I disorder?",
            options: ["Carbamazepine", "Phenytoin", "Primidone", "Levetiracetam", "Sumatriptan"],
            answer: "Carbamazepine",
            explanation: "Carbamazepine has high-yield use beyond seizures, including trigeminal neuralgia and acute manic or mixed bipolar episodes.",
            objective: .indication,
            relatedDrugIds: ["d96"],
            tags: ["9b", "carbamazepine", "bipolar"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_006",
            subsectionId: "9b",
            difficulty: .hard,
            question: "A patient has pure absence seizures, and the team wants to avoid the classic antiepileptic that is not appropriate for that seizure type. Which drug is the problem choice?",
            options: ["Carbamazepine", "Valproic acid", "Ethosuximide", "Lamotrigine", "Levetiracetam"],
            answer: "Carbamazepine",
            explanation: "Carbamazepine is not a good choice for absence seizures; valproate is the classic broad agent in this module that can cover absence seizures.",
            objective: .contraindication,
            relatedDrugIds: ["d96", "d93", "d97"],
            tags: ["9b", "carbamazepine", "absence-seizures"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_007",
            subsectionId: "9b",
            difficulty: .hard,
            question: "Before starting carbamazepine in a patient with ancestry from a genetically at-risk population, which screening pearl is most important because of the risk of life-threatening rash?",
            options: ["Test for HLA-B*1502 because of SJS/TEN risk", "Test for HLA-B*5701 because of DRESS risk", "Check TPMT because of pancreatitis risk", "Check G6PD because of hemolysis risk", "Test for JAK2 because of thrombosis risk"],
            answer: "Test for HLA-B*1502 because of SJS/TEN risk",
            explanation: "Carbamazepine is strongly linked to SJS/TEN risk in HLA-B*1502-positive patients from certain ancestries, so screening is a major board-style pearl.",
            objective: .contraindication,
            relatedDrugIds: ["d96"],
            tags: ["9b", "carbamazepine", "HLA-B1502", "SJS"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_008",
            subsectionId: "9b",
            difficulty: .hard,
            question: "A resident orders baseline CBC monitoring before carbamazepine rather than treating it like a completely benign neurologic drug. Which serious toxicity explains that choice?",
            options: ["Aplastic anemia and agranulocytosis", "Immune thrombocytopenia with every dose increase", "Dose-related rhabdomyolysis", "Red man syndrome", "Hyperammonemic encephalopathy"],
            answer: "Aplastic anemia and agranulocytosis",
            explanation: "Carbamazepine is classically associated with rare but serious hematologic toxicity, including aplastic anemia and agranulocytosis.",
            objective: .monitoring,
            relatedDrugIds: ["d96"],
            tags: ["9b", "carbamazepine", "CBC"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_009",
            subsectionId: "9b",
            difficulty: .hard,
            question: "An older adult taking a thiazide develops fatigue and confusion soon after carbamazepine is added. Which electrolyte problem is especially high yield with carbamazepine?",
            options: ["Hyponatremia from SIADH", "Hypercalcemia from bone resorption", "Hypernatremia from nephrogenic DI", "Hypophosphatemia from renal wasting", "Hypermagnesemia from reduced excretion"],
            answer: "Hyponatremia from SIADH",
            explanation: "Carbamazepine can cause dose-related hyponatremia, often through SIADH, and the risk is higher in older adults and patients on diuretics.",
            objective: .adverseEffect,
            relatedDrugIds: ["d96"],
            tags: ["9b", "carbamazepine", "SIADH", "hyponatremia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_010",
            subsectionId: "9b",
            difficulty: .hard,
            question: "A patient taking carbamazepine asks why breakthrough bleeding matters even though seizure control is good. What is the most important counseling point?",
            options: ["Carbamazepine can lower hormonal contraceptive effectiveness, so backup contraception may be needed", "Carbamazepine always causes amenorrhea through pituitary suppression", "Carbamazepine sharply increases estrogen levels, causing VTE risk", "Carbamazepine makes IUDs ineffective within 24 hours", "Carbamazepine is safe with all contraceptive products because it has no enzyme effects"],
            answer: "Carbamazepine can lower hormonal contraceptive effectiveness, so backup contraception may be needed",
            explanation: "Because carbamazepine is a strong enzyme inducer, it can reduce hormone concentrations and make hormonal contraceptives less effective.",
            objective: .interaction,
            relatedDrugIds: ["d96"],
            tags: ["9b", "carbamazepine", "oral-contraceptives"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_011",
            subsectionId: "9b",
            difficulty: .hard,
            question: "A clinician starts carbamazepine and tells the student that today’s dose may not behave the same way a month from now. Which pharmacokinetic pearl explains this?",
            options: ["Carbamazepine induces its own metabolism over several weeks", "Carbamazepine irreversibly binds albumin for life", "Carbamazepine is eliminated only by the kidneys", "Carbamazepine accumulates because it has no hepatic metabolism", "Carbamazepine blocks its own absorption after the first dose"],
            answer: "Carbamazepine induces its own metabolism over several weeks",
            explanation: "Carbamazepine undergoes autoinduction, so its metabolism speeds up after initiation and the effective half-life changes over the first few weeks.",
            objective: .pearl,
            relatedDrugIds: ["d96"],
            tags: ["9b", "carbamazepine", "autoinduction"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_012",
            subsectionId: "9b",
            difficulty: .medium,
            question: "Because carbamazepine is heavily processed by the liver and can cause hepatic injury, which baseline and follow-up lab category is especially reasonable to monitor?",
            options: ["Liver function tests", "Thyroid antibodies", "Serum amylase only", "Troponin levels", "Uric acid only"],
            answer: "Liver function tests",
            explanation: "Carbamazepine is hepatically metabolized and can be associated with liver abnormalities, so LFT awareness is high yield.",
            objective: .monitoring,
            relatedDrugIds: ["d96"],
            tags: ["9b", "carbamazepine", "LFTs"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_013",
            subsectionId: "9b",
            difficulty: .medium,
            question: "Soon after carbamazepine is started, a patient complains of diplopia, dizziness, and unsteady walking. Which interpretation fits best?",
            options: ["These are common dose-related CNS adverse effects of carbamazepine", "This pattern proves valproate-induced pancreatitis", "This is classic donepezil toxicity", "This confirms serotonin syndrome", "This is the expected sign of vitamin K deficiency"],
            answer: "These are common dose-related CNS adverse effects of carbamazepine",
            explanation: "Diplopia, dizziness, and ataxia are classic neurologic adverse effects seen with carbamazepine, especially early in therapy or after dose increases.",
            objective: .adverseEffect,
            relatedDrugIds: ["d96"],
            tags: ["9b", "carbamazepine", "CNS-effects"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_014",
            subsectionId: "9b",
            difficulty: .medium,
            question: "A patient feels better and wants to stop carbamazepine abruptly. What is the best high-yield response?",
            options: ["It should usually be tapered rather than stopped suddenly to avoid worsening seizures", "It can always be stopped immediately because it does not affect seizure threshold", "Abrupt stopping mainly causes constipation, not seizure problems", "The only concern is rebound hypertension", "Stopping suddenly is recommended after any rash"],
            answer: "It should usually be tapered rather than stopped suddenly to avoid worsening seizures",
            explanation: "As with other antiepileptic drugs, carbamazepine is generally withdrawn gradually to reduce the risk of increased seizure frequency.",
            objective: .pearl,
            relatedDrugIds: ["d96"],
            tags: ["9b", "carbamazepine", "taper"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_015",
            subsectionId: "9b",
            difficulty: .hard,
            question: "Among the three classic antiepileptics in this subsection, which one is most famous for creating a large interaction burden because it strongly induces hepatic enzymes and even its own metabolism?",
            options: ["Carbamazepine", "Phenytoin", "Valproic acid", "All three equally", "None of the three"],
            answer: "Carbamazepine",
            explanation: "Phenytoin is also an inducer, but carbamazepine is especially notorious for strong interaction burden plus autoinduction.",
            objective: .interaction,
            relatedDrugIds: ["d96", "d97", "d93"],
            tags: ["9b", "carbamazepine", "enzyme-inducer"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_016",
            subsectionId: "9b",
            difficulty: .easy,
            question: "Dilantin is a classic antiseizure drug whose toxicity often shows up as nystagmus and ataxia. What is the generic name of Dilantin?",
            options: ["Phenytoin", "Carbamazepine", "Valproic acid", "Lamotrigine", "Topiramate"],
            answer: "Phenytoin",
            explanation: "Dilantin is the brand name for phenytoin, a classic antiepileptic with narrow therapeutic index behavior.",
            objective: .brandGeneric,
            relatedDrugIds: ["d97"],
            tags: ["9b", "phenytoin", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_017",
            subsectionId: "9b",
            difficulty: .easy,
            question: "Phenytoin is an older antiepileptic that can also be given IV in certain emergency situations. Which brand name matches phenytoin?",
            options: ["Dilantin", "Tegretol", "Depakote", "Keppra", "Lamictal"],
            answer: "Dilantin",
            explanation: "Phenytoin corresponds to the brand Dilantin.",
            objective: .genericBrand,
            relatedDrugIds: ["d97"],
            tags: ["9b", "phenytoin", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_018",
            subsectionId: "9b",
            difficulty: .medium,
            question: "Phenytoin helps prevent seizure spread by stabilizing neuronal membranes. Which mechanism best explains that action?",
            options: ["Use-dependent blockade of voltage-gated sodium channels", "Irreversible inhibition of acetylcholinesterase", "Direct agonism at dopamine D2 receptors", "Neutralization of TNF-alpha", "Blockade of H+/K+-ATPase"],
            answer: "Use-dependent blockade of voltage-gated sodium channels",
            explanation: "Phenytoin is classically taught as a sodium-channel blocker that limits repetitive firing and seizure propagation.",
            objective: .moa,
            relatedDrugIds: ["d97"],
            tags: ["9b", "phenytoin", "moa"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_019",
            subsectionId: "9b",
            difficulty: .medium,
            question: "Which classic antiepileptic from this subsection is strongly associated with tonic-clonic seizure treatment and also has an IV role in status epilepticus management?",
            options: ["Phenytoin", "Valproic acid", "Carbamazepine", "Donepezil", "Rizatriptan"],
            answer: "Phenytoin",
            explanation: "Phenytoin is a classic medication for tonic-clonic seizures, and IV phenytoin has a traditional role in status epilepticus management.",
            objective: .indication,
            relatedDrugIds: ["d97"],
            tags: ["9b", "phenytoin", "indication"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_020",
            subsectionId: "9b",
            difficulty: .hard,
            question: "A learner keeps trying to use phenytoin for every seizure disorder. Which statement corrects that mistake?",
            options: ["Phenytoin is not effective for absence seizures", "Phenytoin is first-line for isolated absence seizures", "Phenytoin is the safest choice for migraine prevention in pregnancy", "Phenytoin is the best drug for trigeminal neuralgia", "Phenytoin is mainly an antipsychotic rather than an antiepileptic"],
            answer: "Phenytoin is not effective for absence seizures",
            explanation: "Phenytoin is not effective for absence seizures, which is an important distinction from broader agents like valproate.",
            objective: .contraindication,
            relatedDrugIds: ["d97", "d93"],
            tags: ["9b", "phenytoin", "absence-seizures"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_021",
            subsectionId: "9b",
            difficulty: .medium,
            question: "After a phenytoin dose increase, a patient develops horizontal nystagmus, slurred speech, and gait instability. What is the best interpretation?",
            options: ["The phenytoin concentration is likely too high", "This proves carbamazepine-induced SIADH", "This is classic valproate pancreatitis", "This is the expected sign of therapeutic success", "This confirms serotonin syndrome"],
            answer: "The phenytoin concentration is likely too high",
            explanation: "Nystagmus, dysarthria, and ataxia are classic concentration-related signs of phenytoin toxicity.",
            objective: .adverseEffect,
            relatedDrugIds: ["d97"],
            tags: ["9b", "phenytoin", "toxicity"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_022",
            subsectionId: "9b",
            difficulty: .medium,
            question: "A dental student is asked which seizure medication is most associated with gingival overgrowth and therefore deserves oral-hygiene counseling. Which drug is it?",
            options: ["Phenytoin", "Valproic acid", "Levetiracetam", "Carbamazepine", "Memantine"],
            answer: "Phenytoin",
            explanation: "Gingival hyperplasia is a classic phenytoin adverse effect and is one of the most recognizable board-style pearls for the drug.",
            objective: .adverseEffect,
            relatedDrugIds: ["d97"],
            tags: ["9b", "phenytoin", "gingival-hyperplasia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_023",
            subsectionId: "9b",
            difficulty: .hard,
            question: "Why can a seemingly small phenytoin dose increase suddenly push a patient into toxicity?",
            options: ["Phenytoin shows saturable, zero-order kinetics at higher concentrations", "Phenytoin has no protein binding at all", "Phenytoin is removed only by dialysis", "Phenytoin becomes inactive after food", "Phenytoin automatically induces its own metabolism like carbamazepine"],
            answer: "Phenytoin shows saturable, zero-order kinetics at higher concentrations",
            explanation: "Phenytoin is famous for nonlinear, zero-order kinetics, so small dose increases can cause disproportionate level increases.",
            objective: .pearl,
            relatedDrugIds: ["d97"],
            tags: ["9b", "phenytoin", "zero-order"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_024",
            subsectionId: "9b",
            difficulty: .hard,
            question: "A hospitalized patient on continuous tube feeds suddenly has unexpectedly low phenytoin levels. Which counseling pearl explains this problem?",
            options: ["Enteral feeding products can lower phenytoin absorption and levels", "Tube feeds sharply increase phenytoin protein binding", "Tube feeds convert phenytoin into valproate", "Tube feeds cause purple glove syndrome", "Tube feeds eliminate the need for serum monitoring"],
            answer: "Enteral feeding products can lower phenytoin absorption and levels",
            explanation: "Continuous enteral nutrition can reduce phenytoin absorption, so timing adjustments and serum-level monitoring are often needed.",
            objective: .interaction,
            relatedDrugIds: ["d97"],
            tags: ["9b", "phenytoin", "enteral-feeds"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_025",
            subsectionId: "9b",
            difficulty: .hard,
            question: "In a patient with very low albumin, why can a “normal” total phenytoin level be misleading?",
            options: ["The free active fraction may be higher than the total level suggests", "Phenytoin becomes inactive when albumin is low", "Low albumin prevents phenytoin absorption", "Albumin deficiency makes phenytoin water soluble and harmless", "Total levels always rise when albumin falls, so interpretation is easier"],
            answer: "The free active fraction may be higher than the total level suggests",
            explanation: "Because phenytoin is highly protein bound, low albumin can make the free active level more clinically meaningful than the total level.",
            objective: .monitoring,
            relatedDrugIds: ["d97"],
            tags: ["9b", "phenytoin", "free-levels", "albumin"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_026",
            subsectionId: "9b",
            difficulty: .medium,
            question: "A patient on long-term phenytoin develops low bone density. Which explanation is most high yield?",
            options: ["Phenytoin can accelerate vitamin D metabolism and contribute to osteopenia or osteomalacia", "Phenytoin directly dissolves bone calcium within hours", "Phenytoin causes adrenal insufficiency in all patients", "Phenytoin blocks thyroid hormone synthesis", "Phenytoin prevents all calcium absorption from food"],
            answer: "Phenytoin can accelerate vitamin D metabolism and contribute to osteopenia or osteomalacia",
            explanation: "Chronic phenytoin use is associated with reduced bone density and osteomalacia, in part through increased vitamin D metabolism.",
            objective: .adverseEffect,
            relatedDrugIds: ["d97"],
            tags: ["9b", "phenytoin", "bone-health"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_027",
            subsectionId: "9b",
            difficulty: .hard,
            question: "A patient receiving IV phenytoin develops painful swelling and purple discoloration distal to the infusion site. Which phenytoin-specific complication does this describe?",
            options: ["Purple glove syndrome", "Red man syndrome", "Stevens-Johnson syndrome", "Acute dystonia", "Cholinergic crisis"],
            answer: "Purple glove syndrome",
            explanation: "Purple glove syndrome is the classic infusion-site complication associated with IV phenytoin.",
            objective: .adverseEffect,
            relatedDrugIds: ["d97"],
            tags: ["9b", "phenytoin", "purple-glove"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_028",
            subsectionId: "9b",
            difficulty: .hard,
            question: "A pregnant patient with epilepsy asks why phenytoin is not an ideal “default” option. Which counseling point is most accurate?",
            options: ["Prenatal exposure can cause fetal harm and congenital malformations", "Phenytoin is completely contraindicated in all pregnancies with no exceptions", "Phenytoin always causes miscarriage within days", "Phenytoin is safer than every other antiepileptic in pregnancy", "Phenytoin only affects the fetus if given IV"],
            answer: "Prenatal exposure can cause fetal harm and congenital malformations",
            explanation: "Phenytoin may cause fetal harm, and prenatal exposure has been associated with congenital malformations and adverse developmental outcomes.",
            objective: .contraindication,
            relatedDrugIds: ["d97"],
            tags: ["9b", "phenytoin", "pregnancy"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_029",
            subsectionId: "9b",
            difficulty: .medium,
            question: "A patient takes phenytoin with frequent antacid use and now has lower-than-expected levels. Which explanation fits best?",
            options: ["Antacids can reduce phenytoin absorption", "Antacids permanently raise phenytoin levels", "Antacids convert phenytoin into an inactive prodrug", "Antacids prevent phenytoin protein binding and always cause toxicity", "Antacids are used to intentionally increase phenytoin bioavailability"],
            answer: "Antacids can reduce phenytoin absorption",
            explanation: "Antacids are a classic phenytoin interaction because they can decrease absorption and make serum levels harder to control.",
            objective: .interaction,
            relatedDrugIds: ["d97"],
            tags: ["9b", "phenytoin", "antacids"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_030",
            subsectionId: "9b",
            difficulty: .medium,
            question: "A patient has been seizure-free for months and wants to stop phenytoin overnight. Which teaching point is best?",
            options: ["Phenytoin should usually be withdrawn gradually to avoid increased seizure frequency or status epilepticus", "Phenytoin can be stopped abruptly because it has no withdrawal issues", "Phenytoin must be stopped suddenly whenever gum swelling occurs", "Abrupt stopping only causes nausea, not seizure worsening", "The only reason to taper phenytoin is to prevent hypertension"],
            answer: "Phenytoin should usually be withdrawn gradually to avoid increased seizure frequency or status epilepticus",
            explanation: "Phenytoin is generally tapered rather than stopped abruptly because sudden withdrawal can worsen seizure control.",
            objective: .pearl,
            relatedDrugIds: ["d97"],
            tags: ["9b", "phenytoin", "taper"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_031",
            subsectionId: "9b",
            difficulty: .easy,
            question: "Depakote is a high-yield neurologic drug that appears in seizures, bipolar disorder, and migraine prevention. What is the generic name used in your course outline?",
            options: ["Valproic acid", "Phenytoin", "Carbamazepine", "Topiramate", "Primidone"],
            answer: "Valproic acid",
            explanation: "Depakote corresponds to valproic acid/divalproex-style valproate therapy in high-yield pharmacology teaching.",
            objective: .brandGeneric,
            relatedDrugIds: ["d93"],
            tags: ["9b", "valproic-acid", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_032",
            subsectionId: "9b",
            difficulty: .easy,
            question: "Valproic acid is the broad-use classic antiepileptic in this subsection. Which brand name is most closely associated with valproic acid?",
            options: ["Depakote", "Dilantin", "Tegretol", "Lamictal", "Keppra"],
            answer: "Depakote",
            explanation: "Valproic acid is most commonly associated with the brand Depakote.",
            objective: .genericBrand,
            relatedDrugIds: ["d93"],
            tags: ["9b", "valproic-acid", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_033",
            subsectionId: "9b",
            difficulty: .medium,
            question: "A student wants to classify valproic acid correctly instead of confusing it with a pure sodium-channel drug. Which description fits best?",
            options: ["Broad-spectrum anticonvulsant and mood stabilizer", "Selective dopamine agonist", "Anticholinergic vestibular suppressant", "Acetylcholinesterase inhibitor", "Pure NK1 receptor blocker"],
            answer: "Broad-spectrum anticonvulsant and mood stabilizer",
            explanation: "Valproic acid is a broad-spectrum antiepileptic that also has major high-yield roles in bipolar disorder and migraine prevention.",
            objective: .classId,
            relatedDrugIds: ["d93"],
            tags: ["9b", "valproic-acid", "class"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_034",
            subsectionId: "9b",
            difficulty: .medium,
            question: "Which classic antiepileptic from this subsection stands out because it can treat absence seizures, unlike carbamazepine and phenytoin?",
            options: ["Valproic acid", "Carbamazepine", "Phenytoin", "Neither of them", "All three equally"],
            answer: "Valproic acid",
            explanation: "Valproic acid is the classic broad agent in this subsection that covers absence seizures in addition to other seizure types.",
            objective: .indication,
            relatedDrugIds: ["d93", "d96", "d97"],
            tags: ["9b", "valproic-acid", "absence-seizures"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_035",
            subsectionId: "9b",
            difficulty: .medium,
            question: "Which classic antiepileptic is especially memorable because it also appears in bipolar disorder and migraine prophylaxis?",
            options: ["Valproic acid", "Phenytoin", "Carbamazepine only", "Primidone", "Meclizine"],
            answer: "Valproic acid",
            explanation: "Valproic acid is high yield because it is used for seizures, bipolar disorder, and migraine prevention.",
            objective: .indication,
            relatedDrugIds: ["d93"],
            tags: ["9b", "valproic-acid", "migraine", "bipolar"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_036",
            subsectionId: "9b",
            difficulty: .medium,
            question: "Valproic acid is often remembered as a broad antiseizure drug rather than a clean one-pathway medication. Which mechanism is most classically associated with it?",
            options: ["Increases GABA availability in the CNS", "Stimulates central dopamine release only", "Blocks muscarinic receptors in the gut", "Irreversibly inhibits platelet COX-1", "Neutralizes gastric acid in the stomach"],
            answer: "Increases GABA availability in the CNS",
            explanation: "Valproic acid is classically taught as increasing GABA activity, which helps explain its broad antiseizure utility.",
            objective: .moa,
            relatedDrugIds: ["d93"],
            tags: ["9b", "valproic-acid", "moa"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_037",
            subsectionId: "9b",
            difficulty: .hard,
            question: "A patient starts valproic acid and is counseled that one boxed warning is especially important during the first several months of treatment. Which toxicity is that?",
            options: ["Serious hepatotoxicity", "Pulmonary fibrosis", "Ototoxicity", "Nephrogenic diabetes insipidus", "Aplastic anemia"],
            answer: "Serious hepatotoxicity",
            explanation: "Valproic acid carries a boxed warning for potentially fatal hepatotoxicity, with the greatest risk early in therapy.",
            objective: .contraindication,
            relatedDrugIds: ["d93"],
            tags: ["9b", "valproic-acid", "hepatotoxicity"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_038",
            subsectionId: "9b",
            difficulty: .hard,
            question: "A patient on valproic acid develops severe abdominal pain with nausea and vomiting. Which life-threatening adverse effect should be considered quickly?",
            options: ["Pancreatitis", "Purple glove syndrome", "SIADH", "Serotonin syndrome", "Tardive dyskinesia"],
            answer: "Pancreatitis",
            explanation: "Valproic acid carries a boxed warning for pancreatitis, and severe abdominal pain with GI symptoms should prompt urgent evaluation.",
            objective: .adverseEffect,
            relatedDrugIds: ["d93"],
            tags: ["9b", "valproic-acid", "pancreatitis"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_039",
            subsectionId: "9b",
            difficulty: .hard,
            question: "A person who could become pregnant asks which classic antiepileptic is most strongly linked to neural tube defects and other major fetal harm. Which drug is the main concern?",
            options: ["Valproic acid", "Phenytoin", "Carbamazepine", "Levetiracetam", "Lamotrigine"],
            answer: "Valproic acid",
            explanation: "Valproic acid is the classic high-yield antiepileptic associated with neural tube defects and major fetal harm.",
            objective: .contraindication,
            relatedDrugIds: ["d93"],
            tags: ["9b", "valproic-acid", "pregnancy"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_040",
            subsectionId: "9b",
            difficulty: .hard,
            question: "Which underlying disorder makes valproic acid a particularly dangerous choice because of the risk of hyperammonemic encephalopathy?",
            options: ["Urea cycle disorder", "Myasthenia gravis", "Angle-closure glaucoma", "Benign prostatic hyperplasia", "Peptic ulcer disease"],
            answer: "Urea cycle disorder",
            explanation: "Valproic acid is contraindicated in patients with known urea cycle disorders because severe hyperammonemia and encephalopathy can occur.",
            objective: .contraindication,
            relatedDrugIds: ["d93"],
            tags: ["9b", "valproic-acid", "UCD"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_041",
            subsectionId: "9b",
            difficulty: .hard,
            question: "A child with suspected mitochondrial disease due to a POLG-related disorder needs seizure treatment. Which classic antiepileptic should be avoided?",
            options: ["Valproic acid", "Phenytoin", "Carbamazepine", "Rizatriptan", "Donepezil"],
            answer: "Valproic acid",
            explanation: "Valproic acid is contraindicated in patients with known POLG-related mitochondrial disorders because of the risk of fatal hepatic failure.",
            objective: .contraindication,
            relatedDrugIds: ["d93"],
            tags: ["9b", "valproic-acid", "POLG"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_042",
            subsectionId: "9b",
            difficulty: .hard,
            question: "A patient taking valproic acid develops unexplained lethargy, vomiting, and mental status change despite liver tests that are not dramatically abnormal. Which lab should be considered next?",
            options: ["Ammonia level", "Troponin level", "Lipase only", "TSH", "INR only"],
            answer: "Ammonia level",
            explanation: "Valproic acid can cause hyperammonemia and hyperammonemic encephalopathy, even when liver tests are not markedly abnormal.",
            objective: .adverseEffect,
            relatedDrugIds: ["d93"],
            tags: ["9b", "valproic-acid", "hyperammonemia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_043",
            subsectionId: "9b",
            difficulty: .hard,
            question: "Which concomitant medication is especially high yield because it can increase the risk of valproate-associated hyperammonemia and encephalopathy?",
            options: ["Topiramate", "Donepezil", "Meclizine", "Sumatriptan", "Pramipexole"],
            answer: "Topiramate",
            explanation: "Combining valproate with topiramate is a classic interaction pearl because it can precipitate hyperammonemia with or without encephalopathy.",
            objective: .interaction,
            relatedDrugIds: ["d93"],
            tags: ["9b", "valproic-acid", "topiramate"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_044",
            subsectionId: "9b",
            difficulty: .medium,
            question: "Which monitoring plan best fits valproic acid when you are trying to catch two of its most important dose- and toxicity-related problems?",
            options: ["Check liver function tests and CBC/platelets", "Check ANC every week only", "Check sodium and troponin only", "Check DEXA and uric acid only", "Check digoxin level and INR only"],
            answer: "Check liver function tests and CBC/platelets",
            explanation: "Valproic acid is classically monitored with LFTs and CBC/platelets because of hepatotoxicity and thrombocytopenia risk.",
            objective: .monitoring,
            relatedDrugIds: ["d93"],
            tags: ["9b", "valproic-acid", "monitoring"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9b_add_045",
            subsectionId: "9b",
            difficulty: .medium,
            question: "A patient asks which classic antiepileptic is more likely to cause weight gain and tremor while also requiring respect for liver and platelet toxicity. Which drug best matches that profile?",
            options: ["Valproic acid", "Phenytoin", "Carbamazepine", "Lamotrigine", "Levetiracetam"],
            answer: "Valproic acid",
            explanation: "Weight gain and tremor are classic valproate adverse effects, and the drug also carries important hepatic and hematologic monitoring concerns.",
            objective: .adverseEffect,
            relatedDrugIds: ["d93"],
            tags: ["9b", "valproic-acid", "weight-gain", "tremor"],
            source: .curated
        ),

    ]
}