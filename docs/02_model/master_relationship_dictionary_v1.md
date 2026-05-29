# Master Relationship Dictionary v1

## RBI Retail AI Portfolio Intelligence Graph

## 1. Purpose

This relationship dictionary defines the allowed edge types for the prototype knowledge graph.

The relationship model supports four demo value stories:

1. Assistant overlap → reusable blueprint
2. Shared tool/service layer across Retail AI agents
3. Governance gap by analogy
4. Scaling blocker propagation

The goal is to keep relationship types expressive enough for graph insights, but constrained enough for a one-day prototype.

---

# 2. Relationship Dictionary Summary

| Relationship               | From → To                                          | Purpose                                   |
| -------------------------- | -------------------------------------------------- | ----------------------------------------- |
| `HAS_NETWORK_BANK`         | `RBIGroup → NetworkBank`                           | Group-to-bank context                     |
| `HAS_STRATEGY`             | `RBIGroup → StrategyPillar`                        | Group-to-strategy context                 |
| `OPERATES_IN`              | `NetworkBank → Market`                             | Country/jurisdiction context              |
| `HAS_SYSTEM`               | `NetworkBank → System`                             | Local/group systems available to a bank   |
| `IMPLEMENTED_IN`           | `UseCase → NetworkBank`                            | Where a use case runs                     |
| `SERVES`                   | `UseCase → UserGroup`                              | Who uses or is affected by the use case   |
| `DELIVERED_THROUGH`        | `UseCase → Channel`                                | Access channel                            |
| `SUPPORTS_PROCESS`         | `UseCase → BusinessProcess`                        | Banking/customer process supported        |
| `SUPPORTS_STRATEGY`        | `UseCase → StrategyPillar`                         | Strategy alignment                        |
| `MEASURED_BY`              | `UseCase → KPI`                                    | KPI contribution                          |
| `NEEDS_FUNCTION`           | `UseCase → ReusableFunction`                       | Functional requirement                    |
| `DELIVERED_BY`             | `ReusableFunction → ToolServer`                    | Technical service delivering the function |
| `USES_SYSTEM`              | `UseCase/ToolServer → System`                      | System dependency                         |
| `USES_DATA_DOMAIN`         | `UseCase/ToolServer → DataDomain`                  | Data dependency                           |
| `USES_KNOWLEDGE`           | `UseCase/ToolServer → KnowledgeBase`               | Knowledge dependency                      |
| `REQUIRES_DATA_PRODUCT`    | `UseCase → DataProduct`                            | Governed data product dependency          |
| `COVERS_DATA_DOMAIN`       | `DataProduct → DataDomain`                         | Data domain covered by data product       |
| `SOURCES_FROM`             | `DataProduct → System`                             | Source system for data product            |
| `HAS_RISK_TRIGGER`         | `UseCase → RiskTrigger`                            | Risk/gov reason                           |
| `IMPLIES_CONTROL`          | `RiskTrigger → Control`                            | Control implied by risk trigger           |
| `REQUIRES_CONTROL`         | `UseCase/ToolServer/DataProduct → Control`         | Required safeguard                        |
| `HAS_COMPLETED_CONTROL`    | `UseCase → Control`                                | Completed safeguard                       |
| `MISSING_CONTROL`          | `UseCase → Control`                                | Missing safeguard                         |
| `OWNED_BY`                 | `UseCase/ToolServer/DataProduct/Blocker → OrgUnit` | Ownership                                 |
| `REVIEWED_BY`              | `UseCase → OrgUnit`                                | Review/governance forum                   |
| `CANDIDATE_FOR`            | `UseCase → Blueprint`                              | Strong blueprint fit                      |
| `PARTIAL_VARIANT_OF`       | `UseCase → Blueprint`                              | Adjacent/partial blueprint fit            |
| `INCLUDES_FUNCTION`        | `Blueprint → ReusableFunction`                     | Blueprint component                       |
| `INCLUDES_TOOL_SERVER`     | `Blueprint → ToolServer`                           | Blueprint technical component             |
| `INCLUDES_CONTROL`         | `Blueprint → Control`                              | Blueprint safeguard                       |
| `INCLUDES_CHANNEL_PATTERN` | `Blueprint → Channel`                              | Blueprint channel pattern                 |
| `BLOCKED_BY`               | `UseCase → Blocker`                                | Direct blocker                            |
| `BLOCKS_FUNCTION`          | `Blocker → ReusableFunction`                       | Function blocked                          |
| `BLOCKS_TOOL_SERVER`       | `Blocker → ToolServer`                             | Tool/service blocked                      |
| `BLOCKS_DATA_PRODUCT`      | `Blocker → DataProduct`                            | Data product blocked                      |
| `BLOCKS_CONTROL`           | `Blocker → Control`                                | Control/evidence blocked                  |
| `AFFECTS_KPI`              | `Blocker → KPI`                                    | Business metric affected                  |
| `AFFECTS_BLUEPRINT`        | `Blocker → Blueprint`                              | Reuse pattern affected                    |
| `SIMILAR_RISK_TO`          | `UseCase → UseCase`                                | Derived risk similarity                   |
| `SIMILAR_FUNCTIONALLY_TO`  | `UseCase → UseCase`                                | Derived functional similarity             |

