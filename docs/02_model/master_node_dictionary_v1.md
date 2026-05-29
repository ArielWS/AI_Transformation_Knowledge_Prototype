# Master Node Dictionary v1

## RBI Retail AI Portfolio Intelligence Graph

## 1. Purpose

This node dictionary defines the core node labels for the prototype knowledge graph.

The graph is designed to support four demo value stories:

1. Assistant overlap → reusable blueprint
2. Shared tool/service layer across Retail AI agents
3. Governance gap by analogy
4. Scaling blocker propagation

The model is intentionally constrained for a 5–6 hour prototype. It should support realistic insights without becoming a full enterprise architecture model.

---

# 2. Node Dictionary Summary

| Node label         | Role in graph                                     | Build depth |
| ------------------ | ------------------------------------------------- | ----------- |
| `UseCase`          | Central AI initiative/project                     | High        |
| `NetworkBank`      | RBI country bank or group unit                    | Low         |
| `Market`           | Country/jurisdiction                              | Low         |
| `StrategyPillar`   | Acquire, Engage, Monetize                         | Low         |
| `UserGroup`        | Users or affected parties                         | Low         |
| `Channel`          | Where the solution is accessed                    | Low         |
| `BusinessProcess`  | Banking process supported                         | Low         |
| `ReusableFunction` | Reusable function needed by use cases             | High        |
| `ToolServer`       | API/MCP/RAG/workflow service delivering functions | High        |
| `System`           | Enterprise/local system                           | Medium      |
| `DataDomain`       | Data category used by use cases/services          | Low         |
| `DataProduct`      | Governed reusable data product                    | Medium      |
| `KnowledgeBase`    | Approved knowledge source                         | Medium      |
| `RiskTrigger`      | Reason governance is needed                       | High        |
| `Control`          | Required safeguard/control                        | High        |
| `OrgUnit`          | Team, committee, owner, reviewer                  | Medium      |
| `Blueprint`        | Reusable pattern                                  | High        |
| `Blocker`          | Scaling blocker                                   | High        |
| `KPI`              | Strategic/operational metric                      | Low         |

---

# 3. Core Nodes

---

## 3.1 `UseCase`

### Definition

An AI, automation, data, assistant, agentic, or analytics initiative in the Retail AI portfolio.

This is the central node of the graph.

### Use for

Examples:

* Adam TB
* RAIA Kosovo
* RAIA Bosnia
* RAIA Croatia
* RBUA/RBCZ Voicebot
* Retail Product Knowledge yellowGPT
* Digital Onboarding Assistant
* Authenticated Customer Assistant
* Branch Advisor Copilot
* Sales / Offer Assistant
* Product Recommendation Assistant
* Personalized Offer Engine
* Loan Affordability Recommender
* Credit Pre-Approval Assistant
* Complaint Triage Assistant
* CRM Lead Assistant

### Do not use for

| Do not model as `UseCase`    | Use instead               |
| ---------------------------- | ------------------------- |
| A reusable API               | `ToolServer`              |
| A reusable business function | `ReusableFunction`        |
| A system like CRM            | `System`                  |
| A control like GDPR review   | `Control`                 |
| A strategic objective        | `StrategyPillar` or `KPI` |

### Minimum properties

| Property                    | Type        | Example                                                                                            |
| --------------------------- | ----------- | -------------------------------------------------------------------------------------------------- |
| `id`                        | string      | `UC_ADAM_TB`                                                                                       |
| `name`                      | string      | `Adam TB`                                                                                          |
| `description`               | string      | `Customer-facing banking assistant for product and digital banking support`                        |
| `status`                    | enum        | `planned`, `pilot`, `production`, `blocked`, `deprecated`                                          |
| `solution_type`             | enum/string | `GenAI Assistant`, `Voicebot`, `Agentic Workflow`, `Recommendation Model`, `Classifier`, `Copilot` |
| `access_context`            | enum        | `public`, `authenticated`, `internal`                                                              |
| `strategic_priority`        | enum        | `low`, `medium`, `high`                                                                            |
| `risk_level`                | enum        | `low`, `medium`, `high`                                                                            |
| `governance_status`         | enum        | `not_started`, `in_review`, `reviewed`, `missing_evidence`                                         |
| `reuse_candidate_score`     | enum        | `low`, `medium`, `high`                                                                            |
| `blocked_status`            | enum        | `not_blocked`, `partially_blocked`, `blocked`                                                      |
| `target_quarter`            | string      | `Q3 2026`                                                                                          |
| `source_tag`                | string      | `S3`, `S5`, `S10`                                                                                  |
| `is_hypothetical_demo_case` | boolean     | `true`                                                                                             |

