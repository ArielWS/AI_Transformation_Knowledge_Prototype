# Value Story 4 Draft Schema

## Scaling Blocker Propagation

## 1. Purpose

This value story models how RBI could identify which missing technical, data, governance, or platform dependencies are blocking multiple Retail AI initiatives.

The goal is to show that the graph can reveal downstream strategic impact from a single blocker.

The key insight is:

> A blocker is not important only because it affects one project. It is important because it may block several use cases, countries, strategy pillars, KPIs, and reusable blueprints.

---

## 2. Core Demo Question

Which blocker should RBI resolve first because it has the largest downstream impact across Retail AI use cases?

---

## 3. Demo Insight

A normal dashboard may show individual project blockers.

The graph should show:

| Insight               | Meaning                                                                                      |
| --------------------- | -------------------------------------------------------------------------------------------- |
| Blocker propagation   | One missing dependency can affect multiple use cases                                         |
| Strategic impact      | A technical blocker can delay Acquire / Engage / Monetize outcomes                           |
| Reuse impact          | A blocker may prevent blueprint reuse across network banks                                   |
| Sequencing logic      | Some platform/data/API dependencies should be prioritized before more front-end AI use cases |
| Governance bottleneck | Missing review or control evidence can block production scaling                              |

---

## 4. Example Use Cases

| Use case                         | Country / unit         | Role in story     | Users                       | Main blocker type                                         |
| -------------------------------- | ---------------------- | ----------------- | --------------------------- | --------------------------------------------------------- |
| Digital Onboarding Assistant     | Group / selected banks | Acquire journey   | Prospects, onboarding teams | KYC/eKYC status access                                    |
| eAccount Opening Assistant       | Group / local banks    | Acquire journey   | Prospects                   | Identity verification and onboarding workflow integration |
| Authenticated Customer Assistant | Local network banks    | Engage journey    | Retail customers            | Customer profile access approval                          |
| Personalized Offer Engine        | Group CRM / CVM        | Monetize journey  | Campaign teams, customers   | Governed customer/consent data product                    |
| Branch Advisor Copilot           | Group / local branches | Engage + Monetize | Branch advisors             | Product eligibility service and customer context          |
| Complaint Triage Assistant       | Local contact centers  | Engage journey    | Contact-center agents       | Complaint data access and retention controls              |
| CRM Lead Assistant               | Group/local CRM teams  | Monetize journey  | Digital sales teams         | Reusable CRM lead creation API                            |

## Realism Rule

Do **not** make every blocker apply to every use case.

Use differentiated blocker logic:

| Blocker type                        | Heavily affected use cases                                    | Lightly affected / unaffected cases  |
| ----------------------------------- | ------------------------------------------------------------- | ------------------------------------ |
| KYC/eKYC status access              | Digital onboarding, eAccount opening, authenticated assistant | Public FAQ assistant                 |
| Customer profile access             | Authenticated assistant, branch copilot, personalized offers  | Public FAQ assistant                 |
| Product eligibility standardization | Branch copilot, sales assistant, offer engine                 | Complaint triage                     |
| CRM lead creation API               | Sales assistant, customer assistant, CRM lead assistant       | Onboarding-only assistant            |
| Audit logging / control evidence    | Production AI use cases                                       | Early discovery / ideation use cases |
| Complaint data controls             | Complaint triage, sentiment/classification use cases          | Product FAQ assistant                |

---

## 5. Business Context

| Layer                       | Content                                                                                                                       |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| RBI group strategy          | Digital Bank with Human Touch                                                                                                 |
| Retail strategy pillars     | Acquire, Engage, Monetize                                                                                                     |
| Main pillars for this story | Acquire and Monetize                                                                                                          |
| Secondary pillar            | Engage                                                                                                                        |
| Business processes          | Digital onboarding, eAccount opening, authenticated customer service, campaign execution, branch advisory, complaint handling |
| Technology context          | APEX/Databricks-style data platform, CRM, KYC/eKYC, mobile banking, customer master, product catalogue, API/tool services     |
| Governance context          | Data ownership, lineage, access approval, AICO/AICoE review, audit logging, GDPR, model/data governance                       |
| Reuse context               | Shared blockers affect blueprint rollout and reusable service adoption                                                        |

