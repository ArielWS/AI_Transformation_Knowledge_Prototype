# Master Property Dictionary v1

## RBI Retail AI Portfolio Intelligence Graph

## 1. Purpose

This dictionary defines the minimum useful properties for the prototype graph.

The aim is consistency, not exhaustive enterprise modelling. Properties should support:

1. Assistant overlap and blueprint extraction
2. Shared tool/service reuse
3. Governance gap detection
4. Scaling blocker propagation

---

# 2. General Property Rules

## 2.1 Naming conventions

| Rule                | Standard                                      |
| ------------------- | --------------------------------------------- |
| Property names      | `snake_case`                                  |
| IDs                 | stable uppercase IDs, e.g. `UC_ADAM_TB`       |
| Status values       | lowercase enums, e.g. `production`, `planned` |
| Dates               | ISO format, e.g. `2026-04-15`                 |
| Unknown values      | use `unknown`, not blank                      |
| Demo assumptions    | mark with `is_hypothetical_demo_case = true`  |
| Source traceability | use `source_tag`, e.g. `S3`, `S5`, `S10`      |

## 2.2 Common properties

Use these on most node types.

| Property                    |        Type |   Required? | Example                                     |
| --------------------------- | ----------: | ----------: | ------------------------------------------- |
| `id`                        |      string |         Yes | `UC_ADAM_TB`                                |
| `name`                      |      string |         Yes | `Adam TB`                                   |
| `description`               |      string | Recommended | `Customer-facing banking assistant`         |
| `source_tag`                | string/list | Recommended | `S10`                                       |
| `confidence`                |        enum |    Optional | `observed`, `inferred`, `hypothetical_demo` |
| `is_hypothetical_demo_case` |     boolean | Recommended | `true`                                      |

## 2.3 Standard confidence values

```text
observed
publicly_observed
inferred
hypothetical_demo
unknown
```

---

# 3. Node Property Dictionary

---

## 3.1 `UseCase`

### Required properties

| Property                    | Type        | Allowed values / example                                                                                                  |
| --------------------------- | ----------- | ------------------------------------------------------------------------------------------------------------------------- |
| `id`                        | string      | `UC_ADAM_TB`                                                                                                              |
| `name`                      | string      | `Adam TB`                                                                                                                 |
| `description`               | string      | `Customer-facing assistant for product and digital banking support`                                                       |
| `status`                    | enum        | `planned`, `pilot`, `production`, `blocked`, `deprecated`                                                                 |
| `solution_type`             | enum        | `GenAI Assistant`, `Voicebot`, `Agentic Workflow`, `Recommendation Model`, `Classifier`, `Copilot`, `Knowledge Assistant` |
| `access_context`            | enum        | `public`, `authenticated`, `internal`, `mixed`                                                                            |
| `risk_level`                | enum        | `low`, `medium`, `high`, `unknown`                                                                                        |
| `governance_status`         | enum        | `not_started`, `in_review`, `reviewed`, `missing_evidence`, `not_required`, `unknown`                                     |
| `strategic_priority`        | enum        | `low`, `medium`, `high`                                                                                                   |
| `reuse_candidate_score`     | enum        | `low`, `medium`, `high`                                                                                                   |
| `blocked_status`            | enum        | `not_blocked`, `partially_blocked`, `blocked`                                                                             |
| `source_tag`                | string/list | `S10`, `S3`                                                                                                               |
| `is_hypothetical_demo_case` | boolean     | `true`                                                                                                                    |

### Optional properties

| Property                 | Type   | Example                                                                  |
| ------------------------ | ------ | ------------------------------------------------------------------------ |
| `target_quarter`         | string | `Q3 2026`                                                                |
| `overlap_role`           | enum   | `core_overlap`, `partial_overlap`, `internal_variant`, `none`            |
| `reuse_dependency_level` | enum   | `light`, `medium`, `heavy`                                               |
| `customer_impact`        | enum   | `informational`, `recommendation`, `decision_support`, `workflow_action` |
| `review_priority`        | enum   | `low`, `medium`, `high`                                                  |
| `embedding_text`         | string | combined text for vectorization                                          |
| `embedding`              | vector | optional vector field                                                    |

