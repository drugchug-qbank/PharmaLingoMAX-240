import Foundation

extension DrugDataService {
    static let curatedContrastQuestions_7: [Question] = [

    // ─── 7b: Airway Role & Rescue vs Controller ───

    .multipleChoice(
        id: "q7_ctr_001",
        subsectionId: "7b",
        difficulty: .easy,
        question: "Which best describes albuterol's airway role?",
        options: ["Rescue / quick-relief bronchodilator", "Daily maintenance controller", "Combo ICS/LABA inhaler", "Oral leukotriene modifier", "Biologic add-on therapy"],
        answer: "Rescue / quick-relief bronchodilator",
        explanation: "Albuterol is a SABA — the classic rescue inhaler for acute bronchospasm, not a daily controller.",
        objective: .classId,
        relatedDrugIds: ["d120"],
        tags: ["7b", "airway-role", "rescue-vs-controller"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_002",
        subsectionId: "7b",
        difficulty: .easy,
        question: "Tiotropium (Spiriva) is best classified as which type of airway therapy?",
        options: ["Long-acting maintenance bronchodilator (LAMA)", "Short-acting rescue inhaler", "Inhaled corticosteroid controller", "Oral antihistamine", "PDE-4 inhibitor"],
        answer: "Long-acting maintenance bronchodilator (LAMA)",
        explanation: "Tiotropium is a LAMA — a once-daily maintenance bronchodilator for COPD, not a rescue inhaler.",
        objective: .classId,
        relatedDrugIds: ["d123"],
        tags: ["7b", "airway-role", "rescue-vs-controller"],
        source: .curated
    ),

    .trueFalse(
        id: "q7_ctr_003",
        subsectionId: "7b",
        difficulty: .easy,
        question: "True or false: Ipratropium (Atrovent) is a long-acting maintenance anticholinergic like tiotropium.",
        answer: false,
        explanation: "Ipratropium is SHORT-acting (SAMA). Tiotropium is the long-acting (LAMA) counterpart used for daily COPD maintenance.",
        objective: .classId,
        relatedDrugIds: ["d122"],
        tags: ["7b", "airway-role", "contrast-pair", "rescue-vs-controller"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_004",
        subsectionId: "7b",
        difficulty: .medium,
        question: "A patient needs a quick-relief inhaler for acute wheezing. Which is the best choice?",
        options: ["Albuterol (ProAir/Ventolin)", "Tiotropium (Spiriva)", "Fluticasone inhaled (Flovent)", "Montelukast (Singulair)", "Umeclidinium/Vilanterol (Anoro)"],
        answer: "Albuterol (ProAir/Ventolin)",
        explanation: "Albuterol is the first-line rescue SABA. Tiotropium and Anoro are maintenance; Flovent is a controller ICS; montelukast is an oral controller.",
        objective: .indication,
        relatedDrugIds: ["d120"],
        tags: ["7b", "rescue-vs-controller", "differentiator"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_005",
        subsectionId: "7b",
        difficulty: .medium,
        question: "Which statement best differentiates ipratropium from tiotropium?",
        options: ["Ipratropium is short-acting (rescue adjunct); tiotropium is long-acting (daily maintenance)", "Ipratropium is a LABA; tiotropium is a SABA", "Ipratropium is an ICS; tiotropium is a LAMA", "Both are identical rescue inhalers", "Tiotropium is short-acting; ipratropium is long-acting"],
        answer: "Ipratropium is short-acting (rescue adjunct); tiotropium is long-acting (daily maintenance)",
        explanation: "Both are anticholinergic bronchodilators, but ipratropium = SAMA (short-acting) and tiotropium = LAMA (long-acting, once daily).",
        objective: .classId,
        relatedDrugIds: ["d122", "d123"],
        tags: ["7b", "contrast-pair", "differentiator"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_006",
        subsectionId: "7b",
        difficulty: .medium,
        question: "Anoro Ellipta contains umeclidinium and vilanterol. What are the drug classes of these two ingredients?",
        options: ["LAMA + LABA", "SABA + SAMA", "ICS + LABA", "ICS + LAMA", "LTRA + SABA"],
        answer: "LAMA + LABA",
        explanation: "Anoro Ellipta is a LAMA/LABA combination — umeclidinium (LAMA) + vilanterol (LABA) — for COPD maintenance.",
        objective: .classId,
        relatedDrugIds: ["d124"],
        tags: ["7b", "combo-decomposition", "airway-role"],
        source: .curated
    ),

    .trueFalse(
        id: "q7_ctr_007",
        subsectionId: "7b",
        difficulty: .easy,
        question: "True or false: Levalbuterol (Xopenex) is the R-enantiomer of albuterol and is also classified as a SABA rescue inhaler.",
        answer: true,
        explanation: "Levalbuterol is the R-enantiomer of albuterol. Both are SABAs used for rescue/quick relief of acute bronchospasm.",
        objective: .classId,
        relatedDrugIds: ["d121"],
        tags: ["7b", "airway-role", "contrast-pair"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_008",
        subsectionId: "7b",
        difficulty: .hard,
        question: "A COPD patient uses albuterol multiple times daily for breathlessness. The provider wants to add a once-daily maintenance bronchodilator. Which is the best fit?",
        options: ["Tiotropium (Spiriva)", "More frequent albuterol", "Ipratropium (Atrovent)", "Montelukast (Singulair)", "Diphenhydramine (Benadryl)"],
        answer: "Tiotropium (Spiriva)",
        explanation: "Tiotropium is a once-daily LAMA — the COPD maintenance cornerstone. It reduces the need for frequent rescue albuterol. Ipratropium is short-acting and not ideal for daily maintenance alone.",
        objective: .indication,
        relatedDrugIds: ["d123", "d120"],
        tags: ["7b", "mini-case", "rescue-vs-controller", "differentiator"],
        source: .curated
    ),

    // ─── 7c: ICS vs Combo, Combo Decomposition, LABA Monotherapy ───

    .multipleChoice(
        id: "q7_ctr_010",
        subsectionId: "7c",
        difficulty: .easy,
        question: "Which best describes fluticasone inhaled (Flovent) in the airway therapy framework?",
        options: ["Controller — inhaled corticosteroid for daily maintenance", "Rescue bronchodilator for acute symptoms", "Combo ICS/LABA inhaler", "Oral leukotriene modifier", "Nasal steroid for allergic rhinitis"],
        answer: "Controller — inhaled corticosteroid for daily maintenance",
        explanation: "Inhaled fluticasone (Flovent) is an ICS controller for persistent asthma maintenance. It is NOT a rescue inhaler.",
        objective: .classId,
        relatedDrugIds: ["d114"],
        tags: ["7c", "airway-role", "rescue-vs-controller"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_011",
        subsectionId: "7c",
        difficulty: .easy,
        question: "Advair contains which two active ingredients?",
        options: ["Fluticasone + Salmeterol", "Budesonide + Formoterol", "Mometasone + Formoterol", "Fluticasone + Formoterol", "Budesonide + Salmeterol"],
        answer: "Fluticasone + Salmeterol",
        explanation: "Advair = fluticasone (ICS) + salmeterol (LABA). This ICS/LABA combo is used for maintenance control when ICS alone is insufficient.",
        objective: .brandGeneric,
        relatedDrugIds: ["d116"],
        tags: ["7c", "combo-decomposition", "airway-role"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_012",
        subsectionId: "7c",
        difficulty: .easy,
        question: "Symbicort contains which two active ingredients?",
        options: ["Budesonide + Formoterol", "Fluticasone + Salmeterol", "Mometasone + Formoterol", "Budesonide + Salmeterol", "Fluticasone + Formoterol"],
        answer: "Budesonide + Formoterol",
        explanation: "Symbicort = budesonide (ICS) + formoterol (LABA). It is SMART-eligible: used for both maintenance and reliever therapy.",
        objective: .brandGeneric,
        relatedDrugIds: ["d117"],
        tags: ["7c", "combo-decomposition", "airway-role"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_013",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Dulera contains which two active ingredients?",
        options: ["Mometasone + Formoterol", "Fluticasone + Salmeterol", "Budesonide + Formoterol", "Mometasone + Salmeterol", "Fluticasone + Formoterol"],
        answer: "Mometasone + Formoterol",
        explanation: "Dulera = mometasone (ICS) + formoterol (LABA). It is an MDI formulation ICS/LABA combo for asthma maintenance.",
        objective: .brandGeneric,
        relatedDrugIds: ["d119"],
        tags: ["7c", "combo-decomposition"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_014",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Which statement best differentiates Flovent from Advair?",
        options: ["Flovent is ICS only; Advair adds salmeterol (LABA) to fluticasone", "Advair is ICS only; Flovent is the combo product", "Both are identical rescue inhalers", "Flovent is a LABA; Advair is an ICS", "Advair contains budesonide, not fluticasone"],
        answer: "Flovent is ICS only; Advair adds salmeterol (LABA) to fluticasone",
        explanation: "Flovent = fluticasone alone (pure ICS). Advair = fluticasone + salmeterol (ICS/LABA combo). The step-up from ICS to ICS/LABA is a key concept.",
        objective: .classId,
        relatedDrugIds: ["d114", "d116"],
        tags: ["7c", "contrast-pair", "differentiator", "combo-decomposition"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_015",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Which statement best differentiates Symbicort from Advair?",
        options: ["Symbicort = budesonide + formoterol; Advair = fluticasone + salmeterol", "Both contain the exact same ingredients", "Advair uses formoterol; Symbicort uses salmeterol", "Symbicort is rescue-only; Advair is maintenance", "Advair contains budesonide; Symbicort contains fluticasone"],
        answer: "Symbicort = budesonide + formoterol; Advair = fluticasone + salmeterol",
        explanation: "Both are ICS/LABA combos but pair different steroids with different LABAs. Symbicort is also SMART-eligible (maintenance AND reliever).",
        objective: .classId,
        relatedDrugIds: ["d117", "d116"],
        tags: ["7c", "contrast-pair", "differentiator", "combo-decomposition"],
        source: .curated
    ),

    .trueFalse(
        id: "q7_ctr_016",
        subsectionId: "7c",
        difficulty: .medium,
        question: "True or false: Salmeterol (Serevent) can be safely used alone as monotherapy in asthma.",
        answer: false,
        explanation: "LABA monotherapy in asthma carries a Black Box Warning for increased asthma-related death. Salmeterol must always be paired with an ICS in asthma.",
        objective: .contraindication,
        relatedDrugIds: ["d118"],
        tags: ["7c", "laba-monotherapy", "rescue-vs-controller"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_017",
        subsectionId: "7c",
        difficulty: .hard,
        question: "An asthma patient on Flovent alone still has frequent symptoms. The provider steps up to a combo inhaler. Which product adds a LABA to fluticasone?",
        options: ["Advair (fluticasone/salmeterol)", "Symbicort (budesonide/formoterol)", "Dulera (mometasone/formoterol)", "Anoro Ellipta (umeclidinium/vilanterol)", "Pulmicort (budesonide)"],
        answer: "Advair (fluticasone/salmeterol)",
        explanation: "Advair adds salmeterol (LABA) to fluticasone (the same ICS in Flovent). It's the natural step-up from Flovent monotherapy.",
        objective: .indication,
        relatedDrugIds: ["d116", "d114"],
        tags: ["7c", "mini-case", "contrast-pair", "combo-decomposition"],
        source: .curated
    ),

    .matching(
        id: "q7_ctr_018",
        subsectionId: "7c",
        difficulty: .hard,
        question: "Match each combo inhaler to its ingredients:",
        pairs: [
            MatchingPair(left: "Advair", right: "Fluticasone + Salmeterol"),
            MatchingPair(left: "Symbicort", right: "Budesonide + Formoterol"),
            MatchingPair(left: "Dulera", right: "Mometasone + Formoterol"),
            MatchingPair(left: "Anoro Ellipta", right: "Umeclidinium + Vilanterol"),
        ],
        explanation: "Advair, Symbicort, and Dulera are ICS/LABA combos with different steroid components. Anoro is LAMA/LABA (no steroid).",
        objective: .brandGeneric,
        relatedDrugIds: ["d116", "d117", "d119", "d124"],
        tags: ["7c", "combo-decomposition", "matching", "contrast-class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_019",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Pulmicort (budesonide inhaled) is an ICS controller. What distinguishes it from Symbicort?",
        options: ["Pulmicort is ICS only; Symbicort adds formoterol (LABA)", "Pulmicort is the combo product; Symbicort is pure ICS", "Both are identical formulations", "Pulmicort is a rescue inhaler; Symbicort is maintenance", "Symbicort contains fluticasone; Pulmicort contains mometasone"],
        answer: "Pulmicort is ICS only; Symbicort adds formoterol (LABA)",
        explanation: "Pulmicort = budesonide alone (ICS). Symbicort = budesonide + formoterol (ICS/LABA combo). Same ICS, but Symbicort adds a LABA.",
        objective: .classId,
        relatedDrugIds: ["d115", "d117"],
        tags: ["7c", "contrast-pair", "differentiator", "combo-decomposition"],
        source: .curated
    ),

    // ─── 7c/7e Crossover: Inhaled vs Nasal Steroid ───

    .multipleChoice(
        id: "q7_ctr_020",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Fluticasone is available as both an inhaled and a nasal product. Which statement is correct?",
        options: ["Inhaled fluticasone (Flovent) treats asthma; nasal fluticasone (Flonase) treats allergic rhinitis", "Both Flovent and Flonase are for asthma only", "Flonase is the rescue version; Flovent is the allergy version", "Flovent and Flonase are the same product with different names", "Nasal fluticasone treats asthma; inhaled fluticasone treats rhinitis"],
        answer: "Inhaled fluticasone (Flovent) treats asthma; nasal fluticasone (Flonase) treats allergic rhinitis",
        explanation: "Same drug, different routes: Flovent = lungs (asthma controller); Flonase = nose (allergic rhinitis). This is a high-yield distinction.",
        objective: .indication,
        relatedDrugIds: ["d114", "d249"],
        tags: ["7c", "route-distinction", "contrast-pair", "differentiator"],
        source: .curated
    ),

    // ─── 7d: Oral Controllers & Biologics ───

    .multipleChoice(
        id: "q7_ctr_021",
        subsectionId: "7d",
        difficulty: .easy,
        question: "What is montelukast's airway role?",
        options: ["Oral controller — leukotriene receptor antagonist", "Rescue bronchodilator", "Inhaled corticosteroid", "Biologic add-on", "Decongestant"],
        answer: "Oral controller — leukotriene receptor antagonist",
        explanation: "Montelukast (Singulair) is an oral LTRA controller for asthma and allergic rhinitis. It is NOT a rescue inhaler.",
        objective: .classId,
        relatedDrugIds: ["d125"],
        tags: ["7d", "airway-role", "rescue-vs-controller"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_022",
        subsectionId: "7d",
        difficulty: .medium,
        question: "Which statement best differentiates omalizumab from dupilumab?",
        options: ["Omalizumab targets IgE (allergic asthma); dupilumab targets IL-4/IL-13 (eosinophilic asthma + eczema)", "Both target the same pathway", "Dupilumab is for allergic asthma only; omalizumab is for eczema", "Omalizumab is oral; dupilumab is inhaled", "Both are rescue therapies"],
        answer: "Omalizumab targets IgE (allergic asthma); dupilumab targets IL-4/IL-13 (eosinophilic asthma + eczema)",
        explanation: "Omalizumab (Xolair) = anti-IgE for allergic asthma. Dupilumab (Dupixent) = anti-IL-4/IL-13 for eosinophilic asthma, atopic dermatitis, and nasal polyps.",
        objective: .moa,
        relatedDrugIds: ["d126", "d127"],
        tags: ["7d", "contrast-pair", "differentiator"],
        source: .curated
    ),

    .trueFalse(
        id: "q7_ctr_023",
        subsectionId: "7d",
        difficulty: .medium,
        question: "True or false: Roflumilast (Daliresp) is a bronchodilator used for acute asthma relief.",
        answer: false,
        explanation: "Roflumilast is a PDE-4 inhibitor for severe COPD. It is NOT a bronchodilator and is NOT for acute relief or asthma.",
        objective: .classId,
        relatedDrugIds: ["d128"],
        tags: ["7d", "airway-role", "rescue-vs-controller"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_024",
        subsectionId: "7d",
        difficulty: .hard,
        question: "A patient with moderate-severe allergic asthma and elevated IgE levels needs a biologic add-on. Which is the best match?",
        options: ["Omalizumab (Xolair)", "Dupilumab (Dupixent)", "Montelukast (Singulair)", "Roflumilast (Daliresp)", "Theophylline (Theo-24)"],
        answer: "Omalizumab (Xolair)",
        explanation: "Omalizumab binds free IgE and is specifically indicated for moderate-severe allergic asthma with documented IgE elevation. Dupilumab targets the IL-4/IL-13 pathway instead.",
        objective: .indication,
        relatedDrugIds: ["d126"],
        tags: ["7d", "mini-case", "differentiator"],
        source: .curated
    ),

    .matching(
        id: "q7_ctr_025",
        subsectionId: "7d",
        difficulty: .hard,
        question: "Match each controller to its mechanism:",
        pairs: [
            MatchingPair(left: "Montelukast", right: "Leukotriene receptor antagonist"),
            MatchingPair(left: "Omalizumab", right: "Anti-IgE monoclonal antibody"),
            MatchingPair(left: "Dupilumab", right: "Anti-IL-4/IL-13 monoclonal antibody"),
            MatchingPair(left: "Theophylline", right: "Methylxanthine bronchodilator"),
        ],
        explanation: "Each agent has a distinct mechanism: LTRA, anti-IgE, anti-IL-4/IL-13, and methylxanthine. Roflumilast (PDE-4) is another distinct class.",
        objective: .moa,
        relatedDrugIds: ["d125", "d126", "d127", "d129"],
        tags: ["7d", "matching", "contrast-class", "differentiator"],
        source: .curated
    ),

    // ─── 7e: Antihistamine Generations, Nasal Steroid vs Antihistamine, Combo ───

    .multipleChoice(
        id: "q7_ctr_030",
        subsectionId: "7e",
        difficulty: .easy,
        question: "Which best describes diphenhydramine (Benadryl) compared to cetirizine (Zyrtec)?",
        options: ["Diphenhydramine is 1st-gen (very sedating); cetirizine is 2nd-gen (less sedating)", "Both are equally non-sedating", "Cetirizine is 1st-gen; diphenhydramine is 2nd-gen", "Both are nasal steroids", "Both are decongestants"],
        answer: "Diphenhydramine is 1st-gen (very sedating); cetirizine is 2nd-gen (less sedating)",
        explanation: "1st-gen antihistamines like diphenhydramine cross the BBB and cause significant sedation. 2nd-gen agents like cetirizine are preferred for less sedation.",
        objective: .classId,
        relatedDrugIds: ["d247", "d246"],
        tags: ["7e", "contrast-pair", "differentiator"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_031",
        subsectionId: "7e",
        difficulty: .easy,
        question: "Which antihistamine is considered the LEAST sedating?",
        options: ["Fexofenadine (Allegra)", "Diphenhydramine (Benadryl)", "Cetirizine (Zyrtec)", "Levocetirizine (Xyzal)", "Loratadine (Claritin)"],
        answer: "Fexofenadine (Allegra)",
        explanation: "Fexofenadine is widely regarded as the least sedating antihistamine. It does not cross the blood-brain barrier significantly.",
        objective: .pearl,
        relatedDrugIds: ["d248"],
        tags: ["7e", "differentiator", "airway-role"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_032",
        subsectionId: "7e",
        difficulty: .medium,
        question: "Fluticasone nasal (Flonase) and azelastine nasal (Astelin) are both nasal sprays for allergic rhinitis. What is the key difference?",
        options: ["Flonase is a nasal steroid (most effective class); Astelin is a nasal antihistamine (faster onset)", "Both are nasal steroids", "Both are nasal antihistamines", "Flonase is oral; Astelin is nasal", "Astelin is more effective long-term than Flonase"],
        answer: "Flonase is a nasal steroid (most effective class); Astelin is a nasal antihistamine (faster onset)",
        explanation: "Intranasal steroids like Flonase are the most effective class for allergic rhinitis. Azelastine (nasal antihistamine) has faster onset but is generally less effective long-term.",
        objective: .classId,
        relatedDrugIds: ["d249", "d245"],
        tags: ["7e", "contrast-pair", "differentiator"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_033",
        subsectionId: "7e",
        difficulty: .medium,
        question: "What distinguishes Claritin-D from regular Claritin?",
        options: ["Claritin-D adds pseudoephedrine (decongestant) to loratadine", "Claritin-D removes the antihistamine component", "Claritin-D is a nasal spray version", "There is no difference", "Claritin-D is prescription-only because it contains a steroid"],
        answer: "Claritin-D adds pseudoephedrine (decongestant) to loratadine",
        explanation: "Claritin = loratadine only. Claritin-D = loratadine + pseudoephedrine. The '-D' signals added decongestant for nasal congestion relief.",
        objective: .classId,
        relatedDrugIds: ["d252", "d251"],
        tags: ["7e", "combo-decomposition", "contrast-pair", "differentiator"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_034",
        subsectionId: "7e",
        difficulty: .medium,
        question: "Which statement best differentiates cetirizine (Zyrtec) from levocetirizine (Xyzal)?",
        options: ["Levocetirizine is the active R-enantiomer of cetirizine; both are 2nd-gen antihistamines", "Cetirizine is 1st-gen; levocetirizine is 2nd-gen", "Levocetirizine is a nasal spray; cetirizine is oral", "They target completely different receptors", "Cetirizine is the enantiomer of levocetirizine's prodrug"],
        answer: "Levocetirizine is the active R-enantiomer of cetirizine; both are 2nd-gen antihistamines",
        explanation: "Levocetirizine (Xyzal) is the active R-enantiomer of cetirizine (Zyrtec). Both are 2nd-gen oral antihistamines with similar efficacy.",
        objective: .classId,
        relatedDrugIds: ["d246", "d250"],
        tags: ["7e", "contrast-pair", "differentiator"],
        source: .curated
    ),

    .trueFalse(
        id: "q7_ctr_035",
        subsectionId: "7e",
        difficulty: .medium,
        question: "True or false: Pseudoephedrine (Sudafed) should be avoided in patients with uncontrolled hypertension.",
        answer: true,
        explanation: "Pseudoephedrine is a sympathomimetic decongestant that can raise blood pressure. It is contraindicated in uncontrolled hypertension.",
        objective: .contraindication,
        relatedDrugIds: ["d254"],
        tags: ["7e", "airway-role", "rescue-vs-controller"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7_ctr_036",
        subsectionId: "7e",
        difficulty: .hard,
        question: "A 75-year-old with allergic rhinitis needs an oral antihistamine. Diphenhydramine is a poor choice here. Why?",
        options: ["1st-gen antihistamines are sedating and anticholinergic — avoid in elderly (Beers Criteria)", "Diphenhydramine is too weak for allergic rhinitis", "Diphenhydramine only works for motion sickness", "Diphenhydramine interacts with nasal steroids", "Diphenhydramine causes hypertension in the elderly"],
        answer: "1st-gen antihistamines are sedating and anticholinergic — avoid in elderly (Beers Criteria)",
        explanation: "Diphenhydramine's anticholinergic effects (sedation, confusion, urinary retention, dry mouth) are especially risky in elderly patients. A 2nd-gen agent is preferred.",
        objective: .contraindication,
        relatedDrugIds: ["d247"],
        tags: ["7e", "mini-case", "differentiator"],
        source: .curated
    ),

    .matching(
        id: "q7_ctr_037",
        subsectionId: "7e",
        difficulty: .hard,
        question: "Match each allergy drug to its class:",
        pairs: [
            MatchingPair(left: "Diphenhydramine", right: "1st-gen antihistamine"),
            MatchingPair(left: "Fexofenadine", right: "2nd-gen antihistamine (least sedating)"),
            MatchingPair(left: "Fluticasone nasal", right: "Intranasal corticosteroid"),
            MatchingPair(left: "Azelastine nasal", right: "Intranasal antihistamine"),
        ],
        explanation: "Four distinct allergy drug classes: oral 1st-gen, oral 2nd-gen, nasal steroid, and nasal antihistamine.",
        objective: .classId,
        relatedDrugIds: ["d247", "d248", "d249", "d245"],
        tags: ["7e", "matching", "contrast-class", "differentiator"],
        source: .curated
    ),

    // ─── Cross-subsection: Big-Picture Rescue vs Controller ───

    .matching(
        id: "q7_ctr_040",
        subsectionId: "7b",
        difficulty: .hard,
        question: "Match each drug to its airway role:",
        pairs: [
            MatchingPair(left: "Albuterol", right: "Rescue SABA"),
            MatchingPair(left: "Tiotropium", right: "Maintenance LAMA"),
            MatchingPair(left: "Fluticasone inhaled", right: "Controller ICS"),
            MatchingPair(left: "Montelukast", right: "Oral Controller (LTRA)"),
        ],
        explanation: "Rescue = albuterol (SABA). Maintenance bronchodilator = tiotropium (LAMA). Controller = fluticasone ICS. Oral controller = montelukast LTRA.",
        objective: .classId,
        relatedDrugIds: ["d120", "d123", "d114", "d125"],
        tags: ["7b", "matching", "airway-role", "rescue-vs-controller", "contrast-class"],
        source: .curated
    ),

    ]
}