---

# 3. Group, Bank, and Market Relationships

---

## 3.1 `HAS_NETWORK_BANK`

### Pattern

```text
RBIGroup → HAS_NETWORK_BANK → NetworkBank
```

### Definition

Connects RBI Group to network banks or group-level units.

### Use for

Examples:

```text
RBI Group → HAS_NETWORK_BANK → Tatra banka
RBI Group → HAS_NETWORK_BANK → Raiffeisen Bank Kosovo
RBI Group → HAS_NETWORK_BANK → RBI Group Retail
```

### Relationship properties

| Property            | Example             |
| ------------------- | ------------------- |
| `relationship_type` | `ownership_context` |
| `confidence`        | `high`              |

---

## 3.2 `HAS_STRATEGY`

### Pattern

```text
RBIGroup → HAS_STRATEGY → StrategyPillar
```

### Definition

Connects RBI Group to the strategic pillars used in the demo.

### Use for

Examples:

```text
RBI Group → HAS_STRATEGY → Acquire
RBI Group → HAS_STRATEGY → Engage
RBI Group → HAS_STRATEGY → Monetize
```

---

## 3.3 `OPERATES_IN`

### Pattern

```text
NetworkBank → OPERATES_IN → Market
```

### Definition

Connects a bank or group unit to a country/jurisdiction.

### Use for

Examples:

```text
Tatra banka → OPERATES_IN → Slovakia
Raiffeisen Bank Kosovo → OPERATES_IN → Kosovo
RBUA → OPERATES_IN → Austria
```

### Relationship properties

| Property         | Example |
| ---------------- | ------- |
| `primary_market` | `true`  |

---

## 3.4 `HAS_SYSTEM`

### Pattern

```text
NetworkBank → HAS_SYSTEM → System
```

### Definition

Shows that a system is available, implemented, or relevant in a bank/unit.

### Use for

Examples:

```text
Tatra banka → HAS_SYSTEM → Mobile Banking Platform
RBI Group → HAS_SYSTEM → Internal GenAI Platform
Local Bank → HAS_SYSTEM → CRM / Campaign Platform
```

### Relationship properties

| Property              | Example                                      |
| --------------------- | -------------------------------------------- |
| `availability_status` | `available`, `partial`, `unknown`, `planned` |
| `scope`               | `local`, `group`, `multi_market`             |

---

# 4. Use Case Context Relationships

---

## 4.1 `IMPLEMENTED_IN`

### Pattern

```text
UseCase → IMPLEMENTED_IN → NetworkBank
```

### Definition

Shows where the use case is implemented, piloted, planned, or relevant.

### Use for

Examples:

```text
Adam TB → IMPLEMENTED_IN → Tatra banka
RAIA Kosovo → IMPLEMENTED_IN → Raiffeisen Bank Kosovo
Digital Onboarding Assistant → IMPLEMENTED_IN → RBI Group
```

### Relationship properties

| Property                | Example                                              |
| ----------------------- | ---------------------------------------------------- |
| `implementation_status` | `planned`, `pilot`, `production`, `deprecated`       |
| `scope`                 | `local`, `group`, `multi_market`                     |
| `confidence`            | `publicly_observed`, `hypothetical_demo`, `inferred` |

---

## 4.2 `SERVES`

### Pattern

```text
UseCase → SERVES → UserGroup
```

### Definition

Shows who uses or is directly affected by the use case.

### Use for

Examples:

```text
Adam TB → SERVES → Retail customer
Branch Advisor Copilot → SERVES → Branch advisor
Complaint Triage Assistant → SERVES → Contact-center agent
```

### Relationship properties

| Property       | Example                                        |
| -------------- | ---------------------------------------------- |
| `primary_user` | `true`                                         |
| `impact_type`  | `direct_user`, `affected_customer`, `reviewer` |

---

## 4.3 `DELIVERED_THROUGH`

### Pattern

```text
UseCase → DELIVERED_THROUGH → Channel
```

### Definition

Shows the channel through which the use case is accessed.

### Use for

Examples:

```text
Adam TB → DELIVERED_THROUGH → Mobile app
RAIA Kosovo → DELIVERED_THROUGH → Website
Voicebot → DELIVERED_THROUGH → Phone / voice
```

### Relationship properties

| Property          | Example                               |
| ----------------- | ------------------------------------- |
| `primary_channel` | `true`                                |
| `access_context`  | `public`, `authenticated`, `internal` |

---

## 4.4 `SUPPORTS_PROCESS`

### Pattern

```text
UseCase → SUPPORTS_PROCESS → BusinessProcess
```

### Definition

Connects a use case to the banking/customer process it supports.

### Use for

Examples:

```text
Digital Onboarding Assistant → SUPPORTS_PROCESS → Digital onboarding
Product Recommendation Assistant → SUPPORTS_PROCESS → Product recommendation
Complaint Triage Assistant → SUPPORTS_PROCESS → Complaint handling
```

### Relationship properties

| Property        | Example                |
| --------------- | ---------------------- |
| `support_level` | `primary`, `secondary` |

---

## 4.5 `SUPPORTS_STRATEGY`

### Pattern

```text
UseCase → SUPPORTS_STRATEGY → StrategyPillar
```