---

## 3.2 `NetworkBank`

| Property      |        Type | Required? | Example                                |
| ------------- | ----------: | --------: | -------------------------------------- |
| `id`          |      string |       Yes | `BANK_TATRA`                           |
| `name`        |      string |       Yes | `Tatra banka`                          |
| `bank_type`   |        enum |       Yes | `network_bank`, `group_unit`           |
| `description` |      string |  Optional | `Slovak network bank within RBI Group` |
| `source_tag`  | string/list |  Optional | `S10`                                  |

---

## 3.3 `Market`

| Property             |   Type |   Required? | Example           |
| -------------------- | -----: | ----------: | ----------------- |
| `id`                 | string |         Yes | `MKT_SK`          |
| `name`               | string |         Yes | `Slovakia`        |
| `region`             | string | Recommended | `CEE`             |
| `jurisdiction_notes` | string |    Optional | `EU member state` |

---

## 3.4 `StrategyPillar`

| Property      |   Type |   Required? | Example                                                                    |
| ------------- | -----: | ----------: | -------------------------------------------------------------------------- |
| `id`          | string |         Yes | `STRAT_ENGAGE`                                                             |
| `name`        | string |         Yes | `Engage`                                                                   |
| `description` | string | Recommended | `Increase customer engagement through digital and human-assisted channels` |

Allowed values for `name`:

```text
Acquire
Engage
Monetize
Digital Bank with Human Touch
```

---

## 3.5 `UserGroup`

| Property      |   Type | Required? | Example                                                                                      |
| ------------- | -----: | --------: | -------------------------------------------------------------------------------------------- |
| `id`          | string |       Yes | `USER_RETAIL_CUSTOMER`                                                                       |
| `name`        | string |       Yes | `Retail customer`                                                                            |
| `user_type`   |   enum |       Yes | `external_customer`, `internal_staff`, `operations_user`, `governance_user`, `business_user` |
| `description` | string |  Optional | `End customer using banking services`                                                        |

---

## 3.6 `Channel`

| Property         |   Type |   Required? | Example                                                                 |
| ---------------- | -----: | ----------: | ----------------------------------------------------------------------- |
| `id`             | string |         Yes | `CH_MOBILE_APP`                                                         |
| `name`           | string |         Yes | `Mobile app`                                                            |
| `channel_type`   |   enum |         Yes | `customer_digital`, `staff_internal`, `voice`, `operations`, `campaign` |
| `access_context` |   enum | Recommended | `public`, `authenticated`, `internal`, `mixed`                          |

---

## 3.7 `BusinessProcess`

| Property       |   Type |   Required? | Example                                                           |
| -------------- | -----: | ----------: | ----------------------------------------------------------------- |
| `id`           | string |         Yes | `PROC_DIGITAL_ONBOARDING`                                         |
| `name`         | string |         Yes | `Digital onboarding`                                              |
| `process_area` |   enum | Recommended | `acquisition`, `engagement`, `monetization`, `operations`, `risk` |
| `description`  | string |    Optional | `Journey for opening an account digitally`                        |

---

## 3.8 `ReusableFunction`

| Property                 |   Type |   Required? | Example                                                                                                  |
| ------------------------ | -----: | ----------: | -------------------------------------------------------------------------------------------------------- |
| `id`                     | string |         Yes | `FUNC_CHECK_KYC_STATUS`                                                                                  |
| `name`                   | string |         Yes | `Check KYC/eKYC status`                                                                                  |
| `description`            | string |         Yes | `Retrieve current identity verification or onboarding status`                                            |
| `function_type`          |   enum |         Yes | `knowledge_retrieval`, `data_access`, `workflow_action`, `decision_support`, `control`, `classification` |
| `reuse_priority`         |   enum | Recommended | `low`, `medium`, `high`                                                                                  |
| `governance_sensitivity` |   enum | Recommended | `low`, `medium`, `high`                                                                                  |
| `embedding_text`         | string |    Optional | function name + description                                                                              |
| `embedding`              | vector |    Optional | vectorized representation                                                                                |

