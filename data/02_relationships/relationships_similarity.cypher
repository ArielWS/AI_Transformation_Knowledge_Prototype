// Pack 7: sparse similarity relationships.
// Scope: manually seeded UseCase-to-UseCase similarity edges for demo queries only.
// Allowed relationship types in this file: SIMILAR_FUNCTIONALLY_TO, SIMILAR_RISK_TO.

// -----------------------------------------------------------------------------
// Functional similarity for assistant overlap and reusable blueprint discovery.
// -----------------------------------------------------------------------------
UNWIND [
  {
    source_id: "UC_ADAM_TB",
    target_id: "UC_RAIA_KOSOVO",
    similarity_score: 0.92,
    similarity_basis: "shared_functions",
    evidence_status: "observed",
    rationale: "Customer-facing retail assistants with overlapping product knowledge, escalation, logging, and guardrail needs.",
    created_for_story: "story_1"
  },
  {
    source_id: "UC_RAIA_KOSOVO",
    target_id: "UC_RAIA_BOSNIA",
    similarity_score: 0.90,
    similarity_basis: "shared_functions",
    evidence_status: "observed",
    rationale: "RAIA assistant variants share the same reusable assistant pattern across neighboring network-bank contexts.",
    created_for_story: "story_1"
  },
  {
    source_id: "UC_RAIA_BOSNIA",
    target_id: "UC_RAIA_CROATIA",
    similarity_score: 0.84,
    similarity_basis: "partial_variant",
    evidence_status: "hypothetical_demo",
    rationale: "Croatian RAIA-style variant is modeled as a demo extension of the Bosnia assistant pattern rather than a fully observed duplicate.",
    created_for_story: "story_1"
  },
  {
    source_id: "UC_RBUA_RBCZ_VOICEBOT",
    target_id: "UC_ADAM_TB",
    similarity_score: 0.68,
    similarity_basis: "shared_channel_pattern",
    evidence_status: "inferred",
    rationale: "Voice-channel service assistant partially overlaps with Adam TB through customer conversation, handoff, logging, and guardrail patterns.",
    created_for_story: "story_1"
  },
  {
    source_id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT",
    target_id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT",
    similarity_score: 0.82,
    similarity_basis: "shared_knowledge_pattern",
    evidence_status: "inferred",
    rationale: "Internal staff assistants both depend on governed product and policy knowledge retrieval for answer grounding.",
    created_for_story: "story_1"
  },
  {
    source_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT",
    target_id: "UC_BRANCH_ADVISOR_COPILOT",
    similarity_score: 0.76,
    similarity_basis: "shared_service_layer",
    evidence_status: "hypothetical_demo",
    rationale: "Customer and advisor assistants share reusable customer-profile, eligibility, knowledge, and audit tooling despite different user groups.",
    created_for_story: "story_2"
  }
] AS row
MATCH (source:UseCase {id: row.source_id})
MATCH (target:UseCase {id: row.target_id})
MERGE (source)-[r:SIMILAR_FUNCTIONALLY_TO]->(target)
SET r.similarity_score = row.similarity_score,
    r.similarity_basis = row.similarity_basis,
    r.evidence_status = row.evidence_status,
    r.rationale = row.rationale,
    r.created_for_story = row.created_for_story;

// -----------------------------------------------------------------------------
// Risk similarity for governance-gap-by-analogy review.
// -----------------------------------------------------------------------------
UNWIND [
  {
    source_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT",
    target_id: "UC_PERSONALIZED_OFFER_ENGINE",
    similarity_score: 0.88,
    similarity_basis: "personalization",
    evidence_status: "hypothetical_demo",
    rationale: "Both use cases personalize retail product or offer outcomes and should be compared for consent, explainability, and recommendation controls.",
    created_for_story: "story_3"
  },
  {
    source_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER",
    target_id: "UC_CREDIT_PREAPPROVAL_ASSISTANT",
    similarity_score: 0.87,
    similarity_basis: "credit_adjacent",
    evidence_status: "hypothetical_demo",
    rationale: "Both use cases support credit-adjacent customer journeys where affordability, explainability, and human oversight controls are relevant.",
    created_for_story: "story_3"
  },
  {
    source_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT",
    target_id: "UC_ADAM_TB",
    similarity_score: 0.78,
    similarity_basis: "shared_customer_impact",
    evidence_status: "hypothetical_demo",
    rationale: "Authenticated and public-facing assistants both affect customer service outcomes and need comparable customer-facing AI controls.",
    created_for_story: "story_3"
  },
  {
    source_id: "UC_COMPLAINT_TRIAGE_ASSISTANT",
    target_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT",
    similarity_score: 0.71,
    similarity_basis: "shared_controls",
    evidence_status: "hypothetical_demo",
    rationale: "Complaint handling and authenticated assistance both need auditability, escalation paths, and careful handling of customer-sensitive content.",
    created_for_story: "story_3"
  },
  {
    source_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT",
    target_id: "UC_PERSONALIZED_OFFER_ENGINE",
    similarity_score: 0.83,
    similarity_basis: "shared_risk_triggers",
    evidence_status: "inferred",
    rationale: "Both marketing-oriented use cases depend on consent-aware personalization and should be reviewed against similar data-use controls.",
    created_for_story: "story_3"
  }
] AS row
MATCH (source:UseCase {id: row.source_id})
MATCH (target:UseCase {id: row.target_id})
MERGE (source)-[r:SIMILAR_RISK_TO]->(target)
SET r.similarity_score = row.similarity_score,
    r.similarity_basis = row.similarity_basis,
    r.evidence_status = row.evidence_status,
    r.rationale = row.rationale,
    r.created_for_story = row.created_for_story;