### Definition

Connects a use case to Acquire, Engage, Monetize, or another selected strategy pillar.

### Use for

Examples:

```text
Digital Onboarding Assistant → SUPPORTS_STRATEGY → Acquire
Customer Assistant → SUPPORTS_STRATEGY → Engage
Personalized Offer Engine → SUPPORTS_STRATEGY → Monetize
```

### Relationship properties

| Property             | Example                                                  |
| -------------------- | -------------------------------------------------------- |
| `alignment_strength` | `primary`, `secondary`                                   |
| `rationale`          | `Supports digital engagement through assisted servicing` |

---

## 4.6 `MEASURED_BY`

### Pattern

```text
UseCase → MEASURED_BY → KPI
```

### Definition

Shows which KPI is relevant to measuring the value of a use case.

### Use for

Examples:

```text
Digital Onboarding Assistant → MEASURED_BY → Digital new-to-bank customers
CRM Lead Assistant → MEASURED_BY → Lead conversion rate
Customer Assistant → MEASURED_BY → Containment rate
```

### Relationship properties

| Property             | Example                |
| -------------------- | ---------------------- |
| `contribution_type`  | `direct`, `indirect`   |
| `expected_direction` | `increase`, `decrease` |

---

# 5. Reuse and Service-Layer Relationships

---

## 5.1 `NEEDS_FUNCTION`

### Pattern

```text
UseCase → NEEDS_FUNCTION → ReusableFunction
```

### Definition

Shows that a use case requires a reusable business/technical function to operate.

### Use for

Examples:

```text
Authenticated Customer Assistant → NEEDS_FUNCTION → Retrieve customer profile
Digital Onboarding Assistant → NEEDS_FUNCTION → Check KYC/eKYC status
Sales Assistant → NEEDS_FUNCTION → Create CRM lead
```

### Relationship properties

| Property                       | Example                                |
| ------------------------------ | -------------------------------------- |
| `importance`                   | `required`, `optional`, `nice_to_have` |
| `reuse_relevance`              | `low`, `medium`, `high`                |
| `function_status_for_use_case` | `available`, `missing`, `partial`      |

### Modelling rule

This is one of the most important edges in the prototype. It should be used heavily.

---

## 5.2 `DELIVERED_BY`

### Pattern

```text
ReusableFunction → DELIVERED_BY → ToolServer
```

### Definition

Shows which technical service delivers a reusable function.

### Use for

Examples:

```text
Retrieve customer profile → DELIVERED_BY → Customer Profile Tool Server
Check KYC/eKYC status → DELIVERED_BY → KYC Status Tool Server
Retrieve product knowledge → DELIVERED_BY → Product Knowledge Retrieval Service
```

### Relationship properties

| Property                 | Example                                                    |
| ------------------------ | ---------------------------------------------------------- |
| `delivery_status`        | `available`, `fragmented`, `planned`, `missing`            |
| `standardization_status` | `local_only`, `candidate_group_standard`, `group_standard` |
| `confidence`             | `high`, `medium`, `low`                                    |

---

## 5.3 `USES_SYSTEM`

### Patterns

```text
UseCase → USES_SYSTEM → System
ToolServer → USES_SYSTEM → System
```

### Definition

Shows that a use case or tool server depends on a system.

### Use for

Examples:

```text
Adam TB → USES_SYSTEM → Mobile Banking Platform
CRM Lead Tool Server → USES_SYSTEM → CRM / Campaign Platform
KYC Status Tool Server → USES_SYSTEM → KYC/eKYC Platform
```

### Relationship properties

| Property             | Example                                                       |
| -------------------- | ------------------------------------------------------------- |
| `usage_type`         | `read`, `write`, `read_write`, `runtime`, `channel`, `source` |
| `criticality`        | `low`, `medium`, `high`                                       |
| `integration_status` | `available`, `partial`, `missing`, `planned`                  |

---

## 5.4 `USES_DATA_DOMAIN`

### Patterns

```text
UseCase → USES_DATA_DOMAIN → DataDomain
ToolServer → USES_DATA_DOMAIN → DataDomain
```

### Definition

Shows data categories used by a use case or technical service.

### Use for

Examples:

```text
Personalized Offer Engine → USES_DATA_DOMAIN → Customer profile
Customer Profile Tool Server → USES_DATA_DOMAIN → Product holdings
Complaint Triage Assistant → USES_DATA_DOMAIN → Complaint history
```

### Relationship properties

| Property        | Example                                                                   |
| --------------- | ------------------------------------------------------------------------- |
| `usage_purpose` | `retrieval`, `recommendation`, `classification`, `workflow`, `monitoring` |
| `sensitivity`   | `low`, `medium`, `high`                                                   |
| `access_status` | `approved`, `restricted`, `not_approved`                                  |

---

## 5.5 `USES_KNOWLEDGE`

### Patterns

```text
UseCase → USES_KNOWLEDGE → KnowledgeBase
ToolServer → USES_KNOWLEDGE → KnowledgeBase
```

### Definition

Shows that a use case or tool service relies on a curated knowledge base.

### Use for

Examples:

```text
Adam TB → USES_KNOWLEDGE → Product FAQ Knowledge Base
Product Knowledge Retrieval Service → USES_KNOWLEDGE → Tariff / Fees Knowledge Base
Product Knowledge yellowGPT → USES_KNOWLEDGE → Product Policy Knowledge Base
```

### Relationship properties

| Property          | Example                                                      |
| ----------------- | ------------------------------------------------------------ |
| `usage_type`      | `retrieval`, `grounding`, `answer_drafting`, `staff_support` |
| `approval_status` | `approved`, `needs_review`, `local_only`                     |
| `localization`    | `group`, `local`, `multi_market`                             |

---

# 6. Data Product Relationships

---

## 6.1 `REQUIRES_DATA_PRODUCT`

### Pattern

```text
UseCase → REQUIRES_DATA_PRODUCT → DataProduct
```

### Definition

Shows that a use case requires a governed data product.

### Use for

Examples:

```text
Personalized Offer Engine → REQUIRES_DATA_PRODUCT → Customer 360 Data Product
Campaign Assistant → REQUIRES_DATA_PRODUCT → Consent Data Product
Loan Affordability Recommender → REQUIRES_DATA_PRODUCT → Transaction Summary Data Product
```

### Relationship properties

| Property              | Example                                  |
| --------------------- | ---------------------------------------- |
| `criticality`         | `low`, `medium`, `high`                  |
| `access_status`       | `approved`, `restricted`, `not_approved` |
| `lineage_requirement` | `low`, `medium`, `high`                  |

---

## 6.2 `COVERS_DATA_DOMAIN`

### Pattern

```text
DataProduct → COVERS_DATA_DOMAIN → DataDomain
```

### Definition

Shows which logical data domain a data product packages or represents.

### Use for

Examples:

```text
Customer 360 Data Product → COVERS_DATA_DOMAIN → Customer profile
Consent Data Product → COVERS_DATA_DOMAIN → Consent
KYC Status Data Product → COVERS_DATA_DOMAIN → KYC / identity verification
```

---

## 6.3 `SOURCES_FROM`

### Pattern

```text
DataProduct → SOURCES_FROM → System
```

### Definition

Shows source systems feeding a data product.

### Use for

Examples:

```text
Customer 360 Data Product → SOURCES_FROM → Customer Master
Consent Data Product → SOURCES_FROM → Consent Management System
CRM Interaction Data Product → SOURCES_FROM → CRM / Campaign Platform
```

### Relationship properties

| Property          | Example                                           |
| ----------------- | ------------------------------------------------- |
| `source_type`     | `primary`, `secondary`                            |
| `lineage_status`  | `complete`, `partial`, `missing`                  |
| `refresh_pattern` | `batch`, `near_real_time`, `real_time`, `unknown` |

---

# 7. Governance Relationships

---

## 7.1 `HAS_RISK_TRIGGER`

### Pattern

```text
UseCase → HAS_RISK_TRIGGER → RiskTrigger
```

### Definition

Shows why a use case requires governance attention.

### Use for

Examples:

```text
Personalized Offer Engine → HAS_RISK_TRIGGER → Uses behavioural data
Authenticated Mobile Assistant → HAS_RISK_TRIGGER → Operates in authenticated channel
Loan Affordability Recommender → HAS_RISK_TRIGGER → Credit-adjacent recommendation
```

### Relationship properties

| Property           | Example                                                  |
| ------------------ | -------------------------------------------------------- |
| `trigger_strength` | `low`, `medium`, `high`                                  |
| `evidence_status`  | `assumed`, `documented`, `observed`, `hypothetical_demo` |

---

## 7.2 `IMPLIES_CONTROL`

### Pattern

```text
RiskTrigger → IMPLIES_CONTROL → Control
```

### Definition

Shows which control is implied by a risk trigger.

### Use for

Examples:

```text
Uses personal data → IMPLIES_CONTROL → GDPR review
Influences product recommendation → IMPLIES_CONTROL → Fairness / bias review
Customer-facing GenAI output → IMPLIES_CONTROL → Content safety
```

### Relationship properties

| Property               | Example                                     |
| ---------------------- | ------------------------------------------- |
| `requirement_strength` | `mandatory`, `recommended`, `contextual`    |
| `rationale`            | `Personal data use requires privacy review` |

---

## 7.3 `REQUIRES_CONTROL`

### Patterns

```text
UseCase → REQUIRES_CONTROL → Control
ToolServer → REQUIRES_CONTROL → Control
DataProduct → REQUIRES_CONTROL → Control
```

### Definition

Shows controls required by a use case, service, or data product.

### Use for

Examples:

```text
Authenticated Customer Assistant → REQUIRES_CONTROL → Audit logging
Customer Profile Tool Server → REQUIRES_CONTROL → Role-based access control
Customer 360 Data Product → REQUIRES_CONTROL → Data lineage
```

### Relationship properties

| Property            | Example                                               |
| ------------------- | ----------------------------------------------------- |
| `requirement_level` | `mandatory`, `recommended`, `conditional`             |
| `source`            | `risk_trigger`, `policy`, `architecture`, `demo_rule` |

---

## 7.4 `HAS_COMPLETED_CONTROL`

### Pattern

```text
UseCase → HAS_COMPLETED_CONTROL → Control
```

### Definition

Shows that a required control has been completed or evidenced for a use case.