---

## 3.9 `ToolServer`

| Property                 |   Type |   Required? | Example                                                                            |
| ------------------------ | -----: | ----------: | ---------------------------------------------------------------------------------- |
| `id`                     | string |         Yes | `TOOL_KYC_STATUS`                                                                  |
| `name`                   | string |         Yes | `KYC Status Tool Server`                                                           |
| `description`            | string |         Yes | `Governed service exposing onboarding/KYC status to approved agents`               |
| `service_type`           |   enum |         Yes | `API`, `MCP-style tool server`, `RAG service`, `workflow service`, `model service` |
| `scope`                  |   enum | Recommended | `local`, `group`, `candidate_group_standard`, `multi_market`                       |
| `maturity`               |   enum | Recommended | `available`, `fragmented`, `missing`, `planned`                                    |
| `standardization_status` |   enum | Recommended | `local_only`, `candidate_group_standard`, `group_standard`, `not_standardized`     |
| `access_pattern`         |   enum | Recommended | `read_only`, `write_action`, `decision_support`, `retrieval`                       |
| `reuse_score`            |   enum |    Optional | `low`, `medium`, `high`                                                            |
| `blocking_status`        |   enum |    Optional | `not_blocking`, `partial_blocker`, `major_blocker`                                 |

---

## 3.10 `System`

| Property      |   Type |   Required? | Example                                                                                                                                  |
| ------------- | -----: | ----------: | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `id`          | string |         Yes | `SYS_CRM`                                                                                                                                |
| `name`        | string |         Yes | `CRM / Campaign Platform`                                                                                                                |
| `system_type` |   enum |         Yes | `channel`, `core_banking`, `crm`, `data_platform`, `ai_platform`, `workflow`, `knowledge`, `contact_center`, `kyc`, `product`, `consent` |
| `scope`       |   enum | Recommended | `local`, `group`, `mixed`, `multi_market`                                                                                                |
| `maturity`    |   enum | Recommended | `available`, `fragmented`, `planned`, `missing`, `unknown`                                                                               |
| `description` | string |    Optional | `System used for lead and campaign management`                                                                                           |

---

## 3.11 `DataDomain`

| Property        |   Type | Required? | Example                                                                                          |
| --------------- | -----: | --------: | ------------------------------------------------------------------------------------------------ |
| `id`            | string |       Yes | `DATA_CUSTOMER_PROFILE`                                                                          |
| `name`          | string |       Yes | `Customer profile`                                                                               |
| `sensitivity`   |   enum |       Yes | `low`, `medium`, `high`                                                                          |
| `data_category` |   enum |       Yes | `customer`, `product`, `kyc`, `crm`, `consent`, `complaint`, `transaction`, `audit`, `knowledge` |
| `description`   | string |  Optional | `Customer master and relationship context`                                                       |

---

## 3.12 `DataProduct`

| Property           |   Type |   Required? | Example                                                    |
| ------------------ | -----: | ----------: | ---------------------------------------------------------- |
| `id`               | string |         Yes | `DP_CUSTOMER_360`                                          |
| `name`             | string |         Yes | `Customer 360 Data Product`                                |
| `domain`           | string | Recommended | `Customer`                                                 |
| `maturity`         |   enum | Recommended | `available`, `partial`, `missing`, `planned`               |
| `lineage_status`   |   enum | Recommended | `complete`, `partial`, `missing`, `unknown`                |
| `access_status`    |   enum | Recommended | `approved`, `restricted`, `not_approved`, `unknown`        |
| `governance_owner` | string |    Optional | `Data Office`                                              |
| `description`      | string |    Optional | `Governed customer data product for approved AI use cases` |

