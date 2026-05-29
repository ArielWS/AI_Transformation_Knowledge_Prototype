// Use case nodes for the Retail AI portfolio intelligence demo.
// Generated from data/00_registry/node_id_registry.csv; node relationships are intentionally excluded.

// UseCase
MERGE (n:UseCase {id: "UC_ADAM_TB"})
SET n.name = "Adam TB",
    n.description = "Customer-facing assistant for product and digital banking support at Tatra banka",
    n.source_tag = "S10",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_1";

MERGE (n:UseCase {id: "UC_RAIA_KOSOVO"})
SET n.name = "RAIA Kosovo",
    n.description = "Customer-facing RAIA assistant for digital banking support in Kosovo",
    n.source_tag = "S10|S11",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_1";

MERGE (n:UseCase {id: "UC_RAIA_BOSNIA"})
SET n.name = "RAIA Bosnia",
    n.description = "Customer-facing RAIA assistant for digital banking support in Bosnia",
    n.source_tag = "S10",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_1";

MERGE (n:UseCase {id: "UC_RAIA_CROATIA"})
SET n.name = "RAIA Croatia",
    n.description = "Customer-facing RAIA-style assistant variant for Croatian retail customers",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:UseCase {id: "UC_RBUA_RBCZ_VOICEBOT"})
SET n.name = "RBUA RBCZ Voicebot",
    n.description = "Voicebot pattern for retail service conversations in Austria and Czechia context",
    n.source_tag = "S3",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:UseCase {id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT"})
SET n.name = "Retail Product Knowledge yellowGPT",
    n.description = "Internal knowledge assistant for retail product and policy questions",
    n.source_tag = "S5",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_2";

MERGE (n:UseCase {id: "UC_DIGITAL_ONBOARDING_ASSISTANT"})
SET n.name = "Digital Onboarding Assistant",
    n.description = "Assistant for eAccount opening identity verification and onboarding status support",
    n.source_tag = "S3|S9",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:UseCase {id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT"})
SET n.name = "Authenticated Customer Assistant",
    n.description = "Authenticated mobile assistant using customer profile and product context",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_2|story_4";

MERGE (n:UseCase {id: "UC_BRANCH_ADVISOR_COPILOT"})
SET n.name = "Branch Advisor Copilot",
    n.description = "Staff copilot for branch advisors using customer profile and product knowledge",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_3|story_4";

MERGE (n:UseCase {id: "UC_SALES_OFFER_ASSISTANT"})
SET n.name = "Sales Offer Assistant",
    n.description = "Assistant that supports contextual offers and CRM lead creation",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_3|story_4";

MERGE (n:UseCase {id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT"})
SET n.name = "Product Recommendation Assistant",
    n.description = "Customer-facing assistant that recommends suitable retail products",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";

MERGE (n:UseCase {id: "UC_PERSONALIZED_OFFER_ENGINE"})
SET n.name = "Personalized Offer Engine",
    n.description = "AI use case for next-best offers and campaign personalization",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";

MERGE (n:UseCase {id: "UC_LOAN_AFFORDABILITY_RECOMMENDER"})
SET n.name = "Loan Affordability Recommender",
    n.description = "Decision-support recommender for affordability-sensitive lending conversations",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";

MERGE (n:UseCase {id: "UC_CREDIT_PREAPPROVAL_ASSISTANT"})
SET n.name = "Credit Pre-Approval Assistant",
    n.description = "Assistant supporting pre-approval journeys for eligible credit products",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";

MERGE (n:UseCase {id: "UC_COMPLAINT_TRIAGE_ASSISTANT"})
SET n.name = "Complaint Triage Assistant",
    n.description = "Classifier and assistant for complaint routing and response drafting",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";

MERGE (n:UseCase {id: "UC_CRM_LEAD_ASSISTANT"})
SET n.name = "CRM Lead Assistant",
    n.description = "Agentic assistant that creates and updates CRM leads from conversations",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:UseCase {id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT"})
SET n.name = "Consent-Aware Campaign Agent",
    n.description = "Marketing agent that checks consent before campaign or offer actions",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_3|story_4";

MERGE (n:UseCase {id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT"})
SET n.name = "Contact Center Knowledge Copilot",
    n.description = "Internal copilot for contact center agents handling product and complaint questions",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_2";

MERGE (n:UseCase {id: "UC_MAIA_MULTILINGUAL_ASSISTANT"})
SET n.name = "MAIA Multilingual Assistant",
    n.description = "Multilingual assistant pattern associated with RBI Group AI Lab signals",
    n.source_tag = "S8",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_1";

MERGE (n:UseCase {id: "UC_CUSTOMER_360_INSIGHT_COPILOT"})
SET n.name = "Customer 360 Insight Copilot",
    n.description = "Internal copilot for governed customer insight exploration",
    n.source_tag = "S7",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:UseCase {id: "UC_AUDIT_READY_AGENT_WORKFLOW"})
SET n.name = "Audit-Ready Agent Workflow",
    n.description = "Reference agentic workflow requiring audit logging and read-write controls",
    n.source_tag = "S2|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";
