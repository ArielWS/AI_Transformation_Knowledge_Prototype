Yes. Do **`README.md` now**, then **`BUILD_SEQUENCE.md`**, then **`TODO.md`** last. `TODO.md` should reference the build sequence, so it should come after.

Paste this into `README.md`.

````md
# AI Transformation Knowledge Prototype

## 1. Overview

This repository contains a small Neo4j knowledge graph prototype for AI transformation / AI portfolio intelligence.

The prototype is designed to show how a knowledge graph can reveal insights that are difficult to see in ordinary project dashboards, including:

1. assistant overlap and reusable blueprint opportunities
2. shared tool/API/MCP-style service-layer reuse
3. governance gaps by analogy
4. scaling blockers with downstream impact across use cases, KPIs, and blueprints

The project is intentionally lightweight. It is not a production platform, dashboard, enterprise architecture repository, or full AI governance system.

---

## 2. Core demo idea

The graph models an AI transformation portfolio using nodes such as:

- `UseCase`
- `NetworkBank`
- `StrategyPillar`
- `ReusableFunction`
- `ToolServer`
- `System`
- `DataDomain`
- `DataProduct`
- `KnowledgeBase`
- `RiskTrigger`
- `Control`
- `OrgUnit`
- `Blueprint`
- `Blocker`
- `KPI`

The central node is `UseCase`.

The most important pattern is:

```text
UseCase → NEEDS_FUNCTION → ReusableFunction → DELIVERED_BY → ToolServer → USES_SYSTEM → System
````

This allows the graph to show which reusable functions and technical services could unlock multiple AI initiatives.

---

## 3. The four value stories

### Story 1 — Assistant overlap → reusable blueprint

Shows that several assistant initiatives may share enough reusable functions, channels, knowledge bases, and controls to justify a reusable blueprint.

Core example use cases:

* Adam TB
* RAIA Kosovo
* RAIA Bosnia
* RAIA Croatia

Adjacent variants:

* RBUA/RBCZ Voicebot
* Retail Product Knowledge yellowGPT

Expected insight:

```text
Four customer-facing assistants strongly overlap and are candidates for a reusable Retail Conversational Banking Assistant Blueprint, while the voicebot and yellowGPT are partial variants.
```

---

### Story 2 — Shared tool/service layer across Retail AI agents

Shows that multiple AI use cases need the same reusable functions and tool/API/MCP-style services.

Example reusable functions:

* retrieve customer profile
* check KYC/eKYC status
* check product eligibility
* retrieve product knowledge
* create CRM lead
* retrieve consent status
* escalate to human
* log interaction

Expected insight:

```text
The highest-value scaling opportunity may be reusable service/tool layers, not another assistant UI.
```

---

### Story 3 — Governance gap by analogy

Shows that use cases with similar risk profiles may have inconsistent governance coverage.

Example comparison:

```text
Personalized Offer Engine
  has GDPR / fairness / explainability controls

Product Recommendation Assistant
  has similar data and product-choice influence
  but is missing equivalent controls
```

Expected insight:

```text
Similar-risk use cases should receive consistent AICO/AICoE/GDPR/model-risk treatment.
```

---

### Story 4 — Scaling blocker propagation

Shows that one blocker can affect multiple use cases, functions, services, KPIs, and blueprints.

Example blockers:

* KYC/eKYC status API not standardized
* customer profile access not approved
* product eligibility logic fragmented
* CRM lead creation API not reusable
* missing audit logging pattern
* consent data product incomplete
* incomplete lineage for customer data product

Expected insight:

```text
A blocker should be prioritized by downstream impact, not only by the project it directly affects.
```

---

## 4. Repository structure

```text
.
├── README.md
├── AGENTS.md
├── PROJECT_CONTEXT.md
├── DECISIONS.md
├── BUILD_SEQUENCE.md
├── TODO.md
│
├── docs/
│   ├── 00_sources/
│   │   └── source_registry.md
│   │
│   ├── 01_value_stories/
│   │   ├── value_story_1_assistant_overlap_schema.md
│   │   ├── value_story_2_shared_tool_service_layer_schema.md
│   │   ├── value_story_3_governance_gap_by_analogy_schema.md
│   │   └── value_story_4_scaling_blocker_propagation_schema.md
│   │
│   └── 02_model/
│       ├── master_node_dictionary_v1.md
│       ├── master_relationship_dictionary_v1.md
│       ├── master_property_dictionary_v1.md
│       ├── master_model_mermaid_v1.md
│       └── story_slice_diagrams_v1.md
│
├── data/
│   ├── 00_registry/
│   │   └── node_id_registry.csv
│   │
│   ├── 01_nodes/
│   │   ├── nodes_reference.cypher
│   │   ├── nodes_use_cases.cypher
│   │   ├── nodes_reusable_functions.cypher
│   │   ├── nodes_technical.cypher
│   │   ├── nodes_governance.cypher
│   │   └── nodes_value.cypher
│   │
│   └── 02_relationships/
│       ├── relationships_context.cypher
│       ├── relationships_story_1_assistant_overlap.cypher
│       ├── relationships_story_2_tool_service_layer.cypher
│       ├── relationships_story_3_governance_gap.cypher
│       ├── relationships_story_4_blocker_propagation.cypher
│       └── relationships_similarity.cypher
│
└── cypher/
    ├── 00_constraints.cypher
    ├── 01_load_all.cypher
    ├── 02_validation_queries.cypher
    ├── 03_demo_queries.cypher
    └── 04_cleanup_reset.cypher
