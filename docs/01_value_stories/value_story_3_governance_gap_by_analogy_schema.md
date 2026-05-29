# Value Story 3 Draft Schema

## Governance Gap by Analogy

## 1. Purpose

This value story models how RBI could detect inconsistent AI governance treatment across similar use cases.

The goal is to show that the graph can identify cases where two initiatives have similar risk characteristics, but only one has gone through the expected AICO / AICoE / AI Act / GDPR / model-risk control path.

---

## 2. Core Demo Question

Which AI use cases have similar risk profiles but inconsistent governance coverage?

---

## 3. Demo Insight

A normal dashboard may show use cases by assigned risk level or review status.

The graph should show:

| Insight                  | Meaning                                                                                                          |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| Risk similarity          | Use cases may be similar because of data, users, channel, decision impact, and model type                        |
| Governance inconsistency | One similar use case has required controls while another does not                                                |
| Hidden risk escalation   | A use case may look low risk by name, but become higher risk because of authenticated context or customer impact |
| Control reuse            | Governance control patterns can be reused across similar use cases                                               |
| Review prioritization    | AICO/AICoE can focus on use cases with missing controls and high similarity to already-reviewed cases            |

---

## 4. Example Use Cases

| Use case                               | Country / unit           | Role in story                       | Users                                  | Main risk issue                                 |
| -------------------------------------- | ------------------------ | ----------------------------------- | -------------------------------------- | ----------------------------------------------- |
| Personalized Offer Engine              | Group CRM / CVM          | Reviewed reference case             | Campaign teams, retail customers       | Uses behavioural/customer data for targeting    |
| Product Recommendation Assistant       | Local digital bank       | Similar case with missing controls  | Retail customers                       | Could influence product choice                  |
| Loan Affordability Recommender         | Local retail credit team | Higher-risk similar case            | Customers, advisors                    | Credit-adjacent recommendation                  |
| Credit Pre-Approval Assistant          | Group / selected banks   | Reviewed higher-risk reference case | Customers, advisors                    | Influences credit access / eligibility          |
| Authenticated Mobile Banking Assistant | Local network bank       | Risk escalation case                | Retail customers                       | Uses authenticated customer/account context     |
| Public FAQ Assistant                   | Local digital channels   | Lower-risk comparator               | Prospects, retail customers            | Public product/service Q&A only                 |
| Complaint Triage Assistant             | Local contact center     | Sensitive-data case                 | Contact-center agents, complaints team | Processes complaint/customer communication data |

## Realism Rule

Do **not** classify all AI use cases as high risk.

Use differentiated risk logic:

| Risk level                    | Example                                                                                     |
| ----------------------------- | ------------------------------------------------------------------------------------------- |
| Lower risk                    | Public FAQ assistant using approved public product information                              |
| Medium risk                   | Customer-facing assistant answering product questions                                       |
| Higher risk                   | Authenticated assistant using customer/account context                                      |
| Higher risk / review priority | Credit-adjacent recommender, affordability recommender, personalized financial offer engine |

---

## 5. Business Context

| Layer                      | Content                                                                                              |
| -------------------------- | ---------------------------------------------------------------------------------------------------- |
| RBI group strategy         | Digital Bank with Human Touch                                                                        |
| Retail strategy pillars    | Acquire, Engage, Monetize                                                                            |
| Main pillar for this story | Monetize and Engage                                                                                  |
| Secondary pillar           | Acquire                                                                                              |
| Business processes         | Product recommendation, digital sales, credit pre-assessment, customer servicing, complaint handling |
| Governance context         | AICO, AICoE, EU AI Act readiness, GDPR, banking regulation, model-risk controls, audit readiness     |
| Reuse context              | Reusable governance control patterns for similar AI use cases                                        |

---

## 6. Required Node Types

