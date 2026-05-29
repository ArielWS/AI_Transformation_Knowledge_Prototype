// Reusable function nodes needed by AI use cases and delivered by shared services.
// Generated from data/00_registry/node_id_registry.csv; node relationships are intentionally excluded.

// ReusableFunction
MERGE (n:ReusableFunction {id: "FUNC_RETRIEVE_PRODUCT_KNOWLEDGE"})
SET n.name = "Retrieve product knowledge",
    n.description = "Retrieve approved product information for answers or advice",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_2";

MERGE (n:ReusableFunction {id: "FUNC_RETRIEVE_DIGITAL_HELP"})
SET n.name = "Retrieve digital help guidance",
    n.description = "Retrieve approved help content for app internet banking or onboarding support",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:ReusableFunction {id: "FUNC_RETRIEVE_CUSTOMER_PROFILE"})
SET n.name = "Retrieve customer profile",
    n.description = "Retrieve governed customer context for authenticated service and advice",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:ReusableFunction {id: "FUNC_CHECK_KYC_STATUS"})
SET n.name = "Check KYC eKYC status",
    n.description = "Retrieve current identity verification or onboarding status",
    n.source_tag = "S9",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:ReusableFunction {id: "FUNC_CHECK_PRODUCT_ELIGIBILITY"})
SET n.name = "Check product eligibility",
    n.description = "Evaluate product eligibility or suitability rules for a customer context",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:ReusableFunction {id: "FUNC_CREATE_CRM_LEAD"})
SET n.name = "Create CRM lead",
    n.description = "Create or update a CRM lead from a qualified assistant interaction",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:ReusableFunction {id: "FUNC_ESCALATE_TO_HUMAN"})
SET n.name = "Escalate to human",
    n.description = "Handoff a conversation or task to branch or contact center staff",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_4";

MERGE (n:ReusableFunction {id: "FUNC_LOG_INTERACTION"})
SET n.name = "Log interaction",
    n.description = "Record assistant interaction and tool use for audit and service follow-up",
    n.source_tag = "S2|S7|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_4";

MERGE (n:ReusableFunction {id: "FUNC_APPLY_RESPONSE_GUARDRAILS"})
SET n.name = "Apply response guardrails",
    n.description = "Apply content safety grounding and policy guardrails before response delivery",
    n.source_tag = "S5",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_3";

MERGE (n:ReusableFunction {id: "FUNC_RETRIEVE_CONSENT_STATUS"})
SET n.name = "Retrieve consent status",
    n.description = "Retrieve marketing and personalization consent status",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:ReusableFunction {id: "FUNC_RETRIEVE_COMPLAINT_HISTORY"})
SET n.name = "Retrieve complaint history",
    n.description = "Retrieve prior complaint interactions for triage and response drafting",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";

MERGE (n:ReusableFunction {id: "FUNC_CLASSIFY_COMPLAINT"})
SET n.name = "Classify complaint",
    n.description = "Classify complaint topic severity and routing path",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";

MERGE (n:ReusableFunction {id: "FUNC_RECOMMEND_NEXT_BEST_OFFER"})
SET n.name = "Recommend next best offer",
    n.description = "Generate or rank offer recommendations for customer context",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_3";

MERGE (n:ReusableFunction {id: "FUNC_EXPLAIN_RECOMMENDATION"})
SET n.name = "Explain recommendation",
    n.description = "Produce plain-language rationale for recommendation or affordability support",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";

MERGE (n:ReusableFunction {id: "FUNC_CHECK_AFFORDABILITY_SIGNAL"})
SET n.name = "Check affordability signal",
    n.description = "Use governed signals to support affordability-sensitive recommendations",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";

MERGE (n:ReusableFunction {id: "FUNC_RETRIEVE_GOVERNED_CUSTOMER_DATA"})
SET n.name = "Retrieve governed customer data",
    n.description = "Retrieve customer data product records with lineage and access controls",
    n.source_tag = "S7",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:ReusableFunction {id: "FUNC_TRIGGER_WORKFLOW_ACTION"})
SET n.name = "Trigger workflow action",
    n.description = "Invoke approved workflow action from an agentic assistant",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";
