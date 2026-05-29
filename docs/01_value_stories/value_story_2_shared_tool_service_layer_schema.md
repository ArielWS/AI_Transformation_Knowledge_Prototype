
# Value Story 2 Draft Schema

## Shared Tool / Service Layer Across Retail AI Agents

## 1. Purpose

This value story models how RBI could identify reusable technical services that multiple Retail AI use cases depend on.

The goal is to show that the highest-value scaling opportunity may not be “build another assistant,” but rather:

> Build governed reusable functions and tool/API services once, then reuse them across many AI agents, assistants, copilots, and workflows.

---

## 2. Core Demo Question

Which reusable services, APIs, MCP-style tool servers, or data-access functions would unlock the most Retail AI use cases across RBI Group and network banks?

---

## 3. Demo Insight

A normal dashboard may show several AI projects by country or status.

The graph should show:

| Insight               | Meaning                                                                     |
| --------------------- | --------------------------------------------------------------------------- |
| Shared service demand | Multiple AI use cases need the same underlying functions                    |
| Reuse leverage        | Some boring services unlock more value than flashy front-end agents         |
| Standardization need  | Local teams may rebuild similar integrations unless a reusable layer exists |
| Strategic sequencing  | Shared services with many downstream dependencies should be prioritized     |
| Governance leverage   | One governed tool/API can reduce duplicated control effort across agents    |

---

## 4. Example Use Cases

| Use case                         | Country / unit                       | Role in story                   | Users                                  | Channels                         |
| -------------------------------- | ------------------------------------ | ------------------------------- | -------------------------------------- | -------------------------------- |
| Digital Onboarding Assistant     | Group / selected banks               | Strong service-layer dependency | Prospects, onboarding team             | Mobile app, web onboarding       |
| Authenticated Customer Assistant | Slovakia / Kosovo / Bosnia / Croatia | Strong service-layer dependency | Retail customers                       | Mobile banking, internet banking |
| Branch Advisor Copilot           | Group / local branches               | Internal/staff agent            | Branch advisors                        | Internal staff portal            |
| Sales / Offer Assistant          | Group CRM / local CRM teams          | Monetization use case           | Digital sales teams, campaign teams    | CRM, campaign platform           |
| Complaint Triage Assistant       | Local banks                          | Service operations use case     | Contact-center agents, complaints team | Contact-center platform          |
| Public FAQ Assistant             | Local digital channels               | Light dependency use case       | Prospects, retail customers            | Website                          |

## Realism Rule

Do **not** make every use case require every service.

Use this dependency logic:

| Dependency type   | Use cases                                                                              | Meaning                                                                       |
| ----------------- | -------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| Heavy dependency  | Digital Onboarding Assistant, Authenticated Customer Assistant, Branch Advisor Copilot | Need customer/product/KYC context                                             |
| Medium dependency | Sales / Offer Assistant, Complaint Triage Assistant                                    | Need CRM, classification, product/customer context                            |
| Light dependency  | Public FAQ Assistant                                                                   | Mostly knowledge retrieval and guardrails; limited access to customer systems |

---

## 5. Business Context

| Layer                      | Content                                                                                                                      |
| -------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| RBI group strategy         | Digital Bank with Human Touch                                                                                                |
| Retail strategy pillars    | Acquire, Engage, Monetize                                                                                                    |
| Main pillar for this story | Monetize and Engage                                                                                                          |
| Secondary pillar           | Acquire                                                                                                                      |
| Business processes         | Digital onboarding, customer servicing, branch advisory, lead generation, complaint handling                                 |
| Technology context         | Open APIs, CRM, mobile banking, customer profile, product catalogue, KYC/eKYC, Azure OpenAI / search, internal GenAI tooling |
| Governance context         | AICO/AICoE, API access control, data access control, GDPR, audit logging, human oversight                                    |
| Reuse context              | Reusable tool servers, API services, shared agent functions, blueprints                                                      |

---

## 6. Required Node Types