### Optional properties

| Property          | Example                                                                  |
| ----------------- | ------------------------------------------------------------------------ |
| `overlap_role`    | `core_overlap`, `partial_overlap`, `internal_variant`                    |
| `customer_impact` | `informational`, `recommendation`, `decision_support`, `workflow_action` |
| `embedding_text`  | combined description used for vector search                              |
| `embedding`       | vector field, if vectorization is used                                   |

---

## 3.2 `NetworkBank`

### Definition

A country bank, RBI Group unit, or group-level functional context where use cases run.

### Use for

Examples:

* RBI Group
* Tatra banka
* Raiffeisen Bank Kosovo
* Raiffeisen Bank Bosnia
* RBA Croatia
* RBUA / Austria
* RBCZ / Czechia

### Do not use for

| Do not model as `NetworkBank` | Use instead           |
| ----------------------------- | --------------------- |
| Country name only             | `Market`              |
| Department/team               | `OrgUnit`             |
| Channel such as mobile app    | `Channel` or `System` |

### Minimum properties

| Property      | Type   | Example                                |
| ------------- | ------ | -------------------------------------- |
| `id`          | string | `BANK_TATRA`                           |
| `name`        | string | `Tatra banka`                          |
| `bank_type`   | enum   | `network_bank`, `group_unit`           |
| `description` | string | `Slovak network bank within RBI Group` |

---

## 3.3 `Market`

### Definition

Country or jurisdiction context.

### Use for

Examples:

* Slovakia
* Kosovo
* Bosnia
* Croatia
* Austria
* Czechia

### Do not use for

| Do not model as `Market` | Use instead   |
| ------------------------ | ------------- |
| Legal entity / bank      | `NetworkBank` |
| Local department         | `OrgUnit`     |

### Minimum properties

| Property             | Type   | Example           |
| -------------------- | ------ | ----------------- |
| `id`                 | string | `MKT_SK`          |
| `name`               | string | `Slovakia`        |
| `region`             | string | `CEE`             |
| `jurisdiction_notes` | string | `EU member state` |

---

## 3.4 `StrategyPillar`

### Definition

Retail strategy pillar or high-level strategic objective.

### Use for

Examples:

* Acquire
* Engage
* Monetize
* Digital Bank with Human Touch

### Modelling note

For the prototype, use **Acquire**, **Engage**, and **Monetize** as the core strategy pillars. “Digital Bank with Human Touch” can be represented either as a higher-level `StrategyPillar` or as a property on the model narrative.

### Minimum properties

| Property      | Type   | Example                                                                    |
| ------------- | ------ | -------------------------------------------------------------------------- |
| `id`          | string | `STRAT_ENGAGE`                                                             |
| `name`        | string | `Engage`                                                                   |
| `description` | string | `Increase customer engagement through digital and human-assisted channels` |

---

## 3.5 `UserGroup`

### Definition

The user, beneficiary, or affected party of a use case.

### Use for

Examples:

* Retail customer
* Prospect
* Branch advisor
* Contact-center agent
* Digital sales manager
* Campaign manager
* Product owner
* Compliance reviewer
* AICO reviewer
* Onboarding team

### Do not use for

| Do not model as `UserGroup` | Use instead                                     |
| --------------------------- | ----------------------------------------------- |
| Owning team                 | `OrgUnit`                                       |
| Country bank                | `NetworkBank`                                   |
| Strategic segment only      | property or `UserGroup`, depending on relevance |

