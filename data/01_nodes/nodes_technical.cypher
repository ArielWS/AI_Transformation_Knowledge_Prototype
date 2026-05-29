// Technical service-layer, system, data, and knowledge nodes for the demo graph.
// Generated from data/00_registry/node_id_registry.csv; node relationships are intentionally excluded.

// ToolServer
MERGE (n:ToolServer {id: "TOOL_PRODUCT_KNOWLEDGE_RAG"})
SET n.name = "Product Knowledge RAG Tool Server",
    n.description = "Retrieval service for approved retail product knowledge",
    n.source_tag = "S5",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_2";

MERGE (n:ToolServer {id: "TOOL_DIGITAL_HELP_RAG"})
SET n.name = "Digital Help RAG Tool Server",
    n.description = "Retrieval service for digital help and onboarding guidance",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:ToolServer {id: "TOOL_CUSTOMER_PROFILE"})
SET n.name = "Customer Profile Tool Server",
    n.description = "Governed service exposing customer profile data to approved use cases",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:ToolServer {id: "TOOL_KYC_STATUS"})
SET n.name = "KYC Status Tool Server",
    n.description = "Governed service exposing onboarding and KYC status to approved agents",
    n.source_tag = "S9",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:ToolServer {id: "TOOL_PRODUCT_ELIGIBILITY"})
SET n.name = "Product Eligibility Tool Server",
    n.description = "Service exposing product eligibility and rules checks",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:ToolServer {id: "TOOL_CRM_LEAD"})
SET n.name = "CRM Lead Tool Server",
    n.description = "Workflow service for creating and updating CRM leads",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:ToolServer {id: "TOOL_HUMAN_HANDOFF"})
SET n.name = "Human Handoff Tool Server",
    n.description = "Workflow service for handoff to branch or contact center staff",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_4";

MERGE (n:ToolServer {id: "TOOL_AUDIT_LOGGING"})
SET n.name = "Audit Logging Tool Server",
    n.description = "Shared service for logging agent interactions and tool calls",
    n.source_tag = "S2|S7|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:ToolServer {id: "TOOL_RESPONSE_GUARDRAILS"})
SET n.name = "Response Guardrails Tool Server",
    n.description = "Model service for content safety grounding and response controls",
    n.source_tag = "S5",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_3";

MERGE (n:ToolServer {id: "TOOL_CONSENT_STATUS"})
SET n.name = "Consent Status Tool Server",
    n.description = "Service exposing consent status for approved personalization use cases",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:ToolServer {id: "TOOL_COMPLAINT_TRIAGE"})
SET n.name = "Complaint Triage Tool Server",
    n.description = "Classifier service for complaint routing and response support",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";

MERGE (n:ToolServer {id: "TOOL_NEXT_BEST_OFFER"})
SET n.name = "Next Best Offer Tool Server",
    n.description = "Model or decision service for offer ranking and recommendations",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_3";

MERGE (n:ToolServer {id: "TOOL_GOVERNED_DATA_ACCESS"})
SET n.name = "Governed Data Access Tool Server",
    n.description = "Service for governed access to data products and lineage-aware customer data",
    n.source_tag = "S7",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";


// System
MERGE (n:System {id: "SYS_MOBILE_BANKING"})
SET n.name = "Mobile Banking Platform",
    n.description = "Mobile banking platform used by customer-facing assistants",
    n.source_tag = "S4|S12",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_1";

MERGE (n:System {id: "SYS_PUBLIC_WEBSITE"})
SET n.name = "Public Website Platform",
    n.description = "Public website platform for customer assistance and product content",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:System {id: "SYS_INTERNAL_GENAI_PLATFORM"})
SET n.name = "Internal GenAI Platform",
    n.description = "Shared internal GenAI platform for ChatGPT-style assistants and yellowGPTs",
    n.source_tag = "S5",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_1|story_2";

MERGE (n:System {id: "SYS_CONTENT_SAFETY"})
SET n.name = "Azure AI Content Safety",
    n.description = "Content safety component for response guardrails",
    n.source_tag = "S5",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_1|story_3";

MERGE (n:System {id: "SYS_KYC_PLATFORM"})
SET n.name = "KYC eKYC Platform",
    n.description = "Identity verification eKYC and Video ID platform context",
    n.source_tag = "S9",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_4";

MERGE (n:System {id: "SYS_ONBOARDING_WORKFLOW"})
SET n.name = "Onboarding Workflow System",
    n.description = "Workflow system for eAccount opening and onboarding status",
    n.source_tag = "S9",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:System {id: "SYS_CUSTOMER_MASTER"})
SET n.name = "Customer Master",
    n.description = "System of record for customer profile and relationship context",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:System {id: "SYS_CRM_CAMPAIGN"})
SET n.name = "CRM Campaign Platform",
    n.description = "CRM campaign and offer orchestration platform",
    n.source_tag = "S6",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_2|story_4";

MERGE (n:System {id: "SYS_PRODUCT_CATALOGUE"})
SET n.name = "Product Catalogue",
    n.description = "System containing product information and catalogue data",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_2";