---

## 6. Required Node Types

| Node type          | Purpose                                               | Example values                                               |
| ------------------ | ----------------------------------------------------- | ------------------------------------------------------------ |
| `UseCase`          | AI initiative affected by blockers                    | Digital Onboarding Assistant, Branch Advisor Copilot         |
| `NetworkBank`      | RBI network bank or group unit                        | RBI Group, Tatra banka, Raiffeisen Kosovo                    |
| `Market`           | Country / jurisdiction                                | Slovakia, Kosovo, Austria, Croatia                           |
| `UserGroup`        | Who uses or benefits from the solution                | Prospect, retail customer, branch advisor                    |
| `Channel`          | Where the use case operates                           | Mobile app, web onboarding, CRM, staff portal                |
| `BusinessProcess`  | Banking process affected                              | Digital onboarding, lead generation, complaint handling      |
| `StrategyPillar`   | Retail strategy alignment                             | Acquire, Engage, Monetize                                    |
| `ReusableFunction` | Function that depends on a blocker                    | Check KYC status, retrieve customer profile                  |
| `ToolServer`       | API/MCP-style service that may be missing or immature | KYC Status Tool Server, CRM Lead Tool Server                 |
| `System`           | Source or target system                               | KYC/eKYC platform, CRM, customer master                      |
| `DataDomain`       | Data area affected                                    | Customer profile, KYC, consent, product, complaint           |
| `DataProduct`      | Governed reusable dataset/data product                | Customer 360 Data Product, Consent Data Product              |
| `Control`          | Required control                                      | Audit logging, access control, lineage, GDPR review          |
| `Blocker`          | Explicit blocker                                      | KYC API not standardized, missing data lineage               |
| `KPI`              | Strategic or operational metric affected              | Digital NTB customers, onboarding completion                 |
| `OrgUnit`          | Owner or reviewer                                     | Data Office, CIO/API Team, AICO, Retail Digital              |
| `Blueprint`        | Reusable pattern affected by blocker                  | Digital Onboarding Blueprint, Retail Agent Tooling Blueprint |

---

## 7. Core Relationships

| Relationship            | From → To                       | Meaning                                     |
| ----------------------- | ------------------------------- | ------------------------------------------- |
| `IMPLEMENTED_IN`        | `UseCase → NetworkBank`         | Use case runs in this bank/unit             |
| `OPERATES_IN`           | `NetworkBank → Market`          | Bank belongs to this market                 |
| `SERVES`                | `UseCase → UserGroup`           | User group served                           |
| `DELIVERED_THROUGH`     | `UseCase → Channel`             | Access channel                              |
| `SUPPORTS_PROCESS`      | `UseCase → BusinessProcess`     | Banking process supported                   |
| `SUPPORTS_STRATEGY`     | `UseCase → StrategyPillar`      | Strategic alignment                         |
| `NEEDS_FUNCTION`        | `UseCase → ReusableFunction`    | Functional dependency                       |
| `DELIVERED_BY`          | `ReusableFunction → ToolServer` | Tool/API service delivers function          |
| `USES_SYSTEM`           | `ToolServer → System`           | Tool server accesses system                 |
| `USES_DATA_DOMAIN`      | `UseCase → DataDomain`          | Use-case data dependency                    |
| `USES_DATA_DOMAIN`      | `ToolServer → DataDomain`       | Service data dependency                     |
| `PROVIDED_BY`           | `DataProduct → DataDomain`      | Data product packages domain data           |
| `REQUIRES_DATA_PRODUCT` | `UseCase → DataProduct`         | Use case needs governed data product        |
| `REQUIRES_CONTROL`      | `UseCase → Control`             | Use-case control dependency                 |
| `REQUIRES_CONTROL`      | `ToolServer → Control`          | Service-level control dependency            |
| `BLOCKED_BY`            | `UseCase → Blocker`             | Use case is blocked                         |
| `BLOCKS_FUNCTION`       | `Blocker → ReusableFunction`    | Blocker prevents reusable function          |
| `BLOCKS_TOOL_SERVER`    | `Blocker → ToolServer`          | Blocker prevents service availability       |
| `BLOCKS_DATA_PRODUCT`   | `Blocker → DataProduct`         | Blocker prevents governed data availability |
| `BLOCKS_CONTROL`        | `Blocker → Control`             | Blocker is missing control evidence         |
| `AFFECTS_KPI`           | `Blocker → KPI`                 | Blocker affects business metric             |
| `MEASURED_BY`           | `UseCase → KPI`                 | Use case contributes to KPI                 |
| `OWNED_BY`              | `Blocker → OrgUnit`             | Blocker owner                               |
| `OWNED_BY`              | `UseCase → OrgUnit`             | Use-case owner                              |
| `REVIEWED_BY`           | `UseCase → OrgUnit`             | Governance/architecture review              |
| `AFFECTS_BLUEPRINT`     | `Blocker → Blueprint`           | Blocker affects reusable rollout            |
| `CANDIDATE_FOR`         | `UseCase → Blueprint`           | Use case could reuse blueprint              |
| `DEPENDS_ON`            | `ToolServer → System`           | Technical dependency                        |
| `DEPENDS_ON`            | `UseCase → ToolServer`          | Direct service dependency                   |