### Use for

Examples:

```text
Personalized Offer Engine → HAS_COMPLETED_CONTROL → GDPR review
Credit Pre-Approval Assistant → HAS_COMPLETED_CONTROL → Human oversight
```

### Relationship properties

| Property            | Example                                   |
| ------------------- | ----------------------------------------- |
| `completion_status` | `complete`, `partial`, `evidence_pending` |
| `completion_date`   | `2026-04-15`                              |
| `evidence_status`   | `documented`, `assumed_demo`, `missing`   |

---

## 7.5 `MISSING_CONTROL`

### Pattern

```text
UseCase → MISSING_CONTROL → Control
```

### Definition

Shows that a control appears required but has not been completed or evidenced.

### Use for

Examples:

```text
Product Recommendation Assistant → MISSING_CONTROL → Fairness / bias review
Loan Affordability Recommender → MISSING_CONTROL → Model validation
Authenticated Assistant → MISSING_CONTROL → Audit logging
```

### Relationship properties

| Property          | Example                                                                  |
| ----------------- | ------------------------------------------------------------------------ |
| `gap_severity`    | `low`, `medium`, `high`                                                  |
| `reason`          | `Similar reviewed case has this control but current case lacks evidence` |
| `evidence_status` | `missing`, `unknown`, `hypothetical_demo`                                |

---

# 8. Ownership and Review Relationships

---

## 8.1 `OWNED_BY`

### Patterns

```text
UseCase → OWNED_BY → OrgUnit
ToolServer → OWNED_BY → OrgUnit
DataProduct → OWNED_BY → OrgUnit
Blocker → OWNED_BY → OrgUnit
```

### Definition

Shows ownership or accountability.

### Use for

Examples:

```text
Digital Onboarding Assistant → OWNED_BY → Retail Digital
KYC Status Tool Server → OWNED_BY → CIO / API Team
Customer 360 Data Product → OWNED_BY → Data Office
KYC API not standardized → OWNED_BY → CIO / API Team
```

### Relationship properties

| Property         | Example                                                                     |
| ---------------- | --------------------------------------------------------------------------- |
| `ownership_type` | `business_owner`, `technical_owner`, `governance_owner`, `resolution_owner` |
| `primary_owner`  | `true`                                                                      |

---

## 8.2 `REVIEWED_BY`

### Pattern

```text
UseCase → REVIEWED_BY → OrgUnit
```

### Definition

Shows that a use case has been reviewed by a governance, architecture, compliance, or technical body.

### Use for

Examples:

```text
Personalized Offer Engine → REVIEWED_BY → AICO
Authenticated Customer Assistant → REVIEWED_BY → AICoE
Digital Onboarding Assistant → REVIEWED_BY → CIO / Architecture
```

### Relationship properties

| Property        | Example                                                           |
| --------------- | ----------------------------------------------------------------- |
| `review_type`   | `AICO`, `AICoE`, `GDPR`, `architecture`, `model_risk`, `business` |
| `review_status` | `not_started`, `in_review`, `reviewed`, `missing_evidence`        |
| `review_date`   | `2026-04-10`                                                      |

---

# 9. Blueprint Relationships

---

## 9.1 `CANDIDATE_FOR`

### Pattern

```text
UseCase → CANDIDATE_FOR → Blueprint
```

### Definition

Shows that a use case is a strong candidate for reuse under a blueprint.

### Use for

Examples:

```text
Adam TB → CANDIDATE_FOR → Retail Conversational Banking Assistant Blueprint
RAIA Kosovo → CANDIDATE_FOR → Retail Conversational Banking Assistant Blueprint
Digital Onboarding Assistant → CANDIDATE_FOR → Digital Onboarding Assistant Blueprint
```

### Relationship properties

| Property          | Example                                                                      |
| ----------------- | ---------------------------------------------------------------------------- |
| `fit_strength`    | `high`, `medium`, `low`                                                      |
| `rationale`       | `Shares core assistant functions, channels, knowledge sources, and controls` |
| `evidence_status` | `observed`, `inferred`, `hypothetical_demo`                                  |

---

## 9.2 `PARTIAL_VARIANT_OF`

### Pattern

```text
UseCase → PARTIAL_VARIANT_OF → Blueprint
```

### Definition

Shows that a use case is related to a blueprint but is not a full match.

### Use for

Examples:

```text
RBUA/RBCZ Voicebot → PARTIAL_VARIANT_OF → Retail Conversational Banking Assistant Blueprint
Retail Product Knowledge yellowGPT → PARTIAL_VARIANT_OF → Retail Conversational Banking Assistant Blueprint
```

### Relationship properties

| Property       | Example                                                                                 |
| -------------- | --------------------------------------------------------------------------------------- |
| `variant_type` | `voice_variant`, `internal_staff_variant`, `limited_channel_variant`                    |
| `fit_strength` | `medium`, `low`                                                                         |
| `rationale`    | `Shares knowledge retrieval and intent handling, but differs by channel and user group` |

---

## 9.3 `INCLUDES_FUNCTION`

### Pattern

```text
Blueprint → INCLUDES_FUNCTION → ReusableFunction
```

### Definition

Shows that a blueprint includes a reusable function.

### Use for