| Node type            | Purpose                                 | Example values                                                         |
| -------------------- | --------------------------------------- | ---------------------------------------------------------------------- |
| `UseCase`            | AI initiative being assessed            | Personalized Offer Engine, Loan Affordability Recommender              |
| `NetworkBank`        | RBI network bank or group unit          | RBI Group, local bank                                                  |
| `Market`             | Country / jurisdiction                  | Austria, Slovakia, Kosovo, Croatia                                     |
| `UserGroup`          | Who uses or is affected by the solution | Retail customer, advisor, campaign manager                             |
| `Channel`            | Where the use case operates             | Mobile app, CRM, website, staff portal                                 |
| `BusinessProcess`    | Banking process supported               | Product recommendation, credit pre-assessment, complaint handling      |
| `StrategyPillar`     | Retail strategy alignment               | Acquire, Engage, Monetize                                              |
| `SolutionPattern`    | Type of AI solution                     | GenAI assistant, recommendation model, classifier, workflow automation |
| `DataDomain`         | Data used by the use case               | Customer profile, transactions, CRM, complaint history                 |
| `RiskTrigger`        | Why governance is required              | Uses personal data, influences product choice                          |
| `RiskClassification` | Assigned or inferred risk category      | Low, medium, high, AI Act relevant                                     |
| `Control`            | Required safeguard                      | Human oversight, explainability, fairness review                       |
| `GovernanceBody`     | Reviewer / governance forum             | AICO, AICoE, Legal, Compliance, Model Risk                             |
| `OrgUnit`            | Owner or delivery team                  | CRM/CVM, Retail Digital, Retail Risk, Contact Center                   |
| `Blueprint`          | Reusable governance pattern             | Customer-Facing AI Governance Pattern                                  |

---

## 7. Core Relationships

| Relationship              | From → To                      | Meaning                                     |
| ------------------------- | ------------------------------ | ------------------------------------------- |
| `IMPLEMENTED_IN`          | `UseCase → NetworkBank`        | Use case runs in this bank/unit             |
| `OPERATES_IN`             | `NetworkBank → Market`         | Bank belongs to this market                 |
| `SERVES`                  | `UseCase → UserGroup`          | User or affected party                      |
| `DELIVERED_THROUGH`       | `UseCase → Channel`            | Channel of use                              |
| `SUPPORTS_PROCESS`        | `UseCase → BusinessProcess`    | Banking process supported                   |
| `SUPPORTS_STRATEGY`       | `UseCase → StrategyPillar`     | Strategic alignment                         |
| `HAS_SOLUTION_PATTERN`    | `UseCase → SolutionPattern`    | Type of AI solution                         |
| `USES_DATA_DOMAIN`        | `UseCase → DataDomain`         | Data dependency                             |
| `HAS_RISK_TRIGGER`        | `UseCase → RiskTrigger`        | Governance risk factor                      |
| `HAS_RISK_CLASSIFICATION` | `UseCase → RiskClassification` | Assigned/inferred risk level                |
| `REQUIRES_CONTROL`        | `UseCase → Control`            | Control required                            |
| `HAS_COMPLETED_CONTROL`   | `UseCase → Control`            | Control completed                           |
| `MISSING_CONTROL`         | `UseCase → Control`            | Control missing or not evidenced            |
| `REVIEWED_BY`             | `UseCase → GovernanceBody`     | Governance review completed                 |
| `NEEDS_REVIEW_BY`         | `UseCase → GovernanceBody`     | Review required or recommended              |
| `OWNED_BY`                | `UseCase → OrgUnit`            | Business/solution ownership                 |
| `SIMILAR_RISK_TO`         | `UseCase → UseCase`            | Derived similarity relationship             |
| `CANDIDATE_FOR`           | `UseCase → Blueprint`          | Candidate for governance/control pattern    |
| `INCLUDES_CONTROL`        | `Blueprint → Control`          | Reusable control pattern                    |
| `TRIGGERED_BY`            | `Control → RiskTrigger`        | Control is required because of this trigger |

---

## 8. Suggested Node Properties

### `UseCase`

