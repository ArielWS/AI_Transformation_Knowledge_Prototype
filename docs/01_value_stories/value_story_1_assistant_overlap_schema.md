# Value Story 1 Draft Schema

## Assistant Overlap → Reusable Retail Conversational Banking Assistant Blueprint

## 1. Purpose

This value story models how RBI could identify overlap across country-level assistant initiatives and convert the strongest common patterns into a reusable group blueprint.

The goal is **not** to show that all assistants are identical. The realistic insight is:

> Four customer-facing banking assistants show strong overlap, while a voicebot and an internal knowledge assistant share selected reusable functions but should be treated as adjacent blueprint variants.

---

## 2. Core Demo Question

Which assistant initiatives across RBI network banks are similar enough to justify a reusable blueprint, and which elements should be standardized across group and local implementations?

---

## 3. Demo Insight

A normal dashboard may show assistant projects by country and status.

The graph should show:

| Insight                  | Meaning                                                                                                             |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------- |
| Strong assistant overlap | Several country assistants share users, channels, knowledge needs, controls, and reusable functions                 |
| Partial overlap          | Voicebots and staff copilots reuse selected components but are not identical                                        |
| Blueprint candidate      | A reusable conversational banking assistant pattern can be derived                                                  |
| Risk variation           | Public FAQ assistants, authenticated assistants, voicebots, and internal assistants need different controls         |
| Reuse opportunity        | Product knowledge retrieval, intent detection, human handoff, audit logging, and content safety can be standardized |

---

## 4. Example Use Cases

| Use case                           | Country / unit         | Role in story            | Users                                             | Channels                              |
| ---------------------------------- | ---------------------- | ------------------------ | ------------------------------------------------- | ------------------------------------- |
| Adam TB                            | Slovakia / Tatra banka | Core overlap             | Retail customers                                  | Mobile app, website, internet banking |
| RAIA Kosovo                        | Kosovo                 | Core overlap             | Retail customers                                  | Website, mobile banking               |
| RAIA Bosnia                        | Bosnia                 | Core overlap             | Retail customers                                  | Mobile banking, website               |
| RAIA Croatia                       | Croatia                | Core overlap             | Retail customers                                  | Website, mobile app                   |
| RBUA / RBCZ Voicebot               | Austria / Czechia      | Adjacent partial overlap | Retail customers                                  | Phone / voice                         |
| Retail Product Knowledge yellowGPT | Group / internal       | Internal/staff variant   | Branch staff, contact-center staff, product teams | Internal GenAI platform               |

## Realism Rule

Do **not** make every use case share every function.

Use this overlap logic:

| Overlap type     | Use cases                                       | Meaning                                                                                          |
| ---------------- | ----------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| Strong overlap   | Adam TB, RAIA Kosovo, RAIA Bosnia, RAIA Croatia | Strong candidates for same assistant blueprint                                                   |
| Partial overlap  | RBUA/RBCZ Voicebot                              | Shares intent detection, escalation, logging, service classification, but not same channel or UX |
| Internal variant | Product Knowledge yellowGPT                     | Shares knowledge retrieval and answer drafting, but serves employees rather than customers       |

---

## 5. Business Context

| Layer                      | Content                                                                                             |
| -------------------------- | --------------------------------------------------------------------------------------------------- |
| RBI group strategy         | Digital Bank with Human Touch                                                                       |
| Retail strategy pillars    | Acquire, Engage, Monetize                                                                           |
| Main pillar for this story | Engage                                                                                              |
| Secondary pillars          | Acquire, Monetize                                                                                   |
| Business processes         | Customer servicing, product discovery, digital banking support, onboarding support, lead generation |
| Governance context         | AICO / AICoE, GDPR, customer-facing AI controls, content safety, audit logging                      |
| Reuse context              | Blueprints, assistant patterns, knowledge bases, reusable functions                                 |

---

## 6. Required Node Types

