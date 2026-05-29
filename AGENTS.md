

````md
# Agent Instructions

This repository contains a Neo4j knowledge graph prototype for an AI transformation / Retail AI portfolio intelligence use case.

The prototype is intended to support an interview demo. It must stay practical, small, and focused. Do not turn it into a full enterprise architecture repository.

---

## 1. Core objective

Build a demo knowledge graph that shows graph-native insights across an AI transformation portfolio:

1. Assistant overlap and reusable blueprint discovery
2. Shared tool/API/MCP-style service-layer reuse
3. Governance gap detection by analogy
4. Scaling blocker propagation across use cases, KPIs, and blueprints

The graph should answer questions such as:

- Which assistant initiatives overlap enough to justify a reusable blueprint?
- Which reusable functions and tool servers unlock the most AI use cases?
- Which similar-risk use cases have inconsistent governance controls?
- Which blockers have the largest downstream strategic impact?

---

## 2. Binding source files

Before making changes, read these files:

```text
docs/01_value_stories/value_story_1_assistant_overlap_schema.md
docs/01_value_stories/value_story_2_shared_tool_service_layer_schema.md
docs/01_value_stories/value_story_3_governance_gap_by_analogy_schema.md
docs/01_value_stories/value_story_4_scaling_blocker_propagation_schema.md

docs/02_model/master_node_dictionary_v1.md
docs/02_model/master_relationship_dictionary_v1.md
docs/02_model/master_property_dictionary_v1.md
docs/02_model/master_model_mermaid_v1.md
docs/02_model/story_slice_diagrams_v1.md
````

If a proposed change conflicts with these files, stop and flag the conflict instead of silently inventing a new approach.

---

## 3. Non-negotiable modelling rules

### 3.1 Do not invent schema

Do not invent new:

* node labels
* relationship types
* property names
* enum values
* file naming conventions

Use the model dictionaries as the source of truth.

### 3.2 Use only approved v1 node labels

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

### 3.3 Use only approved v1 relationship types

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

### 3.4 Use stable IDs

Every node must have a stable `id`.

Examples:

```text
UC_ADAM_TB
FUNC_RETRIEVE_PRODUCT_KNOWLEDGE
TOOL_KYC_STATUS
CTRL_CONTENT_SAFETY
BP_RETAIL_CONVERSATIONAL_ASSISTANT
BLK_KYC_API_NOT_STANDARDIZED
```

Do not create duplicate IDs or near-duplicate names.

Bad:

```text
SYS_CRM
SYS_CRM_PLATFORM
SYS_SALESFORCE_CRM
```

Choose one canonical ID unless the model explicitly requires multiple systems.

### 3.5 Use `MERGE`, not `CREATE`

All Cypher data files must use `MERGE` for nodes and relationships.

Correct:

```cypher
MERGE (u:UseCase {id: "UC_ADAM_TB"})
SET u.name = "Adam TB";
```

Avoid:

```cypher
CREATE (u:UseCase {id: "UC_ADAM_TB"});
```

### 3.6 Keep the graph small

Target size:

* approximately 120–180 nodes
* approximately 300–500 relationships
* 18–22 use cases
* 8–12 demo queries

Do not generate thousands of relationships.

---

## 4. Critical modelling concepts

### 4.1 `ReusableFunction`

`ReusableFunction` is not a vague capability bucket.

It means:

> A reusable business/technical function that multiple AI use cases need, and that can be delivered by one or more tool servers, APIs, systems, data products, or knowledge bases.

Examples:

```text
Retrieve product knowledge
Retrieve customer profile
Check KYC/eKYC status
Check product eligibility
Create CRM lead
Escalate to human
Log interaction
Apply response guardrails
```

Use this pattern:

```text
UseCase → NEEDS_FUNCTION → ReusableFunction → DELIVERED_BY → ToolServer
```

### 4.2 `ToolServer`

`ToolServer` represents the reusable technical service layer.

It may stand for:

* API
* MCP-style tool server
* RAG retrieval service
* workflow service
* model service

Do not create separate `API`, `MCPServer`, or `RAGService` node labels in v1.

### 4.3 `OrgUnit`

`OrgUnit` includes both governance bodies and delivery teams.

Examples:

```text
AICO
AICoE
Retail Digital
CRM / CVM Team
CIO / API Team
Data Office
Retail Risk
Legal & Compliance
Contact Center Operations
```

Do not create a separate `GovernanceBody` node label.

### 4.4 `RiskTrigger`

Use `RiskTrigger` to explain why governance is required.

Do not rely only on a `risk_level` property.

Correct pattern:

```text
UseCase → HAS_RISK_TRIGGER → RiskTrigger
RiskTrigger → IMPLIES_CONTROL → Control
UseCase → MISSING_CONTROL → Control
```

### 4.5 `Blocker`

A `Blocker` should be a node only when it has downstream propagation.

Good blockers:

```text
KYC/eKYC status API not standardized
Customer profile access not approved
Product eligibility logic fragmented
CRM lead creation API not reusable
Missing audit logging pattern
Consent data product incomplete
```

Weak blockers to avoid:

```text
Project delayed
Team busy
Needs meeting
```

---

## 5. Required build order

Build incrementally. Do not generate all data in one pass.

### Pack 0 — constraints and reference registry

Files:

```text
cypher/00_constraints.cypher
data/00_registry/node_id_registry.csv
```

### Pack 1 — nodes

Files:

```text
data/01_nodes/nodes_reference.cypher
data/01_nodes/nodes_use_cases.cypher
data/01_nodes/nodes_reusable_functions.cypher
data/01_nodes/nodes_technical.cypher
data/01_nodes/nodes_governance.cypher
data/01_nodes/nodes_value.cypher
```

### Pack 2 — context relationships

File:

```text
data/02_relationships/relationships_context.cypher
```

### Pack 3 — story relationships

Files:

```text
data/02_relationships/relationships_story_1_assistant_overlap.cypher
data/02_relationships/relationships_story_2_tool_service_layer.cypher
data/02_relationships/relationships_story_3_governance_gap.cypher
data/02_relationships/relationships_story_4_blocker_propagation.cypher
data/02_relationships/relationships_similarity.cypher
```

### Pack 4 — load, validation, and demo queries

Files:

```text
cypher/01_load_all.cypher
cypher/02_validation_queries.cypher
cypher/03_demo_queries.cypher
cypher/04_cleanup_reset.cypher
```

If a file already exists with a different but equivalent numbered path, preserve the existing repo convention.

---

## 6. Required validation checks

After each story pack, validation queries must check for:

* duplicate node IDs
* duplicate names within the same label
* use cases without strategy
* use cases without user group
* use cases without reusable functions
* reusable functions without tool servers, unless intentionally conceptual
* tool servers without systems
* risky use cases without controls
* blockers without downstream impact
* blueprints without included functions or controls

Validation queries belong in:

```text
cypher/02_validation_queries.cypher
```

---

## 7. Demo query requirements

Demo queries must directly support the four value stories.

At minimum, create queries for:

1. Assistant overlap candidates
2. Most reused reusable functions
3. Highest leverage tool servers
4. Similar-risk use cases with missing controls
5. Blockers by number of affected use cases
6. Blockers by affected KPIs
7. Blueprints blocked by unresolved dependencies
8. Use cases missing AICO/AICoE review
9. Use cases grouped by Acquire / Engage / Monetize
10. Full path from blocker → function → use case → KPI

Demo queries belong in:

```text
cypher/03_demo_queries.cypher
```

---

## 8. File editing rules

### 8.1 Prefer small commits

Make changes in small coherent batches.

Good commit examples:

```text
Populate AGENTS and project context
Add reference node Cypher
Add Story 1 relationships
Add validation queries
```

Bad commit examples:

```text
everything
update
misc fixes
```

### 8.2 Do not overwrite model docs casually

The model docs under `docs/02_model/` are the source of truth.

Only edit them if explicitly instructed.

### 8.3 Do not add scripts unless requested

Do not add Python scripts, build tools, validation scripts, notebooks, or package files unless explicitly requested.

This prototype is intended to be lightweight and mostly Cypher/Markdown.

---

## 9. Source and realism rules

The graph uses a mix of:

* public RBI facts
* public vendor/customer-story facts
* realistic hypothetical demo cases

Always mark hypothetical demo data with:

```text
is_hypothetical_demo_case: true
confidence: hypothetical_demo
```

Do not represent invented dummy data as confirmed internal RBI data.

Use source tags from:

```text
docs/00_sources/source_registry.md
```

Where source support is unclear, use:

```text
source_tag: DEMO
confidence: hypothetical_demo
```

---

## 10. Out-of-scope for v1

Do not build:

* full enterprise architecture model
* exact API specifications
* exact OAuth/IAM permission model
* model registry
* full EU AI Act legal classification engine
* detailed cost model
* full data lineage graph
* Python validation scripts
* presentation slides
* web app
* dashboard UI

The goal is a Neo4j graph prototype, not a production platform.

---

## 11. Final instruction

When uncertain, optimize for:

1. demo clarity
2. schema consistency
3. small graph size
4. realistic but clearly marked dummy data
5. ability to load and inspect in Neo4j quickly

Do not optimize for completeness.

```
```
