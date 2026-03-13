// PharmaLingo — Module 10c (Contraceptives & Hormonal Therapy)
// Curated Add-On Question Pack (45 questions)
// IDs: q10c_add_001 ... q10c_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 10c exists, then append:
//
//    if bank["10c"] == nil { bank["10c"] = [] }
//    bank["10c"]?.append(contentsOf: Self.curatedAddOnQuestions_10c)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds are mapped in section order for the 10c drug list:
//   d176 (Conjugated estrogens / Premarin)
//   d177 (Drospirenone / Ethinyl estradiol)
//   d178 (Estradiol)
//   d179 (Ethinyl estradiol / Etonogestrel vaginal ring / NuvaRing)
//   d180 (Ethinyl estradiol / Levonorgestrel)
//   d181 (Ethinyl estradiol / Norgestimate / Ortho Tri-Cyclen)
//   d182 (Levonorgestrel IUD / Mirena)
//   d183 (Medroxyprogesterone depot / Depo-Provera)
//   d184 (Norethindrone / Micronor-Camila)
//   d185 (Progesterone)
//   d186 (Raloxifene / Evista)
//   d187 (Testosterone)
//
// Generated on: 2026-03-13

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_10c: [Question] = [
        .multipleChoice(
            id: "q10c_add_001",
            subsectionId: "10c",
            difficulty: .easy,
            question: "Premarin is an oral estrogen product often used for menopausal vasomotor symptoms. What is the generic name of Premarin?",
            options: ["Conjugated estrogens", "Estradiol", "Progesterone", "Raloxifene", "Medroxyprogesterone"],
            answer: "Conjugated estrogens",
            explanation: "Premarin is the brand name for conjugated estrogens.",
            objective: .brandGeneric,
            relatedDrugIds: ["d176"],
            tags: ["10c", "premarin", "brand->generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_002",
            subsectionId: "10c",
            difficulty: .medium,
            question: "A postmenopausal patient reports bothersome hot flashes and asks why Premarin might be prescribed. Which primary indication best fits conjugated estrogens?",
            options: ["Treatment of moderate to severe menopausal vasomotor symptoms", "Rapid emergency contraception after unprotected sex", "Long-term acne treatment in adolescents", "Acute bacterial vaginosis treatment", "Smoking cessation support"],
            answer: "Treatment of moderate to severe menopausal vasomotor symptoms",
            explanation: "Conjugated estrogens are used for menopausal symptoms such as moderate to severe hot flashes.",
            objective: .indication,
            relatedDrugIds: ["d176"],
            tags: ["10c", "conjugated-estrogens", "menopause", "indication"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_003",
            subsectionId: "10c",
            difficulty: .hard,
            question: "A woman with a uterus is started on estrogen-alone therapy for menopause. Which boxed-warning teaching point is highest yield for unopposed systemic estrogen?",
            options: ["It increases the risk of endometrial cancer, so abnormal vaginal bleeding should be evaluated", "It causes permanent infertility after one dose", "It is the preferred long-term method for preventing dementia", "It must always be taken with grapefruit juice", "It is indicated to prevent heart attacks and stroke"],
            answer: "It increases the risk of endometrial cancer, so abnormal vaginal bleeding should be evaluated",
            explanation: "Systemic estrogen-alone therapy in a woman with a uterus increases endometrial cancer risk; any abnormal vaginal bleeding warrants evaluation.",
            objective: .pearl,
            relatedDrugIds: ["d176", "d178"],
            tags: ["10c", "estrogen", "boxed-warning", "endometrial-cancer"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_004",
            subsectionId: "10c",
            difficulty: .hard,
            question: "A postmenopausal patient with an intact uterus is using systemic estrogen for symptom relief. Which additional hormone is commonly added to reduce the risk of endometrial hyperplasia?",
            options: ["Progesterone", "Raloxifene", "Testosterone", "Mirabegron", "Tamsulosin"],
            answer: "Progesterone",
            explanation: "A progestin or progesterone is typically added to systemic estrogen therapy in women with a uterus to reduce endometrial hyperplasia risk.",
            objective: .mixedReview,
            relatedDrugIds: ["d176", "d178", "d185"],
            tags: ["10c", "estrogen", "progesterone", "uterus", "comparison"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_005",
            subsectionId: "10c",
            difficulty: .medium,
            question: "Drospirenone/ethinyl estradiol prevents pregnancy by combining an estrogen with a progestin in a daily pill. Which class best describes this medication?",
            options: ["Combined oral contraceptive", "Progestin-only pill", "Hormone-releasing intrauterine system", "Selective estrogen receptor modulator", "Topical androgen replacement"],
            answer: "Combined oral contraceptive",
            explanation: "Drospirenone/ethinyl estradiol is a combined oral contraceptive because it contains both ethinyl estradiol and a progestin.",
            objective: .classId,
            relatedDrugIds: ["d177"],
            tags: ["10c", "drospirenone-ee", "class"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_006",
            subsectionId: "10c",
            difficulty: .hard,
            question: "A 38-year-old who smokes asks whether a combined birth control pill containing drospirenone and ethinyl estradiol is a good idea. Which counseling point is most important?",
            options: ["Combination oral contraceptives should not be used in women over 35 who smoke because cigarette smoking raises serious cardiovascular risk", "Smoking only matters if the pill is progestin-only", "Smoking lowers clot risk when estrogen is present", "The only concern is tooth discoloration", "The main issue is that the pill stops working after age 35"],
            answer: "Combination oral contraceptives should not be used in women over 35 who smoke because cigarette smoking raises serious cardiovascular risk",
            explanation: "Combined hormonal contraceptives carry a boxed warning that cigarette smoking increases the risk of serious cardiovascular events, especially in women over 35.",
            objective: .pearl,
            relatedDrugIds: ["d177", "d180", "d181"],
            tags: ["10c", "coc", "smoking", "boxed-warning"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_007",
            subsectionId: "10c",
            difficulty: .hard,
            question: "A learner remembers that drospirenone has anti-mineralocorticoid activity similar to a low dose of spironolactone. Which safety issue becomes especially relevant in high-risk patients?",
            options: ["Hyperkalemia", "Profound hypoglycemia", "Ototoxicity", "Blue-gray skin discoloration", "Neutropenia"],
            answer: "Hyperkalemia",
            explanation: "Drospirenone can raise potassium, so hyperkalemia is a key concern in high-risk patients and with interacting conditions or drugs.",
            objective: .interaction,
            relatedDrugIds: ["d177"],
            tags: ["10c", "drospirenone-ee", "hyperkalemia", "interaction"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_008",
            subsectionId: "10c",
            difficulty: .medium,
            question: "A patient starts a drospirenone/ethinyl estradiol pill later than day 1 of the menstrual cycle and asks when it becomes reliable. Which counseling point is most accurate?",
            options: ["Use a non-hormonal backup method for the first 7 consecutive days", "It works immediately regardless of when it is started", "Skip the first week of pills and start with placebo tablets", "Use backup for 30 days every time a new pack is started", "Take two pills only on weekends"],
            answer: "Use a non-hormonal backup method for the first 7 consecutive days",
            explanation: "When certain combined oral contraceptives are not started on day 1, backup contraception is advised during the first 7 days of correct use.",
            objective: .pearl,
            relatedDrugIds: ["d177"],
            tags: ["10c", "drospirenone-ee", "backup", "counseling"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_009",
            subsectionId: "10c",
            difficulty: .medium,
            question: "Estradiol is a systemic estrogen commonly used when a patient has estrogen deficiency symptoms. Which indication is especially high yield for estradiol tablets?",
            options: ["Moderate to severe menopausal vasomotor symptoms", "Acute urinary tract infection", "Status epilepticus", "Smoking cessation", "Benign prostatic hyperplasia"],
            answer: "Moderate to severe menopausal vasomotor symptoms",
            explanation: "Estradiol is used for estrogen replacement, including moderate to severe menopausal vasomotor symptoms.",
            objective: .indication,
            relatedDrugIds: ["d178"],
            tags: ["10c", "estradiol", "indication", "menopause"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_010",
            subsectionId: "10c",
            difficulty: .medium,
            question: "A patient says her only menopausal complaint is vaginal dryness and dyspareunia. Which estrogen-therapy pearl is most appropriate before reflexively prescribing systemic estradiol tablets?",
            options: ["Topical vaginal products should be considered when symptoms are limited to vulvovaginal atrophy", "Systemic estradiol is always safer than local therapy", "Add testosterone first because estrogen worsens dryness", "Use a nicotine patch instead of hormones", "Start raloxifene because it is the best treatment for hot flashes"],
            answer: "Topical vaginal products should be considered when symptoms are limited to vulvovaginal atrophy",
            explanation: "When symptoms are limited to vulvovaginal atrophy, local vaginal estrogen products are often considered before systemic estrogen therapy.",
            objective: .pearl,
            relatedDrugIds: ["d178", "d176"],
            tags: ["10c", "estradiol", "vaginal-atrophy", "pearl"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_011",
            subsectionId: "10c",
            difficulty: .hard,
            question: "A woman with an intact uterus is taking estradiol without any progestin support. What is the main reason this raises concern?",
            options: ["Unopposed estrogen can increase endometrial hyperplasia and cancer risk", "It guarantees severe osteoporosis within weeks", "It causes sudden loss of contraceptive efficacy", "It always causes renal failure", "It blocks all androgen production permanently"],
            answer: "Unopposed estrogen can increase endometrial hyperplasia and cancer risk",
            explanation: "In women with a uterus, unopposed systemic estrogen increases endometrial hyperplasia and cancer risk, which is why a progestin is often added.",
            objective: .contraindication,
            relatedDrugIds: ["d178", "d185"],
            tags: ["10c", "estradiol", "uterus", "endometrial-risk"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_012",
            subsectionId: "10c",
            difficulty: .hard,
            question: "A patient asks whether estradiol should be taken to prevent heart disease or dementia now that she is postmenopausal. Which answer is best?",
            options: ["No—systemic estrogen should not be used to prevent cardiovascular disease or dementia", "Yes—it is first-line prevention for both", "Yes—but only if taken with nicotine replacement", "No—because estradiol has no hormone activity after menopause", "Yes—but only in smokers over 35"],
            answer: "No—systemic estrogen should not be used to prevent cardiovascular disease or dementia",
            explanation: "Systemic estrogen therapy is not indicated for prevention of cardiovascular disease or dementia.",
            objective: .pearl,
            relatedDrugIds: ["d178", "d176"],
            tags: ["10c", "estradiol", "boxed-warning", "cvd", "dementia"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_013",
            subsectionId: "10c",
            difficulty: .easy,
            question: "Ethinyl estradiol/etonogestrel is a combination contraceptive delivered through a vaginal ring. Which brand name matches this product?",
            options: ["NuvaRing", "Mirena", "Depo-Provera", "Premarin", "Evista"],
            answer: "NuvaRing",
            explanation: "Etonogestrel/ethinyl estradiol vaginal ring is sold as NuvaRing.",
            objective: .genericBrand,
            relatedDrugIds: ["d179"],
            tags: ["10c", "nuvaring", "generic->brand"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_014",
            subsectionId: "10c",
            difficulty: .medium,
            question: "A patient choosing NuvaRing wants simple monthly instructions. Which regimen is correct for the standard cycle?",
            options: ["Insert 1 ring for 3 weeks, then remove it for 1 week", "Insert a new ring every morning", "Wear 1 ring continuously for 8 years", "Insert 1 ring only during menstruation", "Use the ring only after intercourse"],
            answer: "Insert 1 ring for 3 weeks, then remove it for 1 week",
            explanation: "The standard NuvaRing schedule is 3 weeks in place followed by 1 ring-free week.",
            objective: .dosing,
            relatedDrugIds: ["d179"],
            tags: ["10c", "nuvaring", "dosing", "3-weeks-1-week"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_015",
            subsectionId: "10c",
            difficulty: .medium,
            question: "A patient with a latex allergy is nervous about using a contraceptive vaginal ring. Which point is correct for NuvaRing?",
            options: ["NuvaRing is not made with natural rubber latex", "NuvaRing contains peanut oil", "NuvaRing must be swallowed whole if latex allergy is present", "NuvaRing is contraindicated because all vaginal rings contain latex", "NuvaRing is a copper device, not a hormonal product"],
            answer: "NuvaRing is not made with natural rubber latex",
            explanation: "NuvaRing is a hormonal vaginal ring and is not made with natural rubber latex.",
            objective: .pearl,
            relatedDrugIds: ["d179"],
            tags: ["10c", "nuvaring", "latex", "counseling"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_016",
            subsectionId: "10c",
            difficulty: .medium,
            question: "Which contraceptive option in this subsection is best identified by its route rather than by a daily pill or quarterly injection schedule?",
            options: ["Ethinyl estradiol/etonogestrel vaginal ring", "Norethindrone", "Medroxyprogesterone depot", "Levonorgestrel/ethinyl estradiol", "Progesterone"],
            answer: "Ethinyl estradiol/etonogestrel vaginal ring",
            explanation: "NuvaRing is distinguished by vaginal ring delivery, unlike daily oral pills or the every-3-month depot injection.",
            objective: .mixedReview,
            relatedDrugIds: ["d179", "d184", "d183", "d180", "d185"],
            tags: ["10c", "comparison", "nuvaring", "route"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_017",
            subsectionId: "10c",
            difficulty: .medium,
            question: "Ethinyl estradiol/levonorgestrel prevents pregnancy using both an estrogen and a progestin. Which class best describes this medication?",
            options: ["Combined oral contraceptive", "Progestin-only pill", "Hormone replacement therapy only", "Selective estrogen receptor modulator", "Vaginal mucosal protectant"],
            answer: "Combined oral contraceptive",
            explanation: "Ethinyl estradiol/levonorgestrel is a combined oral contraceptive because it contains both an estrogen and a progestin.",
            objective: .classId,
            relatedDrugIds: ["d180"],
            tags: ["10c", "levonorgestrel-ee", "class"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_018",
            subsectionId: "10c",
            difficulty: .easy,
            question: "A patient is prescribed ethinyl estradiol/levonorgestrel and asks its main job. What is the primary indication for this medication?",
            options: ["Prevention of pregnancy", "Treatment of osteoporosis in postmenopausal women", "Emergency reversal of opioid overdose", "Treatment of bacterial vaginosis", "Management of overactive bladder"],
            answer: "Prevention of pregnancy",
            explanation: "Ethinyl estradiol/levonorgestrel is a combined oral contraceptive used to prevent pregnancy.",
            objective: .indication,
            relatedDrugIds: ["d180"],
            tags: ["10c", "levonorgestrel-ee", "pregnancy-prevention"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_019",
            subsectionId: "10c",
            difficulty: .hard,
            question: "A patient wants to restart an ethinyl estradiol/levonorgestrel pill immediately after giving birth. Which high-yield timing pearl matters because of thromboembolic risk?",
            options: ["Do not start until at least 4 weeks after delivery", "It should always be started within 24 hours of delivery", "It is safest only during labor", "It must be delayed for 1 full year after delivery", "Postpartum timing does not matter with estrogen-containing pills"],
            answer: "Do not start until at least 4 weeks after delivery",
            explanation: "Estrogen-containing combined oral contraceptives are generally not started until at least 4 weeks postpartum because thromboembolic risk is increased.",
            objective: .contraindication,
            relatedDrugIds: ["d180"],
            tags: ["10c", "levonorgestrel-ee", "postpartum", "vte"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_020",
            subsectionId: "10c",
            difficulty: .medium,
            question: "Which counseling statement is most appropriate for a patient taking an ethinyl estradiol/levonorgestrel birth control pill?",
            options: ["It helps prevent pregnancy but does not protect against HIV or other sexually transmitted infections", "It prevents pregnancy and also reliably prevents sexually transmitted infections", "It works only on days when it is taken after meals", "It can be used to treat severe osteoporosis in men", "It should be stopped whenever spotting occurs"],
            answer: "It helps prevent pregnancy but does not protect against HIV or other sexually transmitted infections",
            explanation: "Combination oral contraceptives help prevent pregnancy but do not protect against HIV or other STIs.",
            objective: .pearl,
            relatedDrugIds: ["d180", "d177", "d181"],
            tags: ["10c", "coc", "sti-counseling"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_021",
            subsectionId: "10c",
            difficulty: .easy,
            question: "Ortho Tri-Cyclen is a combination oral contraceptive that also has a classic acne pearl. What is the generic name of Ortho Tri-Cyclen?",
            options: ["Ethinyl estradiol/Norgestimate", "Ethinyl estradiol/Levonorgestrel", "Drospirenone/Ethinyl estradiol", "Norethindrone", "Estradiol"],
            answer: "Ethinyl estradiol/Norgestimate",
            explanation: "Ortho Tri-Cyclen contains ethinyl estradiol and norgestimate.",
            objective: .brandGeneric,
            relatedDrugIds: ["d181"],
            tags: ["10c", "ortho-tri-cyclen", "brand->generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_022",
            subsectionId: "10c",
            difficulty: .easy,
            question: "Ethinyl estradiol/norgestimate is a combined oral contraceptive listed in your 10c outline. Which brand name matches it?",
            options: ["Ortho Tri-Cyclen", "Mirena", "Premarin", "Depo-Provera", "Evista"],
            answer: "Ortho Tri-Cyclen",
            explanation: "Ethinyl estradiol/norgestimate corresponds to the brand Ortho Tri-Cyclen.",
            objective: .genericBrand,
            relatedDrugIds: ["d181"],
            tags: ["10c", "ortho-tri-cyclen", "generic->brand"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_023",
            subsectionId: "10c",
            difficulty: .hard,
            question: "A teenager asks why Ortho Tri-Cyclen is sometimes discussed beyond contraception. Which additional labeled use is high yield?",
            options: ["Treatment of moderate acne in a patient who also desires oral contraception", "Rapid treatment of an acute yeast infection", "Smoking cessation in nicotine withdrawal", "Emergency contraception after missed periods", "Treatment of menopausal hot flashes"],
            answer: "Treatment of moderate acne in a patient who also desires oral contraception",
            explanation: "Ortho Tri-Cyclen has a high-yield acne indication, but it should be used for acne only when the patient also desires oral contraception.",
            objective: .indication,
            relatedDrugIds: ["d181"],
            tags: ["10c", "ortho-tri-cyclen", "acne", "indication"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_024",
            subsectionId: "10c",
            difficulty: .hard,
            question: "A patient over age 35 who smokes asks whether Ortho Tri-Cyclen is safer than other estrogen-containing birth control pills. Which answer is best?",
            options: ["No—like other combined oral contraceptives, it carries serious cardiovascular risk in smokers over 35", "Yes—norgestimate removes the smoking warning entirely", "Yes—it becomes safer as cigarette use increases", "No—because it contains only progesterone", "Yes—but only if paired with raloxifene"],
            answer: "No—like other combined oral contraceptives, it carries serious cardiovascular risk in smokers over 35",
            explanation: "Norgestimate/ethinyl estradiol is a combined oral contraceptive and shares the boxed smoking-related cardiovascular risk with other estrogen-containing COCs.",
            objective: .pearl,
            relatedDrugIds: ["d181", "d177", "d180"],
            tags: ["10c", "ortho-tri-cyclen", "smoking", "boxed-warning"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_025",
            subsectionId: "10c",
            difficulty: .easy,
            question: "Mirena is a long-acting reversible contraceptive inserted into the uterus by a clinician. Which hormone does Mirena release?",
            options: ["Levonorgestrel", "Etonogestrel", "Drospirenone", "Estradiol", "Testosterone"],
            answer: "Levonorgestrel",
            explanation: "Mirena is a levonorgestrel-releasing intrauterine system (IUD).",
            objective: .brandGeneric,
            relatedDrugIds: ["d182"],
            tags: ["10c", "mirena", "brand->generic", "levonorgestrel"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_026",
            subsectionId: "10c",
            difficulty: .medium,
            question: "A patient wants a “set it and forget it” option and asks how long Mirena can prevent pregnancy. Which answer is correct?",
            options: ["Up to 8 years for contraception", "Exactly 1 year only", "Only during the 3 weeks it remains inserted each month", "Up to 2 years because of bone loss", "For life after a single insertion"],
            answer: "Up to 8 years for contraception",
            explanation: "Mirena is indicated for prevention of pregnancy for up to 8 years.",
            objective: .dosing,
            relatedDrugIds: ["d182"],
            tags: ["10c", "mirena", "duration", "contraception"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_027",
            subsectionId: "10c",
            difficulty: .medium,
            question: "Which additional labeled use makes Mirena unique compared with many other contraceptive options in this subsection?",
            options: ["Treatment of heavy menstrual bleeding in women who choose intrauterine contraception", "Immediate treatment of bacterial cystitis", "Management of menopausal hot flashes", "Smoking cessation support", "Acute migraine rescue"],
            answer: "Treatment of heavy menstrual bleeding in women who choose intrauterine contraception",
            explanation: "Mirena is also indicated for treatment of heavy menstrual bleeding in women who choose intrauterine contraception.",
            objective: .indication,
            relatedDrugIds: ["d182"],
            tags: ["10c", "mirena", "heavy-menstrual-bleeding", "indication"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_028",
            subsectionId: "10c",
            difficulty: .hard,
            question: "A patient returns 2 months after Mirena placement worried because spotting and irregular bleeding have been more noticeable than expected. Which teaching point is best?",
            options: ["Irregular bleeding and spotting are common during the first 3 to 6 months after Mirena placement", "Any spotting means the IUD has definitely perforated the uterus", "Bleeding changes prove it is not working as contraception", "Mirena should never affect bleeding patterns", "Heavy bleeding must worsen permanently in all users"],
            answer: "Irregular bleeding and spotting are common during the first 3 to 6 months after Mirena placement",
            explanation: "Mirena can alter bleeding patterns, and irregular bleeding or spotting is common early after insertion, especially in the first 3 to 6 months.",
            objective: .adverseEffect,
            relatedDrugIds: ["d182"],
            tags: ["10c", "mirena", "bleeding", "adverse-effect"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_029",
            subsectionId: "10c",
            difficulty: .easy,
            question: "Depo-Provera is a long-acting hormonal contraceptive given by injection. What is the generic name of Depo-Provera in this subsection?",
            options: ["Medroxyprogesterone (depot)", "Norethindrone", "Progesterone", "Levonorgestrel", "Conjugated estrogens"],
            answer: "Medroxyprogesterone (depot)",
            explanation: "Depo-Provera CI is depot medroxyprogesterone acetate.",
            objective: .brandGeneric,
            relatedDrugIds: ["d183"],
            tags: ["10c", "depo-provera", "brand->generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_030",
            subsectionId: "10c",
            difficulty: .medium,
            question: "A patient chooses Depo-Provera because she does not want a daily pill. Which dosing schedule is correct for contraceptive use?",
            options: ["150 mg IM every 3 months (13 weeks)", "1 tablet every morning", "1 patch every week for 8 years", "1 ring every 24 hours", "60 mg subcutaneously every 6 months"],
            answer: "150 mg IM every 3 months (13 weeks)",
            explanation: "Depo-Provera CI is administered as a 150 mg deep intramuscular injection every 3 months (13 weeks).",
            objective: .dosing,
            relatedDrugIds: ["d183"],
            tags: ["10c", "depo-provera", "dosing", "q3months"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_031",
            subsectionId: "10c",
            difficulty: .hard,
            question: "Which boxed-warning teaching point is highest yield when counseling a young patient who wants to stay on Depo-Provera for many years?",
            options: ["It can cause significant bone mineral density loss, which increases with duration of use", "It is boxed for irreversible infertility after one injection", "It must always be taken with calcium carbonate at the same moment as the injection", "It is contraindicated because it contains estrogen", "It permanently raises testosterone in all users"],
            answer: "It can cause significant bone mineral density loss, which increases with duration of use",
            explanation: "Depo-Provera carries a boxed warning for loss of bone mineral density, which may increase with longer use and may not be completely reversible.",
            objective: .pearl,
            relatedDrugIds: ["d183"],
            tags: ["10c", "depo-provera", "bone-density", "boxed-warning"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_032",
            subsectionId: "10c",
            difficulty: .hard,
            question: "A patient plans pregnancy soon after stopping Depo-Provera and asks when fertility returns. Which counseling point is most accurate?",
            options: ["Return to ovulation and fertility can be delayed after stopping Depo-Provera", "Fertility always returns the next day", "Depo-Provera causes permanent infertility", "Fertility returns only after starting estrogen therapy", "Pregnancy is impossible for exactly 8 years after the final shot"],
            answer: "Return to ovulation and fertility can be delayed after stopping Depo-Provera",
            explanation: "After discontinuing Depo-Provera, return to ovulation and fertility may be delayed, so it is not the best option for someone seeking very rapid return to fertility.",
            objective: .pearl,
            relatedDrugIds: ["d183"],
            tags: ["10c", "depo-provera", "fertility", "counseling"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_033",
            subsectionId: "10c",
            difficulty: .easy,
            question: "Norethindrone is the progestin-only “mini-pill” in this subsection. Which brand name pair matches norethindrone here?",
            options: ["Micronor/Camila", "Premarin", "Evista", "Depo-Provera", "Mirena"],
            answer: "Micronor/Camila",
            explanation: "Norethindrone 0.35 mg progestin-only contraceptive tablets are associated with brands such as Micronor and Camila.",
            objective: .genericBrand,
            relatedDrugIds: ["d184"],
            tags: ["10c", "norethindrone", "generic->brand"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_034",
            subsectionId: "10c",
            difficulty: .medium,
            question: "A learner is comparing contraceptive options and notices that norethindrone lacks ethinyl estradiol. Which class best describes norethindrone in this subsection?",
            options: ["Progestin-only oral contraceptive", "Combined oral contraceptive", "Hormone-releasing IUD", "Selective estrogen receptor modulator", "Systemic estrogen replacement"],
            answer: "Progestin-only oral contraceptive",
            explanation: "Norethindrone in this subsection is the progestin-only oral contraceptive, often called the mini-pill.",
            objective: .classId,
            relatedDrugIds: ["d184"],
            tags: ["10c", "norethindrone", "class", "mini-pill"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_035",
            subsectionId: "10c",
            difficulty: .hard,
            question: "A patient switching from a combined pill to norethindrone asks what matters most for reliability. Which counseling point is highest yield?",
            options: ["Take it at the same time every day without gaps between packs", "Use it only during the placebo week of a combined pill", "Take it only when intercourse is expected", "Skip days with breakthrough spotting", "Take two tablets every Saturday to make up for missed doses"],
            answer: "Take it at the same time every day without gaps between packs",
            explanation: "Norethindrone progestin-only pills must be taken at the same time every day and used continuously to maximize contraceptive effectiveness.",
            objective: .dosing,
            relatedDrugIds: ["d184"],
            tags: ["10c", "norethindrone", "dosing", "same-time-daily"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_036",
            subsectionId: "10c",
            difficulty: .medium,
            question: "A patient on norethindrone reports that her cycle has become unpredictable. Which adverse-effect counseling point is most accurate for the progestin-only pill?",
            options: ["Irregular menstrual bleeding is common", "Orange-red urine is expected", "Severe tooth staining is routine", "Complete amenorrhea occurs in every patient", "It usually causes profound bradycardia"],
            answer: "Irregular menstrual bleeding is common",
            explanation: "Menstrual irregularity is one of the most common adverse effects of progestin-only pills such as norethindrone.",
            objective: .adverseEffect,
            relatedDrugIds: ["d184"],
            tags: ["10c", "norethindrone", "irregular-bleeding", "adverse-effect"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_037",
            subsectionId: "10c",
            difficulty: .medium,
            question: "Progesterone capsules are sometimes added for a very specific reason in postmenopausal hormone therapy. Which indication best fits oral progesterone in this subsection?",
            options: ["Prevention of endometrial hyperplasia in a woman with a uterus receiving estrogen therapy", "Rapid contraception after unprotected sex", "Long-term treatment of smoking dependence", "Immediate relief of hot flashes as monotherapy in all patients", "Direct treatment of urinary tract pain"],
            answer: "Prevention of endometrial hyperplasia in a woman with a uterus receiving estrogen therapy",
            explanation: "Oral progesterone is used in nonhysterectomized postmenopausal women receiving estrogen therapy to reduce endometrial hyperplasia risk.",
            objective: .indication,
            relatedDrugIds: ["d185", "d178", "d176"],
            tags: ["10c", "progesterone", "endometrial-hyperplasia", "indication"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_038",
            subsectionId: "10c",
            difficulty: .hard,
            question: "A patient taking progesterone capsules says they make her unusually sleepy. Which counseling point is most appropriate?",
            options: ["Take progesterone at bedtime because drowsiness and dizziness can occur", "Take it with an energy drink each morning", "Crush it into juice for faster effect", "Use it only on days with hot flashes", "Apply it to the shoulders like testosterone gel"],
            answer: "Take progesterone at bedtime because drowsiness and dizziness can occur",
            explanation: "Progesterone capsules can cause dizziness and drowsiness, which is why bedtime dosing is a common counseling point.",
            objective: .pearl,
            relatedDrugIds: ["d185"],
            tags: ["10c", "progesterone", "bedtime", "counseling"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_039",
            subsectionId: "10c",
            difficulty: .hard,
            question: "Which allergy history is especially important before prescribing oral progesterone capsules?",
            options: ["Peanut allergy", "Latex allergy", "Sulfonamide allergy", "Penicillin allergy", "Nickel allergy"],
            answer: "Peanut allergy",
            explanation: "Certain oral progesterone capsules contain peanut oil and should not be used in patients with peanut allergy.",
            objective: .contraindication,
            relatedDrugIds: ["d185"],
            tags: ["10c", "progesterone", "peanut-oil", "contraindication"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_040",
            subsectionId: "10c",
            difficulty: .easy,
            question: "Raloxifene is the selective estrogen receptor modulator in this subsection. Which brand name matches raloxifene?",
            options: ["Evista", "Premarin", "Mirena", "Depo-Provera", "AndroGel"],
            answer: "Evista",
            explanation: "Raloxifene corresponds to the brand name Evista.",
            objective: .genericBrand,
            relatedDrugIds: ["d186"],
            tags: ["10c", "raloxifene", "generic->brand"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_041",
            subsectionId: "10c",
            difficulty: .medium,
            question: "A patient asks what kind of drug Evista is, since it is not a typical estrogen replacement product. Which class best describes raloxifene?",
            options: ["Selective estrogen receptor modulator (SERM)", "Combined oral contraceptive", "Progestin-only pill", "Androgen replacement", "GnRH agonist"],
            answer: "Selective estrogen receptor modulator (SERM)",
            explanation: "Raloxifene is a SERM rather than a standard estrogen replacement therapy product.",
            objective: .classId,
            relatedDrugIds: ["d186"],
            tags: ["10c", "raloxifene", "class", "serm"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_042",
            subsectionId: "10c",
            difficulty: .hard,
            question: "Which patient is the poorest candidate for raloxifene therapy?",
            options: ["A woman with a history of deep vein thrombosis", "A postmenopausal woman with osteoporosis", "A patient who wants a daily tablet instead of an injection", "A woman who wishes to lower invasive breast cancer risk while addressing osteoporosis", "A patient who can take medicine without regard to meals"],
            answer: "A woman with a history of deep vein thrombosis",
            explanation: "Raloxifene increases the risk of venous thromboembolism and should not be used in women with active or prior VTE. It is also not for premenopausal women.",
            objective: .contraindication,
            relatedDrugIds: ["d186"],
            tags: ["10c", "raloxifene", "vte", "contraindication"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_043",
            subsectionId: "10c",
            difficulty: .medium,
            question: "Testosterone replacement is included in this module because endocrine and sexual-health medications often overlap. Which indication best fits testosterone therapy?",
            options: ["Replacement therapy in adult males with hypogonadism", "Routine treatment of menopausal hot flashes", "First-line treatment of postmenopausal osteoporosis", "Prevention of pregnancy", "Management of overactive bladder"],
            answer: "Replacement therapy in adult males with hypogonadism",
            explanation: "Testosterone is used as replacement therapy in adult males with certain forms of hypogonadism, not as a standard therapy for menopause or contraception.",
            objective: .indication,
            relatedDrugIds: ["d187"],
            tags: ["10c", "testosterone", "hypogonadism", "indication"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_044",
            subsectionId: "10c",
            difficulty: .hard,
            question: "A father using testosterone gel is told to wash his hands and keep the application site covered after the gel dries. Which boxed-warning issue is this counseling trying to prevent?",
            options: ["Secondary exposure causing virilization in children or others who contact the application site", "Immediate severe hypocalcemia", "Permanent infertility in the user after one dose", "Bone mineral density loss in adolescents", "Drug-induced angle-closure glaucoma"],
            answer: "Secondary exposure causing virilization in children or others who contact the application site",
            explanation: "Testosterone gels carry a boxed warning for secondary exposure; unwashed or uncovered application sites can transfer testosterone to others.",
            objective: .pearl,
            relatedDrugIds: ["d187"],
            tags: ["10c", "testosterone", "boxed-warning", "secondary-exposure"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10c_add_045",
            subsectionId: "10c",
            difficulty: .hard,
            question: "A patient on testosterone gel is being followed in clinic. Which monitoring plan is most appropriate and high yield?",
            options: ["Check testosterone response and monitor parameters such as hematocrit and PSA", "Monitor INR only, because testosterone is a vitamin K antagonist", "Only track body weight; no lab follow-up is needed", "Monitor TSH only", "Check serum calcium every 8 years"],
            answer: "Check testosterone response and monitor parameters such as hematocrit and PSA",
            explanation: "Patients on testosterone replacement are typically monitored for testosterone response and safety, including hematocrit and prostate-related monitoring such as PSA when appropriate.",
            objective: .monitoring,
            relatedDrugIds: ["d187"],
            tags: ["10c", "testosterone", "monitoring", "hematocrit", "psa"],
            source: .curated
        )
    ]
}