| Node type          | Purpose                                   | Example values                                                        |
| ------------------ | ----------------------------------------- | --------------------------------------------------------------------- |
| `UseCase`          | Assistant initiative or project           | Adam TB, RAIA Kosovo, RBUA/RBCZ Voicebot                              |
| `NetworkBank`      | RBI network bank or group unit            | Tatra banka, Raiffeisen Kosovo, Raiffeisen Bosnia                     |
| `Market`           | Country / jurisdiction                    | Slovakia, Kosovo, Bosnia, Croatia, Austria, Czechia                   |
| `UserGroup`        | Who uses the solution                     | Retail customer, branch advisor, contact-center agent                 |
| `Channel`          | Where the assistant is accessed           | Mobile app, website, internet banking, phone, internal GenAI platform |
| `BusinessProcess`  | Banking process supported                 | Customer servicing, product discovery, onboarding support             |
| `StrategyPillar`   | Retail strategy alignment                 | Acquire, Engage, Monetize                                             |
| `ReusableFunction` | Reusable function needed by the assistant | Retrieve product knowledge, escalate to human                         |
| `KnowledgeBase`    | Source of approved knowledge              | Product FAQ, tariff docs, digital banking help                        |
| `System`           | Enterprise/local system used              | CRM, mobile banking, contact-center system                            |
| `RiskTrigger`      | Why governance is needed                  | Customer-facing GenAI, authenticated channel                          |
| `Control`          | Required safeguard                        | Content safety, audit logging, human handoff                          |
| `OrgUnit`          | Owner/reviewer/supporting team            | AICO, AICoE, Retail Digital, Local Digital Channels                   |
| `Blueprint`        | Reusable pattern                          | Retail Conversational Banking Assistant Blueprint                     |

---

## 7. Core Relationships

| Relationship               | From → To                      | Meaning                               |
| -------------------------- | ------------------------------ | ------------------------------------- |
| `IMPLEMENTED_IN`           | `UseCase → NetworkBank`        | Use case runs in this bank/unit       |
| `OPERATES_IN`              | `NetworkBank → Market`         | Bank belongs to this market           |
| `SERVES`                   | `UseCase → UserGroup`          | User group served                     |
| `DELIVERED_THROUGH`        | `UseCase → Channel`            | Access channel                        |
| `SUPPORTS_PROCESS`         | `UseCase → BusinessProcess`    | Banking process supported             |
| `SUPPORTS_STRATEGY`        | `UseCase → StrategyPillar`     | Strategic pillar alignment            |
| `NEEDS_FUNCTION`           | `UseCase → ReusableFunction`   | Functional requirement                |
| `USES_KNOWLEDGE`           | `UseCase → KnowledgeBase`      | Knowledge source used                 |
| `USES_SYSTEM`              | `UseCase → System`             | Technical/local system used           |
| `HAS_RISK_TRIGGER`         | `UseCase → RiskTrigger`        | Risk source                           |
| `REQUIRES_CONTROL`         | `UseCase → Control`            | Required safeguard                    |
| `REVIEWED_BY`              | `UseCase → OrgUnit`            | Governance or delivery review         |
| `OWNED_BY`                 | `UseCase → OrgUnit`            | Business/technical ownership          |
| `CANDIDATE_FOR`            | `UseCase → Blueprint`          | Potential blueprint reuse             |
| `PARTIAL_VARIANT_OF`       | `UseCase → Blueprint`          | Adjacent but not full blueprint match |
| `INCLUDES_FUNCTION`        | `Blueprint → ReusableFunction` | Blueprint functional component        |
| `INCLUDES_CONTROL`         | `Blueprint → Control`          | Blueprint safeguard                   |
| `INCLUDES_CHANNEL_PATTERN` | `Blueprint → Channel`          | Blueprint channel pattern             |

---

## 8. Suggested Node Properties

### `UseCase`

| Property                | Example                                                                       |
| ----------------------- | ----------------------------------------------------------------------------- |
| `id`                    | `UC_ADAM_TB`                                                                  |
| `name`                  | `Adam TB`                                                                     |
| `description`           | `Customer-facing banking assistant for product and banking-operation support` |
| `status`                | `production`, `pilot`, `planned`                                              |
| `solution_type`         | `GenAI Assistant`, `Voicebot`, `Internal Knowledge Assistant`                 |
| `access_context`        | `public`, `authenticated`, `internal`                                         |
| `overlap_role`          | `core_overlap`, `partial_overlap`, `internal_variant`                         |
| `reuse_candidate_score` | `high`, `medium`, `low`                                                       |
| `risk_level`            | `low`, `medium`, `high`                                                       |
| `source_tag`            | `S10`, `S5`, etc.                                                             |
| `is_publicly_observed`  | `true/false`                                                                  |

### `ReusableFunction`

| Property         | Example                                                               |
| ---------------- | --------------------------------------------------------------------- |
| `name`           | `Retrieve product knowledge`                                          |
| `description`    | `Fetch approved product and service information for grounded answers` |
| `function_type`  | `knowledge`, `workflow`, `control`, `integration`                     |
| `reuse_priority` | `high`, `medium`, `low`                                               |

