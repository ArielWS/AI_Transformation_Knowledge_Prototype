# TODO

This file is the execution checklist for the prototype build. It is not a design document.

Codex or any assisting agent should update this file as tasks are completed.

---

## 1. Documentation setup

- [x] Populate `AGENTS.md`
- [x] Populate `PROJECT_CONTEXT.md`
- [x] Populate `DECISIONS.md`
- [x] Populate `README.md`
- [x] Populate `docs/00_sources/source_registry.md`
- [x] Confirm `docs/01_value_stories/` files are complete
- [x] Confirm `docs/02_model/` files are complete

## 1A. Repository handoff cleanup

- [x] Remove accidental Markdown wrapper fences from `README.md`
- [x] Remove accidental Markdown wrapper fences from `AGENTS.md`
- [x] Remove accidental Markdown wrapper fences from `PROJECT_CONTEXT.md`
- [x] Remove accidental Markdown wrapper fences from `DECISIONS.md`
- [x] Confirm handoff files start directly with their intended H1 headings
- [x] Clean `docs/00_sources/source_registry.md` into a Markdown table

---

## 2. Constraints and registry

- [x] Populate `cypher/00_constraints.cypher`
- [x] Populate `data/00_registry/node_id_registry.csv`
- [x] Confirm every planned node has a stable ID
- [x] Confirm no duplicate or near-duplicate IDs exist

---

## 3. Node data

Create node Cypher files using `MERGE`, not `CREATE`.

- [x] Populate `data/01_nodes/nodes_reference.cypher`
- [x] Populate `data/01_nodes/nodes_use_cases.cypher`
- [x] Populate `data/01_nodes/nodes_reusable_functions.cypher`
- [x] Populate `data/01_nodes/nodes_technical.cypher`
- [x] Populate `data/01_nodes/nodes_governance.cypher`
- [x] Populate `data/01_nodes/nodes_value.cypher`

Expected scope:

- approximately 120–180 total nodes
- approximately 18–22 use cases
- no new node labels beyond the approved model dictionary

---

## 4. Relationship data

Create relationship Cypher files using `MATCH` + `MERGE`.

- [x] Populate `data/02_relationships/relationships_context.cypher`
- [x] Populate `data/02_relationships/relationships_story_1_assistant_overlap.cypher`
- [ ] Populate `data/02_relationships/relationships_story_2_tool_service_layer.cypher`
- [ ] Populate `data/02_relationships/relationships_story_3_governance_gap.cypher`
- [ ] Populate `data/02_relationships/relationships_story_4_blocker_propagation.cypher`
- [ ] Populate `data/02_relationships/relationships_similarity.cypher`

Expected scope:

- approximately 300–500 total relationships
- sparse similarity relationships only
- no new relationship types beyond the approved model dictionary

---

## 5. Load file

- [ ] Populate `cypher/01_load_all.cypher`
- [ ] Ensure files are loaded in the correct order:
  1. constraints
  2. reference nodes
  3. use cases
  4. reusable functions
  5. technical nodes
  6. governance/value nodes
  7. context relationships
  8. story relationships
  9. similarity relationships

---

## 6. Validation queries

Populate `cypher/02_validation_queries.cypher` with checks for:

- [ ] duplicate node IDs
- [ ] duplicate names within the same label
- [ ] use cases without strategy links
- [ ] use cases without user groups
- [ ] use cases without reusable functions
- [ ] reusable functions without tool servers
- [ ] tool servers without systems
- [ ] risky use cases without controls
- [ ] blockers without downstream impact
- [ ] blueprints without included functions
- [ ] blueprints without included controls

---

## 7. Demo queries

Populate `cypher/03_demo_queries.cypher` with queries for:

- [ ] assistant overlap candidates
- [ ] most reused reusable functions
- [ ] highest-leverage tool servers
- [ ] similar-risk use cases with missing controls
- [ ] blockers by number of affected use cases
- [ ] blockers by affected KPIs
- [ ] blueprints blocked by unresolved dependencies
- [ ] use cases missing AICO/AICoE review
- [ ] use cases grouped by strategy pillar
- [ ] full path from blocker → function → use case → KPI

---

## 8. Optional cleanup/reset

- [ ] Populate `cypher/04_cleanup_reset.cypher` only if needed
- [ ] Keep reset logic clearly separated from load/demo queries

---

## 9. Final readiness check

- [ ] Run all node files successfully
- [ ] Run all relationship files successfully
- [ ] Run validation queries and resolve critical issues
- [ ] Run demo queries and confirm each value story is demonstrable
- [ ] Confirm hypothetical demo data is marked with `is_hypothetical_demo_case: true` and `confidence: hypothetical_demo`

---

## 10. Do not do unless explicitly requested

- [ ] Do not add Python scripts
- [ ] Do not add package files
- [ ] Do not add notebooks
- [ ] Do not add dashboard UI
- [ ] Do not expand into a full enterprise architecture model
- [ ] Do not add new node labels, relationship types, or properties without explicit approval