---

## 3.13 `KnowledgeBase`

| Property             |   Type |   Required? | Example                                                                                |
| -------------------- | -----: | ----------: | -------------------------------------------------------------------------------------- |
| `id`                 | string |         Yes | `KB_PRODUCT_FAQ`                                                                       |
| `name`               | string |         Yes | `Product FAQ Knowledge Base`                                                           |
| `knowledge_type`     |   enum |         Yes | `product`, `policy`, `tariff`, `digital_help`, `complaint_guidance`, `staff_knowledge` |
| `approval_status`    |   enum | Recommended | `approved`, `draft`, `local_only`, `needs_review`                                      |
| `localization_scope` |   enum | Recommended | `group`, `local`, `multi_market`                                                       |
| `description`        | string |    Optional | `Approved product and service content for answer grounding`                            |

---

## 3.14 `RiskTrigger`

| Property       |   Type |   Required? | Example                                                                                  |
| -------------- | -----: | ----------: | ---------------------------------------------------------------------------------------- |
| `id`           | string |         Yes | `RISK_INFLUENCES_PRODUCT_CHOICE`                                                         |
| `name`         | string |         Yes | `Influences product recommendation`                                                      |
| `trigger_type` |   enum |         Yes | `data`, `channel`, `decision_impact`, `model_type`, `customer_impact`, `workflow_action` |
| `severity`     |   enum |         Yes | `low`, `medium`, `high`                                                                  |
| `description`  | string | Recommended | `Output may influence which product is offered or selected`                              |

---

## 3.15 `Control`

| Property                  |    Type |   Required? | Example                                                                                                 |
| ------------------------- | ------: | ----------: | ------------------------------------------------------------------------------------------------------- |
| `id`                      |  string |         Yes | `CTRL_FAIRNESS_REVIEW`                                                                                  |
| `name`                    |  string |         Yes | `Fairness / bias review`                                                                                |
| `control_type`            |    enum |         Yes | `governance`, `privacy`, `model_risk`, `security`, `operational`, `platform`, `content`, `architecture` |
| `mandatory_for_high_risk` | boolean | Recommended | `true`                                                                                                  |
| `description`             |  string | Recommended | `Review whether outputs create unfair treatment across customer groups`                                 |

---

## 3.16 `OrgUnit`

| Property        |   Type |   Required? | Example                                                                                                                |
| --------------- | -----: | ----------: | ---------------------------------------------------------------------------------------------------------------------- |
| `id`            | string |         Yes | `ORG_AICO`                                                                                                             |
| `name`          | string |         Yes | `AICO`                                                                                                                 |
| `org_unit_type` |   enum |         Yes | `governance_body`, `business_team`, `technology_team`, `data_team`, `risk_team`, `operations_team`, `legal_compliance` |
| `scope`         |   enum | Recommended | `group`, `local`, `multi_market`                                                                                       |
| `description`   | string |    Optional | `AI governance committee responsible for review and oversight`                                                         |

---

## 3.17 `Blueprint`

| Property         |   Type |   Required? | Example                                                                                       |
| ---------------- | -----: | ----------: | --------------------------------------------------------------------------------------------- |
| `id`             | string |         Yes | `BP_RETAIL_CONVERSATIONAL_ASSISTANT`                                                          |
| `name`           | string |         Yes | `Retail Conversational Banking Assistant Blueprint`                                           |
| `blueprint_type` |   enum |         Yes | `assistant`, `tooling`, `onboarding`, `governance_pattern`, `complaint_ai`, `personalization` |
| `maturity`       |   enum | Recommended | `candidate`, `draft`, `approved`, `in_use`                                                    |
| `intended_scope` |   enum | Recommended | `group`, `multi_market`, `local`                                                              |
| `description`    | string | Recommended | `Reusable pattern for customer-facing banking assistants`                                     |
| `embedding_text` | string |    Optional | blueprint name + included functions + controls                                                |
| `embedding`      | vector |    Optional | vectorized representation                                                                     |

