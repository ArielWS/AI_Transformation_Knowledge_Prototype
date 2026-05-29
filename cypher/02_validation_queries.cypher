// Pack 8 validation queries for the Retail AI portfolio intelligence graph.
// Run after loading all node and relationship files. All queries are read-only.
// Queries marked "zero rows" indicate issues only when rows appear.

// 1. Count nodes by label. Review total shape and label balance.
MATCH (n)
UNWIND labels(n) AS label
RETURN label, count(n) AS node_count
ORDER BY label;

// 2. Count relationships by type. Review relationship volume and mix.
MATCH ()-[r]->()
RETURN type(r) AS relationship_type, count(r) AS relationship_count
ORDER BY relationship_type;

// 3. Duplicate node IDs across approved labels. Expected: zero rows.
MATCH (n)
WHERE n.id IS NOT NULL
UNWIND labels(n) AS label
WITH n.id AS id, collect(label) AS labels_seen, collect(coalesce(n.name, "<no name>")) AS names, count(*) AS occurrences
WHERE occurrences > 1
RETURN id, occurrences, labels_seen, names
ORDER BY occurrences DESC, id;

// 4. Duplicate names within the same label. Expected: zero rows.
MATCH (n)
WHERE n.name IS NOT NULL
UNWIND labels(n) AS label
WITH label, n.name AS name, collect(n.id) AS ids, count(*) AS occurrences
WHERE occurrences > 1
RETURN label, name, occurrences, ids
ORDER BY label, name;

// 5. Use cases without IMPLEMENTED_IN. Expected: zero rows.
MATCH (u:UseCase)
WHERE NOT (u)-[:IMPLEMENTED_IN]->(:NetworkBank)
RETURN u.id AS use_case_id, u.name AS use_case_name
ORDER BY use_case_name;


// 5a. Use cases without SERVES user-group links. Expected: zero rows.
MATCH (u:UseCase)
WHERE NOT (u)-[:SERVES]->(:UserGroup)
RETURN u.id AS use_case_id, u.name AS use_case_name
ORDER BY use_case_name;

// 6. Use cases without SUPPORTS_STRATEGY. Expected: zero rows.
MATCH (u:UseCase)
WHERE NOT (u)-[:SUPPORTS_STRATEGY]->(:StrategyPillar)
RETURN u.id AS use_case_id, u.name AS use_case_name
ORDER BY use_case_name;

// 7. Story 1 / Story 2 use cases without NEEDS_FUNCTION. Expected: zero rows.
MATCH (u:UseCase)
WHERE (u.created_for_story CONTAINS "story_1" OR u.created_for_story CONTAINS "story_2")
  AND NOT (u)-[:NEEDS_FUNCTION]->(:ReusableFunction)
RETURN u.id AS use_case_id, u.name AS use_case_name, u.created_for_story AS created_for_story
ORDER BY use_case_name;

// 8. Reusable functions without DELIVERED_BY. Manual review: some functions may be intentionally conceptual or not yet service-backed.
MATCH (f:ReusableFunction)
WHERE NOT (f)-[:DELIVERED_BY]->(:ToolServer)
RETURN f.id AS function_id, f.name AS function_name
ORDER BY function_name;

// 9. Tool servers without USES_SYSTEM. Expected: zero rows.
MATCH (t:ToolServer)
WHERE NOT (t)-[:USES_SYSTEM]->(:System)
RETURN t.id AS tool_server_id, t.name AS tool_server_name
ORDER BY tool_server_name;

// 10. Tool servers without REQUIRES_CONTROL. Manual review: not every technical service necessarily requires an explicit control in v1.
MATCH (t:ToolServer)
WHERE NOT (t)-[:REQUIRES_CONTROL]->(:Control)
RETURN t.id AS tool_server_id, t.name AS tool_server_name
ORDER BY tool_server_name;

// 11. Risk triggers without IMPLIES_CONTROL. Expected: zero rows.
MATCH (rt:RiskTrigger)
WHERE NOT (rt)-[:IMPLIES_CONTROL]->(:Control)
RETURN rt.id AS risk_trigger_id, rt.name AS risk_trigger_name
ORDER BY risk_trigger_name;

// 12. Risky use cases without completed, missing, or required controls. Expected: zero rows.
MATCH (u:UseCase)-[:HAS_RISK_TRIGGER]->(:RiskTrigger)
WHERE NOT (u)-[:HAS_COMPLETED_CONTROL|MISSING_CONTROL|REQUIRES_CONTROL]->(:Control)
RETURN u.id AS use_case_id, u.name AS use_case_name
ORDER BY use_case_name;

// 13. Blockers without downstream impact. Expected: zero rows.
MATCH (b:Blocker)
WHERE NOT (b)-[:BLOCKS_FUNCTION|BLOCKS_TOOL_SERVER|BLOCKS_DATA_PRODUCT|BLOCKS_CONTROL|AFFECTS_KPI|AFFECTS_BLUEPRINT]-()
RETURN b.id AS blocker_id, b.name AS blocker_name
ORDER BY blocker_name;

