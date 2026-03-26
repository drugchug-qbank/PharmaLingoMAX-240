// PharmaLingo — Module 2f (Anti-Arrhythmics)
// Curated Add-On Question Pack (45 questions)
// IDs: q2f_add_001 ... q2f_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 2f exists, then append:
//
//    if bank["2f"] == nil { bank["2f"] = [] }
//    bank["2f"]?.append(contentsOf: Self.curatedAddOnQuestions_2f)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are designed to teach while avoiding exact duplicates of simple generator templates.
// - relatedDrugIds use the uploaded repo IDs: d68 (Amiodarone), d69 (Dronedarone), d70 (Sotalol), d71 (Flecainide), d72 (Digoxin), d73 (Adenosine).

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_2f: [Question] = [

.multipleChoice(
    id: "q2f_add_001",
    subsectionId: "2f",
    difficulty: .easy,
    question: "Adenocard is the medication given as a rapid IV push for certain regular narrow-complex tachycardias because it briefly slows AV nodal conduction. What is the generic name of Adenocard?",
    options: ["Adenosine", "Amiodarone", "Digoxin", "Dronedarone", "Sotalol"],
    answer: "Adenosine",
    explanation: "Adenocard is the brand name for adenosine. Linking the brand to its rapid IV push use and AV nodal effect helps distinguish it from longer-acting antiarrhythmics.",
    objective: .brandGeneric,
    relatedDrugIds: ["d73"],
    tags: ["Adenocard", "adenosine", "brand->generic"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_002",
    subsectionId: "2f",
    difficulty: .easy,
    question: "Adenosine is an ultra-short-acting antiarrhythmic used for acute conversion of certain SVTs in monitored settings. Which brand name matches adenosine?",
    options: ["Adenocard", "Cordarone/Pacerone", "Lanoxin", "Multaq", "Betapace"],
    answer: "Adenocard",
    explanation: "Adenocard is the brand name for adenosine. It is the classic emergency-department drug for acute SVT conversion because its effect is almost immediate and very brief.",
    objective: .genericBrand,
    relatedDrugIds: ["d73"],
    tags: ["Adenocard", "adenosine", "generic->brand"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_003",
    subsectionId: "2f",
    difficulty: .medium,
    question: "A patient suddenly develops a regular supraventricular tachycardia, and the team wants a medication that can acutely interrupt AV nodal conduction and terminate the rhythm within seconds. Which indication best matches adenosine?",
    options: ["Acute conversion of SVT", "Long-term prevention of AFib", "Rate control in chronic HFrEF", "Chronic suppression of ventricular ectopy", "DVT treatment"],
    answer: "Acute conversion of SVT",
    explanation: "Adenosine is used for acute conversion of SVT. It is not a chronic maintenance drug like some other antiarrhythmics and is not used for anticoagulation or heart-failure maintenance.",
    objective: .indication,
    relatedDrugIds: ["d73"],
    tags: ["adenosine", "SVT", "indication"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_004",
    subsectionId: "2f",
    difficulty: .hard,
    question: "The reason adenosine can terminate many re-entrant supraventricular tachycardias is that it causes a very brief conduction pause at a specific cardiac site. Which site is most directly affected?",
    options: ["AV node", "SA node", "Purkinje fibers", "Bundle branches", "Ventricular myocardium"],
    answer: "AV node",
    explanation: "Adenosine briefly blocks conduction through the AV node, which is why it can terminate many AV-node-dependent SVTs. This AV nodal effect is the high-yield mechanistic pearl to remember.",
    objective: .moa,
    relatedDrugIds: ["d73"],
    tags: ["adenosine", "AV node", "MOA"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_005",
    subsectionId: "2f",
    difficulty: .medium,
    question: "A nurse prepares adenosine for a patient with SVT and is told to push it rapidly followed by a saline flush. Which property of adenosine makes that administration pearl essential?",
    options: ["Its half-life is less than 10 seconds", "It causes delayed hepatic activation", "It requires slow titration over hours", "It binds irreversibly for days", "It is only absorbed with food"],
    answer: "Its half-life is less than 10 seconds",
    explanation: "Adenosine has an ultra-short half-life of under 10 seconds, so it must be given as a rapid IV push with a flush. That very short duration is one of the defining features of the drug.",
    objective: .pearl,
    relatedDrugIds: ["d73"],
    tags: ["adenosine", "half-life", "rapid IV push"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_006",
    subsectionId: "2f",
    difficulty: .easy,
    question: "A patient who receives adenosine for SVT briefly feels flushing, chest tightness, and a moment of \"something is very wrong\" before the rhythm converts. Which answer best describes this expected high-yield adverse-effect pattern?",
    options: ["Transient effects that can include flushing, chest pressure, and brief asystole", "Delayed pulmonary fibrosis several months later", "Permanent AV block in most patients", "Severe hypoglycemia from insulin release", "Blue-gray skin discoloration"],
    answer: "Transient effects that can include flushing, chest pressure, and brief asystole",
    explanation: "Adenosine commonly causes very short-lived flushing, chest discomfort, dyspnea, or transient asystole because its effects occur abruptly and then wear off quickly. This is expected and very different from chronic toxicity patterns seen with amiodarone.",
    objective: .adverseEffect,
    relatedDrugIds: ["d73"],
    tags: ["adenosine", "flushing", "adverse effect"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_007",
    subsectionId: "2f",
    difficulty: .hard,
    question: "A patient drank several large coffees before arriving with SVT. Which counseling pearl explains why adenosine may be less effective than expected in this situation?",
    options: ["Caffeine can antagonize adenosine’s effect", "Coffee blocks digoxin clearance", "Caffeine causes rapid nitrate tolerance", "Coffee converts adenosine into amiodarone", "Caffeine reverses warfarin anticoagulation"],
    answer: "Caffeine can antagonize adenosine’s effect",
    explanation: "Methylxanthines such as caffeine can antagonize the effect of adenosine. This is a classic testable interaction pearl because adenosine works through adenosine receptors and caffeine interferes with that signaling.",
    objective: .interaction,
    relatedDrugIds: ["d73"],
    tags: ["adenosine", "caffeine", "interaction"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_008",
    subsectionId: "2f",
    difficulty: .easy,
    question: "Cordarone or Pacerone is the broad-coverage antiarrhythmic often remembered as highly effective but also highly toxic. What is the generic name of Cordarone/Pacerone?",
    options: ["Amiodarone", "Dronedarone", "Sotalol", "Flecainide", "Digoxin"],
    answer: "Amiodarone",
    explanation: "Cordarone/Pacerone is amiodarone. Pairing the brand with its reputation for effectiveness and toxicity helps students remember one of the highest-yield drugs in the subsection.",
    objective: .brandGeneric,
    relatedDrugIds: ["d68"],
    tags: ["Cordarone/Pacerone", "amiodarone", "brand->generic"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_009",
    subsectionId: "2f",
    difficulty: .easy,
    question: "Amiodarone is a class III antiarrhythmic used across atrial and ventricular arrhythmias, including ACLS settings. Which brand name matches amiodarone?",
    options: ["Cordarone/Pacerone", "Multaq", "Betapace", "Tambocor", "Lanoxin"],
    answer: "Cordarone/Pacerone",
    explanation: "Cordarone/Pacerone is the brand name for amiodarone. This brand-generic pairing is worth memorizing because amiodarone is commonly discussed in both inpatient and outpatient rhythm management.",
    objective: .genericBrand,
    relatedDrugIds: ["d68"],
    tags: ["Cordarone/Pacerone", "amiodarone", "generic->brand"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_010",
    subsectionId: "2f",
    difficulty: .medium,
    question: "Amiodarone is often grouped with potassium-channel blockers because it prolongs repolarization, even though it has properties from several Vaughan-Williams classes. Which class is the classic high-yield label for amiodarone?",
    options: ["Class III antiarrhythmic", "Class I antiarrhythmic", "Class II antiarrhythmic", "Class IV antiarrhythmic", "Cardiac glycoside"],
    answer: "Class III antiarrhythmic",
    explanation: "Amiodarone is classically labeled a Class III antiarrhythmic. Remembering its formal class helps anchor the broader concept that it prolongs repolarization and can be used in multiple arrhythmia settings.",
    objective: .classId,
    relatedDrugIds: ["d68"],
    tags: ["amiodarone", "class III", "class ID"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_011",
    subsectionId: "2f",
    difficulty: .medium,
    question: "A single antiarrhythmic is being discussed for atrial fibrillation, ventricular tachycardia, ventricular fibrillation, and even ACLS scenarios. Which drug best fits that unusually broad high-yield indication profile?",
    options: ["Amiodarone", "Adenosine", "Digoxin", "Flecainide", "Dronedarone"],
    answer: "Amiodarone",
    explanation: "Amiodarone has unusually broad antiarrhythmic use, including AFib and serious ventricular arrhythmias. That wide indication range is one reason it is often described as very effective despite major toxicity concerns.",
    objective: .indication,
    relatedDrugIds: ["d68"],
    tags: ["amiodarone", "AFib", "VT/VF"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_012",
    subsectionId: "2f",
    difficulty: .hard,
    question: "When students learn why amiodarone lengthens cardiac action potentials, the highest-yield mechanistic theme is that it prolongs repolarization. Which ion-channel effect best matches that concept?",
    options: ["Potassium-channel blockade that prolongs repolarization", "Sodium-channel activation that shortens repolarization", "Calcium-channel activation that speeds AV conduction", "Direct thrombin inhibition", "Cyclooxygenase inhibition"],
    answer: "Potassium-channel blockade that prolongs repolarization",
    explanation: "The classic class III mechanism is potassium-channel blockade with prolongation of repolarization. Amiodarone has additional properties, but this is the core board-style mechanism to remember.",
    objective: .moa,
    relatedDrugIds: ["d68"],
    tags: ["amiodarone", "repolarization", "MOA"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_013",
    subsectionId: "2f",
    difficulty: .medium,
    question: "A patient taking amiodarone develops progressive shortness of breath and new interstitial changes on imaging. Which serious high-yield toxicity should immediately come to mind?",
    options: ["Pulmonary toxicity", "Ototoxicity", "Gingival hyperplasia", "Stevens-Johnson syndrome", "Achilles tendon rupture"],
    answer: "Pulmonary toxicity",
    explanation: "Pulmonary toxicity is one of the most important serious adverse effects of amiodarone. It is a classic reason the drug is remembered as powerful but dangerous.",
    objective: .adverseEffect,
    relatedDrugIds: ["d68"],
    tags: ["amiodarone", "pulmonary toxicity", "adverse effect"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_014",
    subsectionId: "2f",
    difficulty: .medium,
    question: "Because amiodarone contains iodine and affects thyroid physiology, a patient may become either hypothyroid or hyperthyroid while taking it. Which adverse-effect category is being tested here?",
    options: ["Thyroid dysfunction", "Nephrogenic diabetes insipidus", "Permanent hearing loss", "Hypoglycemia unawareness", "Drug-induced lupus"],
    answer: "Thyroid dysfunction",
    explanation: "Amiodarone can cause thyroid dysfunction in either direction. This is one of the signature toxicities that makes thyroid monitoring essential during therapy.",
    objective: .adverseEffect,
    relatedDrugIds: ["d68"],
    tags: ["amiodarone", "thyroid", "adverse effect"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_015",
    subsectionId: "2f",
    difficulty: .hard,
    question: "A resident says, “This antiarrhythmic is effective, but I need to remember the organs we monitor because it can injure several systems.” Which monitoring bundle best fits amiodarone?",
    options: ["Thyroid, liver, lung, and eye monitoring", "INR and vitamin K intake only", "Serum uric acid and hearing tests only", "Lipase and amylase only", "Bone density and urinalysis only"],
    answer: "Thyroid, liver, lung, and eye monitoring",
    explanation: "Amiodarone monitoring classically includes TFTs, LFTs, pulmonary assessment, and eye exams. This wide monitoring burden reflects the drug’s multi-organ toxicity profile.",
    objective: .monitoring,
    relatedDrugIds: ["d68"],
    tags: ["amiodarone", "monitoring", "TFT LFT PFT"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_016",
    subsectionId: "2f",
    difficulty: .medium,
    question: "A patient stops amiodarone, but the team explains that drug effects and interactions can linger because the medication remains in the body for a very long time. Which pharmacokinetic pearl best explains that warning?",
    options: ["Amiodarone has a very long half-life, roughly 40 to 55 days", "Amiodarone is cleared completely in under 10 seconds", "Amiodarone is inactivated by a single first-pass dose", "Amiodarone is only active during IV infusion", "Amiodarone works only after weekly dosing"],
    answer: "Amiodarone has a very long half-life, roughly 40 to 55 days",
    explanation: "Amiodarone has an extremely long half-life, often cited around 40 to 55 days. That helps explain why adverse effects and drug interactions may persist even after stopping the medication.",
    objective: .pearl,
    relatedDrugIds: ["d68"],
    tags: ["amiodarone", "half-life", "pearl"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_017",
    subsectionId: "2f",
    difficulty: .hard,
    question: "A patient stabilized on warfarin is started on amiodarone for rhythm control. Which interaction is most important to anticipate?",
    options: ["Warfarin effect can increase, raising INR and bleeding risk", "Warfarin is completely neutralized within hours", "Amiodarone causes warfarin malabsorption with thrombosis", "The combination always prevents all arrhythmias", "Amiodarone reverses vitamin K deficiency instantly"],
    answer: "Warfarin effect can increase, raising INR and bleeding risk",
    explanation: "Amiodarone can increase warfarin effect, so INR often rises and bleeding risk can increase. This is a classic interaction pearl that frequently appears in clinical teaching.",
    objective: .interaction,
    relatedDrugIds: ["d68"],
    tags: ["amiodarone", "warfarin", "interaction"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_018",
    subsectionId: "2f",
    difficulty: .easy,
    question: "Multaq is a rhythm medication structurally related to amiodarone but remembered for fewer thyroid and pulmonary problems. What is the generic name of Multaq?",
    options: ["Dronedarone", "Amiodarone", "Sotalol", "Flecainide", "Digoxin"],
    answer: "Dronedarone",
    explanation: "Multaq is the brand name for dronedarone. Remembering it as the amiodarone-related drug with fewer organ toxicities helps separate it from its more toxic relative.",
    objective: .brandGeneric,
    relatedDrugIds: ["d69"],
    tags: ["Multaq", "dronedarone", "brand->generic"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_019",
    subsectionId: "2f",
    difficulty: .easy,
    question: "Dronedarone is used in selected patients with atrial fibrillation but is not the same as amiodarone despite their structural similarity. Which brand name matches dronedarone?",
    options: ["Multaq", "Cordarone/Pacerone", "Betapace", "Tambocor", "Lanoxin"],
    answer: "Multaq",
    explanation: "Multaq is the brand name for dronedarone. It is worth memorizing separately from amiodarone because the two drugs have important safety differences.",
    objective: .genericBrand,
    relatedDrugIds: ["d69"],
    tags: ["Multaq", "dronedarone", "generic->brand"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_020",
    subsectionId: "2f",
    difficulty: .medium,
    question: "A student is trying to remember why dronedarone is often described as an “amiodarone cousin.” Which statement best captures the high-yield comparison?",
    options: ["It is structurally similar to amiodarone but generally has fewer thyroid and pulmonary toxicities", "It is actually the IV brand of amiodarone", "It is the antidote for amiodarone overdose", "It works only as an anticoagulant", "It is primarily a loop diuretic with rhythm effects"],
    answer: "It is structurally similar to amiodarone but generally has fewer thyroid and pulmonary toxicities",
    explanation: "Dronedarone is commonly taught as structurally similar to amiodarone but with fewer thyroid and pulmonary adverse effects. That comparison is one of the easiest ways to remember the drug.",
    objective: .pearl,
    relatedDrugIds: ["d69"],
    tags: ["dronedarone", "amiodarone", "fewer toxicities"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_021",
    subsectionId: "2f",
    difficulty: .hard,
    question: "Which patient description should make you avoid dronedarone because it is a classic contraindication scenario?",
    options: ["A patient with permanent AFib or advanced symptomatic heart failure", "A patient with occasional premature atrial contractions and normal cardiac structure", "A patient with stable hypertension on one medication", "A patient with migraine without aura", "A patient with seasonal allergic rhinitis"],
    answer: "A patient with permanent AFib or advanced symptomatic heart failure",
    explanation: "Dronedarone is contraindicated in permanent AFib and in severe symptomatic heart failure such as NYHA class IV. That safety warning is one of the most important facts to remember about the drug.",
    objective: .contraindication,
    relatedDrugIds: ["d69"],
    tags: ["dronedarone", "permanent AFib", "heart failure"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_022",
    subsectionId: "2f",
    difficulty: .medium,
    question: "A patient started on dronedarone returns with a slower pulse and bothersome stomach upset. Which adverse-effect pair is especially associated with dronedarone in high-yield teaching?",
    options: ["Bradycardia and GI upset", "Dry cough and angioedema", "Blue-gray skin and corneal deposits", "Yellow-green visual halos and vomiting only after overdose", "Severe hyperkalemia and gynecomastia"],
    answer: "Bradycardia and GI upset",
    explanation: "Bradycardia and gastrointestinal upset are high-yield adverse effects of dronedarone. These are much more typical for the drug than multi-organ toxicity patterns like amiodarone’s pulmonary or thyroid issues.",
    objective: .adverseEffect,
    relatedDrugIds: ["d69"],
    tags: ["dronedarone", "bradycardia", "GI upset"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_023",
    subsectionId: "2f",
    difficulty: .medium,
    question: "Although it is often discussed by comparing it with amiodarone, dronedarone still belongs to the same classic Vaughan-Williams grouping. Which class best describes dronedarone?",
    options: ["Class III antiarrhythmic", "Class I antiarrhythmic", "Class II antiarrhythmic", "Class IV antiarrhythmic", "Endogenous nucleoside"],
    answer: "Class III antiarrhythmic",
    explanation: "Dronedarone is classically grouped as a Class III antiarrhythmic. Knowing that label helps organize it alongside amiodarone and sotalol in rhythm-pharmacology review.",
    objective: .classId,
    relatedDrugIds: ["d69"],
    tags: ["dronedarone", "class III", "class ID"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_024",
    subsectionId: "2f",
    difficulty: .easy,
    question: "Betapace is the antiarrhythmic with a beta-blocker suffix that also prolongs repolarization and can trigger torsades if not monitored carefully. What is the generic name of Betapace?",
    options: ["Sotalol", "Propranolol", "Metoprolol", "Dronedarone", "Flecainide"],
    answer: "Sotalol",
    explanation: "Betapace is the brand name for sotalol. The drug is especially memorable because it behaves as both a beta blocker and a class III antiarrhythmic.",
    objective: .brandGeneric,
    relatedDrugIds: ["d70"],
    tags: ["Betapace", "sotalol", "brand->generic"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_025",
    subsectionId: "2f",
    difficulty: .easy,
    question: "Sotalol is used in selected atrial and ventricular arrhythmias, but it stands out because it is both a beta blocker and a class III antiarrhythmic. Which brand name matches sotalol?",
    options: ["Betapace", "Multaq", "Tambocor", "Lanoxin", "Adenocard"],
    answer: "Betapace",
    explanation: "Betapace is the brand name for sotalol. This brand-generic pair is useful to tie to the drug’s unique double identity as a beta blocker and antiarrhythmic.",
    objective: .genericBrand,
    relatedDrugIds: ["d70"],
    tags: ["Betapace", "sotalol", "generic->brand"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_026",
    subsectionId: "2f",
    difficulty: .medium,
    question: "A drug that ends in -olol is being reviewed, but unlike a routine beta blocker it is also grouped as a class III antiarrhythmic because it prolongs repolarization. Which description fits sotalol?",
    options: ["Class III antiarrhythmic plus beta blocker", "Pure class IV calcium-channel blocker", "Cardiac glycoside only", "Endogenous nucleoside only", "Direct factor Xa inhibitor"],
    answer: "Class III antiarrhythmic plus beta blocker",
    explanation: "Sotalol is unique because it is both a beta blocker and a Class III antiarrhythmic. That dual identity explains why it can cause both bradycardia and QT-related problems.",
    objective: .classId,
    relatedDrugIds: ["d70"],
    tags: ["sotalol", "class III", "beta blocker"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_027",
    subsectionId: "2f",
    difficulty: .medium,
    question: "A patient starting sotalol needs close ECG monitoring because one of its most feared complications comes from QT prolongation. Which arrhythmia is the classic high-yield risk?",
    options: ["Torsades de pointes", "Adenosine-sensitive AVNRT", "Sinus tachycardia", "Wolff-Parkinson-White syndrome", "Atrial flutter from digoxin withdrawal"],
    answer: "Torsades de pointes",
    explanation: "Sotalol can prolong the QT interval and precipitate torsades de pointes. This is one of the defining safety issues that makes the drug high risk early in therapy.",
    objective: .adverseEffect,
    relatedDrugIds: ["d70"],
    tags: ["sotalol", "torsades", "QT prolongation"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_028",
    subsectionId: "2f",
    difficulty: .medium,
    question: "Why is sotalol commonly initiated in the hospital rather than casually started at home in many patients?",
    options: ["Because ECG monitoring is needed early due to QT and torsades risk", "Because it must always be given as a rapid IV push", "Because it causes immediate pulmonary fibrosis", "Because it only works after transdermal absorption", "Because its antidote must be stocked at the bedside"],
    answer: "Because ECG monitoring is needed early due to QT and torsades risk",
    explanation: "Sotalol is often initiated in the hospital so the QT interval and rhythm can be monitored. This is a classic pearl tied directly to its torsades risk.",
    objective: .pearl,
    relatedDrugIds: ["d70"],
    tags: ["sotalol", "hospital initiation", "pearl"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_029",
    subsectionId: "2f",
    difficulty: .hard,
    question: "A clinician is reviewing the safest way to follow a patient on sotalol. Which monitoring pair is most high yield?",
    options: ["ECG/QTc and renal function", "INR and dietary vitamin K", "Lipid panel and CK only", "Pulmonary function tests and fundoscopy only", "A1c and uric acid"],
    answer: "ECG/QTc and renal function",
    explanation: "Sotalol monitoring focuses heavily on ECG/QTc because of torsades risk and on renal function because the drug is renally cleared. Those two checks are much more relevant than INR or lipid monitoring.",
    objective: .monitoring,
    relatedDrugIds: ["d70"],
    tags: ["sotalol", "renal function", "QTc"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_030",
    subsectionId: "2f",
    difficulty: .medium,
    question: "Because sotalol also acts as a beta blocker, which patient history should raise extra concern before prescribing it?",
    options: ["Reactive airway disease with bronchospasm risk", "Hyperthyroidism requiring PTU", "Severe constipation from opioids", "History of gout alone", "Seasonal pollen allergy"],
    answer: "Reactive airway disease with bronchospasm risk",
    explanation: "Sotalol has beta-blocking activity, so bronchospasm risk matters, especially in reactive airway disease. This is a useful way to remember that sotalol is not just a “pure” class III drug.",
    objective: .contraindication,
    relatedDrugIds: ["d70"],
    tags: ["sotalol", "asthma", "contraindication"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_031",
    subsectionId: "2f",
    difficulty: .medium,
    question: "Which arrhythmia-use pair best matches sotalol as listed in your subsection notes?",
    options: ["Atrial fibrillation and ventricular tachycardia", "Acute SVT conversion only", "HFrEF symptom relief only", "Angina rescue only", "STEMI anticoagulation only"],
    answer: "Atrial fibrillation and ventricular tachycardia",
    explanation: "Sotalol is used for atrial fibrillation and ventricular tachycardia. It is not the rescue drug for acute SVT and it is not used as an anticoagulant or nitrate.",
    objective: .indication,
    relatedDrugIds: ["d70"],
    tags: ["sotalol", "AFib", "VTach"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_032",
    subsectionId: "2f",
    difficulty: .easy,
    question: "Tambocor is an antiarrhythmic used for selected supraventricular rhythm problems but avoided in patients with structural heart disease because of proarrhythmic risk. What is the generic name of Tambocor?",
    options: ["Flecainide", "Dronedarone", "Amiodarone", "Sotalol", "Digoxin"],
    answer: "Flecainide",
    explanation: "Tambocor is the brand name for flecainide. Tying the brand to the “avoid in structural heart disease” warning helps make the drug easier to remember.",
    objective: .brandGeneric,
    relatedDrugIds: ["d71"],
    tags: ["Tambocor", "flecainide", "brand->generic"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_033",
    subsectionId: "2f",
    difficulty: .easy,
    question: "Flecainide is a potent sodium-channel antiarrhythmic reserved for selected patients without major structural heart disease. Which brand name matches flecainide?",
    options: ["Tambocor", "Betapace", "Multaq", "Lanoxin", "Adenocard"],
    answer: "Tambocor",
    explanation: "Tambocor is the brand name for flecainide. It is useful to pair that brand with the drug’s limited use in carefully selected patients.",
    objective: .genericBrand,
    relatedDrugIds: ["d71"],
    tags: ["Tambocor", "flecainide", "generic->brand"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_034",
    subsectionId: "2f",
    difficulty: .medium,
    question: "Flecainide is a strong sodium-channel blocker with major conduction-slowing effects and is grouped with the “C” subgroup of class I antiarrhythmics. Which class best describes flecainide?",
    options: ["Class IC antiarrhythmic", "Class IA antiarrhythmic", "Class II antiarrhythmic", "Class III antiarrhythmic", "Class IV antiarrhythmic"],
    answer: "Class IC antiarrhythmic",
    explanation: "Flecainide is a Class IC antiarrhythmic. That classification helps explain its strong conduction-slowing effect and why proarrhythmia is such an important concern.",
    objective: .classId,
    relatedDrugIds: ["d71"],
    tags: ["flecainide", "class IC", "class ID"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_035",
    subsectionId: "2f",
    difficulty: .medium,
    question: "A cardiologist is considering an antiarrhythmic for a patient with atrial fibrillation or SVT who does not have structural heart disease. Which drug from this subsection best fits that use pattern?",
    options: ["Flecainide", "Adenosine", "Digoxin", "Amiodarone", "Warfarin"],
    answer: "Flecainide",
    explanation: "Flecainide is used for selected patients with AFib or SVT, especially when structural heart disease is absent. The structural-heart warning is part of what makes the drug high yield.",
    objective: .indication,
    relatedDrugIds: ["d71"],
    tags: ["flecainide", "AFib", "SVT"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_036",
    subsectionId: "2f",
    difficulty: .hard,
    question: "Which patient is the poorest candidate for flecainide because it can be proarrhythmic in this setting?",
    options: ["A patient with prior MI and structural heart disease", "A patient with episodic SVT and an otherwise normal heart", "A patient with stable allergic rhinitis", "A patient with uncomplicated GERD", "A patient with isolated white-coat hypertension"],
    answer: "A patient with prior MI and structural heart disease",
    explanation: "Flecainide should be avoided in structural heart disease or coronary artery disease because of proarrhythmic risk. This is one of the most important contraindication pearls for the drug.",
    objective: .contraindication,
    relatedDrugIds: ["d71"],
    tags: ["flecainide", "structural heart disease", "CAD"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_037",
    subsectionId: "2f",
    difficulty: .hard,
    question: "If a patient on flecainide develops excessive conduction slowing, which ECG change would be the most high-yield clue that the sodium-channel blockade is becoming too pronounced?",
    options: ["QRS widening", "Shortened QT from nitrate use", "Loss of P waves from aspirin", "Peaked T waves from ACE-inhibitor cough", "ST elevation from statin myalgia"],
    answer: "QRS widening",
    explanation: "Because flecainide strongly slows conduction, QRS widening is a high-yield ECG clue that the effect may be excessive. This fits with its class IC sodium-channel-blocking mechanism.",
    objective: .monitoring,
    relatedDrugIds: ["d71"],
    tags: ["flecainide", "QRS", "monitoring"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_038",
    subsectionId: "2f",
    difficulty: .easy,
    question: "Lanoxin is the cardiac glycoside still used in selected patients for HFrEF symptoms or atrial fibrillation rate control, but it has a famously narrow therapeutic window. What is the generic name of Lanoxin?",
    options: ["Digoxin", "Diltiazem", "Dronedarone", "Dabigatran", "Dobutamine"],
    answer: "Digoxin",
    explanation: "Lanoxin is the brand name for digoxin. Pairing the brand with its narrow therapeutic index makes the drug easier to distinguish from other rhythm agents.",
    objective: .brandGeneric,
    relatedDrugIds: ["d72"],
    tags: ["Lanoxin", "digoxin", "brand->generic"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_039",
    subsectionId: "2f",
    difficulty: .easy,
    question: "Digoxin is a cardiac glycoside that can slow AV nodal conduction and also increase inotropy, but toxicity is always a concern. Which brand name matches digoxin?",
    options: ["Lanoxin", "Adenocard", "Betapace", "Tambocor", "Multaq"],
    answer: "Lanoxin",
    explanation: "Lanoxin is the brand name for digoxin. This pair is worth knowing because digoxin remains a classic board-style medication with several distinctive toxicity clues.",
    objective: .genericBrand,
    relatedDrugIds: ["d72"],
    tags: ["Lanoxin", "digoxin", "generic->brand"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_040",
    subsectionId: "2f",
    difficulty: .medium,
    question: "Which indication pair best matches digoxin in a high-yield review of cardiovascular pharmacology?",
    options: ["HFrEF symptom support and AFib rate control", "Acute SVT conversion and STEMI anticoagulation", "Chronic angina prophylaxis and LDL lowering", "Pulmonary fibrosis treatment and thyroid replacement", "DVT treatment and platelet inhibition"],
    answer: "HFrEF symptom support and AFib rate control",
    explanation: "Digoxin is used in selected patients for HFrEF symptom support and for rate control in atrial fibrillation. It is not used for acute SVT conversion, anticoagulation, or lipid lowering.",
    objective: .indication,
    relatedDrugIds: ["d72"],
    tags: ["digoxin", "HFrEF", "AFib"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_041",
    subsectionId: "2f",
    difficulty: .hard,
    question: "The inotropic effect of digoxin begins with inhibition of a membrane pump, which secondarily increases intracellular calcium in cardiac cells. Which pump is directly inhibited by digoxin?",
    options: ["Na+/K+-ATPase", "H+/K+-ATPase", "SERCA pump", "NPC1L1 transporter", "NKCC2 cotransporter"],
    answer: "Na+/K+-ATPase",
    explanation: "Digoxin directly inhibits the Na+/K+-ATPase pump. That ultimately increases intracellular calcium and helps explain its positive inotropic effect.",
    objective: .moa,
    relatedDrugIds: ["d72"],
    tags: ["digoxin", "Na/K ATPase", "MOA"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_042",
    subsectionId: "2f",
    difficulty: .medium,
    question: "A medication reconciliation note warns that even modest overexposure could be dangerous because the drug has a narrow therapeutic index, often taught in a classic range of about 0.5 to 2 ng/mL. Which drug is being described?",
    options: ["Digoxin", "Adenosine", "Nitroglycerin", "Ezetimibe", "Clopidogrel"],
    answer: "Digoxin",
    explanation: "Digoxin is the classic narrow-therapeutic-index drug in this subsection, often taught with a serum range around 0.5 to 2 ng/mL. That is why level monitoring and toxicity recognition matter so much.",
    objective: .monitoring,
    relatedDrugIds: ["d72"],
    tags: ["digoxin", "narrow therapeutic index", "monitoring"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_043",
    subsectionId: "2f",
    difficulty: .medium,
    question: "A patient on digoxin reports nausea and says that lights now look yellow-green around the edges. Which high-yield toxicity clue is this?",
    options: ["Visual changes consistent with digoxin toxicity", "Classic nitrate tolerance", "Amiodarone pulmonary fibrosis", "Aspirin-induced tinnitus", "ACE-inhibitor angioedema"],
    answer: "Visual changes consistent with digoxin toxicity",
    explanation: "Yellow-green visual changes or halos are a classic clue to digoxin toxicity, especially when accompanied by nausea or arrhythmias. It is one of the most recognizable toxicology pearls in pharmacology.",
    objective: .adverseEffect,
    relatedDrugIds: ["d72"],
    tags: ["digoxin", "visual halos", "toxicity"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_044",
    subsectionId: "2f",
    difficulty: .hard,
    question: "Which electrolyte abnormality can make digoxin toxicity more likely even when the prescribed dose has not changed?",
    options: ["Hypokalemia", "Hypernatremia", "Hypercalcemia from thiazides alone without other changes", "Hypochloremia", "Hyperphosphatemia"],
    answer: "Hypokalemia",
    explanation: "Hypokalemia increases the risk of digoxin toxicity. This is a crucial interaction pearl because loop and thiazide diuretics can lower potassium and make digoxin more dangerous.",
    objective: .interaction,
    relatedDrugIds: ["d72"],
    tags: ["digoxin", "hypokalemia", "interaction"],
    source: .curated
),


.multipleChoice(
    id: "q2f_add_045",
    subsectionId: "2f",
    difficulty: .medium,
    question: "A patient with life-threatening digoxin toxicity needs a reversal strategy beyond simply holding the medication. Which antidote is classically used in severe digoxin toxicity?",
    options: ["Digoxin immune Fab", "Protamine sulfate", "Vitamin K", "Naloxone", "Atropine"],
    answer: "Digoxin immune Fab",
    explanation: "Digoxin immune Fab is the classic antidote for severe digoxin toxicity. This is a must-know rescue pearl because digoxin can cause dangerous arrhythmias and other toxic effects.",
    objective: .pearl,
    relatedDrugIds: ["d72"],
    tags: ["digoxin", "antidote", "immune Fab"],
    source: .curated
)

    ]
}