MERGE (n:System {id: "SYS_ELIGIBILITY_RULES"})
SET n.name = "Eligibility Rules Engine",
    n.description = "Rules system for product eligibility checks",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:System {id: "SYS_CONSENT_MANAGEMENT"})
SET n.name = "Consent Management System",
    n.description = "System managing customer consent for personalization and marketing",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:System {id: "SYS_DATA_PLATFORM_APEX"})
SET n.name = "Data Platform APEX",
    n.description = "Data analytics platform context for governed data products lineage and audit logs",
    n.source_tag = "S7",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_2|story_4";


// DataDomain
MERGE (n:DataDomain {id: "DATA_CUSTOMER_PROFILE"})
SET n.name = "Customer profile",
    n.description = "Customer master profile and relationship context",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:DataDomain {id: "DATA_KYC_IDENTITY"})
SET n.name = "KYC identity verification",
    n.description = "KYC eKYC identity and onboarding status data",
    n.source_tag = "S9",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:DataDomain {id: "DATA_PRODUCT_CATALOGUE"})
SET n.name = "Product catalogue",
    n.description = "Product facts tariffs and eligibility-relevant metadata",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_2";

MERGE (n:DataDomain {id: "DATA_CRM_INTERACTIONS"})
SET n.name = "CRM interactions",
    n.description = "CRM leads campaigns and customer interaction history",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:DataDomain {id: "DATA_CONSENT"})
SET n.name = "Consent",
    n.description = "Consent data for personalization and marketing permissions",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:DataDomain {id: "DATA_TRANSACTION_SUMMARY"})
SET n.name = "Transaction summary",
    n.description = "Summarized customer transaction patterns for affordability and recommendation use cases",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";

MERGE (n:DataDomain {id: "DATA_COMPLAINTS"})
SET n.name = "Complaints",
    n.description = "Complaint records routing history and resolution context",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";

MERGE (n:DataDomain {id: "DATA_AUDIT_LOGS"})
SET n.name = "Audit logs",
    n.description = "Audit logging and lineage evidence for AI tool calls and workflows",
    n.source_tag = "S2|S7|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:DataDomain {id: "DATA_KNOWLEDGE_CONTENT"})
SET n.name = "Knowledge content",
    n.description = "Approved product policy help and staff knowledge content",
    n.source_tag = "S5",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_2";


// DataProduct
MERGE (n:DataProduct {id: "DP_CUSTOMER_360"})
SET n.name = "Customer 360 Data Product",
    n.description = "Governed customer profile and holdings data product",
    n.source_tag = "S7",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:DataProduct {id: "DP_KYC_STATUS"})
SET n.name = "KYC Status Data Product",
    n.description = "Reusable KYC and identity verification status data product",
    n.source_tag = "S9",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:DataProduct {id: "DP_PRODUCT_CATALOGUE"})
SET n.name = "Product Catalogue Data Product",
    n.description = "Governed product catalogue data product for retrieval and eligibility",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_2";

MERGE (n:DataProduct {id: "DP_CONSENT_STATUS"})
SET n.name = "Consent Status Data Product",
    n.description = "Governed consent data product for personalization checks",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:DataProduct {id: "DP_CRM_INTERACTION_HISTORY"})
SET n.name = "CRM Interaction History Data Product",
    n.description = "Reusable CRM interaction and lead history data product",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:DataProduct {id: "DP_COMPLAINT_HISTORY"})
SET n.name = "Complaint History Data Product",
    n.description = "Governed complaint history data product for triage",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";

MERGE (n:DataProduct {id: "DP_AUDIT_LOG_EVENTS"})
SET n.name = "Audit Log Events Data Product",
    n.description = "Governed event log data product for AI actions and lineage evidence",
    n.source_tag = "S2|S7|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";


// KnowledgeBase
MERGE (n:KnowledgeBase {id: "KB_PRODUCT_FAQ"})
SET n.name = "Product FAQ Knowledge Base",
    n.description = "Approved retail product and FAQ content for answer grounding",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:KnowledgeBase {id: "KB_DIGITAL_HELP"})
SET n.name = "Digital Help Knowledge Base",
    n.description = "Approved digital banking help content",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:KnowledgeBase {id: "KB_COMPLAINT_GUIDANCE"})
SET n.name = "Complaint Guidance Knowledge Base",
    n.description = "Guidance for complaint handling triage and response drafting",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";

MERGE (n:KnowledgeBase {id: "KB_ONBOARDING_FAQ"})
SET n.name = "Onboarding FAQ Knowledge Base",
    n.description = "Knowledge content for eAccount opening eKYC and onboarding questions",
    n.source_tag = "S9",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:KnowledgeBase {id: "KB_LOCALIZED_ASSISTANT_CONTENT"})
SET n.name = "Localized Assistant Content Knowledge Base",
    n.description = "Market-localized content for multilingual retail assistants",
    n.source_tag = "S8|S10",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:KnowledgeBase {id: "KB_GOVERNANCE_CONTROL_LIBRARY"})
SET n.name = "Governance Control Library",
    n.description = "Reference control library for AI governance review and reusable patterns",
    n.source_tag = "S2|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";
