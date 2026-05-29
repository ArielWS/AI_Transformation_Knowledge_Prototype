# Project Context

## 1. Project purpose

This repository contains a small Neo4j knowledge graph prototype for an AI transformation / AI portfolio intelligence demo.

The prototype was created for an interview preparation scenario for an AI Strategy Lead-type role. The goal is to show how a knowledge graph can provide insights that are difficult to see in normal project dashboards.

The graph should help identify:

1. assistant overlap and reusable blueprint opportunities
2. shared tool/API/MCP-style service-layer reuse
3. governance gaps by analogy
4. scaling blockers with downstream impact across use cases, KPIs, and blueprints

This is not intended to be a production enterprise architecture model.

---

## 2. Core demo concept

The prototype represents a realistic AI transformation portfolio across a banking group / network-bank environment.

The model includes:

- AI use cases
- network banks / markets
- strategy pillars
- user groups
- business processes
- reusable functions
- tool/API/MCP-style services
- systems
- data domains and data products
- knowledge bases
- governance controls
- risk triggers
- blockers
- KPIs
- reusable blueprints

The graph is intended to show hidden relationships such as:

- multiple country assistants needing the same reusable functions
- several AI agents depending on the same technical service layer
- similar-risk AI use cases having inconsistent controls
- one missing data/API/control dependency blocking multiple strategic use cases

---

## 3. The four value stories

### Story 1 — Assistant overlap → reusable blueprint

Show that several country-level assistant initiatives are not isolated projects.

Core example:

- Adam TB
- RAIA Kosovo
- RAIA Bosnia
- RAIA Croatia

These show strong overlap.

Adjacent variants:

- RBUA/RBCZ Voicebot
- Retail Product Knowledge yellowGPT

Expected graph insight:

> Four customer-facing assistants strongly overlap and are candidates for a reusable Retail Conversational Banking Assistant Blueprint, while the voicebot and yellowGPT are partial variants.

---

### Story 2 — Shared tool/service layer across Retail AI agents

Show that multiple use cases need the same reusable functions and tool/API/MCP-style services.

Example reusable functions:

- retrieve customer profile
- check KYC/eKYC status
- check product eligibility
- retrieve product knowledge
- create CRM lead
- retrieve consent status
- escalate to human
- log interaction

Expected graph insight:

> The highest-value scaling opportunity may be reusable service/tool layers, not another assistant UI.

---

### Story 3 — Governance gap by analogy

Show that use cases with similar risk profiles may have inconsistent governance coverage.

Example comparison:

- Personalized Offer Engine has GDPR/fairness/explainability controls
- Product Recommendation Assistant has similar data and product-choice influence but missing controls

Expected graph insight:

> Similar-risk use cases should receive consistent AICO/AICoE/GDPR/model-risk treatment.

---

### Story 4 — Scaling blocker propagation

Show that one blocker can affect multiple use cases, functions, services, KPIs, and blueprints.

Example blockers:

- KYC/eKYC status API not standardized
- customer profile access not approved
- product eligibility logic fragmented
- CRM lead creation API not reusable
- missing audit logging pattern
- consent data product incomplete
- incomplete lineage for customer data product

Expected graph insight:

> A blocker should be prioritized not only by the project it affects directly, but by its downstream impact across use cases, strategy pillars, KPIs, and blueprints.

---

## 4. Build constraints

The prototype must remain small and buildable.

Target size:

- approximately 120–180 nodes
- approximately 300–500 relationships
- approximately 18–22 use cases
- approximately 8–12 demo queries

Do not generate thousands of nodes or relationships.

Use Cypher files with `MERGE`, not CSV imports, unless explicitly changed later.

---

## 5. Repository source of truth

The binding model documents are:

```text
docs/02_model/master_node_dictionary_v1.md
docs/02_model/master_relationship_dictionary_v1.md
docs/02_model/master_property_dictionary_v1.md
docs/02_model/master_model_mermaid_v1.md
docs/02_model/story_slice_diagrams_v1.md
````

The value-story documents are:

```text
docs/01_value_stories/value_story_1_assistant_overlap_schema.md
docs/01_value_stories/value_story_2_shared_tool_service_layer_schema.md
docs/01_value_stories/value_story_3_governance_gap_by_analogy_schema.md
docs/01_value_stories/value_story_4_scaling_blocker_propagation_schema.md
```

The source registry is:

```text
docs/00_sources/source_registry.md
```

---

## 6. Implementation approach

Build the graph incrementally.

Recommended order:

1. constraints
2. node ID registry
3. reference nodes
4. use case nodes
5. reusable function nodes
6. technical nodes
7. governance/value nodes
8. context relationships
9. story 1 relationships
10. story 2 relationships
11. story 3 relationships
12. story 4 relationships
13. similarity relationships
14. validation queries
15. demo queries

Do not attempt to generate the whole graph in one pass.

---

## 7. Important modelling principles

### UseCase is the central node

Most graph paths should start from or return to `UseCase`.

### ReusableFunction is the bridge

Use this pattern:

```text
UseCase → NEEDS_FUNCTION → ReusableFunction → DELIVERED_BY → ToolServer
```

### ToolServer is generic

`ToolServer` may represent:

* API
* MCP-style tool server
* RAG retrieval service
* workflow service
* model service

Do not create separate node labels for those in v1.

### RiskTrigger explains governance

Use this pattern:

```text
UseCase → HAS_RISK_TRIGGER → RiskTrigger → IMPLIES_CONTROL → Control
```

### Blocker must propagate

A `Blocker` should connect to downstream impact:

```text
Blocker → BLOCKS_FUNCTION / BLOCKS_TOOL_SERVER / BLOCKS_DATA_PRODUCT / BLOCKS_CONTROL
Blocker → AFFECTS_KPI
Blocker → AFFECTS_BLUEPRINT
```

---

## 8. Data realism

The prototype uses a mix of:

* public source-backed examples
* realistic hypothetical demo data
* deliberately simplified graph structures

Do not present hypothetical data as confirmed internal company data.

Use:

```text
is_hypothetical_demo_case: true
confidence: hypothetical_demo
```

when data is invented for the demo.

Use source tags from:

```text
docs/00_sources/source_registry.md
```

where relevant.

---

## 9. Out of scope

Do not build the following unless explicitly requested:

* full enterprise architecture model
* full API specification
* full OAuth/IAM model
* model registry
* detailed EU AI Act legal classification engine
* production data lineage model
* cost model
* dashboard UI
* web app
* Python validation tooling
* presentation deck

The deliverable is a Neo4j graph prototype and supporting Cypher/demo queries.

---

## 10. Success criteria

The repo is successful when it can support a quick Neo4j demo answering:

1. Which assistant initiatives overlap enough to become a reusable blueprint?
2. Which reusable functions/tool servers unlock the most AI use cases?
3. Which similar-risk use cases have missing governance controls?
4. Which blockers affect the most use cases, KPIs, and blueprints?
