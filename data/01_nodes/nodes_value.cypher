// Blueprint, blocker, and KPI nodes used to show reuse value and scaling impact.
// Generated from data/00_registry/node_id_registry.csv; node relationships are intentionally excluded.

// Blueprint
MERGE (n:Blueprint {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT_BLUEPRINT"})
SET n.name = "Retail Conversational Banking Assistant Blueprint",
    n.description = "Reusable blueprint for customer-facing retail conversational assistants",
    n.source_tag = "S2|S3",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_4";

MERGE (n:Blueprint {id: "BP_DIGITAL_ONBOARDING_ASSISTANT_BLUEPRINT"})
SET n.name = "Digital Onboarding Assistant Blueprint",
    n.description = "Reusable blueprint for onboarding and eKYC assistant journeys",
    n.source_tag = "S3|S9",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:Blueprint {id: "BP_RETAIL_AGENT_TOOLING_BLUEPRINT"})
SET n.name = "Retail Agent Tooling Blueprint",
    n.description = "Reusable service-layer blueprint for retail AI agents and tool servers",
    n.source_tag = "S2|S14",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:Blueprint {id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT"})
SET n.name = "Customer-Facing AI Governance Blueprint",
    n.description = "Reusable control pattern for customer-facing and personal-data AI use cases",
    n.source_tag = "S2|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";

MERGE (n:Blueprint {id: "BP_PERSONALIZED_OFFER_GOVERNANCE_BLUEPRINT"})
SET n.name = "Personalized Offer Governance Blueprint",
    n.description = "Reusable governance and service pattern for personalized offers",
    n.source_tag = "S6|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";


// Blocker
MERGE (n:Blocker {id: "BLK_KYC_API_NOT_STANDARDIZED"})
SET n.name = "KYC eKYC status API not standardized",
    n.description = "API standardization blocker affecting onboarding and identity-status reuse",
    n.source_tag = "S9|S14",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:Blocker {id: "BLK_CUSTOMER_PROFILE_ACCESS_NOT_APPROVED"})
SET n.name = "Customer profile access not approved",
    n.description = "Data access blocker affecting authenticated assistants and staff copilots",
    n.source_tag = "S7|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:Blocker {id: "BLK_PRODUCT_ELIGIBILITY_FRAGMENTED"})
SET n.name = "Product eligibility logic fragmented",
    n.description = "Rules fragmentation blocker affecting product recommendations and offer conversion",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:Blocker {id: "BLK_CRM_LEAD_API_NOT_REUSABLE"})
SET n.name = "CRM lead creation API not reusable",
    n.description = "Workflow API blocker affecting monetization and CRM lead automation",
    n.source_tag = "S6|S14",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:Blocker {id: "BLK_CONSENT_DATA_PRODUCT_INCOMPLETE"})
SET n.name = "Consent data product incomplete",
    n.description = "Data product blocker affecting personalization and marketing compliance",
    n.source_tag = "S6|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:Blocker {id: "BLK_AUDIT_LOGGING_PATTERN_MISSING"})
SET n.name = "Missing audit logging pattern for tool calls",
    n.description = "Control and platform blocker affecting agentic workflow production release",
    n.source_tag = "S2|S7|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:Blocker {id: "BLK_CUSTOMER_DATA_LINEAGE_INCOMPLETE"})
SET n.name = "Incomplete lineage for customer data product",
    n.description = "Data governance blocker affecting scaled customer-data use in AI",
    n.source_tag = "S7|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:Blocker {id: "BLK_COMPLAINT_RETENTION_CONTROL_MISSING"})
SET n.name = "Complaint data retention control missing",
    n.description = "Governance blocker affecting complaint triage assistant rollout",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:Blocker {id: "BLK_LOCAL_INTEGRATION_UNAVAILABLE"})
SET n.name = "Local system integration unavailable",
    n.description = "Local integration blocker affecting selected network-bank rollout",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:Blocker {id: "BLK_AICO_REVIEW_NOT_COMPLETED"})
SET n.name = "AICO review not completed",
    n.description = "Governance review blocker affecting higher-risk production release",
    n.source_tag = "S2|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";


// KPI
MERGE (n:KPI {id: "KPI_DIGITAL_NTB_CUSTOMERS"})
SET n.name = "Digital new-to-bank customers",
    n.description = "Metric for digital acquisition and onboarding conversion",
    n.source_tag = "S1|S9",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:KPI {id: "KPI_ONBOARDING_COMPLETION_RATE"})
SET n.name = "Onboarding completion rate",
    n.description = "Metric for completion of digital onboarding journeys",
    n.source_tag = "S9",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:KPI {id: "KPI_SELF_SERVICE_CONTAINMENT"})
SET n.name = "Self-service containment",
    n.description = "Metric for assistant conversations resolved without human escalation",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_4";

MERGE (n:KPI {id: "KPI_LEAD_CONVERSION_RATE"})
SET n.name = "Lead conversion rate",
    n.description = "Metric for conversion of qualified assistant or campaign leads",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:KPI {id: "KPI_OFFER_ACCEPTANCE_RATE"})
SET n.name = "Offer acceptance rate",
    n.description = "Metric for acceptance of personalized offers",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";

MERGE (n:KPI {id: "KPI_COMPLAINT_RESOLUTION_TIME"})
SET n.name = "Complaint resolution time",
    n.description = "Metric for speed of complaint handling and resolution",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";

MERGE (n:KPI {id: "KPI_GOVERNANCE_REVIEW_CYCLE_TIME"})
SET n.name = "Governance review cycle time",
    n.description = "Metric for time to complete AI governance reviews",
    n.source_tag = "S2|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";

MERGE (n:KPI {id: "KPI_REUSE_BLUEPRINT_ADOPTION"})
SET n.name = "Blueprint adoption rate",
    n.description = "Metric for reuse of approved assistant and tooling blueprints",
    n.source_tag = "S2|S3",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_4";

MERGE (n:KPI {id: "KPI_API_REUSE_RATE"})
SET n.name = "API reuse rate",
    n.description = "Metric for reuse of standardized tool servers and APIs across use cases",
    n.source_tag = "S14",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";