| Node type          | Purpose                                  | Example values                                                  |
| ------------------ | ---------------------------------------- | --------------------------------------------------------------- |
| `UseCase`          | AI project or agent initiative           | Digital Onboarding Assistant, Branch Advisor Copilot            |
| `NetworkBank`      | RBI network bank or group unit           | Tatra banka, Raiffeisen Kosovo, RBI Group                       |
| `Market`           | Country / jurisdiction                   | Slovakia, Kosovo, Austria                                       |
| `UserGroup`        | Who uses the solution                    | Prospect, retail customer, branch advisor, contact-center agent |
| `Channel`          | Where the solution is accessed           | Mobile app, CRM, staff portal, contact-center platform          |
| `BusinessProcess`  | Banking process supported                | Onboarding, servicing, lead generation                          |
| `StrategyPillar`   | Retail strategy alignment                | Acquire, Engage, Monetize                                       |
| `ReusableFunction` | Function needed by use cases             | Check KYC status, retrieve customer profile                     |
| `ToolServer`       | MCP/API-style reusable technical service | Customer Profile Tool Server, CRM Lead Tool Server              |
| `System`           | Enterprise/local system accessed         | CRM, mobile banking, KYC system, product catalogue              |
| `DataDomain`       | Data area touched                        | Customer, product, KYC, CRM, consent                            |
| `Control`          | Safeguard required                       | API access control, audit logging, human oversight              |
| `RiskTrigger`      | Why governance matters                   | Uses personal data, performs customer-facing action             |
| `OrgUnit`          | Owner/reviewer/support team              | CIO/API Team, AICoE, Retail Digital, CRM/CVM                    |
| `Blueprint`        | Reusable pattern using service layer     | Retail Agent Tooling Blueprint                                  |

---

## 7. Core Relationships

| Relationship           | From → To                       | Meaning                                      |
| ---------------------- | ------------------------------- | -------------------------------------------- |
| `IMPLEMENTED_IN`       | `UseCase → NetworkBank`         | Use case runs in this bank/unit              |
| `OPERATES_IN`          | `NetworkBank → Market`          | Bank belongs to this market                  |
| `SERVES`               | `UseCase → UserGroup`           | User group served                            |
| `DELIVERED_THROUGH`    | `UseCase → Channel`             | Access channel                               |
| `SUPPORTS_PROCESS`     | `UseCase → BusinessProcess`     | Banking process supported                    |
| `SUPPORTS_STRATEGY`    | `UseCase → StrategyPillar`      | Strategic alignment                          |
| `NEEDS_FUNCTION`       | `UseCase → ReusableFunction`    | Functional requirement                       |
| `DELIVERED_BY`         | `ReusableFunction → ToolServer` | Tool/API service delivers function           |
| `USES_SYSTEM`          | `ToolServer → System`           | Tool server accesses enterprise/local system |
| `USES_DATA_DOMAIN`     | `ToolServer → DataDomain`       | Data required by tool server                 |
| `USES_DATA_DOMAIN`     | `UseCase → DataDomain`          | Direct data dependency where needed          |
| `REQUIRES_CONTROL`     | `ToolServer → Control`          | Service-level control                        |
| `REQUIRES_CONTROL`     | `UseCase → Control`             | Use-case-level control                       |
| `HAS_RISK_TRIGGER`     | `UseCase → RiskTrigger`         | Risk source                                  |
| `OWNED_BY`             | `ToolServer → OrgUnit`          | Technical/service ownership                  |
| `OWNED_BY`             | `UseCase → OrgUnit`             | Business/solution ownership                  |
| `REVIEWED_BY`          | `UseCase → OrgUnit`             | Governance or architecture review            |
| `CANDIDATE_FOR`        | `UseCase → Blueprint`           | Could reuse blueprint                        |
| `INCLUDES_FUNCTION`    | `Blueprint → ReusableFunction`  | Blueprint component                          |
| `INCLUDES_TOOL_SERVER` | `Blueprint → ToolServer`        | Blueprint technical service                  |
| `INCLUDES_CONTROL`     | `Blueprint → Control`           | Blueprint safeguard                          |

---

## 8. Suggested Node Properties

### `UseCase`