```

---

## 5. Source-of-truth files

The model is governed by these files:

```text
docs/02_model/master_node_dictionary_v1.md
docs/02_model/master_relationship_dictionary_v1.md
docs/02_model/master_property_dictionary_v1.md
docs/02_model/master_model_mermaid_v1.md
docs/02_model/story_slice_diagrams_v1.md
```

The value-story logic is governed by:

```text
docs/01_value_stories/value_story_1_assistant_overlap_schema.md
docs/01_value_stories/value_story_2_shared_tool_service_layer_schema.md
docs/01_value_stories/value_story_3_governance_gap_by_analogy_schema.md
docs/01_value_stories/value_story_4_scaling_blocker_propagation_schema.md
```

Agents and Codex should read `AGENTS.md` before making changes.

---

## 6. Build approach

The graph should be built incrementally.

Do not generate the entire graph in one pass.

Recommended order:

1. create constraints
2. create node ID registry
3. create reference nodes
4. create use case nodes
5. create reusable function nodes
6. create technical nodes
7. create governance/value nodes
8. create context relationships
9. create Story 1 relationships
10. create Story 2 relationships
11. create Story 3 relationships
12. create Story 4 relationships
13. create similarity relationships
14. create validation queries
15. create demo queries

Detailed instructions are in:

```text
BUILD_SEQUENCE.md
```

---

## 7. Data loading

The first version uses Cypher files, not CSV imports.

All node and relationship statements should use `MERGE`, not `CREATE`.

Example:

```cypher
MERGE (u:UseCase {id: "UC_ADAM_TB"})
SET u.name = "Adam TB",
    u.status = "production",
    u.solution_type = "GenAI Assistant";
```

---

## 8. Validation

Validation queries should be stored in:

```text
cypher/02_validation_queries.cypher
```

Validation should check for:

* duplicate IDs
* duplicate names within a label
* use cases without strategy
* use cases without reusable functions
* functions without tool servers
* tool servers without systems
* risky use cases without controls
* blockers without downstream impact
* blueprints without included functions or controls

---

## 9. Demo queries

Demo queries should be stored in:

```text
cypher/03_demo_queries.cypher
```

They should prove graph-native insight, not simple dashboard reporting.

Minimum demo query themes:

1. assistant overlap candidates
2. most reused reusable functions
3. highest leverage tool servers
4. similar-risk use cases with missing controls
5. blockers by number of affected use cases
6. blockers by affected KPIs
7. blueprints blocked by unresolved dependencies
8. use cases missing AICO/AICoE review
9. use cases grouped by strategy pillar
10. blocker → function → use case → KPI path

---

## 10. Data realism

The graph contains a mix of:

* public source-backed examples
* realistic hypothetical demo examples
* simplified relationships for demonstration

Hypothetical data must be marked with:

```text
is_hypothetical_demo_case: true
confidence: hypothetical_demo
```

Use source tags from:

```text
docs/00_sources/source_registry.md
```

Where no public source exists, use:

```text
source_tag: DEMO
confidence: hypothetical_demo
```

---

## 11. Out of scope

Do not build the following in v1:

* production application
* dashboard UI
* Python tooling
* full enterprise architecture model
* full API specification
* full IAM/OAuth model
* full model registry
* full EU AI Act legal classification engine
* detailed cost model
* production data lineage graph
* presentation deck

The deliverable is a small Neo4j graph prototype with supporting documentation, Cypher data files, validation queries, and demo queries.

---

## 12. Success criteria

The prototype is successful if it can answer:

1. Which assistant initiatives overlap enough to become a reusable blueprint?
2. Which reusable functions and tool servers unlock the most AI use cases?
3. Which similar-risk use cases have missing governance controls?
4. Which blockers affect the most use cases, KPIs, and blueprints?

```