---

## 3.18 `Blocker`

| Property                      |   Type |   Required? | Example                                                                     |
| ----------------------------- | -----: | ----------: | --------------------------------------------------------------------------- |
| `id`                          | string |         Yes | `BLK_KYC_API_NOT_STANDARDIZED`                                              |
| `name`                        | string |         Yes | `KYC/eKYC status API not standardized`                                      |
| `description`                 | string |         Yes | `No reusable group-standard service for retrieving onboarding/KYC status`   |
| `blocker_type`                |   enum |         Yes | `api`, `data`, `governance`, `platform`, `system`, `control`, `integration` |
| `severity`                    |   enum |         Yes | `low`, `medium`, `high`, `critical`                                         |
| `scope`                       |   enum | Recommended | `local`, `multi_market`, `group`                                            |
| `resolution_status`           |   enum | Recommended | `not_started`, `in_progress`, `resolved`, `accepted_risk`                   |
| `estimated_resolution_effort` |   enum | Recommended | `low`, `medium`, `high`                                                     |
| `reuse_impact`                |   enum | Recommended | `low`, `medium`, `high`                                                     |

---

## 3.19 `KPI`

| Property      |   Type |   Required? | Example                                                                           |
| ------------- | -----: | ----------: | --------------------------------------------------------------------------------- |
| `id`          | string |         Yes | `KPI_DIGITAL_NTB`                                                                 |
| `name`        | string |         Yes | `Digital new-to-bank customers`                                                   |
| `kpi_type`    |   enum |         Yes | `strategic`, `operational`, `governance`, `reuse`, `customer_experience`, `sales` |
| `direction`   |   enum | Recommended | `increase`, `decrease`, `maintain`                                                |
| `description` | string |    Optional | `Customers acquired through digital onboarding channels`                          |

---

# 4. Relationship Property Dictionary

Use relationship properties selectively. Most relationships only need source and target nodes.

---

## 4.1 Common relationship properties

| Property            | Type        | Use for                                                     |
| ------------------- | ----------- | ----------------------------------------------------------- |
| `confidence`        | enum        | whether relationship is observed, inferred, or hypothetical |
| `rationale`         | string      | why this relationship exists                                |
| `source_tag`        | string/list | evidence/source reference                                   |
| `created_for_story` | enum/list   | `story_1`, `story_2`, `story_3`, `story_4`                  |

---

## 4.2 High-value relationship properties

### `IMPLEMENTED_IN`

| Property                | Example                                              |
| ----------------------- | ---------------------------------------------------- |
| `implementation_status` | `planned`, `pilot`, `production`, `deprecated`       |
| `scope`                 | `local`, `group`, `multi_market`                     |
| `confidence`            | `publicly_observed`, `hypothetical_demo`, `inferred` |

### `SERVES`

| Property       | Example                                        |
| -------------- | ---------------------------------------------- |
| `primary_user` | `true`                                         |
| `impact_type`  | `direct_user`, `affected_customer`, `reviewer` |

### `DELIVERED_THROUGH`

| Property          | Example                               |
| ----------------- | ------------------------------------- |
| `primary_channel` | `true`                                |
| `access_context`  | `public`, `authenticated`, `internal` |

### `SUPPORTS_STRATEGY`

| Property             | Example                                                  |
| -------------------- | -------------------------------------------------------- |
| `alignment_strength` | `primary`, `secondary`                                   |
| `rationale`          | `Supports digital engagement through assisted servicing` |

### `MEASURED_BY`

| Property             | Example                |
| -------------------- | ---------------------- |
| `contribution_type`  | `direct`, `indirect`   |
| `expected_direction` | `increase`, `decrease` |

---

## 4.3 Reuse and technical relationship properties

### `NEEDS_FUNCTION`

| Property                       | Example                                |
| ------------------------------ | -------------------------------------- |
| `importance`                   | `required`, `optional`, `nice_to_have` |
| `reuse_relevance`              | `low`, `medium`, `high`                |
| `function_status_for_use_case` | `available`, `missing`, `partial`      |