---

## 8. Suggested Node Properties

### `UseCase`

| Property                    | Example                                                               |
| --------------------------- | --------------------------------------------------------------------- |
| `id`                        | `UC_DIGITAL_ONBOARDING_ASSISTANT`                                     |
| `name`                      | `Digital Onboarding Assistant`                                        |
| `description`               | `Guides prospects through onboarding and identity verification steps` |
| `status`                    | `planned`, `pilot`, `blocked`, `production`                           |
| `solution_type`             | `Agentic Workflow`, `GenAI Assistant`, `Copilot`, `Classifier`        |
| `strategic_priority`        | `high`, `medium`, `low`                                               |
| `blocked_status`            | `not_blocked`, `partially_blocked`, `blocked`                         |
| `target_quarter`            | `Q3 2026`                                                             |
| `risk_level`                | `low`, `medium`, `high`                                               |
| `source_tag`                | `S3`, `S7`, `S9`, `S14`                                               |
| `is_hypothetical_demo_case` | `true`                                                                |

### `Blocker`

| Property                      | Example                                                                                             |
| ----------------------------- | --------------------------------------------------------------------------------------------------- |
| `id`                          | `BLK_KYC_API_NOT_STANDARDIZED`                                                                      |
| `name`                        | `KYC/eKYC status API not standardized`                                                              |
| `description`                 | `No reusable group-standard service for retrieving onboarding or KYC status across approved agents` |
| `blocker_type`                | `api`, `data`, `governance`, `platform`, `system`, `control`                                        |
| `severity`                    | `low`, `medium`, `high`, `critical`                                                                 |
| `scope`                       | `local`, `multi_market`, `group`                                                                    |
| `resolution_status`           | `not_started`, `in_progress`, `resolved`, `accepted_risk`                                           |
| `estimated_resolution_effort` | `low`, `medium`, `high`                                                                             |
| `reuse_impact`                | `low`, `medium`, `high`                                                                             |

### `DataProduct`

| Property           | Example                                      |
| ------------------ | -------------------------------------------- |
| `name`             | `Customer 360 Data Product`                  |
| `domain`           | `Customer`                                   |
| `maturity`         | `available`, `partial`, `missing`, `planned` |
| `lineage_status`   | `complete`, `partial`, `missing`             |
| `access_status`    | `approved`, `restricted`, `not_approved`     |
| `governance_owner` | `Data Office`                                |

### `ToolServer`

| Property                 | Example                                                    |
| ------------------------ | ---------------------------------------------------------- |
| `name`                   | `KYC Status Tool Server`                                   |
| `service_type`           | `API`, `MCP-style tool server`, `workflow service`         |
| `maturity`               | `available`, `fragmented`, `missing`, `planned`            |
| `standardization_status` | `local_only`, `candidate_group_standard`, `group_standard` |
| `access_pattern`         | `read_only`, `write_action`, `decision_support`            |
| `blocking_status`        | `not_blocking`, `partial_blocker`, `major_blocker`         |

