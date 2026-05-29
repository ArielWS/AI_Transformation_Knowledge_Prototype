// Pack 8 interview demo queries for the Retail AI portfolio intelligence graph.
// Run after loading all graph files. All queries are read-only and use the v1 schema.

// 1. Story 1: Retail conversational assistant blueprint candidates.
// Insight: Adam TB and RAIA-style assistants converge on one reusable blueprint.
MATCH (u:UseCase)-[r:CANDIDATE_FOR]->(bp:Blueprint {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT_BLUEPRINT"})
OPTIONAL MATCH (u)-[:IMPLEMENTED_IN]->(bank:NetworkBank)
OPTIONAL MATCH (u)-[:DELIVERED_THROUGH]->(ch:Channel)
RETURN bp.name AS blueprint, u.name AS assistant, collect(DISTINCT bank.name) AS network_banks, collect(DISTINCT ch.name) AS channels, r.fit_strength AS fit_strength, r.rationale AS rationale
ORDER BY assistant;

// 2. Story 1: Shared functions across Adam TB and RAIA assistants.
// Insight: shared reusable functions explain why a common assistant blueprint is practical.
MATCH (u:UseCase)-[:NEEDS_FUNCTION]->(f:ReusableFunction)
WHERE u.id IN ["UC_ADAM_TB", "UC_RAIA_KOSOVO", "UC_RAIA_BOSNIA", "UC_RAIA_CROATIA"]
WITH f, collect(DISTINCT u.name) AS assistants, count(DISTINCT u) AS assistant_count
WHERE assistant_count >= 2
RETURN f.name AS shared_function, assistant_count, assistants
ORDER BY assistant_count DESC, shared_function;

// 3. Story 1: Partial variants of the conversational assistant blueprint.
// Insight: voicebot and yellowGPT are adjacent patterns, not exact duplicates.
MATCH (u:UseCase)-[r:PARTIAL_VARIANT_OF]->(bp:Blueprint {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT_BLUEPRINT"})
OPTIONAL MATCH (u)-[:DELIVERED_THROUGH]->(ch:Channel)
OPTIONAL MATCH (u)-[:NEEDS_FUNCTION]->(f:ReusableFunction)
RETURN bp.name AS blueprint, u.name AS partial_variant, collect(DISTINCT ch.name) AS channels, collect(DISTINCT f.name) AS functions, r.variant_type AS variant_type, r.rationale AS rationale
ORDER BY partial_variant;

// 4. Story 1: Blueprint components across functions, controls, and channel patterns.
// Insight: a blueprint is a reusable subgraph, not just a label on use cases.
MATCH (bp:Blueprint {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT_BLUEPRINT"})
OPTIONAL MATCH (bp)-[:INCLUDES_FUNCTION]->(f:ReusableFunction)
OPTIONAL MATCH (bp)-[:INCLUDES_CONTROL]->(c:Control)
OPTIONAL MATCH (bp)-[:INCLUDES_CHANNEL_PATTERN]->(ch:Channel)
RETURN bp.name AS blueprint, collect(DISTINCT f.name) AS functions, collect(DISTINCT c.name) AS controls, collect(DISTINCT ch.name) AS channel_patterns;

// 5. Story 2: Most reused reusable functions.
// Insight: functions with many use-case dependents are the strongest candidates for reusable services.
MATCH (u:UseCase)-[:NEEDS_FUNCTION]->(f:ReusableFunction)
OPTIONAL MATCH (f)-[:DELIVERED_BY]->(t:ToolServer)
RETURN f.name AS reusable_function, count(DISTINCT u) AS use_case_count, collect(DISTINCT u.name)[0..8] AS example_use_cases, collect(DISTINCT t.name) AS tool_servers
ORDER BY use_case_count DESC, reusable_function
LIMIT 12;

// 6. Story 2: High-leverage tool servers by indirect use-case support.
// Insight: one service-layer tool can unlock multiple assistants and agents through reusable functions.
MATCH (u:UseCase)-[:NEEDS_FUNCTION]->(f:ReusableFunction)-[:DELIVERED_BY]->(t:ToolServer)
OPTIONAL MATCH (t)-[:OWNED_BY]->(owner:OrgUnit)
RETURN t.name AS tool_server, count(DISTINCT u) AS supported_use_cases, collect(DISTINCT f.name) AS delivered_functions, collect(DISTINCT owner.name) AS owners
ORDER BY supported_use_cases DESC, tool_server
LIMIT 12;

// 7. Story 2: Runtime path from use case to tool server to system.
// Insight: this shows the graph-native chain from portfolio demand to reusable service to underlying system.
MATCH path = (u:UseCase)-[:NEEDS_FUNCTION]->(:ReusableFunction)-[:DELIVERED_BY]->(:ToolServer)-[:USES_SYSTEM]->(:System)
RETURN path
LIMIT 25;

// 8. Story 2: Tool servers that require controls and have owners.
// Insight: reusable service-layer components are also governance assets with accountable teams.
MATCH (t:ToolServer)-[:REQUIRES_CONTROL]->(c:Control)
OPTIONAL MATCH (t)-[:OWNED_BY]->(owner:OrgUnit)
RETURN t.name AS tool_server, collect(DISTINCT c.name) AS required_controls, collect(DISTINCT owner.name) AS owners, count(DISTINCT c) AS control_count
ORDER BY control_count DESC, tool_server;

// 9. Story 3: Missing controls explained by risk triggers.
// Insight: gaps are grounded in risk-trigger-to-control analogy, not free-text opinions.
MATCH (u:UseCase)-[:MISSING_CONTROL]->(c:Control)
OPTIONAL MATCH (u)-[:HAS_RISK_TRIGGER]->(rt:RiskTrigger)-[:IMPLIES_CONTROL]->(c)
RETURN u.name AS use_case, collect(DISTINCT rt.name) AS risk_triggers, c.name AS missing_control
ORDER BY use_case, missing_control;

// 10. Story 3: Product Recommendation Assistant vs Personalized Offer Engine.
// Insight: similar-risk use cases can reveal inconsistent completed and missing controls.
MATCH (source:UseCase {id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT"})-[sim:SIMILAR_RISK_TO]->(target:UseCase {id: "UC_PERSONALIZED_OFFER_ENGINE"})
OPTIONAL MATCH (source)-[:MISSING_CONTROL]->(source_missing:Control)
OPTIONAL MATCH (source)-[:HAS_COMPLETED_CONTROL]->(source_done:Control)
OPTIONAL MATCH (target)-[:MISSING_CONTROL]->(target_missing:Control)
OPTIONAL MATCH (target)-[:HAS_COMPLETED_CONTROL]->(target_done:Control)
RETURN source.name AS source_use_case, target.name AS comparison_use_case, sim.similarity_score AS similarity_score, sim.rationale AS rationale, collect(DISTINCT source_missing.name) AS source_missing_controls, collect(DISTINCT source_done.name) AS source_completed_controls, collect(DISTINCT target_missing.name) AS comparison_missing_controls, collect(DISTINCT target_done.name) AS comparison_completed_controls;

// 11. Story 3: Loan Affordability Recommender vs Credit Pre-Approval Assistant.
// Insight: credit-adjacent use cases should be compared for affordability, explainability, and review controls.
MATCH (source:UseCase {id: "UC_LOAN_AFFORDABILITY_RECOMMENDER"})-[sim:SIMILAR_RISK_TO]->(target:UseCase {id: "UC_CREDIT_PREAPPROVAL_ASSISTANT"})
OPTIONAL MATCH (source)-[:HAS_RISK_TRIGGER]->(source_risk:RiskTrigger)
OPTIONAL MATCH (target)-[:HAS_RISK_TRIGGER]->(target_risk:RiskTrigger)
OPTIONAL MATCH (source)-[:MISSING_CONTROL]->(source_missing:Control)
OPTIONAL MATCH (target)-[:HAS_COMPLETED_CONTROL]->(target_done:Control)
RETURN source.name AS source_use_case, target.name AS comparison_use_case, sim.similarity_score AS similarity_score, collect(DISTINCT source_risk.name) AS source_risks, collect(DISTINCT target_risk.name) AS comparison_risks, collect(DISTINCT source_missing.name) AS source_missing_controls, collect(DISTINCT target_done.name) AS comparison_completed_controls;

// 12. Story 3: AICO and AICoE review evidence compared with gaps.
// Insight: candidates missing AICO or AICoE review evidence are visible as graph gaps.
MATCH (u:UseCase)
OPTIONAL MATCH (u)-[rev:REVIEWED_BY]->(reviewer:OrgUnit)
WHERE reviewer.id IN ["ORG_AICO", "ORG_AICOE"]
WITH u, collect(DISTINCT reviewer.name + " (" + coalesce(rev.review_status, "unknown") + ")") AS review_entries, collect(DISTINCT rev.review_status) AS review_statuses
RETURN u.name AS use_case, review_entries AS aico_aicoe_reviews, CASE WHEN any(status IN review_statuses WHERE status IN ["reviewed", "in_review"]) THEN "has AICO or AICoE progress" ELSE "missing AICO or AICoE evidence" END AS review_evidence
ORDER BY review_evidence DESC, use_case;

// 13. Story 4: Blockers ranked by downstream propagation.
// Insight: blockers can be prioritized by affected use cases, functions, KPIs, and blueprints.
MATCH (b:Blocker)
OPTIONAL MATCH (u:UseCase)-[:BLOCKED_BY]->(b)
OPTIONAL MATCH (b)-[:BLOCKS_FUNCTION]->(f:ReusableFunction)
OPTIONAL MATCH (b)-[:AFFECTS_KPI]->(k:KPI)
OPTIONAL MATCH (b)-[:AFFECTS_BLUEPRINT]->(bp:Blueprint)
RETURN b.name AS blocker, count(DISTINCT u) AS affected_use_cases, count(DISTINCT f) AS blocked_functions, count(DISTINCT k) AS affected_kpis, count(DISTINCT bp) AS affected_blueprints, collect(DISTINCT bp.name) AS blueprints
ORDER BY affected_use_cases DESC, affected_kpis DESC, affected_blueprints DESC, blocker;

// 14. Story 4: Full blocker to function to use case to KPI propagation path.
// Insight: a technical or control blocker propagates through reusable functions into use cases and measurable outcomes.
MATCH path = (b:Blocker)-[:BLOCKS_FUNCTION]->(:ReusableFunction)<-[:NEEDS_FUNCTION]-(:UseCase)-[:MEASURED_BY]->(:KPI)
RETURN path
LIMIT 30;

// 15. Story 4: Blocker impact on KPIs and blueprints.
// Insight: blocker resolution can be framed in strategic outcomes and reusable blueprint adoption.
MATCH (b:Blocker)
OPTIONAL MATCH (b)-[:AFFECTS_KPI]->(k:KPI)
OPTIONAL MATCH (b)-[:AFFECTS_BLUEPRINT]->(bp:Blueprint)
WHERE k IS NOT NULL OR bp IS NOT NULL
RETURN b.name AS blocker, collect(DISTINCT k.name) AS affected_kpis, collect(DISTINCT bp.name) AS affected_blueprints
ORDER BY size(affected_kpis) DESC, size(affected_blueprints) DESC, blocker;

// 16. Similarity layer: sparse functional and risk analogy edges.
// Insight: the sparse similarity layer supports overlap discovery and governance-by-analogy without dense graph clutter.
MATCH (a:UseCase)-[r:SIMILAR_FUNCTIONALLY_TO|SIMILAR_RISK_TO]->(b:UseCase)
RETURN type(r) AS similarity_type, a.name AS source_use_case, b.name AS target_use_case, r.similarity_score AS similarity_score, r.similarity_basis AS similarity_basis, r.rationale AS rationale
ORDER BY similarity_type, similarity_score DESC, source_use_case;

// 17. Portfolio lens: use cases grouped by strategy pillar.
// Insight: graph paths connect reuse and governance stories back to Acquire, Engage, and Monetize.
MATCH (u:UseCase)-[:SUPPORTS_STRATEGY]->(sp:StrategyPillar)
WHERE sp.id IN ["STRAT_ACQUIRE", "STRAT_ENGAGE", "STRAT_MONETIZE"]
RETURN sp.name AS strategy_pillar, count(DISTINCT u) AS use_case_count, collect(DISTINCT u.name) AS use_cases
ORDER BY strategy_pillar;