| Property                    | Example                                                                  |
| --------------------------- | ------------------------------------------------------------------------ |
| `id`                        | `UC_PERSONALIZED_OFFER_ENGINE`                                           |
| `name`                      | `Personalized Offer Engine`                                              |
| `description`               | `Uses customer and CRM signals to recommend relevant retail offers`      |
| `status`                    | `planned`, `pilot`, `production`                                         |
| `solution_type`             | `Recommendation Model`, `GenAI Assistant`, `Classifier`                  |
| `access_context`            | `public`, `authenticated`, `internal`                                    |
| `customer_impact`           | `informational`, `recommendation`, `decision_support`, `workflow_action` |
| `risk_level_assigned`       | `low`, `medium`, `high`                                                  |
| `governance_status`         | `not_started`, `in_review`, `reviewed`, `missing_evidence`               |
| `review_priority`           | `low`, `medium`, `high`                                                  |
| `source_tag`                | `S2`, `S3`, `S13`                                                        |
| `is_hypothetical_demo_case` | `true`                                                                   |

### `RiskTrigger`

| Property       | Example                                                               |
| -------------- | --------------------------------------------------------------------- |
| `name`         | `Influences product recommendation`                                   |
| `trigger_type` | `data`, `channel`, `decision_impact`, `model_type`, `customer_impact` |
| `severity`     | `low`, `medium`, `high`                                               |
| `description`  | `The output may influence which product is offered or selected`       |

### `Control`

| Property                  | Example                                                                       |
| ------------------------- | ----------------------------------------------------------------------------- |
| `name`                    | `Fairness / bias review`                                                      |
| `control_type`            | `governance`, `privacy`, `model-risk`, `operational`, `security`              |
| `mandatory_for_high_risk` | `true/false`                                                                  |
| `description`             | `Review whether model output creates unfair treatment across customer groups` |

### `RiskClassification`

| Property                | Example                                                                                          |
| ----------------------- | ------------------------------------------------------------------------------------------------ |
| `name`                  | `Medium - Customer-facing recommendation`                                                        |
| `classification_source` | `assigned`, `inferred`, `demo_rule`                                                              |
| `description`           | `Customer-facing use case with product recommendation influence but no automated final decision` |

---

## 9. Risk Triggers for Story 3

| Risk trigger                      | Example use cases                                                 |
| --------------------------------- | ----------------------------------------------------------------- |
| Uses personal data                | Personalized Offer Engine, Authenticated Mobile Banking Assistant |
| Uses behavioural data             | Personalized Offer Engine, Product Recommendation Assistant       |
| Uses transaction data             | Loan Affordability Recommender, Credit Pre-Approval Assistant     |
| Uses complaint data               | Complaint Triage Assistant                                        |
| Operates in authenticated channel | Authenticated Mobile Banking Assistant                            |
| Customer-facing GenAI output      | Authenticated Assistant, Public FAQ Assistant                     |
| Influences product recommendation | Product Recommendation Assistant, Personalized Offer Engine       |
| Credit-adjacent recommendation    | Loan Affordability Recommender, Credit Pre-Approval Assistant     |
| Supports staff decision-making    | Branch/advisor-facing recommender                                 |
| Performs workflow/action          | CRM lead creation, complaint routing                              |
| Uses sensitive communication data | Complaint Triage Assistant                                        |

---

## 10. Controls for Story 3

| Control                             | Triggered by                                                              |
| ----------------------------------- | ------------------------------------------------------------------------- |
| AICO review                         | Customer-facing AI, higher-risk AI, GenAI, credit-adjacent use cases      |
| AICoE technical review              | GenAI/agentic solutions, model-based solutions                            |
| GDPR review                         | Personal data, behavioural data, complaint data                           |
| Data minimization                   | Personal data, CRM, KYC, complaint data                                   |
| Human oversight                     | Credit-adjacent, recommendation, complaint handling                       |
| Explainability                      | Product recommendation, credit-adjacent decision support                  |
| Fairness / bias review              | Personalized offers, eligibility, affordability, credit-related use cases |
| Model validation                    | Recommendation models, ML models, credit-adjacent use cases               |
| Output grounding                    | GenAI assistants and product-information assistants                       |
| Content safety                      | GenAI assistants and customer-facing assistants                           |
| Audit logging                       | All production customer-facing or staff decision-support use cases        |
| Access control                      | Authenticated assistants and sensitive data use cases                     |
| Local regulatory/content validation | Market-specific customer-facing product guidance                          |