### `Blueprint`

| Property         | Example                                             |
| ---------------- | --------------------------------------------------- |
| `name`           | `Retail Conversational Banking Assistant Blueprint` |
| `blueprint_type` | `customer_assistant`                                |
| `maturity`       | `candidate`, `draft`, `approved`                    |
| `intended_scope` | `group_reusable_pattern`                            |

---

## 9. Reusable Functions for Story 1

| Reusable function             | Applies to                 | Notes                                |
| ----------------------------- | -------------------------- | ------------------------------------ |
| Identify customer intent      | Core assistants, voicebot  | Common assistant foundation          |
| Retrieve product knowledge    | Core assistants, yellowGPT | Strongest shared reusable function   |
| Retrieve digital banking help | Core assistants            | App/login/payment/card support       |
| Answer in local language      | Country assistants         | Local market/language variant        |
| Escalate to human             | Core assistants, voicebot  | Contact-center/branch handoff        |
| Create CRM lead               | Selected assistants        | Only where sales/lead capture exists |
| Check customer context        | Authenticated assistants   | Not for public FAQ-only use cases    |
| Apply response guardrails     | All GenAI assistants       | Content safety / safe answer control |
| Log interaction               | All production assistants  | Monitoring and auditability          |
| Draft staff answer            | yellowGPT                  | Internal/staff-specific function     |

---

## 10. Systems and Knowledge Sources

| System / knowledge source           | Type           | Used by                                         |
| ----------------------------------- | -------------- | ----------------------------------------------- |
| Mobile Banking Platform             | System         | Adam TB, RAIA Kosovo, RAIA Bosnia, RAIA Croatia |
| Public Website                      | System/channel | Adam TB, RAIA Kosovo, RAIA Bosnia, RAIA Croatia |
| Internet Banking                    | System/channel | Adam TB                                         |
| Contact-Center Platform             | System         | Voicebot, customer assistants with escalation   |
| CRM Platform                        | System         | Assistants with lead capture                    |
| Internal GenAI Platform             | System         | Product Knowledge yellowGPT                     |
| Product FAQ Knowledge Base          | KnowledgeBase  | Core assistants, yellowGPT                      |
| Tariff / Fees Knowledge Base        | KnowledgeBase  | Core assistants, yellowGPT                      |
| Digital Banking Help Knowledge Base | KnowledgeBase  | Core assistants                                 |
| Product Policy Knowledge Base       | KnowledgeBase  | yellowGPT, branch/contact-center variant        |

---

## 11. Risk Triggers

| Risk trigger                                | Applies to                                      |
| ------------------------------------------- | ----------------------------------------------- |
| Customer-facing GenAI                       | Adam TB, RAIA Kosovo, RAIA Bosnia, RAIA Croatia |
| Authenticated channel                       | Adam TB, selected RAIA variants                 |
| Uses personal/account context               | Authenticated assistants only                   |
| Generates customer-facing answer            | External assistants                             |
| Could influence product choice              | Assistants answering product questions          |
| Local-language regulatory context           | Country assistants                              |
| Internal staff reliance on generated answer | Product Knowledge yellowGPT                     |
| Voice interaction / call-channel handling   | Voicebot                                        |

---

## 12. Controls

| Control                           | Purpose                                                             |
| --------------------------------- | ------------------------------------------------------------------- |
| Approved knowledge source         | Answers must come from validated product/service content            |
| Grounded retrieval                | Reduce hallucination by grounding answers in approved content       |
| Content safety                    | Prevent unsafe, harmful, or inappropriate outputs                   |
| Human handoff                     | Route uncertain, sensitive, or complex requests to staff            |
| Authentication boundary           | Separate public FAQ from authenticated customer context             |
| Audit logging                     | Store interaction metadata and outputs for review                   |
| GDPR review                       | Validate personal-data handling                                     |
| AICO/AICoE review                 | AI governance review for higher-risk or customer-facing deployments |
| Local language/content validation | Ensure market-specific product/legal accuracy                       |
| Staff-use disclaimer/control      | Clarify internal assistant support vs final decision responsibility |

---

## 13. Blueprint Definition

### `Retail Conversational Banking Assistant Blueprint`