### Minimum properties

| Property      | Type   | Example                                                                     |
| ------------- | ------ | --------------------------------------------------------------------------- |
| `id`          | string | `USER_RETAIL_CUSTOMER`                                                      |
| `name`        | string | `Retail customer`                                                           |
| `user_type`   | enum   | `external_customer`, `internal_staff`, `governance_user`, `operations_user` |
| `description` | string | `End customer using digital banking services`                               |

---

## 3.6 `Channel`

### Definition

The access channel through which a use case is delivered.

### Use for

Examples:

* Mobile app
* Public website
* Internet banking
* Phone / voice
* CRM
* Staff portal
* Contact-center platform
* Internal GenAI platform
* Campaign platform

### Do not use for

| Do not model as `Channel` | Use instead                   |
| ------------------------- | ----------------------------- |
| System backend            | `System`                      |
| Data source               | `DataDomain` or `DataProduct` |
| User group                | `UserGroup`                   |

### Minimum properties

| Property         | Type   | Example                                                                 |
| ---------------- | ------ | ----------------------------------------------------------------------- |
| `id`             | string | `CH_MOBILE_APP`                                                         |
| `name`           | string | `Mobile app`                                                            |
| `channel_type`   | enum   | `customer_digital`, `staff_internal`, `voice`, `operations`, `campaign` |
| `access_context` | enum   | `public`, `authenticated`, `internal`                                   |

---

## 3.7 `BusinessProcess`

### Definition

The banking process, customer journey, or operational process supported by a use case.

### Use for

Examples:

* Digital onboarding
* eAccount opening
* Customer servicing
* Product discovery
* Digital banking support
* Lead generation
* Campaign execution
* Branch advisory
* Complaint handling
* Credit pre-assessment
* Product recommendation

### Do not use for

| Do not model as `BusinessProcess` | Use instead      |
| --------------------------------- | ---------------- |
| KPI                               | `KPI`            |
| Use case/project                  | `UseCase`        |
| Strategy pillar                   | `StrategyPillar` |

### Minimum properties

| Property       | Type   | Example                                                           |
| -------------- | ------ | ----------------------------------------------------------------- |
| `id`           | string | `PROC_DIGITAL_ONBOARDING`                                         |
| `name`         | string | `Digital onboarding`                                              |
| `process_area` | enum   | `acquisition`, `engagement`, `monetization`, `operations`, `risk` |

---

# 4. Reuse and Technical Nodes

---

## 4.1 `ReusableFunction`

### Definition

A reusable business/technical function that multiple AI use cases need, and that can be delivered by one or more tool servers, APIs, systems, data products, or knowledge bases.

This replaces the vague concept of “capability.”

### Use for

Examples:

* Identify customer intent
* Retrieve product knowledge
* Retrieve digital banking help
* Retrieve customer profile
* Check KYC/eKYC status
* Check product eligibility
* Retrieve consent status
* Create CRM lead
* Escalate to human
* Classify complaint/service request
* Log interaction
* Apply content safety guardrail
* Explain recommendation
* Monitor model/output quality

### Do not use for

| Do not model as `ReusableFunction` | Use instead  |
| ---------------------------------- | ------------ |
| Actual API/service implementation  | `ToolServer` |
| Source system                      | `System`     |
| Data category                      | `DataDomain` |
| Control                            | `Control`    |
| Business project                   | `UseCase`    |

### Minimum properties

| Property                 | Type   | Example                                                                                                  |
| ------------------------ | ------ | -------------------------------------------------------------------------------------------------------- |
| `id`                     | string | `FUNC_CHECK_KYC_STATUS`                                                                                  |
| `name`                   | string | `Check KYC/eKYC status`                                                                                  |
| `description`            | string | `Retrieve the current identity verification or onboarding status`                                        |
| `function_type`          | enum   | `knowledge_retrieval`, `data_access`, `workflow_action`, `decision_support`, `control`, `classification` |
| `reuse_priority`         | enum   | `low`, `medium`, `high`                                                                                  |
| `governance_sensitivity` | enum   | `low`, `medium`, `high`                                                                                  |