---

## 11. Governance Bodies / Org Units

| Node                         | Role                                                           |
| ---------------------------- | -------------------------------------------------------------- |
| AICO                         | AI governance committee / use-case review                      |
| AICoE                        | AI center of excellence / technical and methodological support |
| Legal & Compliance           | GDPR, customer communication, regulatory interpretation        |
| Model Risk / Risk Management | Model validation and risk review                               |
| Retail Digital               | Digital channel ownership                                      |
| CRM / CVM Team               | Campaign and personalization ownership                         |
| Retail Credit Team           | Credit and affordability use cases                             |
| Contact Center Operations    | Complaint/service triage ownership                             |
| CIO / Architecture           | Architecture and platform review                               |

---

## 12. Example Governance Gap Findings

| Reviewed use case              | Similar use case                                | Why similar                                                                  | Gap                                        |
| ------------------------------ | ----------------------------------------------- | ---------------------------------------------------------------------------- | ------------------------------------------ |
| Personalized Offer Engine      | Product Recommendation Assistant                | Both use customer/behavioural data and influence product choice              | Missing fairness review / GDPR evidence    |
| Credit Pre-Approval Assistant  | Loan Affordability Recommender                  | Both are credit-adjacent and influence access/eligibility                    | Missing model validation / human oversight |
| Authenticated Mobile Assistant | Public FAQ Assistant upgraded to mobile context | Similar assistant pattern, but authenticated channel adds personal data risk | Missing access control / audit logging     |
| Complaint Triage Assistant     | Customer Sentiment Classifier                   | Both process sensitive customer communication                                | Missing GDPR review / retention control    |

---

## 13. Risk Classification Logic for Demo

Use simple demo logic. Do not overcomplicate.

| Condition                                        | Suggested risk implication               |
| ------------------------------------------------ | ---------------------------------------- |
| Public FAQ + approved knowledge only             | Lower risk                               |
| Customer-facing GenAI + product answers          | Medium risk                              |
| Authenticated channel + customer/account context | Medium/high risk                         |
| Uses behavioural data for offer targeting        | Medium/high risk                         |
| Influences product recommendation                | Medium/high risk                         |
| Credit-adjacent recommendation                   | High review priority                     |
| Uses complaint or sensitive communication data   | Medium/high review priority              |
| Writes to CRM or triggers workflow action        | Requires additional operational controls |

---

## 14. Blueprint Definition

### `Customer-Facing AI Governance Pattern`

| Blueprint component | Included elements                                                                              |
| ------------------- | ---------------------------------------------------------------------------------------------- |
| Core controls       | AICO review, GDPR review, audit logging, content safety, output grounding                      |
| Additional controls | Human oversight, explainability, fairness review, model validation                             |
| Trigger logic       | personal data, customer-facing output, product recommendation, authenticated channel           |
| Use-case variants   | public FAQ assistant, authenticated assistant, product recommender, complaint triage assistant |
| Governance users    | AICO reviewer, AICoE reviewer, compliance reviewer, product owner                              |

---

## 15. Expected Graph Questions

| Question                                                                | Expected graph answer                                                                     |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| Which similar-risk use cases have inconsistent controls?                | Product Recommendation Assistant missing controls compared with Personalized Offer Engine |
| Which use cases need AICO review but do not show it?                    | Authenticated customer assistant, loan recommender, complaint triage assistant            |
| Which controls are most commonly missing in medium/high-risk use cases? | Fairness review, explainability, audit logging, human oversight                           |
| Which risk triggers drive the most governance requirements?             | Personal data, authenticated channel, product recommendation influence                    |
| Which lower-risk case becomes higher risk if moved into mobile banking? | Public FAQ Assistant upgraded to authenticated mobile context                             |
| Which use cases should reuse the same governance pattern?               | Customer-facing assistants, offer engines, recommendation assistants                      |
| Which teams need to be involved in review?                              | AICO, AICoE, Compliance, Model Risk, Retail Risk depending on triggers                    |

