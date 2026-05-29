Paste this into `DECISIONS.md`.

````md
# Decisions

This file records settled modelling and build decisions for the AI Transformation Knowledge Prototype.

The purpose is to prevent future agents from reopening decisions that were already made during design.

---

## D001 — Use a Neo4j property graph

Use Neo4j/Cypher as the prototype implementation model.

Reason:

- the demo depends on multi-hop relationships
- graph traversal is central to the value story
- Neo4j Bloom / Neo4j Browser can visually demonstrate the prototype quickly

---

## D002 — Use Cypher files, not CSV imports, for v1

Use Cypher files with `MERGE` statements for the first build.

Reason:

- easier to inspect manually
- easier to run in small batches
- easier to debug under time pressure
- lower setup overhead than CSV import

CSV can be added later if the graph becomes larger.

---

## D003 — Build incrementally by packs

Do not generate the entire graph in one pass.

Build order:

1. constraints
2. node ID registry
3. reference nodes
4. use case nodes
5. reusable function nodes
6. technical nodes
7. governance/value nodes
8. context relationships
9. story-specific relationships
10. similarity relationships
11. validation queries
12. demo queries

Reason:

- reduces duplicate IDs
- makes errors easier to detect
- allows validation after each story pack

---

## D004 — Keep the prototype small

Target size:

- approximately 120–180 nodes
- approximately 300–500 relationships
- approximately 18–22 use cases
- approximately 8–12 demo queries

Reason:

- this is an interview prototype, not a production knowledge graph
- clarity is more important than completeness
- the graph must be easy to understand in a short demo

---

## D005 — Use `ReusableFunction`, not `Capability`

The model uses `ReusableFunction` instead of `Capability`.

Reason:

- `Capability` was too vague
- `ReusableFunction` makes the reuse layer concrete
- it clearly bridges use cases and technical services

Example:

```text
UseCase → NEEDS_FUNCTION → ReusableFunction → DELIVERED_BY → ToolServer
````

Examples of reusable functions:

* retrieve customer profile
* check KYC/eKYC status
* check product eligibility
* retrieve product knowledge
* create CRM lead
* escalate to human
* log interaction

---

## D006 — Use `ToolServer` as the generic technical service node

Use one node label: `ToolServer`.

It may represent:

* API
* MCP-style tool server
* RAG retrieval service
* workflow service
* model service

Do not create separate v1 labels for:

* `API`
* `MCPServer`
* `RAGService`
* `WorkflowService`

Reason:

* keeps the graph simple
* supports the agentic/tool-service demo without over-modelling protocol details
* allows service type to be captured as a property

---

## D007 — Merge governance bodies into `OrgUnit`

Do not use a separate `GovernanceBody` node label in v1.

Use `OrgUnit` for both governance bodies and delivery teams.

Examples:

* AICO
* AICoE
* Legal & Compliance
* Model Risk
* Data Office
* CIO / API Team
* Retail Digital
* CRM / CVM Team

Reason:

* fewer labels
* simpler ownership/review modelling
* governance bodies can be distinguished using `org_unit_type = governance_body`

---

## D008 — Use `RiskTrigger` to explain governance

Do not rely only on a `risk_level` property.

Use `RiskTrigger` nodes to explain why a use case needs controls.

Example:

```text
Product Recommendation Assistant
  → HAS_RISK_TRIGGER
Influences product recommendation
  → IMPLIES_CONTROL
Fairness / bias review
```

Reason:

* enables governance-gap-by-analogy
* makes missing controls explainable
* supports demo questions about why a control is required

---

## D009 — Use explicit `Control` nodes

Controls are modelled as reusable nodes.

Examples:

* AICO review
* AICoE technical review
* GDPR review
* audit logging
* content safety
* output grounding
* human oversight
* fairness / bias review
* model validation
* role-based access control
* data lineage

Reason:

* the same control applies to many use cases, tool servers, and data products
* supports missing/completed control analysis
* supports reusable governance patterns

---

## D010 — Use `Blocker` as a node, not a property

A blocker should be a node if it can affect multiple downstream elements.

Example:

```text
KYC/eKYC status API not standardized
  → BLOCKS_FUNCTION
Check KYC/eKYC status
  → AFFECTS_KPI
