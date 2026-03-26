// PharmaLingo — Module 5c (Gout Medications)
// Curated Add-On Question Pack (45 questions)
// IDs: q5c_add_001 ... q5c_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 5c exists, then append:
//
//    if bank["5c"] == nil { bank["5c"] = [] }
//    bank["5c"]?.append(contentsOf: Self.curatedAddOnQuestions_5c)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are intentionally written in a teaching style and to avoid exact duplicates
//   of the current auto-generated templates.
// - relatedDrugIds use the uploaded repo IDs: d176 (Allopurinol), d157 (Colchicine),
//   d177 (Febuxostat).

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_5c: [Question] = [
.multipleChoice(
    id: "q5c_add_001",
    subsectionId: "5c",
    difficulty: .easy,
    question: "Zyloprim is the classic oral urate-lowering medication used for long-term gout control because it reduces uric acid production rather than treating pain instantly. What is the generic name of Zyloprim?",
    options: ["Allopurinol", "Colchicine", "Febuxostat", "Indomethacin", "Prednisone"],
    answer: "Allopurinol",
    explanation: "Zyloprim is the brand name for allopurinol. Allopurinol is the first-line long-term urate-lowering option in this subsection and is used to reduce uric acid production over time.",
    objective: .brandGeneric,
    relatedDrugIds: ["d176"],
    tags: ["Zyloprim", "allopurinol", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_002",
    subsectionId: "5c",
    difficulty: .easy,
    question: "Allopurinol is a xanthine oxidase inhibitor used for chronic gout and hyperuricemia, so students should think prevention and urate-lowering rather than immediate flare relief. Which brand name matches allopurinol?",
    options: ["Zyloprim", "Colcrys", "Uloric", "Toradol", "Celebrex"],
    answer: "Zyloprim",
    explanation: "Allopurinol is marketed as Zyloprim. Pairing allopurinol with Zyloprim helps anchor it as the long-term urate-lowering drug rather than the acute flare drug.",
    objective: .genericBrand,
    relatedDrugIds: ["d176"],
    tags: ["allopurinol", "Zyloprim", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_003",
    subsectionId: "5c",
    difficulty: .easy,
    question: "Colcrys is the oral anti-inflammatory gout medication best known for being taken at the first sign of a flare and for causing dose-limiting diarrhea. What is the generic name of Colcrys?",
    options: ["Colchicine", "Allopurinol", "Febuxostat", "Naproxen", "Hydroxychloroquine"],
    answer: "Colchicine",
    explanation: "Colcrys is the brand name for colchicine. Colchicine is the gout flare medication in this subsection and is also used in low doses for gout-flare prophylaxis.",
    objective: .brandGeneric,
    relatedDrugIds: ["d157"],
    tags: ["Colcrys", "colchicine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_004",
    subsectionId: "5c",
    difficulty: .easy,
    question: "Colchicine is the oral gout drug that decreases crystal-driven inflammation and is often remembered for diarrhea and tricky interaction warnings. Which brand name matches colchicine?",
    options: ["Colcrys", "Zyloprim", "Uloric", "Lyrica", "Ultram"],
    answer: "Colcrys",
    explanation: "Colchicine is marketed as Colcrys. This pairing is high yield because colchicine questions often test acute-flare use, prophylaxis, diarrhea, and CYP3A4/P-gp interactions.",
    objective: .genericBrand,
    relatedDrugIds: ["d157"],
    tags: ["colchicine", "Colcrys", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_005",
    subsectionId: "5c",
    difficulty: .easy,
    question: "Uloric is the xanthine oxidase inhibitor that lowers uric acid for chronic gout but carries a boxed cardiovascular warning, making it more memorable than a standard brand-generic pair. What is the generic name of Uloric?",
    options: ["Febuxostat", "Allopurinol", "Colchicine", "Meloxicam", "Methotrexate"],
    answer: "Febuxostat",
    explanation: "Uloric is the brand name for febuxostat. Febuxostat is the alternative xanthine oxidase inhibitor in this subsection and is especially associated with cardiovascular risk counseling.",
    objective: .brandGeneric,
    relatedDrugIds: ["d177"],
    tags: ["Uloric", "febuxostat", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_006",
    subsectionId: "5c",
    difficulty: .easy,
    question: "Febuxostat is an oral xanthine oxidase inhibitor reserved for selected chronic-gout patients when allopurinol is not adequate or not tolerated. Which brand name matches febuxostat?",
    options: ["Uloric", "Zyloprim", "Colcrys", "Celebrex", "Imuran"],
    answer: "Uloric",
    explanation: "Febuxostat is marketed as Uloric. Students should connect Uloric with chronic gout management plus the boxed warning for cardiovascular death.",
    objective: .genericBrand,
    relatedDrugIds: ["d177"],
    tags: ["febuxostat", "Uloric", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_007",
    subsectionId: "5c",
    difficulty: .easy,
    question: "Allopurinol lowers uric acid over time by blocking uric acid synthesis, so knowing its class helps explain both its role in chronic gout prevention and its interaction profile. Which drug class best describes allopurinol?",
    options: ["Xanthine oxidase inhibitor", "NSAID", "Uricosuric", "Corticosteroid", "Opioid analgesic"],
    answer: "Xanthine oxidase inhibitor",
    explanation: "Allopurinol is a xanthine oxidase inhibitor. That class identity explains why it lowers uric acid for long-term control rather than giving immediate anti-inflammatory pain relief.",
    objective: .classId,
    relatedDrugIds: ["d176"],
    tags: ["allopurinol", "class", "xanthine oxidase inhibitor"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_008",
    subsectionId: "5c",
    difficulty: .easy,
    question: "Febuxostat and allopurinol treat the same long-term gout problem by targeting uric acid production rather than neutrophil-driven inflammation. Which class best describes febuxostat?",
    options: ["Xanthine oxidase inhibitor", "NSAID", "Anti-inflammatory microtubule inhibitor", "Biologic TNF blocker", "Muscle relaxant"],
    answer: "Xanthine oxidase inhibitor",
    explanation: "Febuxostat is a xanthine oxidase inhibitor. It belongs in the same urate-lowering class as allopurinol, not in the acute anti-inflammatory drug category.",
    objective: .classId,
    relatedDrugIds: ["d177"],
    tags: ["febuxostat", "class", "xanthine oxidase inhibitor"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_009",
    subsectionId: "5c",
    difficulty: .medium,
    question: "Colchicine is not a xanthine oxidase inhibitor and it does not lower uric acid the way allopurinol or febuxostat do. Instead, it is best categorized as which type of gout medication?",
    options: ["Anti-inflammatory gout agent that disrupts microtubule-dependent inflammation", "Xanthine oxidase inhibitor", "Uricosuric agent that increases uric acid excretion", "COX-2 selective NSAID", "Systemic corticosteroid replacement drug"],
    answer: "Anti-inflammatory gout agent that disrupts microtubule-dependent inflammation",
    explanation: "Colchicine works as an anti-inflammatory gout agent by interfering with microtubule-dependent inflammatory signaling. That is why it is used for flare treatment and prophylaxis rather than chronic urate lowering.",
    objective: .classId,
    relatedDrugIds: ["d157"],
    tags: ["colchicine", "class", "anti-inflammatory"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_010",
    subsectionId: "5c",
    difficulty: .medium,
    question: "A patient asks for a medication that will reduce future gout attacks by lowering uric acid over months, not something that only calms the pain of today’s hot joint. Which medication best fits that long-term goal?",
    options: ["Allopurinol", "Colchicine", "Ibuprofen", "Prednisone", "Ketorolac"],
    answer: "Allopurinol",
    explanation: "Allopurinol is used for chronic urate-lowering management of gout. In contrast, colchicine, NSAIDs, and steroids are better thought of as acute anti-inflammatory options rather than long-term urate-lowering therapy.",
    objective: .indication,
    relatedDrugIds: ["d176"],
    tags: ["allopurinol", "indication", "chronic gout"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_011",
    subsectionId: "5c",
    difficulty: .medium,
    question: "A patient develops a classic painful gout flare and wants something that works on crystal-triggered inflammation rather than long-term uric acid synthesis. Which medication from this subsection is most associated with that acute flare role?",
    options: ["Colchicine", "Allopurinol", "Febuxostat", "Azathioprine", "Methotrexate"],
    answer: "Colchicine",
    explanation: "Colchicine is the acute-flare medication in this subsection. It works by reducing gout-related inflammatory signaling, whereas allopurinol and febuxostat are chronic urate-lowering agents.",
    objective: .indication,
    relatedDrugIds: ["d157"],
    tags: ["colchicine", "indication", "acute gout flare"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_012",
    subsectionId: "5c",
    difficulty: .medium,
    question: "Uloric is not the usual first urate-lowering choice for every gout patient. Its labeled role is chronic hyperuricemia in gout mainly when which situation applies?",
    options: ["The patient had an inadequate response to maximally titrated allopurinol, cannot tolerate it, or it is not advisable", "The patient only needs quick pain relief during a single flare", "The patient has asymptomatic hyperuricemia with no gout history", "The patient needs opioid-strength analgesia", "The patient needs treatment for bacterial arthritis"],
    answer: "The patient had an inadequate response to maximally titrated allopurinol, cannot tolerate it, or it is not advisable",
    explanation: "Febuxostat is used for chronic hyperuricemia in gout when maximally titrated allopurinol is inadequate, not tolerated, or not advisable. That distinction is central because febuxostat carries boxed cardiovascular-risk counseling.",
    objective: .indication,
    relatedDrugIds: ["d177"],
    tags: ["febuxostat", "indication", "allopurinol alternative"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_013",
    subsectionId: "5c",
    difficulty: .medium,
    question: "Allopurinol lowers uric acid by blocking the enzyme responsible for converting purine metabolites into uric acid. Which mechanism best describes allopurinol?",
    options: ["Inhibits xanthine oxidase to reduce formation of uric acid", "Blocks cyclooxygenase to decrease prostaglandins", "Binds mu-opioid receptors to decrease pain perception", "Blocks TNF-alpha to decrease synovial inflammation", "Inhibits folate metabolism to suppress the immune system"],
    answer: "Inhibits xanthine oxidase to reduce formation of uric acid",
    explanation: "Allopurinol inhibits xanthine oxidase, reducing the conversion steps that produce uric acid. That is why it lowers serum urate over time and is used for chronic gout management.",
    objective: .moa,
    relatedDrugIds: ["d176"],
    tags: ["allopurinol", "mechanism", "xanthine oxidase"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_014",
    subsectionId: "5c",
    difficulty: .medium,
    question: "Febuxostat helps prevent future gout problems by reducing uric acid production instead of directly numbing pain or blocking prostaglandins. Which mechanism best describes febuxostat?",
    options: ["Inhibits xanthine oxidase to lower uric acid production", "Blocks neutrophil microtubule assembly as its main action", "Inhibits COX-2 only", "Antagonizes IL-6 receptors", "Enhances renal excretion of uric acid by acting as a uricosuric"],
    answer: "Inhibits xanthine oxidase to lower uric acid production",
    explanation: "Febuxostat is a xanthine oxidase inhibitor. It shares the urate-lowering class concept with allopurinol even though its safety counseling differs.",
    objective: .moa,
    relatedDrugIds: ["d177"],
    tags: ["febuxostat", "mechanism", "xanthine oxidase"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_015",
    subsectionId: "5c",
    difficulty: .medium,
    question: "Colchicine is useful in gout flares because it targets inflammatory cell activity rather than uric acid synthesis. Which mechanism best explains colchicine’s role?",
    options: ["Disrupts microtubule-dependent neutrophil inflammatory activity", "Inhibits xanthine oxidase", "Blocks prostaglandin synthesis through COX inhibition", "Neutralizes TNF-alpha", "Stimulates renal excretion of uric acid"],
    answer: "Disrupts microtubule-dependent neutrophil inflammatory activity",
    explanation: "Colchicine interferes with microtubule-dependent inflammatory processes, which helps blunt gout-flare inflammation. That is why it treats flare biology differently from allopurinol or febuxostat.",
    objective: .moa,
    relatedDrugIds: ["d157"],
    tags: ["colchicine", "mechanism", "microtubules"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_016",
    subsectionId: "5c",
    difficulty: .medium,
    question: "A learner remembers allopurinol best as “start low and titrate to uric acid goal.” Which initiation strategy most closely matches that teaching pearl?",
    options: ["Start low, such as 100 mg daily in gout, and titrate upward over time; start even lower in renal impairment", "Start at the maximum dose on day 1 to abort the flare quickly", "Take only as needed on days with joint pain", "Use a one-time loading dose followed by no maintenance therapy", "Start at 40 mg daily and reassess in 2 weeks"],
    answer: "Start low, such as 100 mg daily in gout, and titrate upward over time; start even lower in renal impairment",
    explanation: "Allopurinol is started low and titrated upward to serum uric acid goal. A lower initial dose is used in renal impairment, which reinforces the classic 'start low, go slow' pearl.",
    objective: .dosing,
    relatedDrugIds: ["d176"],
    tags: ["allopurinol", "start low", "dosing"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_017",
    subsectionId: "5c",
    difficulty: .medium,
    question: "Before starting allopurinol for chronic gout, the label emphasizes baseline labs because the drug is titrated to effect and can affect multiple organ systems. Which baseline set is most appropriate?",
    options: ["Serum uric acid, CBC, chemistry panel, liver tests, and kidney function tests", "Troponin, BNP, and INR only", "TSH and free T4 only", "Pulmonary function tests only", "Audiogram and slit-lamp eye exam only"],
    answer: "Serum uric acid, CBC, chemistry panel, liver tests, and kidney function tests",
    explanation: "Baseline serum uric acid, CBC, chemistry, liver tests, and kidney function are recommended before starting allopurinol. This supports safe titration and monitoring for toxicity.",
    objective: .monitoring,
    relatedDrugIds: ["d176"],
    tags: ["allopurinol", "baseline labs", "monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_018",
    subsectionId: "5c",
    difficulty: .medium,
    question: "A patient is confused because gout attacks may briefly increase after starting a urate-lowering drug that is supposed to help long term. Which counseling point best fits starting allopurinol?",
    options: ["Use flare prophylaxis such as colchicine or another anti-inflammatory when allopurinol is started because flares can increase initially", "Stop allopurinol immediately at the first hint of any flare and never restart it", "Allopurinol gives rapid pain relief within minutes, so prophylaxis is unnecessary", "Allopurinol should be used only during a flare and stopped once the pain is gone", "Take naloxone with each allopurinol dose"],
    answer: "Use flare prophylaxis such as colchicine or another anti-inflammatory when allopurinol is started because flares can increase initially",
    explanation: "Gout flares can occur after allopurinol is started because urate stores are being mobilized. Prophylaxis with colchicine or another anti-inflammatory is recommended during initiation and titration.",
    objective: .pearl,
    relatedDrugIds: ["d176", "d157"],
    tags: ["allopurinol", "flare prophylaxis", "colchicine"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_019",
    subsectionId: "5c",
    difficulty: .hard,
    question: "A patient already taking allopurinol correctly has a breakthrough gout flare during titration. What is the best high-yield teaching point?",
    options: ["Continue allopurinol and treat the flare concurrently rather than automatically stopping the urate-lowering drug", "Immediately double the allopurinol dose for one day only", "Stop all gout medicines permanently", "Switch from allopurinol to colchicine forever because both drugs serve the same long-term purpose", "Add azathioprine to offset the flare"],
    answer: "Continue allopurinol and treat the flare concurrently rather than automatically stopping the urate-lowering drug",
    explanation: "If a gout flare occurs during allopurinol treatment, allopurinol generally does not need to be discontinued. The flare is treated concurrently while long-term urate-lowering continues.",
    objective: .pearl,
    relatedDrugIds: ["d176", "d157"],
    tags: ["allopurinol", "continue during flare", "teaching pearl"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_020",
    subsectionId: "5c",
    difficulty: .medium,
    question: "Allopurinol is high yield not only because it lowers uric acid, but also because an early rash can be the warning sign of a severe hypersensitivity reaction. Which adverse-effect counseling point is most important?",
    options: ["Stop allopurinol and seek medical attention promptly if a rash develops", "Expect harmless loose stools and keep taking it no matter what", "Temporary yellow vision is the classic expected effect", "Bradycardia is the main dose-limiting toxicity", "A dry cough means the drug is working"],
    answer: "Stop allopurinol and seek medical attention promptly if a rash develops",
    explanation: "Allopurinol can cause severe skin and hypersensitivity reactions, including SJS/TEN-type presentations. A rash is not a 'push through it' side effect; it is a stop-and-call warning.",
    objective: .adverseEffect,
    relatedDrugIds: ["d176"],
    tags: ["allopurinol", "rash", "SJS/TEN"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_021",
    subsectionId: "5c",
    difficulty: .hard,
    question: "A prescriber is choosing a urate-lowering drug for a patient of Han Chinese ancestry. Why is HLA-B*58:01 relevant before starting allopurinol?",
    options: ["It marks increased risk for severe allopurinol hypersensitivity reactions, so screening is considered in high-prevalence populations", "It predicts who will get opioid dependence from pain treatment", "It proves the patient will not respond to colchicine", "It identifies patients who need febuxostat plus azathioprine together", "It is used only to decide whether to prescribe ibuprofen"],
    answer: "It marks increased risk for severe allopurinol hypersensitivity reactions, so screening is considered in high-prevalence populations",
    explanation: "HLA-B*58:01 is associated with severe allopurinol hypersensitivity, and screening is considered in populations where the allele is more prevalent. This is one of the highest-yield safety pearls for allopurinol.",
    objective: .contraindication,
    relatedDrugIds: ["d176"],
    tags: ["allopurinol", "HLA-B*58:01", "hypersensitivity"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_022",
    subsectionId: "5c",
    difficulty: .hard,
    question: "A patient with gout also takes azathioprine for an autoimmune disease. Why must allopurinol use trigger extra caution?",
    options: ["Allopurinol inhibits xanthine oxidase metabolism of azathioprine and can greatly increase myelosuppression risk", "Allopurinol instantly blocks azathioprine absorption so the autoimmune disease will relapse", "Allopurinol causes azathioprine to become an opioid", "The combination is harmless and requires no adjustment", "Allopurinol lowers azathioprine levels, so azathioprine should be doubled"],
    answer: "Allopurinol inhibits xanthine oxidase metabolism of azathioprine and can greatly increase myelosuppression risk",
    explanation: "Allopurinol inhibits xanthine oxidase-mediated metabolism of azathioprine and mercaptopurine, which can markedly increase exposure and toxicity. This is a classic interaction pearl tied directly to its mechanism.",
    objective: .interaction,
    relatedDrugIds: ["d176"],
    tags: ["allopurinol", "azathioprine", "mercaptopurine", "interaction"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_023",
    subsectionId: "5c",
    difficulty: .medium,
    question: "Allopurinol counseling includes more than lab monitoring. Which practical self-care instruction is most appropriate while taking it long term?",
    options: ["Stay well hydrated and increase fluid intake to help reduce kidney stone risk", "Avoid all fluids because they worsen gout", "Take only with grapefruit juice to improve absorption", "Limit bowel movements to prevent drug loss", "Use external heat over the kidneys after each dose"],
    answer: "Stay well hydrated and increase fluid intake to help reduce kidney stone risk",
    explanation: "Allopurinol counseling includes good hydration. The labeling advises adequate fluid intake, which helps reduce the risk of kidney stone formation and supports kidney safety.",
    objective: .monitoring,
    relatedDrugIds: ["d176"],
    tags: ["allopurinol", "hydration", "kidney stones"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_024",
    subsectionId: "5c",
    difficulty: .medium,
    question: "When titrating urate-lowering therapy, symptom improvement alone is not enough. Which lab target is the high-yield goal commonly used to judge whether allopurinol or febuxostat is doing its job?",
    options: ["Serum uric acid at or below 6 mg/dL", "Serum calcium above 10.5 mg/dL", "Hemoglobin A1c below 7%", "TSH between 0.5 and 4.5 mIU/L", "LDL cholesterol below 70 mg/dL"],
    answer: "Serum uric acid at or below 6 mg/dL",
    explanation: "Both allopurinol and febuxostat are titrated or assessed against serum uric acid goals, with a common target of 6 mg/dL or less. That lab goal captures efficacy better than symptom guessing alone.",
    objective: .monitoring,
    relatedDrugIds: ["d176", "d177"],
    tags: ["serum uric acid", "goal", "monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_025",
    subsectionId: "5c",
    difficulty: .medium,
    question: "Low-dose colchicine is often used not for instant flare rescue, but to prevent flares while urate-lowering therapy is being started or adjusted. Which prophylaxis regimen best matches colchicine?",
    options: ["0.6 mg once or twice daily, with a maximum of 1.2 mg/day", "1.2 mg every hour until pain stops", "40 mg once daily and increase to 80 mg after 2 weeks", "100 mg daily increased by 100 mg every week", "One transdermal patch every 72 hours"],
    answer: "0.6 mg once or twice daily, with a maximum of 1.2 mg/day",
    explanation: "For gout-flare prophylaxis, colchicine is given as 0.6 mg once or twice daily, with a maximum of 1.2 mg/day. This is distinct from the short acute-flare regimen.",
    objective: .dosing,
    relatedDrugIds: ["d157"],
    tags: ["colchicine", "prophylaxis", "dosing"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_026",
    subsectionId: "5c",
    difficulty: .medium,
    question: "At the first sign of a classic gout flare, colchicine works best when used with the labeled early flare regimen rather than as a repeatedly escalated pain pill. Which regimen is correct?",
    options: ["1.2 mg at the first sign of the flare, then 0.6 mg one hour later", "0.6 mg every hour for the rest of the day", "100 mg daily for one week", "40 mg once daily for 2 weeks", "800 mg every 8 hours as needed"],
    answer: "1.2 mg at the first sign of the flare, then 0.6 mg one hour later",
    explanation: "The labeled acute gout-flare colchicine regimen is 1.2 mg at flare onset followed by 0.6 mg one hour later. Higher repeated dosing is not more effective and increases toxicity.",
    objective: .dosing,
    relatedDrugIds: ["d157"],
    tags: ["colchicine", "acute flare dose", "dosing"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_027",
    subsectionId: "5c",
    difficulty: .easy,
    question: "Colchicine is memorable because the gut often complains before anything else does. Which adverse effect is most classically associated with colchicine?",
    options: ["Diarrhea", "Dry cough", "Bradycardia", "Urinary retention", "Photosensitivity"],
    answer: "Diarrhea",
    explanation: "Diarrhea is the most commonly reported adverse effect with colchicine and is one of the fastest ways to recognize the drug on an exam question.",
    objective: .adverseEffect,
    relatedDrugIds: ["d157"],
    tags: ["colchicine", "diarrhea", "adverse effect"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_028",
    subsectionId: "5c",
    difficulty: .medium,
    question: "A patient wants to use leftover colchicine for a generic headache because 'it helped pain before.' Which counseling response is most accurate?",
    options: ["Colchicine is not a general analgesic and should not be used to treat pain from other causes", "That is fine because colchicine works like acetaminophen for any pain", "Colchicine is a safer substitute for opioids in all pain syndromes", "Colchicine should be used for chest pain first and gout second", "Colchicine is mainly a sleep aid when taken at bedtime"],
    answer: "Colchicine is not a general analgesic and should not be used to treat pain from other causes",
    explanation: "Colchicine is not an all-purpose pain medication. It is used for gout-related inflammatory indications, not for unrelated pain complaints such as routine headaches.",
    objective: .pearl,
    relatedDrugIds: ["d157"],
    tags: ["colchicine", "not analgesic", "counseling"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_029",
    subsectionId: "5c",
    difficulty: .hard,
    question: "Colchicine can become dangerous in the setting of certain drug interactions, especially when renal or hepatic impairment is already present. Which combination is most concerning for life-threatening colchicine toxicity?",
    options: ["Colchicine plus a strong CYP3A4 or P-gp inhibitor in a patient with renal or hepatic impairment", "Colchicine plus acetaminophen in a healthy adult", "Colchicine plus calcium carbonate", "Colchicine plus topical lidocaine patch", "Colchicine plus vitamin D"],
    answer: "Colchicine plus a strong CYP3A4 or P-gp inhibitor in a patient with renal or hepatic impairment",
    explanation: "Colchicine is a CYP3A4 and P-gp substrate, and life-threatening toxicity can occur when it is combined with strong inhibitors, especially in patients with renal or hepatic impairment. This is a major safety pearl.",
    objective: .contraindication,
    relatedDrugIds: ["d157"],
    tags: ["colchicine", "CYP3A4", "P-gp", "toxicity"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_030",
    subsectionId: "5c",
    difficulty: .hard,
    question: "Which co-medication is a classic example of the kind of interacting drug that can dangerously raise colchicine exposure and trigger fatal toxicity?",
    options: ["Clarithromycin", "Amoxicillin", "Famotidine", "Cetirizine", "Levothyroxine"],
    answer: "Clarithromycin",
    explanation: "Clarithromycin is a strong CYP3A4 inhibitor and is a classic high-yield colchicine interaction. The risk becomes especially dangerous in the setting of renal or hepatic impairment.",
    objective: .interaction,
    relatedDrugIds: ["d157"],
    tags: ["colchicine", "clarithromycin", "interaction"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_031",
    subsectionId: "5c",
    difficulty: .hard,
    question: "An older adult with chronic kidney disease develops progressive weakness while taking colchicine for repeated gout issues. Which toxicity should rise high on your differential?",
    options: ["Colchicine-induced neuromuscular toxicity and possible rhabdomyolysis", "ACE-inhibitor cough", "Ototoxicity", "Thyroid storm", "Serotonin syndrome"],
    answer: "Colchicine-induced neuromuscular toxicity and possible rhabdomyolysis",
    explanation: "Colchicine can cause neuromuscular toxicity and rhabdomyolysis, especially in older adults and patients with renal dysfunction. That makes weakness on colchicine an important red-flag symptom.",
    objective: .adverseEffect,
    relatedDrugIds: ["d157"],
    tags: ["colchicine", "neuromuscular toxicity", "rhabdomyolysis"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_032",
    subsectionId: "5c",
    difficulty: .medium,
    question: "Colchicine toxicity is not limited to GI symptoms. Which serious hematologic adverse effect is also associated with therapeutic colchicine exposure?",
    options: ["Myelosuppression, including pancytopenia-type blood dyscrasias", "Profound hyperkalemia", "Acute angle-closure glaucoma", "Agranulocytosis from thyroid blockade only", "Nephrogenic diabetes insipidus"],
    answer: "Myelosuppression, including pancytopenia-type blood dyscrasias",
    explanation: "Colchicine has been associated with blood dyscrasias such as myelosuppression, leukopenia, and thrombocytopenia. That is one reason interaction-heavy toxicity can become life-threatening.",
    objective: .adverseEffect,
    relatedDrugIds: ["d157"],
    tags: ["colchicine", "myelosuppression", "blood dyscrasias"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_033",
    subsectionId: "5c",
    difficulty: .easy,
    question: "Febuxostat stands out from allopurinol because its label carries a boxed warning that changes when it should be used. What is the major boxed warning concern?",
    options: ["Increased cardiovascular death risk compared with allopurinol in patients with established CV disease", "Severe hypoglycemia in fasting patients", "Pulmonary fibrosis after long-term use", "Addiction and misuse", "Tendon rupture"],
    answer: "Increased cardiovascular death risk compared with allopurinol in patients with established CV disease",
    explanation: "Febuxostat carries a boxed warning for increased cardiovascular death risk compared with allopurinol in patients with established cardiovascular disease. That is the main reason it is not the usual first urate-lowering choice.",
    objective: .contraindication,
    relatedDrugIds: ["d177"],
    tags: ["febuxostat", "boxed warning", "cardiovascular death"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_034",
    subsectionId: "5c",
    difficulty: .medium,
    question: "A patient with gout asks why febuxostat is not usually started before allopurinol. Which answer is most accurate?",
    options: ["Because febuxostat is generally reserved for patients who did not respond adequately to allopurinol, could not tolerate it, or should not take it", "Because febuxostat only treats acute flares and never lowers uric acid", "Because febuxostat is only available as an IV infusion", "Because febuxostat is contraindicated in all adults over age 65", "Because febuxostat must always be combined with opioids"],
    answer: "Because febuxostat is generally reserved for patients who did not respond adequately to allopurinol, could not tolerate it, or should not take it",
    explanation: "Febuxostat is reserved for patients who have an inadequate response to maximally titrated allopurinol, cannot tolerate it, or should not take it. That reserve role reflects its boxed cardiovascular warning.",
    objective: .pearl,
    relatedDrugIds: ["d177", "d176"],
    tags: ["febuxostat", "reserve use", "allopurinol alternative"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_035",
    subsectionId: "5c",
    difficulty: .medium,
    question: "Urate-lowering drugs are not automatically appropriate just because a lab value is high. Which statement best reflects febuxostat labeling?",
    options: ["Febuxostat is not recommended for asymptomatic hyperuricemia", "Febuxostat is first-line for any isolated high uric acid level on screening labs", "Febuxostat should replace colchicine in every patient with toe pain", "Febuxostat must be started during every acute gout flare", "Febuxostat is only for kidney stone prevention in people without gout"],
    answer: "Febuxostat is not recommended for asymptomatic hyperuricemia",
    explanation: "Febuxostat is indicated for chronic hyperuricemia in adults with gout under specific circumstances, but it is not recommended for asymptomatic hyperuricemia.",
    objective: .indication,
    relatedDrugIds: ["d177"],
    tags: ["febuxostat", "asymptomatic hyperuricemia", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_036",
    subsectionId: "5c",
    difficulty: .medium,
    question: "Before and during febuxostat therapy, a clinician should think beyond uric acid alone. Which monitoring issue is especially important because febuxostat can cause clinically significant organ toxicity?",
    options: ["Baseline and follow-up liver tests, especially if symptoms such as dark urine or jaundice develop", "Routine peak and trough vancomycin levels", "Pulmonary function tests every week", "Daily INR regardless of co-medications", "Bone density testing before the first tablet"],
    answer: "Baseline and follow-up liver tests, especially if symptoms such as dark urine or jaundice develop",
    explanation: "Febuxostat labeling emphasizes baseline liver tests and prompt evaluation if symptoms of liver injury appear, such as dark urine, jaundice, fatigue, or right upper abdominal discomfort.",
    objective: .monitoring,
    relatedDrugIds: ["d177"],
    tags: ["febuxostat", "liver tests", "monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_037",
    subsectionId: "5c",
    difficulty: .medium,
    question: "A student is trying to distinguish allopurinol from febuxostat by dosing. Which regimen best matches febuxostat?",
    options: ["Start 40 mg once daily and increase to 80 mg if serum uric acid remains above goal after 2 weeks", "Start 100 mg daily and increase weekly by 100 mg until goal", "Use 1.2 mg then 0.6 mg one hour later", "Take 0.6 mg once or twice daily only during titration", "Use only as needed at the first sign of toe pain"],
    answer: "Start 40 mg once daily and increase to 80 mg if serum uric acid remains above goal after 2 weeks",
    explanation: "Febuxostat is started at 40 mg once daily, and if serum uric acid remains above goal after 2 weeks, the dose is typically increased to 80 mg once daily. That helps distinguish it from allopurinol titration.",
    objective: .dosing,
    relatedDrugIds: ["d177"],
    tags: ["febuxostat", "40 mg", "80 mg", "dosing"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_038",
    subsectionId: "5c",
    difficulty: .medium,
    question: "Starting febuxostat can temporarily stir up gout flares even though the long-term goal is flare prevention. Which preventive step is recommended when febuxostat is initiated?",
    options: ["Use concurrent prophylaxis with colchicine or an NSAID, often for up to 6 months", "Avoid all anti-inflammatory therapy because it reduces febuxostat efficacy", "Stop febuxostat after the first flare and never restart it", "Add azathioprine to control inflammation", "Use naloxone before each febuxostat dose"],
    answer: "Use concurrent prophylaxis with colchicine or an NSAID, often for up to 6 months",
    explanation: "Like allopurinol, febuxostat can initially trigger gout flares as urate stores shift. Colchicine or an NSAID is recommended as prophylaxis when therapy is started, and benefit may extend for up to 6 months.",
    objective: .pearl,
    relatedDrugIds: ["d177", "d157"],
    tags: ["febuxostat", "flare prophylaxis", "colchicine", "NSAID"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_039",
    subsectionId: "5c",
    difficulty: .medium,
    question: "A patient started febuxostat 3 weeks ago and now has a flare. Which management pearl is most accurate?",
    options: ["The flare can be treated concurrently; febuxostat generally does not need to be stopped", "The flare means febuxostat is absolutely ineffective and must be abandoned immediately", "The correct response is to double the febuxostat dose for one day", "Switch all therapy to acetaminophen because anti-inflammatory drugs are contraindicated", "Add mercaptopurine to offset febuxostat"],
    answer: "The flare can be treated concurrently; febuxostat generally does not need to be stopped",
    explanation: "If a gout flare occurs during febuxostat treatment, febuxostat generally does not need to be discontinued. The flare is managed concurrently while urate-lowering continues.",
    objective: .pearl,
    relatedDrugIds: ["d177"],
    tags: ["febuxostat", "continue during flare", "teaching pearl"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_040",
    subsectionId: "5c",
    difficulty: .hard,
    question: "Which medication pair should not be given together because febuxostat can dangerously raise the exposure of the second drug via xanthine oxidase inhibition?",
    options: ["Febuxostat plus azathioprine", "Febuxostat plus acetaminophen", "Febuxostat plus topical diclofenac", "Febuxostat plus famotidine", "Febuxostat plus cetirizine"],
    answer: "Febuxostat plus azathioprine",
    explanation: "Febuxostat is contraindicated with azathioprine or mercaptopurine because xanthine oxidase inhibition can lead to severe toxicity. This is stricter than the allopurinol situation, where major dose reduction is required rather than an absolute label contraindication.",
    objective: .interaction,
    relatedDrugIds: ["d177"],
    tags: ["febuxostat", "azathioprine", "contraindication"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_041",
    subsectionId: "5c",
    difficulty: .medium,
    question: "A patient calls at the very first sign of an acutely hot, swollen first MTP joint and wants the drug from this subsection that is most associated with early flare treatment rather than long-term urate lowering. Which answer is best?",
    options: ["Colchicine", "Allopurinol", "Febuxostat", "Warfarin", "Rosuvastatin"],
    answer: "Colchicine",
    explanation: "Colchicine is the drug in this subsection most associated with early treatment of an acute gout flare. Allopurinol and febuxostat are chronic urate-lowering therapies rather than quick anti-inflammatory rescue drugs.",
    objective: .mixedReview,
    relatedDrugIds: ["d157", "d176", "d177"],
    tags: ["acute flare", "colchicine", "comparison"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_042",
    subsectionId: "5c",
    difficulty: .hard,
    question: "Which pair of drugs from this subsection belongs to the same urate-lowering class because both inhibit xanthine oxidase?",
    options: ["Allopurinol and febuxostat", "Allopurinol and colchicine", "Colchicine and naproxen", "Febuxostat and prednisone", "Colchicine and methotrexate"],
    answer: "Allopurinol and febuxostat",
    explanation: "Allopurinol and febuxostat are both xanthine oxidase inhibitors. Colchicine is the odd one out because it is an anti-inflammatory gout agent rather than a urate-lowering xanthine oxidase inhibitor.",
    objective: .mixedReview,
    relatedDrugIds: ["d176", "d177"],
    tags: ["xanthine oxidase inhibitors", "comparison"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_043",
    subsectionId: "5c",
    difficulty: .hard,
    question: "Which counseling statement best teaches the difference between colchicine and allopurinol without relying on memorization alone?",
    options: ["Colchicine helps with crystal-driven flare inflammation, while allopurinol lowers uric acid over time for long-term control", "Allopurinol and colchicine do the same job, so whichever is cheaper can be used interchangeably", "Colchicine is the chronic urate-lowering drug and allopurinol is the rapid pain reliever", "Both drugs are mainly used as broad-spectrum analgesics", "Neither drug requires lab monitoring or interaction review"],
    answer: "Colchicine helps with crystal-driven flare inflammation, while allopurinol lowers uric acid over time for long-term control",
    explanation: "Colchicine is best understood as the anti-inflammatory flare drug, while allopurinol is the chronic urate-lowering drug. That comparison captures the central clinical distinction students need.",
    objective: .mixedReview,
    relatedDrugIds: ["d157", "d176"],
    tags: ["colchicine vs allopurinol", "comparison"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_044",
    subsectionId: "5c",
    difficulty: .hard,
    question: "A patient with autoimmune disease takes azathioprine and now needs a gout medication. Which choice from this subsection is specifically contraindicated with azathioprine rather than merely requiring major dose adjustment and caution?",
    options: ["Febuxostat", "Allopurinol", "Colchicine", "Naproxen", "Prednisone"],
    answer: "Febuxostat",
    explanation: "Febuxostat is contraindicated with azathioprine or mercaptopurine. Allopurinol also interacts strongly with those drugs, but the label emphasis differs because febuxostat is listed as contraindicated.",
    objective: .contraindication,
    relatedDrugIds: ["d177", "d176"],
    tags: ["febuxostat", "azathioprine", "comparison"],
    source: .curated
),

.multipleChoice(
    id: "q5c_add_045",
    subsectionId: "5c",
    difficulty: .medium,
    question: "Two months after starting urate-lowering therapy, a patient feels somewhat better but still wants objective proof the medication is working. Which monitoring strategy is most appropriate?",
    options: ["Follow serum uric acid and titrate toward a goal of 6 mg/dL or less", "Follow only white blood cell count because gout control does not involve uric acid monitoring", "Track pain score alone and ignore laboratory goals", "Measure digoxin levels to assess efficacy", "Use TSH as the main efficacy marker"],
    answer: "Follow serum uric acid and titrate toward a goal of 6 mg/dL or less",
    explanation: "For chronic gout management, serum uric acid is the key efficacy lab. Symptom improvement matters, but urate-lowering therapy is judged by whether serum uric acid is being driven to goal.",
    objective: .monitoring,
    relatedDrugIds: ["d176", "d177"],
    tags: ["serum uric acid", "goal", "efficacy"],
    source: .curated
)
    ]
}