---

## 16. Minimum Seed Data for Story 3

| Data type                     | Target count |
| ----------------------------- | -----------: |
| Use cases                     |            7 |
| Network banks / units         |          4–6 |
| Markets                       |          4–6 |
| User groups                   |            6 |
| Channels                      |            5 |
| Business processes            |            5 |
| Strategy pillars              |            3 |
| Solution patterns             |            5 |
| Data domains                  |            8 |
| Risk triggers                 |        10–12 |
| Risk classifications          |          4–5 |
| Controls                      |        12–14 |
| Governance bodies / org units |          8–9 |
| Blueprints                    |            1 |

Expected relationship count: approximately **130–190**.

---

## 17. Story 3 Schema Spine

```text id="mxhin2"
NetworkBank
  → OPERATES_IN → Market

UseCase
  → IMPLEMENTED_IN → NetworkBank
  → SERVES → UserGroup
  → DELIVERED_THROUGH → Channel
  → SUPPORTS_PROCESS → BusinessProcess
  → SUPPORTS_STRATEGY → StrategyPillar
  → HAS_SOLUTION_PATTERN → SolutionPattern
  → USES_DATA_DOMAIN → DataDomain
  → HAS_RISK_TRIGGER → RiskTrigger
  → HAS_RISK_CLASSIFICATION → RiskClassification
  → REQUIRES_CONTROL → Control
  → HAS_COMPLETED_CONTROL → Control
  → MISSING_CONTROL → Control
  → REVIEWED_BY → GovernanceBody
  → NEEDS_REVIEW_BY → GovernanceBody
  → OWNED_BY → OrgUnit
  → SIMILAR_RISK_TO → UseCase
  → CANDIDATE_FOR → Blueprint

Control
  → TRIGGERED_BY → RiskTrigger

Blueprint
  → INCLUDES_CONTROL → Control
```

---

## 18. Modelling Decision

This value story requires `RiskTrigger`.

A simple `risk_level` property is not enough because the graph needs to explain **why** two use cases are similar from a governance perspective.

Correct distinction:

| Concept              | Example                     |
| -------------------- | --------------------------- |
| `RiskTrigger`        | Uses behavioural data       |
| `RiskClassification` | Medium/high review priority |
| `Control`            | Fairness / bias review      |
| `GovernanceBody`     | AICO                        |
| `UseCase`            | Personalized Offer Engine   |

The pattern is:

```text id="nvevs9"
UseCase
  → HAS_RISK_TRIGGER
RiskTrigger
  → TRIGGERED_BY / drives
Control

UseCase
  → REQUIRES_CONTROL
Control

UseCase
  → HAS_COMPLETED_CONTROL or MISSING_CONTROL
Control
```

This allows the graph to detect governance gaps by analogy.

---

## 19. What Not to Model in Story 3

| Excluded element                       | Reason                                                  |
| -------------------------------------- | ------------------------------------------------------- |
| Full legal interpretation of EU AI Act | Too heavy and risky for prototype                       |
| Detailed model registry                | Could be added later, but not required for demo insight |
| Full control evidence documents        | Represent as status/properties, not full document model |
| Detailed audit trail                   | Story 4 or future extension                             |
| Exact production architecture          | Not needed for governance-gap logic                     |
| Full risk scoring formula              | Use simple transparent demo rules                       |

---

## 20. Summary

Story 3 should show that graph-based governance is more powerful than a static risk dashboard.

The key insight is:

> If two use cases share similar risk triggers, but only one has completed the relevant controls, the other should be flagged for review.

This story adds the governance intelligence layer needed for RBI’s AI portfolio:

* risk triggers
* required controls
* completed/missing controls
* governance bodies
* similarity by relationship profile
* reusable governance patterns