### `DELIVERED_BY`

| Property                 | Example                                                    |
| ------------------------ | ---------------------------------------------------------- |
| `delivery_status`        | `available`, `fragmented`, `planned`, `missing`            |
| `standardization_status` | `local_only`, `candidate_group_standard`, `group_standard` |
| `confidence`             | `high`, `medium`, `low`                                    |

### `USES_SYSTEM`

| Property             | Example                                                       |
| -------------------- | ------------------------------------------------------------- |
| `usage_type`         | `read`, `write`, `read_write`, `runtime`, `channel`, `source` |
| `criticality`        | `low`, `medium`, `high`                                       |
| `integration_status` | `available`, `partial`, `missing`, `planned`                  |

### `USES_DATA_DOMAIN`

| Property        | Example                                                                   |
| --------------- | ------------------------------------------------------------------------- |
| `usage_purpose` | `retrieval`, `recommendation`, `classification`, `workflow`, `monitoring` |
| `sensitivity`   | `low`, `medium`, `high`                                                   |
| `access_status` | `approved`, `restricted`, `not_approved`                                  |

### `USES_KNOWLEDGE`

| Property          | Example                                                      |
| ----------------- | ------------------------------------------------------------ |
| `usage_type`      | `retrieval`, `grounding`, `answer_drafting`, `staff_support` |
| `approval_status` | `approved`, `needs_review`, `local_only`                     |
| `localization`    | `group`, `local`, `multi_market`                             |

---

## 4.4 Data relationship properties

### `REQUIRES_DATA_PRODUCT`

| Property              | Example                                  |
| --------------------- | ---------------------------------------- |
| `criticality`         | `low`, `medium`, `high`                  |
| `access_status`       | `approved`, `restricted`, `not_approved` |
| `lineage_requirement` | `low`, `medium`, `high`                  |

### `SOURCES_FROM`

| Property          | Example                                           |
| ----------------- | ------------------------------------------------- |
| `source_type`     | `primary`, `secondary`                            |
| `lineage_status`  | `complete`, `partial`, `missing`                  |
| `refresh_pattern` | `batch`, `near_real_time`, `real_time`, `unknown` |

---

## 4.5 Governance relationship properties

### `HAS_RISK_TRIGGER`

| Property           | Example                                                  |
| ------------------ | -------------------------------------------------------- |
| `trigger_strength` | `low`, `medium`, `high`                                  |
| `evidence_status`  | `assumed`, `documented`, `observed`, `hypothetical_demo` |

### `IMPLIES_CONTROL`

| Property               | Example                                     |
| ---------------------- | ------------------------------------------- |
| `requirement_strength` | `mandatory`, `recommended`, `contextual`    |
| `rationale`            | `Personal data use requires privacy review` |

### `REQUIRES_CONTROL`

| Property            | Example                                               |
| ------------------- | ----------------------------------------------------- |
| `requirement_level` | `mandatory`, `recommended`, `conditional`             |
| `source`            | `risk_trigger`, `policy`, `architecture`, `demo_rule` |

### `HAS_COMPLETED_CONTROL`

| Property            | Example                                   |
| ------------------- | ----------------------------------------- |
| `completion_status` | `complete`, `partial`, `evidence_pending` |
| `completion_date`   | `2026-04-15`                              |
| `evidence_status`   | `documented`, `assumed_demo`, `missing`   |

### `MISSING_CONTROL`

| Property          | Example                                                                  |
| ----------------- | ------------------------------------------------------------------------ |
| `gap_severity`    | `low`, `medium`, `high`                                                  |
| `reason`          | `Similar reviewed case has this control but current case lacks evidence` |
| `evidence_status` | `missing`, `unknown`, `hypothetical_demo`                                |

### `REVIEWED_BY`