Examples:

```text
Retail Conversational Banking Assistant Blueprint → INCLUDES_FUNCTION → Retrieve product knowledge
Retail Agent Tooling Blueprint → INCLUDES_FUNCTION → Retrieve customer profile
Digital Onboarding Assistant Blueprint → INCLUDES_FUNCTION → Check KYC/eKYC status
```

### Relationship properties

| Property         | Example                                |
| ---------------- | -------------------------------------- |
| `component_role` | `core`, `optional`, `variant_specific` |
| `priority`       | `high`, `medium`, `low`                |

---

## 9.4 `INCLUDES_TOOL_SERVER`

### Pattern

```text
Blueprint → INCLUDES_TOOL_SERVER → ToolServer
```

### Definition

Shows that a blueprint includes or recommends a reusable tool/API/service component.

### Use for

Examples:

```text
Retail Agent Tooling Blueprint → INCLUDES_TOOL_SERVER → Customer Profile Tool Server
Retail Agent Tooling Blueprint → INCLUDES_TOOL_SERVER → CRM Lead Tool Server
Digital Onboarding Assistant Blueprint → INCLUDES_TOOL_SERVER → KYC Status Tool Server
```

### Relationship properties

| Property                 | Example                                   |
| ------------------------ | ----------------------------------------- |
| `component_role`         | `core`, `optional`, `future_candidate`    |
| `standardization_target` | `local`, `multi_market`, `group_standard` |

---

## 9.5 `INCLUDES_CONTROL`

### Pattern

```text
Blueprint → INCLUDES_CONTROL → Control
```

### Definition

Shows that a blueprint includes a reusable governance, privacy, security, operational, or model-risk control.

### Use for

Examples:

```text
Customer-Facing AI Governance Pattern → INCLUDES_CONTROL → AICO review
Retail Conversational Banking Assistant Blueprint → INCLUDES_CONTROL → Content safety
Retail Agent Tooling Blueprint → INCLUDES_CONTROL → API access control
```

### Relationship properties

| Property             | Example                                                                  |
| -------------------- | ------------------------------------------------------------------------ |
| `control_role`       | `mandatory`, `recommended`, `conditional`                                |
| `applies_to_variant` | `all`, `authenticated`, `internal`, `customer_facing`, `credit_adjacent` |

---

## 9.6 `INCLUDES_CHANNEL_PATTERN`

### Pattern

```text
Blueprint → INCLUDES_CHANNEL_PATTERN → Channel
```

### Definition

Shows which channel patterns a blueprint can support.

### Use for

Examples:

```text
Retail Conversational Banking Assistant Blueprint → INCLUDES_CHANNEL_PATTERN → Mobile app
Retail Conversational Banking Assistant Blueprint → INCLUDES_CHANNEL_PATTERN → Website
Retail Conversational Banking Assistant Blueprint → INCLUDES_CHANNEL_PATTERN → Phone / voice
```

### Relationship properties

| Property         | Example                               |
| ---------------- | ------------------------------------- |
| `channel_role`   | `core`, `optional`, `variant`         |
| `access_context` | `public`, `authenticated`, `internal` |

---

# 10. Blocker Relationships

---

## 10.1 `BLOCKED_BY`

### Pattern

```text
UseCase → BLOCKED_BY → Blocker
```

### Definition

Shows that a use case is directly affected by a blocker.

### Use for

Examples:

```text
Digital Onboarding Assistant → BLOCKED_BY → KYC/eKYC status API not standardized
Authenticated Customer Assistant → BLOCKED_BY → Customer profile access not approved
CRM Lead Assistant → BLOCKED_BY → CRM lead creation API not reusable
```

### Relationship properties

| Property           | Example                                                   |
| ------------------ | --------------------------------------------------------- |
| `impact_level`     | `low`, `medium`, `high`, `critical`                       |
| `blocking_status`  | `partial`, `full`, `risk_to_scale`                        |
| `impact_rationale` | `Required function unavailable as reusable group service` |

---

## 10.2 `BLOCKS_FUNCTION`

### Pattern

```text
Blocker → BLOCKS_FUNCTION → ReusableFunction
```

### Definition

Shows that a blocker prevents or limits a reusable function.

### Use for

Examples:

```text
KYC/eKYC status API not standardized → BLOCKS_FUNCTION → Check KYC/eKYC status
Customer profile access not approved → BLOCKS_FUNCTION → Retrieve customer profile
CRM lead creation API not reusable → BLOCKS_FUNCTION → Create CRM lead
```

### Relationship properties

| Property                | Example                                                                 |
| ----------------------- | ----------------------------------------------------------------------- |
| `block_strength`        | `low`, `medium`, `high`                                                 |
| `resolution_dependency` | `API standardization`, `data access approval`, `control implementation` |

---

## 10.3 `BLOCKS_TOOL_SERVER`

### Pattern

```text
Blocker → BLOCKS_TOOL_SERVER → ToolServer
```

### Definition

Shows that a blocker prevents or limits a tool/API/service.

### Use for

Examples:

```text
KYC/eKYC status API not standardized → BLOCKS_TOOL_SERVER → KYC Status Tool Server
Missing audit logging pattern → BLOCKS_TOOL_SERVER → CRM Lead Tool Server
Product eligibility logic fragmented → BLOCKS_TOOL_SERVER → Product Eligibility Tool Server
```