---

## 9. Blockers for Story 4

| Blocker                                      | Type                 | Main impact                                              |
| -------------------------------------------- | -------------------- | -------------------------------------------------------- |
| KYC/eKYC status API not standardized         | API / system         | Blocks onboarding and eAccount assistant reuse           |
| Customer profile access not approved         | Data / governance    | Blocks authenticated assistants and branch copilots      |
| Product eligibility logic fragmented         | System / rules       | Blocks sales assistant, offer engine, branch copilot     |
| CRM lead creation API not reusable           | API / workflow       | Blocks chatbot monetization and digital sales conversion |
| Consent data product incomplete              | Data / governance    | Blocks personalized offers and campaign AI               |
| Missing audit logging pattern for tool calls | Control / platform   | Blocks production release of agentic workflows           |
| Incomplete lineage for customer data product | Data governance      | Blocks scaled customer-data use in AI                    |
| Complaint data retention control missing     | Governance / control | Blocks complaint triage assistant                        |
| Local system integration unavailable         | System / local       | Blocks rollout in selected network banks                 |
| AICO review not completed                    | Governance           | Blocks higher-risk production release                    |

---

## 10. Reusable Functions Affected by Blockers

| Reusable function               | Potential blocker                            |
| ------------------------------- | -------------------------------------------- |
| Check KYC/eKYC status           | KYC/eKYC status API not standardized         |
| Retrieve customer profile       | Customer profile access not approved         |
| Check product eligibility       | Product eligibility logic fragmented         |
| Create CRM lead                 | CRM lead creation API not reusable           |
| Retrieve consent status         | Consent data product incomplete              |
| Log interaction                 | Missing audit logging pattern                |
| Retrieve complaint history      | Complaint data retention control missing     |
| Retrieve governed customer data | Incomplete lineage for customer data product |
| Trigger workflow action         | Read/write action controls not approved      |
| Reuse local integration         | Local system integration unavailable         |

---

## 11. Systems and Data Domains

### Systems

| System                                | Common dependencies                                      |
| ------------------------------------- | -------------------------------------------------------- |
| KYC/eKYC Platform                     | KYC status check, onboarding assistant                   |
| Onboarding Workflow System            | eAccount opening, identity verification, document status |
| Customer Master                       | customer profile retrieval                               |
| CRM / Campaign Platform               | CRM lead creation, personalized offers                   |
| Product Catalogue                     | product knowledge, product eligibility                   |
| Eligibility Rules Engine              | product eligibility, sales assistant                     |
| Consent Management System             | consent check, personalization                           |
| Mobile Banking Platform               | authenticated assistant, onboarding assistant            |
| Contact-Center Platform               | complaint triage, human handoff                          |
| Data Platform / APEX-like environment | governed data products, lineage, analytics               |
| Internal GenAI Platform               | staff copilots, knowledge assistants                     |

### Data Domains

| DataDomain                  | Relevance                                              |
| --------------------------- | ------------------------------------------------------ |
| Customer profile            | personalization, authenticated service, branch copilot |
| KYC / identity verification | onboarding, eAccount opening                           |
| Product holdings            | customer profile, sales/offer assistant                |
| Product catalogue           | product knowledge and eligibility                      |
| CRM interactions            | campaign execution, lead creation                      |
| Consent                     | personalization and marketing compliance               |
| Transaction summary         | affordability/recommendation use cases                 |
| Complaint history           | complaint triage and contact-center AI                 |
| Audit / interaction logs    | production monitoring and governance evidence          |

---

## 12. Controls

| Control                      | Blocker relevance                                         |
| ---------------------------- | --------------------------------------------------------- |
| API access control           | Required before reusable tool servers can be exposed      |
| Role-based access control    | Required for customer/KYC/CRM/complaint data              |
| Audit logging                | Required for production AI/tool calls                     |
| Data lineage                 | Required for governed customer data products              |
| Consent check                | Required for personalized offer and campaign AI           |
| Human oversight              | Required for recommendation and complaint handling        |
| Read/write action separation | Required for CRM lead creation and workflow actions       |
| GDPR review                  | Required for personal/customer/complaint data             |
| AICO/AICoE review            | Required for higher-risk or customer-facing AI            |
| Architecture review          | Required for reusable service/tool-server standardization |
| Local regulatory validation  | Required for country-specific rollout                     |