| Blueprint component | Included elements                                                                                                                |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| Core functions      | Identify intent, retrieve product knowledge, retrieve digital banking help, escalate to human, apply guardrails, log interaction |
| Optional functions  | Check customer context, create CRM lead, draft staff answer                                                                      |
| Channel patterns    | Website, mobile app, internet banking, voice, internal GenAI platform                                                            |
| Knowledge patterns  | Product FAQ, tariff docs, digital banking help, product policy documents                                                         |
| Control pattern     | Approved knowledge source, grounded retrieval, content safety, human handoff, audit logging, authentication boundary             |
| Variants            | Public FAQ assistant, authenticated mobile assistant, voicebot, internal staff knowledge assistant                               |

---

## 14. Expected Graph Questions

| Question                                               | Expected graph answer                                                                   |
| ------------------------------------------------------ | --------------------------------------------------------------------------------------- |
| Which assistants show strong overlap?                  | Adam TB, RAIA Kosovo, RAIA Bosnia, RAIA Croatia                                         |
| Which assistants are only partial variants?            | RBUA/RBCZ Voicebot, Product Knowledge yellowGPT                                         |
| Which reusable functions are most common?              | Retrieve product knowledge, identify customer intent, apply guardrails, log interaction |
| Which controls should be standardized?                 | Grounded retrieval, content safety, human handoff, audit logging                        |
| Which assistants have higher governance sensitivity?   | Authenticated, customer-facing assistants using personal/account context                |
| Which use cases are candidates for a common blueprint? | Four core country assistants, with voicebot and yellowGPT as adjacent variants          |
| Which systems are common reuse points?                 | Product knowledge base, mobile banking, CRM, contact-center platform                    |

---

## 15. Minimum Seed Data for Story 1

| Data type             | Target count |
| --------------------- | -----------: |
| Use cases             |            6 |
| Network banks / units |            6 |
| Markets               |            6 |
| User groups           |            4 |
| Channels              |            5 |
| Business processes    |            4 |
| Strategy pillars      |            3 |
| Reusable functions    |           10 |
| Knowledge bases       |            4 |
| Systems               |            6 |
| Risk triggers         |            8 |
| Controls              |           10 |
| Org units             |            5 |
| Blueprints            |            1 |

Expected relationship count: approximately **90–130**.

---

## 16. Story 1 Schema Spine

```text
NetworkBank
  → OPERATES_IN → Market

UseCase
  → IMPLEMENTED_IN → NetworkBank
  → SERVES → UserGroup
  → DELIVERED_THROUGH → Channel
  → SUPPORTS_PROCESS → BusinessProcess
  → SUPPORTS_STRATEGY → StrategyPillar
  → NEEDS_FUNCTION → ReusableFunction
  → USES_KNOWLEDGE → KnowledgeBase
  → USES_SYSTEM → System
  → HAS_RISK_TRIGGER → RiskTrigger
  → REQUIRES_CONTROL → Control
  → REVIEWED_BY → OrgUnit
  → OWNED_BY → OrgUnit
  → CANDIDATE_FOR → Blueprint
  → PARTIAL_VARIANT_OF → Blueprint

Blueprint
  → INCLUDES_FUNCTION → ReusableFunction
  → INCLUDES_CONTROL → Control
  → INCLUDES_CHANNEL_PATTERN → Channel
```

---

## 17. Modelling Decision

This value story confirms that `ReusableFunction` is useful, provided it is kept concrete.

Definition:

> `ReusableFunction` = a reusable business/technical function that multiple AI use cases need, and that can be delivered by one or more systems, APIs, tool servers, knowledge bases, or workflow components.

For Story 1, examples are not abstract capabilities like “AI” or “personalization.” They are concrete functions such as:

* retrieve product knowledge
* identify customer intent
* escalate to human
* log interaction
* apply response guardrails
* create CRM lead

---

## 18. What Not to Model in Story 1

Do not model these yet:

| Excluded element                | Reason                                         |
| ------------------------------- | ---------------------------------------------- |
| Detailed model registry         | More relevant to governance story              |
| Data products / lineage         | More relevant to scaling blocker story         |
| MCP/tool-server details         | More relevant to shared service-layer story    |
| Full KPI/value model            | More relevant after all stories are reconciled |
| Repo/runtime/deployment details | Too implementation-heavy for this story        |
| Full CoALA memory model         | Too detailed for 5–6 hour prototype            |

---

## 19. Summary

Story 1 should show that several RBI network-bank assistant initiatives share enough functional, channel, knowledge, and governance structure to justify a reusable blueprint.

The graph should also show that not all assistants are identical:

* four are strong overlap candidates
* one is a voice/service-channel variant
* one is an internal/staff knowledge variant

This creates a realistic basis for blueprint extraction without oversimplifying the environment.