### Relationship properties

| Property         | Example                                  |
| ---------------- | ---------------------------------------- |
| `block_strength` | `low`, `medium`, `high`                  |
| `status`         | `not_started`, `in_progress`, `resolved` |

---

## 10.4 `BLOCKS_DATA_PRODUCT`

### Pattern

```text
Blocker → BLOCKS_DATA_PRODUCT → DataProduct
```

### Definition

Shows that a blocker prevents or limits a governed reusable data product.

### Use for

Examples:

```text
Consent data product incomplete → BLOCKS_DATA_PRODUCT → Consent Data Product
Incomplete lineage for customer data product → BLOCKS_DATA_PRODUCT → Customer 360 Data Product
```

### Relationship properties

| Property               | Example                                                 |
| ---------------------- | ------------------------------------------------------- |
| `block_strength`       | `low`, `medium`, `high`                                 |
| `data_readiness_issue` | `lineage`, `access`, `quality`, `ownership`, `coverage` |

---

## 10.5 `BLOCKS_CONTROL`

### Pattern

```text
Blocker → BLOCKS_CONTROL → Control
```

### Definition

Shows that a blocker is preventing a required control from being implemented or evidenced.

### Use for

Examples:

```text
Missing audit logging pattern → BLOCKS_CONTROL → Audit logging
AICO review not completed → BLOCKS_CONTROL → AICO review
Complaint data retention control missing → BLOCKS_CONTROL → Data retention control
```

### Relationship properties

| Property          | Example                         |
| ----------------- | ------------------------------- |
| `block_strength`  | `low`, `medium`, `high`         |
| `evidence_status` | `missing`, `partial`, `unknown` |

---

## 10.6 `AFFECTS_KPI`

### Pattern

```text
Blocker → AFFECTS_KPI → KPI
```

### Definition

Shows that a blocker affects a strategic or operational metric.

### Use for

Examples:

```text
KYC/eKYC status API not standardized → AFFECTS_KPI → Digital new-to-bank customers
CRM lead creation API not reusable → AFFECTS_KPI → Lead conversion rate
Missing audit logging pattern → AFFECTS_KPI → Governance readiness score
```

### Relationship properties

| Property           | Example                                                |
| ------------------ | ------------------------------------------------------ |
| `impact_direction` | `negative`, `positive`                                 |
| `impact_type`      | `delay`, `risk`, `reduced_conversion`, `blocked_scale` |
| `impact_strength`  | `low`, `medium`, `high`                                |

---

## 10.7 `AFFECTS_BLUEPRINT`

### Pattern

```text
Blocker → AFFECTS_BLUEPRINT → Blueprint
```

### Definition

Shows that a blocker prevents or limits reuse of a blueprint.

### Use for

Examples:

```text
Customer profile access not approved → AFFECTS_BLUEPRINT → Retail Agent Tooling Blueprint
KYC/eKYC status API not standardized → AFFECTS_BLUEPRINT → Digital Onboarding Assistant Blueprint
Missing audit logging pattern → AFFECTS_BLUEPRINT → Retail Agent Tooling Blueprint
```

### Relationship properties

| Property           | Example                                                    |
| ------------------ | ---------------------------------------------------------- |
| `impact_level`     | `low`, `medium`, `high`                                    |
| `impact_rationale` | `Blueprint cannot scale without governed reusable service` |

---

# 11. Derived Similarity Relationships

These relationships may be manually seeded for the prototype or later derived through rule-based or vector similarity.

---

## 11.1 `SIMILAR_RISK_TO`

### Pattern

```text
UseCase → SIMILAR_RISK_TO → UseCase
```

### Definition

Shows that two use cases have similar governance/risk profiles.

### Use for

Examples:

```text
Product Recommendation Assistant → SIMILAR_RISK_TO → Personalized Offer Engine
Loan Affordability Recommender → SIMILAR_RISK_TO → Credit Pre-Approval Assistant
Authenticated Mobile Banking Assistant → SIMILAR_RISK_TO → Public FAQ Assistant
```

### Relationship properties

| Property           | Example                                                                               |
| ------------------ | ------------------------------------------------------------------------------------- |
| `similarity_score` | `0.82`                                                                                |
| `similarity_basis` | `shared risk triggers: personal data, product recommendation, customer-facing output` |
| `derived_by`       | `manual_demo_rule`, `vector_similarity`, `graph_similarity`                           |

### Modelling rule

Use this only when the similarity is analytically useful.

Do not connect every use case to every other use case.

---

## 11.2 `SIMILAR_FUNCTIONALLY_TO`

### Pattern

```text
UseCase → SIMILAR_FUNCTIONALLY_TO → UseCase
```

### Definition

Shows that two use cases have similar functional patterns.

### Use for

Examples:

```text
Adam TB → SIMILAR_FUNCTIONALLY_TO → RAIA Kosovo
RAIA Bosnia → SIMILAR_FUNCTIONALLY_TO → RAIA Croatia
Authenticated Customer Assistant → SIMILAR_FUNCTIONALLY_TO → Digital Onboarding Assistant
```

### Relationship properties

