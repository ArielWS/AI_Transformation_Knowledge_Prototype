// Pack 8 load guide for the Retail AI portfolio intelligence graph.
// Run these files from the repository root after starting Neo4j.
// Neo4j Browser supports :source in many environments. If :source is not available,
// paste and run each referenced file manually in the same order.
//
// This file is intentionally only an operational guide. It does not define graph data.

// 1. Constraints
:source cypher/00_constraints.cypher

// 2. Reference nodes
:source data/01_nodes/nodes_reference.cypher

// 3. Use case nodes
:source data/01_nodes/nodes_use_cases.cypher

// 4. Reusable function nodes
:source data/01_nodes/nodes_reusable_functions.cypher

// 5. Technical nodes
:source data/01_nodes/nodes_technical.cypher

// 6. Governance nodes
:source data/01_nodes/nodes_governance.cypher

// 7. Value nodes: blueprints, blockers, and KPIs
:source data/01_nodes/nodes_value.cypher

// 8. Context relationships
:source data/02_relationships/relationships_context.cypher

// 9. Story 1 relationships: assistant overlap and blueprint discovery
:source data/02_relationships/relationships_story_1_assistant_overlap.cypher

// 10. Story 2 relationships: shared tool and service layer reuse
:source data/02_relationships/relationships_story_2_tool_service_layer.cypher

// 11. Story 3 relationships: governance gap by analogy
:source data/02_relationships/relationships_story_3_governance_gap.cypher

// 12. Story 4 relationships: blocker propagation
:source data/02_relationships/relationships_story_4_blocker_propagation.cypher

// 13. Sparse similarity layer
:source data/02_relationships/relationships_similarity.cypher