### Modelling rule

Use this pattern:

```text
UseCase → NEEDS_FUNCTION → ReusableFunction → DELIVERED_BY → ToolServer
```

---

## 4.2 `ToolServer`

### Definition

A reusable technical service that delivers a reusable function. This may represent an API, MCP-style tool server, RAG retrieval service, workflow service, or model/service endpoint.

### Use for

Examples:

* Customer Profile Tool Server
* KYC Status Tool Server
* Product Eligibility Tool Server
* CRM Lead Tool Server
* Product Knowledge Retrieval Service
* Consent Status Tool Server
* Human Handoff Tool Server
* Complaint Classification Service
* Audit Logging Tool Server

### Do not use for

| Do not model as `ToolServer` | Use instead        |
| ---------------------------- | ------------------ |
| Business function            | `ReusableFunction` |
| Underlying source system     | `System`           |
| Data category                | `DataDomain`       |
| Use case/project             | `UseCase`          |

### Minimum properties

| Property                 | Type   | Example                                                                            |
| ------------------------ | ------ | ---------------------------------------------------------------------------------- |
| `id`                     | string | `TOOL_KYC_STATUS`                                                                  |
| `name`                   | string | `KYC Status Tool Server`                                                           |
| `description`            | string | `Governed service exposing onboarding/KYC status to approved agents`               |
| `service_type`           | enum   | `API`, `MCP-style tool server`, `RAG service`, `workflow service`, `model service` |
| `scope`                  | enum   | `local`, `group`, `candidate_group_standard`                                       |
| `maturity`               | enum   | `available`, `fragmented`, `missing`, `planned`                                    |
| `standardization_status` | enum   | `local_only`, `candidate_group_standard`, `group_standard`                         |
| `access_pattern`         | enum   | `read_only`, `write_action`, `decision_support`                                    |
| `reuse_score`            | enum   | `low`, `medium`, `high`                                                            |
| `blocking_status`        | enum   | `not_blocking`, `partial_blocker`, `major_blocker`                                 |

---

## 4.3 `System`

### Definition

A source, target, runtime, platform, or enterprise/local system accessed by use cases or tool servers.

### Use for

Examples:

* Mobile Banking Platform
* Internet Banking Platform
* Public Website
* CRM / Campaign Platform
* Customer Master
* KYC/eKYC Platform
* Onboarding Workflow System
* Product Catalogue
* Eligibility Rules Engine
* Consent Management System
* Contact-Center Platform
* Complaint Management System
* Internal GenAI Platform
* Azure OpenAI / Azure AI Foundry
* Azure AI Search
* Data Platform / APEX-like environment

### Do not use for

| Do not model as `System`     | Use instead       |
| ---------------------------- | ----------------- |
| Business process             | `BusinessProcess` |
| Data category                | `DataDomain`      |
| Reusable API/service         | `ToolServer`      |
| Knowledge content collection | `KnowledgeBase`   |

### Minimum properties

| Property      | Type   | Example                                                                                                     |
| ------------- | ------ | ----------------------------------------------------------------------------------------------------------- |
| `id`          | string | `SYS_CRM`                                                                                                   |
| `name`        | string | `CRM / Campaign Platform`                                                                                   |
| `system_type` | enum   | `channel`, `core_banking`, `crm`, `data_platform`, `ai_platform`, `workflow`, `knowledge`, `contact_center` |
| `scope`       | enum   | `local`, `group`, `mixed`                                                                                   |
| `maturity`    | enum   | `available`, `fragmented`, `planned`, `missing`                                                             |
| `description` | string | `System used for lead, campaign, and customer interaction management`                                       |

---

## 4.4 `DataDomain`

### Definition

A logical category of data used by use cases, tool servers, systems, controls, or data products.

### Use for

Examples:

* Customer profile
* Product holdings
* KYC / identity verification
* Product catalogue
* CRM interactions
* Consent
* Complaint / service history
* Transaction summary
* Audit / interaction logs
* Product knowledge
* Tariff / fees

### Do not use for

| Do not model as `DataDomain` | Use instead     |
| ---------------------------- | --------------- |
| Governed dataset/product     | `DataProduct`   |
| Source system                | `System`        |
| Knowledge collection         | `KnowledgeBase` |
| Control requirement          | `Control`       |

### Minimum properties

| Property        | Type   | Example                                                                                          |
| --------------- | ------ | ------------------------------------------------------------------------------------------------ |
| `id`            | string | `DATA_CUSTOMER_PROFILE`                                                                          |
| `name`          | string | `Customer profile`                                                                               |
| `sensitivity`   | enum   | `low`, `medium`, `high`                                                                          |
| `data_category` | enum   | `customer`, `product`, `kyc`, `crm`, `consent`, `complaint`, `transaction`, `audit`, `knowledge` |
| `description`   | string | `Customer master and relationship context`                                                       |

---

## 4.5 `DataProduct`

### Definition

A governed, reusable data product or curated dataset made available for approved use cases.

### Use for

Examples:

* Customer 360 Data Product
* Consent Data Product
* Product Eligibility Data Product
* KYC Status Data Product
* CRM Interaction Data Product

### Do not use for

| Do not model as `DataProduct` | Use instead     |
| ----------------------------- | --------------- |
| Broad data category           | `DataDomain`    |
| Raw source system             | `System`        |
| Knowledge base                | `KnowledgeBase` |
| API/tool service              | `ToolServer`    |

### Minimum properties

| Property           | Type   | Example                                      |
| ------------------ | ------ | -------------------------------------------- |
| `id`               | string | `DP_CUSTOMER_360`                            |
| `name`             | string | `Customer 360 Data Product`                  |
| `domain`           | string | `Customer`                                   |
| `maturity`         | enum   | `available`, `partial`, `missing`, `planned` |
| `lineage_status`   | enum   | `complete`, `partial`, `missing`             |
| `access_status`    | enum   | `approved`, `restricted`, `not_approved`     |
| `governance_owner` | string | `Data Office`                                |

---

## 4.6 `KnowledgeBase`

### Definition

A curated source of approved knowledge used for retrieval, grounding, answer drafting, or internal support.

### Use for

Examples:

* Product FAQ Knowledge Base
* Tariff / Fees Knowledge Base
* Digital Banking Help Knowledge Base
* Product Policy Knowledge Base
* Complaint Handling Guidance Knowledge Base
* Staff Product Knowledge Base

### Do not use for

| Do not model as `KnowledgeBase` | Use instead                  |
| ------------------------------- | ---------------------------- |
| Structured customer data        | `DataDomain` / `DataProduct` |
| Source system                   | `System`                     |
| Retrieval service               | `ToolServer`                 |
| Full document-level corpus      | Too detailed for prototype   |

### Minimum properties

| Property             | Type   | Example                                                                                |
| -------------------- | ------ | -------------------------------------------------------------------------------------- |
| `id`                 | string | `KB_PRODUCT_FAQ`                                                                       |
| `name`               | string | `Product FAQ Knowledge Base`                                                           |
| `knowledge_type`     | enum   | `product`, `policy`, `tariff`, `digital_help`, `complaint_guidance`, `staff_knowledge` |
| `approval_status`    | enum   | `approved`, `draft`, `local_only`, `needs_review`                                      |
| `localization_scope` | enum   | `group`, `local`, `multi_market`                                                       |
| `description`        | string | `Approved product/service answers for assistant grounding`                             |

---

# 5. Governance Nodes

---

## 5.1 `RiskTrigger`

### Definition

A reason why a use case requires governance, control, review, or risk classification.

`RiskTrigger` explains **why** a use case is risky or review-worthy.

### Use for

Examples:

* Uses personal data
* Uses behavioural data
* Uses transaction data
* Uses KYC/identity data
* Uses complaint data
* Operates in authenticated channel
* Customer-facing GenAI output
* Influences product recommendation
* Credit-adjacent recommendation
* Supports staff decision-making
* Performs workflow/action
* Handles sensitive communication data
* Uses local-language regulatory content

### Do not use for

| Do not model as `RiskTrigger` | Use instead                                             |
| ----------------------------- | ------------------------------------------------------- |
| Safeguard/control             | `Control`                                               |
| Risk rating only              | property on `UseCase`, or optional `RiskClassification` |
| System/data source            | `System`, `DataDomain`                                  |

### Minimum properties

| Property       | Type   | Example                                                                                  |
| -------------- | ------ | ---------------------------------------------------------------------------------------- |
| `id`           | string | `RISK_INFLUENCES_PRODUCT_CHOICE`                                                         |
| `name`         | string | `Influences product recommendation`                                                      |
| `trigger_type` | enum   | `data`, `channel`, `decision_impact`, `model_type`, `customer_impact`, `workflow_action` |
| `severity`     | enum   | `low`, `medium`, `high`                                                                  |
| `description`  | string | `The output may influence which product is offered or selected`                          |

---

## 5.2 `Control`

### Definition

A governance, security, privacy, operational, model-risk, or platform safeguard required for safe delivery or scaling.

### Use for

Examples:

* AICO review
* AICoE technical review
* GDPR review
* Data minimization
* Human oversight
* Explainability
* Fairness / bias review
* Model validation
* Output grounding
* Content safety
* Audit logging
* API access control
* Role-based access control
* Authentication boundary
* Read/write action separation
* Local regulatory/content validation
* Data lineage

### Do not use for

| Do not model as `Control` | Use instead   |
| ------------------------- | ------------- |
| Risk reason               | `RiskTrigger` |
| Reviewer/team             | `OrgUnit`     |
| Actual system             | `System`      |
| Blocker                   | `Blocker`     |

### Minimum properties

| Property                  | Type    | Example                                                                                 |
| ------------------------- | ------- | --------------------------------------------------------------------------------------- |
| `id`                      | string  | `CTRL_FAIRNESS_REVIEW`                                                                  |
| `name`                    | string  | `Fairness / bias review`                                                                |
| `control_type`            | enum    | `governance`, `privacy`, `model_risk`, `security`, `operational`, `platform`, `content` |
| `mandatory_for_high_risk` | boolean | `true`                                                                                  |
| `description`             | string  | `Review whether model outputs create unfair treatment across customer groups`           |

---

## 5.3 `OrgUnit`

### Definition

An organisational unit, team, committee, governance body, or delivery owner.

This node absorbs both delivery teams and governance bodies.

### Use for

Examples:

* AICO
* AICoE
* Retail Strategy
* Retail Digital
* Data & AI Delivery
* CIO / API Team
* Data Office
* CRM / CVM Team
* Retail Credit Team
* Retail Risk
* Legal & Compliance
* Model Risk / Risk Management
* Contact Center Operations
* Local Digital Channels Team

### Do not use for

| Do not model as `OrgUnit` | Use instead                            |
| ------------------------- | -------------------------------------- |
| Individual person         | Skip for prototype, or future `Person` |
| Country bank              | `NetworkBank`                          |
| User role                 | `UserGroup`                            |

### Minimum properties

| Property        | Type   | Example                                                                                            |
| --------------- | ------ | -------------------------------------------------------------------------------------------------- |
| `id`            | string | `ORG_AICO`                                                                                         |
| `name`          | string | `AICO`                                                                                             |
| `org_unit_type` | enum   | `governance_body`, `business_team`, `technology_team`, `data_team`, `risk_team`, `operations_team` |
| `scope`         | enum   | `group`, `local`, `multi_market`                                                                   |
| `description`   | string | `AI governance committee responsible for review and oversight`                                     |

---

# 6. Reuse, Scaling, and Value Nodes

---

## 6.1 `Blueprint`