// 14. Blueprints without included functions, tool servers, controls, or channel patterns. Expected: zero rows.
MATCH (bp:Blueprint)
WHERE NOT (bp)-[:INCLUDES_FUNCTION|INCLUDES_TOOL_SERVER|INCLUDES_CONTROL|INCLUDES_CHANNEL_PATTERN]->()
RETURN bp.id AS blueprint_id, bp.name AS blueprint_name
ORDER BY blueprint_name;


// 14a. Blueprints missing included functions or controls. Manual review: governance-only blueprints may intentionally include controls without functions.
MATCH (bp:Blueprint)
WHERE NOT (bp)-[:INCLUDES_FUNCTION]->(:ReusableFunction) OR NOT (bp)-[:INCLUDES_CONTROL]->(:Control)
RETURN bp.id AS blueprint_id, bp.name AS blueprint_name, EXISTS { MATCH (bp)-[:INCLUDES_FUNCTION]->(:ReusableFunction) } AS has_functions, EXISTS { MATCH (bp)-[:INCLUDES_CONTROL]->(:Control) } AS has_controls
ORDER BY blueprint_name;

// 15. Similarity relationships not between two UseCase nodes. Expected: zero rows.
MATCH (a)-[r:SIMILAR_FUNCTIONALLY_TO|SIMILAR_RISK_TO]->(b)
WHERE NOT a:UseCase OR NOT b:UseCase
RETURN type(r) AS relationship_type, a.id AS source_id, labels(a) AS source_labels, b.id AS target_id, labels(b) AS target_labels
ORDER BY relationship_type, source_id, target_id;

// 16. Check total graph size. Review against the small-demo target.
MATCH (n)
WITH count(n) AS node_count
MATCH ()-[r]->()
RETURN node_count, count(r) AS relationship_count;

// 17. Relationship types outside the approved dictionary. Expected: zero rows.
MATCH ()-[r]->()
WHERE NOT type(r) IN [
  "HAS_NETWORK_BANK",
  "HAS_STRATEGY",
  "OPERATES_IN",
  "HAS_SYSTEM",
  "IMPLEMENTED_IN",
  "SERVES",
  "DELIVERED_THROUGH",
  "SUPPORTS_PROCESS",
  "SUPPORTS_STRATEGY",
  "MEASURED_BY",
  "NEEDS_FUNCTION",
  "DELIVERED_BY",
  "USES_SYSTEM",
  "USES_DATA_DOMAIN",
  "USES_KNOWLEDGE",
  "REQUIRES_DATA_PRODUCT",
  "COVERS_DATA_DOMAIN",
  "SOURCES_FROM",
  "HAS_RISK_TRIGGER",
  "IMPLIES_CONTROL",
  "REQUIRES_CONTROL",
  "HAS_COMPLETED_CONTROL",
  "MISSING_CONTROL",
  "OWNED_BY",
  "REVIEWED_BY",
  "CANDIDATE_FOR",
  "PARTIAL_VARIANT_OF",
  "INCLUDES_FUNCTION",
  "INCLUDES_TOOL_SERVER",
  "INCLUDES_CONTROL",
  "INCLUDES_CHANNEL_PATTERN",
  "BLOCKED_BY",
  "BLOCKS_FUNCTION",
  "BLOCKS_TOOL_SERVER",
  "BLOCKS_DATA_PRODUCT",
  "BLOCKS_CONTROL",
  "AFFECTS_KPI",
  "AFFECTS_BLUEPRINT",
  "SIMILAR_RISK_TO",
  "SIMILAR_FUNCTIONALLY_TO"
]
RETURN type(r) AS unexpected_relationship_type, count(r) AS relationship_count
ORDER BY unexpected_relationship_type;

// 18. Orphan nodes with no relationships. Expected: zero rows.
MATCH (n)
WHERE NOT (n)--()
RETURN labels(n) AS node_labels, n.id AS node_id, n.name AS node_name
ORDER BY node_labels, node_name;

// 19. Use cases marked as candidates for blueprints. Review for expected story coverage.
MATCH (u:UseCase)-[r:CANDIDATE_FOR]->(bp:Blueprint)
RETURN bp.name AS blueprint, count(u) AS candidate_count, collect(u.name) AS candidate_use_cases
ORDER BY candidate_count DESC, blueprint;

// 20. Missing controls by use case. Review gaps for governance story.
MATCH (u:UseCase)-[:MISSING_CONTROL]->(c:Control)
OPTIONAL MATCH (u)-[:HAS_RISK_TRIGGER]->(rt:RiskTrigger)-[:IMPLIES_CONTROL]->(c)
RETURN u.name AS use_case, collect(DISTINCT rt.name) AS risk_triggers, collect(DISTINCT c.name) AS missing_controls, count(DISTINCT c) AS missing_control_count
ORDER BY missing_control_count DESC, use_case;