| Property        | Example                                                           |
| --------------- | ----------------------------------------------------------------- |
| `review_type`   | `AICO`, `AICoE`, `GDPR`, `architecture`, `model_risk`, `business` |
| `review_status` | `not_started`, `in_review`, `reviewed`, `missing_evidence`        |
| `review_date`   | `2026-04-10`                                                      |

---

## 4.6 Ownership relationship properties

### `OWNED_BY`

| Property         | Example                                                                                   |
| ---------------- | ----------------------------------------------------------------------------------------- |
| `ownership_type` | `business_owner`, `technical_owner`, `governance_owner`, `resolution_owner`, `data_owner` |
| `primary_owner`  | `true`                                                                                    |

---

## 4.7 Blueprint relationship properties

### `CANDIDATE_FOR`

| Property          | Example                                                                 |
| ----------------- | ----------------------------------------------------------------------- |
| `fit_strength`    | `high`, `medium`, `low`                                                 |
| `rationale`       | `Shares assistant functions, channels, knowledge sources, and controls` |
| `evidence_status` | `observed`, `inferred`, `hypothetical_demo`                             |

### `PARTIAL_VARIANT_OF`

| Property       | Example                                                              |
| -------------- | -------------------------------------------------------------------- |
| `variant_type` | `voice_variant`, `internal_staff_variant`, `limited_channel_variant` |
| `fit_strength` | `medium`, `low`                                                      |
| `rationale`    | `Shares knowledge retrieval but differs by channel and user group`   |

### `INCLUDES_FUNCTION`

| Property         | Example                                |
| ---------------- | -------------------------------------- |
| `component_role` | `core`, `optional`, `variant_specific` |
| `priority`       | `high`, `medium`, `low`                |

### `INCLUDES_TOOL_SERVER`

| Property                 | Example                                   |
| ------------------------ | ----------------------------------------- |
| `component_role`         | `core`, `optional`, `future_candidate`    |
| `standardization_target` | `local`, `multi_market`, `group_standard` |

### `INCLUDES_CONTROL`

| Property             | Example                                                                  |
| -------------------- | ------------------------------------------------------------------------ |
| `control_role`       | `mandatory`, `recommended`, `conditional`                                |
| `applies_to_variant` | `all`, `authenticated`, `internal`, `customer_facing`, `credit_adjacent` |

---

## 4.8 Blocker relationship properties

### `BLOCKED_BY`

| Property           | Example                                                   |
| ------------------ | --------------------------------------------------------- |
| `impact_level`     | `low`, `medium`, `high`, `critical`                       |
| `blocking_status`  | `partial`, `full`, `risk_to_scale`                        |
| `impact_rationale` | `Required function unavailable as reusable group service` |

### `BLOCKS_FUNCTION`

| Property                | Example                                                                 |
| ----------------------- | ----------------------------------------------------------------------- |
| `block_strength`        | `low`, `medium`, `high`                                                 |
| `resolution_dependency` | `API standardization`, `data access approval`, `control implementation` |

### `BLOCKS_TOOL_SERVER`

| Property         | Example                                  |
| ---------------- | ---------------------------------------- |
| `block_strength` | `low`, `medium`, `high`                  |
| `status`         | `not_started`, `in_progress`, `resolved` |

### `BLOCKS_DATA_PRODUCT`

| Property               | Example                                                 |
| ---------------------- | ------------------------------------------------------- |
| `block_strength`       | `low`, `medium`, `high`                                 |
| `data_readiness_issue` | `lineage`, `access`, `quality`, `ownership`, `coverage` |

### `BLOCKS_CONTROL`

| Property          | Example                         |
| ----------------- | ------------------------------- |
| `block_strength`  | `low`, `medium`, `high`         |
| `evidence_status` | `missing`, `partial`, `unknown` |

### `AFFECTS_KPI`

| Property           | Example                                                |
| ------------------ | ------------------------------------------------------ |
| `impact_direction` | `negative`, `positive`                                 |
| `impact_type`      | `delay`, `risk`, `reduced_conversion`, `blocked_scale` |
| `impact_strength`  | `low`, `medium`, `high`                                |