### Definition

A reusable pattern that packages functions, controls, tools, channels, or implementation logic for reuse across network banks or use cases.

### Use for

Examples:

* Retail Conversational Banking Assistant Blueprint
* Retail Agent Tooling Blueprint
* Digital Onboarding Assistant Blueprint
* Customer-Facing AI Governance Pattern
* Personalized Offer Governance Pattern
* Complaint AI Pattern

### Do not use for

| Do not model as `Blueprint` | Use instead        |
| --------------------------- | ------------------ |
| Individual project          | `UseCase`          |
| Single reusable function    | `ReusableFunction` |
| API/service                 | `ToolServer`       |
| Governance control          | `Control`          |

### Minimum properties

| Property         | Type   | Example                                                                                       |
| ---------------- | ------ | --------------------------------------------------------------------------------------------- |
| `id`             | string | `BP_RETAIL_CONVERSATIONAL_ASSISTANT`                                                          |
| `name`           | string | `Retail Conversational Banking Assistant Blueprint`                                           |
| `blueprint_type` | enum   | `assistant`, `tooling`, `onboarding`, `governance_pattern`, `complaint_ai`, `personalization` |
| `maturity`       | enum   | `candidate`, `draft`, `approved`, `in_use`                                                    |
| `intended_scope` | enum   | `group`, `multi_market`, `local`                                                              |
| `description`    | string | `Reusable pattern for customer-facing banking assistants`                                     |

---

## 6.2 `Blocker`

### Definition

A missing, immature, unapproved, fragmented, or unavailable dependency that blocks one or more use cases, functions, services, controls, data products, KPIs, or blueprints.

### Use for

Examples:

* KYC/eKYC status API not standardized
* Customer profile access not approved
* Product eligibility logic fragmented
* CRM lead creation API not reusable
* Consent data product incomplete
* Missing audit logging pattern for tool calls
* Incomplete lineage for customer data product
* Complaint data retention control missing
* Local system integration unavailable
* AICO review not completed

### Do not use for

| Do not model as `Blocker` | Use instead                                    |
| ------------------------- | ---------------------------------------------- |
| General risk factor       | `RiskTrigger`                                  |
| Control requirement       | `Control`                                      |
| Use case status only      | property on `UseCase`                          |
| System immaturity alone   | property on `System`, unless it blocks scaling |

### Minimum properties

| Property                      | Type   | Example                                                                      |
| ----------------------------- | ------ | ---------------------------------------------------------------------------- |
| `id`                          | string | `BLK_KYC_API_NOT_STANDARDIZED`                                               |
| `name`                        | string | `KYC/eKYC status API not standardized`                                       |
| `description`                 | string | `No reusable group-standard service for retrieving onboarding or KYC status` |
| `blocker_type`                | enum   | `api`, `data`, `governance`, `platform`, `system`, `control`, `integration`  |
| `severity`                    | enum   | `low`, `medium`, `high`, `critical`                                          |
| `scope`                       | enum   | `local`, `multi_market`, `group`                                             |
| `resolution_status`           | enum   | `not_started`, `in_progress`, `resolved`, `accepted_risk`                    |
| `estimated_resolution_effort` | enum   | `low`, `medium`, `high`                                                      |
| `reuse_impact`                | enum   | `low`, `medium`, `high`                                                      |

---

## 6.3 `KPI`

### Definition

A strategic or operational metric that a use case contributes to or a blocker affects.

### Use for

Examples:

* Digital new-to-bank customers
* Onboarding completion rate
* Mobile engagement
* Digital sales conversion
* Lead conversion rate
* Complaint handling time
* Time-to-market for AI use cases
* Reuse count
* Governance readiness score
* Blocked use-case count
* Containment rate
* Customer satisfaction / NPS

### Do not use for

| Do not model as `KPI` | Use instead                         |
| --------------------- | ----------------------------------- |
| Strategy pillar       | `StrategyPillar`                    |
| Control metric only   | property on `Control` unless needed |
| Project status        | property on `UseCase`               |