---

## 13. KPIs

| KPI                             | Affected by                                       |
| ------------------------------- | ------------------------------------------------- |
| Digital new-to-bank customers   | onboarding assistant, eAccount opening            |
| Onboarding completion rate      | KYC/eKYC status, onboarding workflow              |
| Time-to-market for AI use cases | reusable services, governance review, data access |
| Reuse count                     | standardized tool servers, blueprints             |
| Digital sales conversion        | CRM lead creation, offer assistant                |
| Lead conversion rate            | CRM lead API, sales assistant                     |
| Mobile engagement               | authenticated customer assistant                  |
| Complaint handling time         | complaint triage assistant                        |
| Governance readiness score      | controls, review status, audit logging            |
| Blocked use-case count          | blocker propagation metric                        |

---

## 14. Example Blocker Propagation Findings

| Blocker                                  | Directly blocks                                                            | Downstream impact                                  |
| ---------------------------------------- | -------------------------------------------------------------------------- | -------------------------------------------------- |
| KYC/eKYC status API not standardized     | Digital Onboarding Assistant, eAccount Opening Assistant                   | Delays Acquire pillar and digital NTB growth       |
| Customer profile access not approved     | Authenticated Assistant, Branch Advisor Copilot, Personalized Offer Engine | Limits Engage and Monetize use cases               |
| Product eligibility logic fragmented     | Sales Assistant, Branch Copilot, Product Recommendation Assistant          | Prevents scalable product guidance pattern         |
| CRM lead creation API not reusable       | Customer Assistant, Sales Assistant, CRM Lead Assistant                    | Weakens lead capture and digital sales conversion  |
| Missing audit logging pattern            | Agentic workflows using tools/actions                                      | Blocks production readiness across multiple agents |
| Consent data product incomplete          | Personalized Offer Engine, Campaign Assistant                              | Blocks compliant personalization                   |
| Complaint data retention control missing | Complaint Triage Assistant                                                 | Blocks contact-center AI scaling                   |

---

## 15. Blueprint Impact

| Blueprint                                         | Blockers that affect it                                                           |
| ------------------------------------------------- | --------------------------------------------------------------------------------- |
| Digital Onboarding Assistant Blueprint            | KYC/eKYC status API, onboarding workflow integration, audit logging               |
| Retail Agent Tooling Blueprint                    | customer profile access, product eligibility service, CRM lead API, audit logging |
| Retail Conversational Banking Assistant Blueprint | product knowledge retrieval, human handoff, audit logging, auth boundary          |
| Personalized Offer Governance Pattern             | consent data product, customer data lineage, fairness/explainability controls     |
| Complaint AI Pattern                              | complaint data access, retention control, human oversight                         |

---

## 16. Expected Graph Questions

| Question                                                      | Expected graph answer                                                       |
| ------------------------------------------------------------- | --------------------------------------------------------------------------- |
| Which blocker affects the most use cases?                     | Customer profile access, audit logging, product eligibility, KYC status     |
| Which blocker affects the most strategic pillars?             | Customer profile access and audit logging affect Acquire, Engage, Monetize  |
| Which blocker should be fixed first for Acquire?              | KYC/eKYC status API and onboarding workflow integration                     |
| Which blocker should be fixed first for Monetize?             | CRM lead API, product eligibility service, consent data product             |
| Which use cases are blocked by missing audit logging?         | Production agentic workflows and customer-facing assistants                 |
| Which blueprint cannot scale because of missing dependencies? | Digital Onboarding Blueprint or Retail Agent Tooling Blueprint              |
| Which org unit owns the most critical blockers?               | Data Office, CIO/API Team, AICO/AICoE depending on blocker type             |
| Which blocker is low effort but high reuse impact?            | Product knowledge retrieval service or CRM lead API, depending on seed data |

---

## 17. Minimum Seed Data for Story 4

