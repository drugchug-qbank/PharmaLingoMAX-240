# Replace random bucket lesson planner with drug-centric adaptive pathway

## Overview

Replace the current random-bucket quiz engine for normal Learn sessions with a **drug-focused, stage-aware adaptive lesson planner**. Mastery/boss sessions stay as-is (review-focused).

---

## What Changes

### 1. New Learning Stage System (`DrugMasteryService.swift`)
- Add a `DrugLearningStage` enum with 5 stages: `foundation → indication → safety → practical → advanced`
- Add a `learningStage(for:masteryMap:)` method that determines each drug's current stage using transparent thresholds:
  - **Foundation** stable when names + classMOA buckets have combined attempts ≥ 4 and accuracy ≥ 0.75
  - **Indications** stable when attempts ≥ 2 and accuracy ≥ 0.75
  - **Safety** stable when attempts ≥ 2 and accuracy ≥ 0.75
  - **Practical (dosing/monitoring)** stable when attempts ≥ 1 and accuracy ≥ 0.70
  - **Advanced** unlocked only after all earlier stages are reasonably stable
- Add `relevantMasteryRecords(for:subsectionDrugIds:masteryMap:)` helper that scopes mastery lookups strictly to a subsection's drug IDs

### 2. Drug-Centric Lesson Builder (`QuizEngine.swift`)
Replace `buildLessonSession()` and `selectTeachingArcQuestions()` with:

- **`selectFocusDrugs(subsection:masteryMap:)`** — picks 2–4 focus drugs from the subsection, prioritizing weaker drugs first (lowest stage / lowest accuracy)
- **`learningStage(for:masteryMap:)`** — delegates to the new DrugMasteryService method
- **`buildDrugBurst(for:stage:...)`** — builds a 2-question linked burst for a specific drug at its current stage:
  - Foundation → suffix/class, brand/generic, simple MCQ, fill-blank, true/false only
  - Indication → indication MCQ, fill-blank, vignette-lite
  - Safety → side effect, contraindication, black-box questions
  - Practical → dosing, monitoring (only if drug has `commonDosing`)
  - Advanced → pearls, vignettes, matching, select-all
- **`insertReviewQuestions(into:completedSubsections:count:masteryMap:)`** — weaves 15–30% review questions from completed subsections into the session
- **`smoothVariety(questions:)`** — post-processing pass that:
  - Ensures no more than 2 consecutive questions on the same drug (unless intentional remediation)
  - Ensures first 3 questions are easy/medium and NOT select-all
  - Prevents matching before foundation questions have appeared for that drug
  - Prevents select-all until advanced stage
  - Swaps to avoid 3+ same type or objective in a row

### 3. Format/Difficulty Guardrails (inside QuizEngine)
- First 3 questions must be easy/medium, no select-all
- Matching only appears after at least one foundation question for that drug has been shown
- Select-all only in advanced stage
- Dosing never forced if drug has no `commonDosing`
- Pearls/vignettes/advanced differentiators mostly in stage 4 (advanced)

### 4. Fix Mastery Scoping (`QuizEngine.swift`)
- Replace the buggy `averageMastery()` method (which uses `$0.key.contains(subsectionId)`) with `relevantMasteryRecords(for:)` that strictly filters by the subsection's actual drug IDs and known objective keys

### 5. Mastery/Boss Sessions — No Changes to Flow
- Keep mastery sessions as review-only mixed content
- No new-drug teaching flow in boss battles
- No structural changes to `buildMasterySession()`

---

## Files Changed

| File | What Changes |
|------|-------------|
| `ios/PharmaLingo/Services/DrugMasteryService.swift` | Add `DrugLearningStage` enum, `learningStage(for:masteryMap:)`, `relevantMasteryRecords(for:subsectionDrugIds:masteryMap:)` |
| `ios/PharmaLingo/Services/QuizEngine.swift` | Rewrite `buildLessonSession()` and helpers with drug-centric adaptive pathway; fix mastery scoping; add `selectFocusDrugs`, `buildDrugBurst`, `insertReviewQuestions`, `smoothVariety` |

---

## What Stays the Same
- All UI views remain untouched
- `QuizViewModel`, `QuizView`, question models, `HighYieldQuestionFactory`, `QuestionFactory` — no changes
- Mastery/boss session logic — no structural changes
- The app compiles and works identically from the user's perspective, just with smarter lesson planning