| Property                    | Example                                                                     |
| --------------------------- | --------------------------------------------------------------------------- |
| `id`                        | `UC_DIGITAL_ONBOARDING_ASSISTANT`                                           |
| `name`                      | `Digital Onboarding Assistant`                                              |
| `description`               | `Guides prospects through eAccount opening and identity verification steps` |
| `status`                    | `planned`, `pilot`, `production`                                            |
| `solution_type`             | `Agentic Workflow`, `GenAI Assistant`, `Copilot`, `Classifier`              |
| `access_context`            | `public`, `authenticated`, `internal`                                       |
| `reuse_dependency_level`    | `heavy`, `medium`, `light`                                                  |
| `risk_level`                | `low`, `medium`, `high`                                                     |
| `source_tag`                | `S5`, `S7`, `S9`, `S14`                                                     |
| `is_hypothetical_demo_case` | `true`                                                                      |

### `ReusableFunction`

| Property                 | Example                                                                               |
| ------------------------ | ------------------------------------------------------------------------------------- |
| `name`                   | `Check KYC status`                                                                    |
| `description`            | `Retrieve current identity verification or onboarding status for a customer/prospect` |
| `function_type`          | `data_access`, `workflow_action`, `knowledge_retrieval`, `decision_support`           |
| `reuse_priority`         | `high`, `medium`, `low`                                                               |
| `governance_sensitivity` | `low`, `medium`, `high`                                                               |

### `ToolServer`

| Property         | Example                                                                     |
| ---------------- | --------------------------------------------------------------------------- |
| `name`           | `KYC Status Tool Server`                                                    |
| `description`    | `Governed service that exposes onboarding/KYC status to approved agents`    |
| `service_type`   | `API`, `MCP-style tool server`, `RAG retrieval service`, `workflow service` |
| `scope`          | `group`, `local`, `candidate_group_standard`                                |
| `maturity`       | `available`, `fragmented`, `missing`, `planned`                             |
| `access_pattern` | `read_only`, `write_action`, `decision_support`                             |
| `reuse_score`    | `high`, `medium`, `low`                                                     |

---

## 9. Reusable Functions for Story 2

| Reusable function                  | Applies to                                               | Notes                                         |
| ---------------------------------- | -------------------------------------------------------- | --------------------------------------------- |
| Retrieve customer profile          | Authenticated assistant, branch copilot, sales assistant | Core personalization/context function         |
| Check KYC/eKYC status              | Onboarding assistant, customer assistant                 | Critical for Acquire journeys                 |
| Check product eligibility          | Sales assistant, branch copilot, onboarding              | High-value reusable decision-support function |
| Retrieve product knowledge         | All assistants/copilots                                  | Shared knowledge foundation                   |
| Create CRM lead                    | Customer assistant, sales assistant, branch copilot      | Converts interaction into monetization        |
| Retrieve consent status            | Sales/offer assistant, personalization use cases         | GDPR/marketing relevance                      |
| Escalate to human                  | Customer assistant, complaint triage                     | Service continuity                            |
| Classify complaint/service request | Complaint triage, contact-center copilot                 | Operations automation                         |
| Log interaction                    | All production agents                                    | Audit and monitoring requirement              |
| Trigger appointment booking        | Branch copilot, sales assistant, service assistant       | Useful but lower-priority                     |
| Retrieve case history              | Complaint triage, contact-center copilot                 | Requires stronger access control              |
| Apply product-rule validation      | Sales/offer assistant, branch copilot                    | Prevents wrong product guidance               |

---

## 10. Tool Servers / API Services

| ToolServer                          | Delivered function                 | Systems accessed                                   | Maturity in demo              |
| ----------------------------------- | ---------------------------------- | -------------------------------------------------- | ----------------------------- |
| Customer Profile Tool Server        | Retrieve customer profile          | Customer master, CRM, mobile banking profile       | Candidate group standard      |
| KYC Status Tool Server              | Check KYC/eKYC status              | KYC/eKYC platform, onboarding system               | Fragmented / not standardized |
| Product Eligibility Tool Server     | Check product eligibility          | Product catalogue, eligibility rules engine        | Planned / high priority       |
| CRM Lead Tool Server                | Create CRM lead                    | CRM / campaign platform                            | Partially available           |
| Product Knowledge Retrieval Service | Retrieve product knowledge         | Product FAQ, tariff docs, policy knowledge base    | Available / reusable          |
| Consent Status Tool Server          | Retrieve consent status            | Consent management system, CRM                     | Required for personalization  |
| Human Handoff Tool Server           | Escalate to human                  | Contact-center platform, branch appointment system | Local implementations         |
| Complaint Classification Service    | Classify complaint/service request | Contact-center system, complaint management        | Local/pilot                   |