Digital new-to-bank customers
```

Reason:

* blocker propagation is one of the four core value stories
* blockers need to connect to functions, tool servers, data products, controls, KPIs, and blueprints

---

## D011 — Use `Blueprint` for reusable patterns

Blueprints represent reusable solution, tooling, or governance patterns.

Examples:

* Retail Conversational Banking Assistant Blueprint
* Retail Agent Tooling Blueprint
* Digital Onboarding Assistant Blueprint
* Customer-Facing AI Governance Pattern
* Complaint AI Pattern

Reason:

* blueprint extraction is a key demo insight
* supports reuse across countries/use cases
* connects reusable functions, controls, tool servers, and channel patterns

---

## D012 — Use `KnowledgeBase` separately from `DataDomain`

Use `KnowledgeBase` for approved document/content sources used for retrieval or grounding.

Examples:

* Product FAQ Knowledge Base
* Tariff / Fees Knowledge Base
* Digital Banking Help Knowledge Base
* Product Policy Knowledge Base

Use `DataDomain` for logical data categories.

Examples:

* customer profile
* KYC / identity verification
* consent
* CRM interactions
* complaint history

Reason:

* assistant/RAG use cases need explicit knowledge sources
* governance/data stories need explicit data domains
* combining both would make the graph less clear

---

## D013 — Use `DataProduct` only where data readiness matters

`DataProduct` is included for the scaling blocker story.

Examples:

* Customer 360 Data Product
* Consent Data Product
* KYC Status Data Product
* CRM Interaction Data Product

Reason:

* not every data dependency needs a data product
* data products are useful only where access, lineage, and governance readiness matter

---

## D014 — Keep similarity relationships sparse

Use only a small number of derived similarity relationships:

* `SIMILAR_FUNCTIONALLY_TO`
* `SIMILAR_RISK_TO`

Reason:

* too many similarity edges make the graph noisy
* similarity should support specific demo insights, not connect everything to everything

Examples:

```text
Adam TB → SIMILAR_FUNCTIONALLY_TO → RAIA Kosovo
Product Recommendation Assistant → SIMILAR_RISK_TO → Personalized Offer Engine
Loan Affordability Recommender → SIMILAR_RISK_TO → Credit Pre-Approval Assistant
```

---

## D015 — Use properties for solution type and risk level

Do not create separate node labels for `SolutionPattern` or `RiskClassification` in v1.

Use properties on `UseCase`:

```text
solution_type
risk_level
governance_status
access_context
customer_impact
```

Reason:

* keeps the model smaller
* avoids over-modelling classification taxonomies
* sufficient for the demo

---

## D016 — Do not model individual people in v1

Do not create a `Person` node label.

Use `OrgUnit` for ownership and review.

Reason:

* individual ownership is not required for the demo
* team-level ownership is enough
* avoids speculative personal data

---

## D017 — Do not model full runtime architecture in v1

Do not add detailed deployment/runtime nodes.

Avoid modelling:

* containers
* repositories
* environments
* exact cloud resource topology
* exact API specs
* OAuth scopes
* full MCP protocol internals

Reason:

* too implementation-heavy
* not required for the four demo insights
* would slow down the build

---

## D018 — Distinguish public facts from hypothetical demo data

The graph may include realistic hypothetical examples.

Hypothetical data must be marked with:

```text
is_hypothetical_demo_case: true
confidence: hypothetical_demo
```

Reason:

* avoids implying that invented data is confirmed internal company data
* keeps the demo credible and honest

---

## D019 — Source tags are required where available

Use source tags from:

```text
docs/00_sources/source_registry.md
```

Where there is no public source, use:

```text
source_tag: DEMO
confidence: hypothetical_demo
```

Reason:

* keeps evidence and assumptions distinguishable
* supports credible interview discussion

---

## D020 — Do not add scripts unless explicitly requested

Do not add Python scripts, notebooks, package files, validation scripts, or build tooling unless explicitly instructed.

Reason:

* this is a time-constrained prototype
* Cypher and Markdown are enough for v1
* extra tooling increases complexity and failure risk

---

## D021 — `TODO.md` is an execution checklist, not a design document

`TODO.md` should be short and practical.

The user or Codex can update it as tasks are completed.

Reason:

* prevents hidden work
* gives Codex a simple execution checklist
* avoids turning TODO into another long planning artifact

---

## D022 — Demo queries should prove graph-native insight

Demo queries should not merely count projects by status or country.

They should show:

* overlap
* reuse
* missing controls
* blocker propagation
* blueprint candidates
* high-leverage services

Reason:

* the prototype must demonstrate why a knowledge graph adds value beyond dashboards

```
```