| Data type             | Target count |
| --------------------- | -----------: |
| Use cases             |            7 |
| Network banks / units |          4–6 |
| Markets               |          4–6 |
| User groups           |          5–6 |
| Channels              |          5–6 |
| Business processes    |            6 |
| Strategy pillars      |            3 |
| Reusable functions    |           10 |
| Tool servers          |          7–8 |
| Systems               |        10–11 |
| Data domains          |            9 |
| Data products         |          4–5 |
| Controls              |        10–11 |
| Blockers              |         9–10 |
| KPIs                  |         8–10 |
| Org units             |          6–8 |
| Blueprints            |          4–5 |

Expected relationship count: approximately **150–220**.

---

## 18. Story 4 Schema Spine

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
  → DEPENDS_ON → ToolServer
  → USES_DATA_DOMAIN → DataDomain
  → REQUIRES_DATA_PRODUCT → DataProduct
  → REQUIRES_CONTROL → Control
  → BLOCKED_BY → Blocker
  → MEASURED_BY → KPI
  → OWNED_BY → OrgUnit
  → REVIEWED_BY → OrgUnit
  → CANDIDATE_FOR → Blueprint

ReusableFunction
  → DELIVERED_BY → ToolServer

ToolServer
  → USES_SYSTEM → System
  → USES_DATA_DOMAIN → DataDomain
  → REQUIRES_CONTROL → Control
  → DEPENDS_ON → System

DataProduct
  → PROVIDED_BY → DataDomain
  → REQUIRES_CONTROL → Control
  → OWNED_BY → OrgUnit

Blocker
  → BLOCKS_FUNCTION → ReusableFunction
  → BLOCKS_TOOL_SERVER → ToolServer
  → BLOCKS_DATA_PRODUCT → DataProduct
  → BLOCKS_CONTROL → Control
  → AFFECTS_KPI → KPI
  → AFFECTS_BLUEPRINT → Blueprint
  → OWNED_BY → OrgUnit
```

---

## 19. Modelling Decision

This value story requires an explicit `Blocker` node.

A blocker should not be only a property on a use case because the same blocker can affect multiple use cases, functions, services, controls, data products, KPIs, and blueprints.

Correct distinction:

| Concept            | Example                              |
| ------------------ | ------------------------------------ |
| `UseCase`          | Digital Onboarding Assistant         |
| `ReusableFunction` | Check KYC/eKYC status                |
| `ToolServer`       | KYC Status Tool Server               |
| `System`           | KYC/eKYC Platform                    |
| `Blocker`          | KYC/eKYC status API not standardized |
| `KPI`              | Digital new-to-bank customers        |

The pattern is:

```text
Blocker
  → BLOCKS_FUNCTION
ReusableFunction
  → DELIVERED_BY
ToolServer

UseCase
  → NEEDS_FUNCTION
ReusableFunction

UseCase
  → SUPPORTS_STRATEGY
StrategyPillar

Blocker
  → AFFECTS_KPI
KPI
```

This allows the graph to show strategic blocker propagation.

---

## 20. What Not to Model in Story 4

| Excluded element                   | Reason                                          |
| ---------------------------------- | ----------------------------------------------- |
| Full project-management task model | Too much for prototype                          |
| Detailed JIRA/ADO backlog items    | Not needed for strategic blocker propagation    |
| Full data lineage graph            | Use `lineage_status` and selected controls only |
| Exact API specifications           | Keep tool/service nodes conceptual              |
| Detailed cost model                | Useful later, not needed for demo               |
| Full KPI formula model             | Model KPI affected, not full calculation        |
| Full deployment topology           | Too implementation-heavy for one-day prototype  |

---

## 21. Summary

Story 4 should show that a graph can reveal hidden strategic impact from technical, data, governance, and platform blockers.

The strongest blocker examples are:

* KYC/eKYC status API not standardized
* customer profile access not approved
* product eligibility logic fragmented
* CRM lead creation API not reusable
* missing audit logging pattern
* consent data product incomplete
* incomplete lineage for customer data product
* missing AICO review

The graph should answer which blocker affects the most use cases, strategy pillars, KPIs, and blueprints, allowing RBI to sequence platform and governance work more intelligently.
