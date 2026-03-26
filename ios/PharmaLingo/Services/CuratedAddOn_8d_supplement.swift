import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_8d_supplement: [Question] = [

    .multipleChoice(
        id: "q8d_sup_001",
        subsectionId: "8d",
        difficulty: .hard,
        question: "An 82-year-old nursing home resident with IBS cramping is started on dicyclomine. Two days later, staff report she is agitated, confused, and picking at the air. Which diagnosis is most likely?",
        options: ["Anticholinergic delirium from dicyclomine", "Serotonin syndrome", "Opioid withdrawal", "Hepatic encephalopathy", "Tardive dyskinesia"],
        answer: "Anticholinergic delirium from dicyclomine",
        explanation: "Older adults are highly susceptible to anticholinergic CNS effects. Confusion, agitation, and visual hallucinations are classic anticholinergic toxicity findings.",
        objective: .adverseEffect,
        relatedDrugIds: ["d261"],
        tags: ["8d", "mini-case", "dicyclomine", "elderly", "delirium"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_sup_002",
        subsectionId: "8d",
        difficulty: .hard,
        question: "A 35-year-old man with IBS-related cramping and known narrow-angle glaucoma asks for an antispasmodic. Why is dicyclomine contraindicated?",
        options: ["Its anticholinergic effects can increase intraocular pressure and worsen glaucoma", "It directly damages the optic nerve", "It causes irreversible mydriasis in all patients", "It is only available as an eye drop", "It crosses the blood-retinal barrier and causes retinal detachment"],
        answer: "Its anticholinergic effects can increase intraocular pressure and worsen glaucoma",
        explanation: "Dicyclomine is contraindicated in glaucoma because anticholinergic mydriasis can precipitate acute angle-closure and raise intraocular pressure.",
        objective: .contraindication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "mini-case", "dicyclomine", "glaucoma"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_sup_003",
        subsectionId: "8d",
        difficulty: .hard,
        question: "A patient with IBS takes dicyclomine 20 mg QID but still has significant cramping after one week. What is the appropriate next step?",
        options: ["Increase to 40 mg QID if side effects allow", "Increase to 80 mg QID immediately", "Add a second anticholinergic for synergy", "Continue the same dose for 6 months", "Switch to IV dicyclomine"],
        answer: "Increase to 40 mg QID if side effects allow",
        explanation: "After one week at 20 mg QID, dicyclomine can be titrated to 40 mg QID. If efficacy is not achieved within 2 weeks or side effects require doses below 80 mg/day, the drug should be discontinued.",
        objective: .dosing,
        relatedDrugIds: ["d261"],
        tags: ["8d", "mini-case", "dicyclomine", "titration"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_sup_004",
        subsectionId: "8d",
        difficulty: .medium,
        question: "A patient taking dicyclomine for IBS is also prescribed metoclopramide for gastroparesis. Why is this combination problematic?",
        options: ["Dicyclomine slows GI motility while metoclopramide speeds it, so they oppose each other", "Both drugs cause identical serotonin syndrome", "Metoclopramide converts dicyclomine into a toxic metabolite", "Dicyclomine doubles metoclopramide absorption", "Both are mucosal protectants competing for the same receptor"],
        answer: "Dicyclomine slows GI motility while metoclopramide speeds it, so they oppose each other",
        explanation: "Dicyclomine is an anticholinergic that reduces GI motility, directly opposing the prokinetic effect of metoclopramide. This pharmacodynamic antagonism makes the combination counterproductive.",
        objective: .interaction,
        relatedDrugIds: ["d261", "d138"],
        tags: ["8d", "mini-case", "dicyclomine", "metoclopramide", "interaction"],
        source: .curated
    ),

    .trueFalse(
        id: "q8d_sup_005",
        subsectionId: "8d",
        difficulty: .easy,
        question: "Dicyclomine is safe to use in infants younger than 6 months for colic.",
        answer: false,
        explanation: "False. Dicyclomine is contraindicated in infants younger than 6 months due to the risk of serious adverse reactions.",
        objective: .contraindication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "true-false", "dicyclomine", "infants"],
        source: .curated
    ),

    .fillBlank(
        id: "q8d_sup_006",
        subsectionId: "8d",
        difficulty: .medium,
        question: "The initial adult oral dose of dicyclomine for IBS is ___ mg four times daily.",
        options: ["20", "10", "40", "80"],
        answer: "20",
        explanation: "Dicyclomine is started at 20 mg four times daily and may be increased to 40 mg four times daily after one week if tolerated.",
        objective: .dosing,
        relatedDrugIds: ["d261"],
        tags: ["8d", "fill-blank", "dicyclomine", "starting-dose"],
        source: .curated
    )

    ]
}