### Minimum properties

| Property      | Type   | Example                                                                           |
| ------------- | ------ | --------------------------------------------------------------------------------- |
| `id`          | string | `KPI_DIGITAL_NTB`                                                                 |
| `name`        | string | `Digital new-to-bank customers`                                                   |
| `kpi_type`    | enum   | `strategic`, `operational`, `governance`, `reuse`, `customer_experience`, `sales` |
| `direction`   | enum   | `increase`, `decrease`, `maintain`                                                |
| `description` | string | `Number of customers acquired through digital onboarding channels`                |

---

# 7. Nodes Deliberately Excluded from v1

| Candidate node       | Decision                            | Reason                                                       |
| -------------------- | ----------------------------------- | ------------------------------------------------------------ |
| `Person`             | Exclude                             | Team-level ownership is enough                               |
| `GovernanceBody`     | Merge into `OrgUnit`                | Avoid duplicate reviewer/owner nodes                         |
| `SolutionPattern`    | Use property on `UseCase`           | Simpler for prototype                                        |
| `RiskClassification` | Use property on `UseCase` initially | Add later only if needed                                     |
| `Model`              | Exclude                             | Model registry is not central to the four demo stories       |
| `Permission`         | Exclude                             | Represent through `Control`                                  |
| `Roadmap`            | Exclude                             | Use `UseCase.status`, `target_quarter`, `strategic_priority` |
| `ProjectRepo`        | Exclude                             | Too implementation-heavy                                     |
| `DeploymentRuntime`  | Exclude                             | Use `System` or `ToolServer` properties                      |
| `AuditLog`           | Exclude                             | Use `Control` and `KPI` unless detailed evidence is needed   |

---

# 8. Node Modelling Rules

## Rule 1 — Model as a node if it connects to many things

Use a node when the concept can connect to multiple use cases, controls, systems, KPIs, or blockers.

Examples:

* `ReusableFunction`
* `Blocker`
* `Control`
* `Blueprint`

## Rule 2 — Model as a property if it only describes one thing

Use a property when the value is mainly descriptive.

Examples:

* `UseCase.solution_type`
* `UseCase.status`
* `UseCase.risk_level`
* `ToolServer.maturity`
* `DataProduct.lineage_status`

## Rule 3 — Keep `ReusableFunction` business-readable

Good:

* Check KYC/eKYC status
* Retrieve customer profile
* Create CRM lead

Bad:

* API integration
* AI capability
* Personalization
* Data platform

## Rule 4 — Keep `ToolServer` technical but not too technical

Good:

* Customer Profile Tool Server
* Product Eligibility Tool Server
* CRM Lead Tool Server

Bad:

* Full API endpoint specification
* OAuth scope model
* Full MCP protocol object model

## Rule 5 — Keep controls reusable

Good:

* Audit logging
* Human oversight
* GDPR review
* Output grounding

Bad:

* “Control for Adam TB only”
* One-off task names

## Rule 6 — Use `RiskTrigger` to explain governance

Do not rely only on `risk_level`.

Good:

```text
UseCase → HAS_RISK_TRIGGER → Uses personal data
UseCase → HAS_RISK_TRIGGER → Influences product recommendation
```

## Rule 7 — Use `Blocker` only when there is downstream propagation

A blocker should affect more than one node or explain why something cannot scale.

Good:

* Customer profile access not approved
* KYC API not standardized
* Missing audit logging pattern

Weak:

* “Project delayed”
* “Needs meeting”
* “Team busy”

---

# 9. Final Node Set for v1

Use exactly these node labels in the first build:

```text
UseCase
NetworkBank
Market
StrategyPillar
UserGroup
Channel
BusinessProcess
ReusableFunction
ToolServer
System
DataDomain
DataProduct
KnowledgeBase
RiskTrigger
Control
OrgUnit
Blueprint
Blocker
KPI
```

Total: **19 node labels**.

This is large enough to support the four demo stories, but still manageable because most labels are small reference lists.