---

## 11. Systems and Data Domains

### Systems

| System                    | Used by                                            |
| ------------------------- | -------------------------------------------------- |
| Mobile Banking Platform   | customer assistant, onboarding assistant           |
| Internet Banking Platform | authenticated assistant                            |
| CRM / Campaign Platform   | sales assistant, CRM lead service, personalization |
| Customer Master           | customer profile service                           |
| KYC/eKYC Platform         | onboarding assistant, KYC status service           |
| Product Catalogue         | product eligibility, product knowledge retrieval   |
| Eligibility Rules Engine  | product eligibility service                        |
| Contact-Center Platform   | human handoff, complaint triage                    |
| Consent Management System | sales/offer assistant, consent status service      |
| Internal GenAI Platform   | branch copilot, internal assistants                |

### Data Domains

| DataDomain                  | Sensitivity |
| --------------------------- | ----------- |
| Customer profile            | High        |
| Product holdings            | High        |
| KYC / identity verification | High        |
| Product catalogue           | Medium      |
| CRM interactions            | High        |
| Consent                     | High        |
| Complaint / service history | High        |
| Product knowledge           | Medium      |
| Tariff / fees               | Medium      |

---

## 12. Risk Triggers

| Risk trigger                      | Applies to                                 |
| --------------------------------- | ------------------------------------------ |
| Uses personal data                | Customer profile, CRM, KYC services        |
| Uses KYC/identity data            | Onboarding assistant, KYC status service   |
| Writes to CRM                     | CRM lead creation                          |
| Influences product recommendation | Sales/offer assistant, product eligibility |
| Operates in authenticated channel | Authenticated customer assistant           |
| Performs workflow action          | CRM lead creation, appointment booking     |
| Supports staff decision-making    | Branch advisor copilot                     |
| Customer-facing GenAI             | Customer assistant, onboarding assistant   |
| Handles complaint data            | Complaint triage assistant                 |

---

## 13. Controls

| Control                             | Applies to                                              |
| ----------------------------------- | ------------------------------------------------------- |
| API access control                  | All tool servers                                        |
| Role-based access control           | Customer profile, KYC, CRM, complaint data              |
| Consent check                       | Sales/offer and personalization functions               |
| Audit logging                       | All production tool calls                               |
| Data minimization                   | Customer profile, CRM, KYC functions                    |
| Human oversight                     | Product eligibility, complaint handling, sales guidance |
| Read/write separation               | CRM lead creation, appointment booking                  |
| Output grounding                    | Product knowledge retrieval                             |
| AICO/AICoE review                   | Customer-facing and higher-risk use cases               |
| Architecture review                 | Reusable tool/server patterns                           |
| Local regulatory/content validation | Country-specific deployments                            |

---

## 14. Blueprint Definition

### `Retail Agent Tooling Blueprint`

| Blueprint component           | Included elements                                                                              |
| ----------------------------- | ---------------------------------------------------------------------------------------------- |
| Core reusable functions       | Retrieve customer profile, retrieve product knowledge, log interaction, escalate to human      |
| High-value optional functions | Check KYC status, check product eligibility, create CRM lead, retrieve consent status          |
| Tool/server pattern           | Governed API/MCP-style service layer with access control and audit logs                        |
| Systems pattern               | CRM, customer master, KYC/eKYC, product catalogue, contact-center system                       |
| Controls pattern              | RBAC, audit logging, consent check, read/write separation, human oversight                     |
| Use-case variants             | Customer assistant, onboarding assistant, branch copilot, sales assistant, complaint assistant |

---

## 15. Expected Graph Questions