| Property           | Example                                                                                |
| ------------------ | -------------------------------------------------------------------------------------- |
| `similarity_score` | `0.88`                                                                                 |
| `similarity_basis` | `shared functions: intent detection, product knowledge retrieval, escalation, logging` |
| `derived_by`       | `manual_demo_rule`, `vector_similarity`, `graph_similarity`                            |

### Modelling rule

This is useful for Story 1 and vector-search demonstration.

Use sparingly.

---

# 12. Relationship Modelling Rules

## Rule 1 — Prefer canonical relationships

Use the relationship names in this dictionary. Avoid inventing near-duplicates.

Bad:

```text
USES_API
CALLS_SERVICE
CONNECTS_TO_TOOL
```

Good:

```text
NEEDS_FUNCTION
DELIVERED_BY
USES_SYSTEM
```

---

## Rule 2 — Separate functional need from technical delivery

Use:

```text
UseCase → NEEDS_FUNCTION → ReusableFunction
ReusableFunction → DELIVERED_BY → ToolServer
ToolServer → USES_SYSTEM → System
```

Do not collapse this into:

```text
UseCase → USES_SYSTEM → CRM
```

unless the direct system dependency is specifically relevant.

---

## Rule 3 — Use direct `USES_SYSTEM` only when useful

It is acceptable to connect:

```text
Adam TB → USES_SYSTEM → Mobile Banking Platform
```

But do not rely only on direct system links. The reusable insight comes from the function/service layer.

---

## Rule 4 — Use `RiskTrigger` to explain controls

Use:

```text
UseCase → HAS_RISK_TRIGGER → RiskTrigger
RiskTrigger → IMPLIES_CONTROL → Control
UseCase → MISSING_CONTROL → Control
```

This supports governance-gap detection.

---

## Rule 5 — Use `MISSING_CONTROL` only where it drives a demo insight

Do not mark every missing control in the world. Seed only the important gaps.

Examples:

* Product Recommendation Assistant missing fairness review
* Loan Affordability Recommender missing model validation
* Authenticated Assistant missing audit logging

---

## Rule 6 — Use `Blocker` nodes when the issue propagates

A blocker should connect to more than one thing:

```text
Blocker → BLOCKS_FUNCTION → ReusableFunction
Blocker → AFFECTS_KPI → KPI
Blocker → AFFECTS_BLUEPRINT → Blueprint
UseCase → BLOCKED_BY → Blocker
```

If the issue only describes one use case, keep it as a property.

---

## Rule 7 — Use blueprint edges for reuse logic

Use:

```text
UseCase → CANDIDATE_FOR → Blueprint
UseCase → PARTIAL_VARIANT_OF → Blueprint
Blueprint → INCLUDES_FUNCTION → ReusableFunction
Blueprint → INCLUDES_CONTROL → Control
```

This supports the assistant overlap and blueprint extraction story.

---

## Rule 8 — Use relationship properties lightly

Relationship properties are useful but should not explode.

Use them mainly for:

| Relationship       | Useful properties                                               |
| ------------------ | --------------------------------------------------------------- |
| `NEEDS_FUNCTION`   | `importance`, `reuse_relevance`, `function_status_for_use_case` |
| `DELIVERED_BY`     | `delivery_status`, `standardization_status`                     |
| `REQUIRES_CONTROL` | `requirement_level`, `source`                                   |
| `MISSING_CONTROL`  | `gap_severity`, `reason`                                        |
| `BLOCKED_BY`       | `impact_level`, `blocking_status`                               |
| `CANDIDATE_FOR`    | `fit_strength`, `rationale`                                     |
| `SIMILAR_*`        | `similarity_score`, `similarity_basis`, `derived_by`            |

---

# 13. Final Relationship Set for v1

Use exactly these relationship types in the first build:

```text
HAS_NETWORK_BANK
HAS_STRATEGY
OPERATES_IN
HAS_SYSTEM
IMPLEMENTED_IN
SERVES
DELIVERED_THROUGH
SUPPORTS_PROCESS
SUPPORTS_STRATEGY
MEASURED_BY
NEEDS_FUNCTION
DELIVERED_BY
USES_SYSTEM
USES_DATA_DOMAIN
USES_KNOWLEDGE
REQUIRES_DATA_PRODUCT
COVERS_DATA_DOMAIN
SOURCES_FROM
HAS_RISK_TRIGGER
IMPLIES_CONTROL
REQUIRES_CONTROL
HAS_COMPLETED_CONTROL
MISSING_CONTROL
OWNED_BY
REVIEWED_BY
CANDIDATE_FOR
PARTIAL_VARIANT_OF
INCLUDES_FUNCTION
INCLUDES_TOOL_SERVER
INCLUDES_CONTROL
INCLUDES_CHANNEL_PATTERN
BLOCKED_BY
BLOCKS_FUNCTION
BLOCKS_TOOL_SERVER
BLOCKS_DATA_PRODUCT
BLOCKS_CONTROL
AFFECTS_KPI
AFFECTS_BLUEPRINT
SIMILAR_RISK_TO
SIMILAR_FUNCTIONALLY_TO
```

Total: **40 relationship types**.

This is slightly large, but acceptable because they are grouped by purpose and support the four value stories cleanly.