### `AFFECTS_BLUEPRINT`

| Property           | Example                                                    |
| ------------------ | ---------------------------------------------------------- |
| `impact_level`     | `low`, `medium`, `high`                                    |
| `impact_rationale` | `Blueprint cannot scale without governed reusable service` |

---

## 4.9 Similarity relationship properties

### `SIMILAR_RISK_TO`

| Property           | Example                                                                               |
| ------------------ | ------------------------------------------------------------------------------------- |
| `similarity_score` | `0.82`                                                                                |
| `similarity_basis` | `shared risk triggers: personal data, product recommendation, customer-facing output` |
| `derived_by`       | `manual_demo_rule`, `vector_similarity`, `graph_similarity`                           |

### `SIMILAR_FUNCTIONALLY_TO`

| Property           | Example                                                                       |
| ------------------ | ----------------------------------------------------------------------------- |
| `similarity_score` | `0.88`                                                                        |
| `similarity_basis` | `shared functions: intent detection, product knowledge retrieval, escalation` |
| `derived_by`       | `manual_demo_rule`, `vector_similarity`, `graph_similarity`                   |

---

# 5. Properties to Avoid in v1

Avoid these unless necessary:

| Property                         | Reason                             |
| -------------------------------- | ---------------------------------- |
| `full_api_spec`                  | Too detailed                       |
| `exact_runtime_config`           | Too implementation-heavy           |
| `personal_owner_name`            | Team-level ownership is enough     |
| `exact_model_weights`            | Not relevant                       |
| `full_regulatory_interpretation` | Too risky and unnecessary          |
| `detailed_cost_estimate`         | Not needed for demo                |
| `full_kpi_formula`               | Model KPI linkage, not calculation |
| `full_lineage_graph`             | Use `lineage_status` instead       |

---

# 6. Vectorization Properties

Use vectorization only on selected nodes.

## 6.1 Nodes eligible for embeddings

| Node               |   Vectorize? | Reason                                   |
| ------------------ | -----------: | ---------------------------------------- |
| `UseCase`          |          Yes | duplicate/overlap detection              |
| `Blueprint`        |          Yes | match use cases to reusable patterns     |
| `ReusableFunction` |        Maybe | useful for function similarity           |
| `KnowledgeBase`    |        Maybe | useful for retrieval story               |
| `Control`          | No initially | exact links are enough                   |
| `ToolServer`       | No initially | exact function/service mapping is enough |
| `Blocker`          | No initially | graph propagation is enough              |

## 6.2 Standard embedding properties

| Property               | Type   | Example                                                                 |
| ---------------------- | ------ | ----------------------------------------------------------------------- |
| `embedding_text`       | string | text combined from name, description, functions, users, channels, risks |
| `embedding`            | vector | generated vector                                                        |
| `embedding_model`      | string | `mistral-embed` or selected model                                       |
| `embedding_created_at` | date   | `2026-05-28`                                                            |
| `embedding_version`    | string | `v1`                                                                    |

## 6.3 Recommended `UseCase.embedding_text`

```text
name + description + solution_type + access_context + user groups + channels + business processes + reusable functions + data domains + risk triggers
```

---

# 7. Final Build Rule

For the first prototype build:

* Use **all required node properties**
* Use only the **most useful optional properties**
* Use relationship properties only for:

  * `NEEDS_FUNCTION`
  * `DELIVERED_BY`
  * `HAS_RISK_TRIGGER`
  * `REQUIRES_CONTROL`
  * `HAS_COMPLETED_CONTROL`
  * `MISSING_CONTROL`
  * `BLOCKED_BY`
  * `AFFECTS_KPI`
  * `CANDIDATE_FOR`
  * `PARTIAL_VARIANT_OF`
  * `SIMILAR_RISK_TO`
  * `SIMILAR_FUNCTIONALLY_TO`

This keeps the graph expressive but buildable.