| Question                                                          | Expected graph answer                                                                      |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| Which reusable service unlocks the most use cases?                | Customer Profile Tool Server, Product Knowledge Retrieval, Product Eligibility Tool Server |
| Which use cases depend on KYC/eKYC status?                        | Digital Onboarding Assistant, Authenticated Customer Assistant                             |
| Which services require strongest access control?                  | Customer Profile, KYC Status, CRM Lead, Complaint History                                  |
| Which functions are only needed by internal staff tools?          | Branch copilot functions, product-rule validation, case-history retrieval                  |
| Which tool servers are good candidates for group standardization? | Customer Profile, Product Eligibility, Product Knowledge, CRM Lead                         |
| Which use cases are light vs heavy dependency cases?              | Public FAQ Assistant is light; onboarding/customer/branch agents are heavy                 |
| Which services create write/action risk?                          | CRM Lead Creation, Appointment Booking, Complaint Case Update                              |

---

## 16. Minimum Seed Data for Story 2

| Data type             | Target count |
| --------------------- | -----------: |
| Use cases             |            6 |
| Network banks / units |          4–6 |
| Markets               |          4–6 |
| User groups           |            6 |
| Channels              |            6 |
| Business processes    |            5 |
| Strategy pillars      |            3 |
| Reusable functions    |           12 |
| Tool servers          |            8 |
| Systems               |           10 |
| Data domains          |            9 |
| Risk triggers         |            9 |
| Controls              |           11 |
| Org units             |            6 |
| Blueprints            |            1 |

Expected relationship count: approximately **120–170**.

---

## 17. Story 2 Schema Spine

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
  → USES_DATA_DOMAIN → DataDomain
  → HAS_RISK_TRIGGER → RiskTrigger
  → REQUIRES_CONTROL → Control
  → OWNED_BY → OrgUnit
  → REVIEWED_BY → OrgUnit
  → CANDIDATE_FOR → Blueprint

ReusableFunction
  → DELIVERED_BY → ToolServer

ToolServer
  → USES_SYSTEM → System
  → USES_DATA_DOMAIN → DataDomain
  → REQUIRES_CONTROL → Control
  → OWNED_BY → OrgUnit

Blueprint
  → INCLUDES_FUNCTION → ReusableFunction
  → INCLUDES_TOOL_SERVER → ToolServer
  → INCLUDES_CONTROL → Control
```

---

## 18. Modelling Decision

This story confirms that `ReusableFunction` is useful only when it remains separate from the technical delivery mechanism.

Correct distinction:

| Concept            | Example                                  |
| ------------------ | ---------------------------------------- |
| `ReusableFunction` | Check KYC status                         |
| `ToolServer`       | KYC Status Tool Server                   |
| `System`           | KYC/eKYC Platform                        |
| `DataDomain`       | KYC / identity verification data         |
| `Control`          | Role-based access control, audit logging |

The pattern is:

```text
UseCase
  → NEEDS_FUNCTION
ReusableFunction
  → DELIVERED_BY
ToolServer
  → USES_SYSTEM
System
```

This is the core reuse insight.

---

## 19. What Not to Model in Story 2

| Excluded element                   | Reason                                                           |
| ---------------------------------- | ---------------------------------------------------------------- |
| Detailed model registry            | More relevant to governance story                                |
| Detailed KPI calculation           | Useful later, not needed for service-layer discovery             |
| Full deployment architecture       | Too heavy for demo                                               |
| Full MCP protocol mechanics        | The prototype only needs MCP-style reusable tool/service concept |
| Vendor-level implementation detail | Avoid speculative over-specificity                               |
| Full data lineage                  | More relevant to scaling blocker story                           |

---

## 20. Summary

Story 2 should show that several Retail AI agents and assistants depend on the same reusable functions.

The graph should reveal that RBI could prioritize shared tool/API services such as:

* customer profile retrieval
* KYC/eKYC status check
* product eligibility check
* CRM lead creation
* product knowledge retrieval
* human handoff
* consent check

This creates a realistic basis for demonstrating how agentic AI can scale through a governed reusable service layer rather than isolated local builds.