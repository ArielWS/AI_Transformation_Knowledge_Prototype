// -----------------------------------------------------------------------------
// Pack 4 / Story 2: shared tool and service layer across Retail AI agents
// -----------------------------------------------------------------------------
// Scope: service-layer, reusable-function, data, system, control, ownership, and
// tooling-blueprint relationships only. All nodes are defined in Pack 1.

// -----------------------------------------------------------------------------
// Use cases need reusable functions that can be served through shared tools/APIs.
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_DIGITAL_ONBOARDING_ASSISTANT", function_id: "FUNC_CHECK_KYC_STATUS", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S9"},
  {use_case_id: "UC_DIGITAL_ONBOARDING_ASSISTANT", function_id: "FUNC_RETRIEVE_PRODUCT_KNOWLEDGE", importance: "required", reuse_relevance: "high", status: "available", confidence: "inferred", source_tag: "S3|S9"},
  {use_case_id: "UC_DIGITAL_ONBOARDING_ASSISTANT", function_id: "FUNC_LOG_INTERACTION", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S2|S13"},
  {use_case_id: "UC_DIGITAL_ONBOARDING_ASSISTANT", function_id: "FUNC_ESCALATE_TO_HUMAN", importance: "optional", reuse_relevance: "medium", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},

  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", function_id: "FUNC_RETRIEVE_CUSTOMER_PROFILE", importance: "required", reuse_relevance: "high", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", function_id: "FUNC_RETRIEVE_PRODUCT_KNOWLEDGE", importance: "required", reuse_relevance: "high", status: "available", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", function_id: "FUNC_ESCALATE_TO_HUMAN", importance: "required", reuse_relevance: "high", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", function_id: "FUNC_LOG_INTERACTION", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S2|S13"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", function_id: "FUNC_APPLY_RESPONSE_GUARDRAILS", importance: "required", reuse_relevance: "high", status: "available", confidence: "inferred", source_tag: "S5"},

  {use_case_id: "UC_BRANCH_ADVISOR_COPILOT", function_id: "FUNC_RETRIEVE_CUSTOMER_PROFILE", importance: "required", reuse_relevance: "high", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_BRANCH_ADVISOR_COPILOT", function_id: "FUNC_CHECK_PRODUCT_ELIGIBILITY", importance: "required", reuse_relevance: "high", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_BRANCH_ADVISOR_COPILOT", function_id: "FUNC_RETRIEVE_PRODUCT_KNOWLEDGE", importance: "required", reuse_relevance: "high", status: "available", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_BRANCH_ADVISOR_COPILOT", function_id: "FUNC_CREATE_CRM_LEAD", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S6"},
  {use_case_id: "UC_BRANCH_ADVISOR_COPILOT", function_id: "FUNC_LOG_INTERACTION", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S2|S13"},

  {use_case_id: "UC_SALES_OFFER_ASSISTANT", function_id: "FUNC_RETRIEVE_CUSTOMER_PROFILE", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S6"},
  {use_case_id: "UC_SALES_OFFER_ASSISTANT", function_id: "FUNC_CHECK_PRODUCT_ELIGIBILITY", importance: "required", reuse_relevance: "high", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_SALES_OFFER_ASSISTANT", function_id: "FUNC_CREATE_CRM_LEAD", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S6"},
  {use_case_id: "UC_SALES_OFFER_ASSISTANT", function_id: "FUNC_RETRIEVE_CONSENT_STATUS", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S6"},
  {use_case_id: "UC_SALES_OFFER_ASSISTANT", function_id: "FUNC_LOG_INTERACTION", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S2|S13"},

  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", function_id: "FUNC_CLASSIFY_COMPLAINT", importance: "required", reuse_relevance: "high", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", function_id: "FUNC_RETRIEVE_COMPLAINT_HISTORY", importance: "required", reuse_relevance: "high", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", function_id: "FUNC_ESCALATE_TO_HUMAN", importance: "required", reuse_relevance: "high", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", function_id: "FUNC_LOG_INTERACTION", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S2|S13"},

  {use_case_id: "UC_CRM_LEAD_ASSISTANT", function_id: "FUNC_CREATE_CRM_LEAD", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S6"},
  {use_case_id: "UC_CRM_LEAD_ASSISTANT", function_id: "FUNC_LOG_INTERACTION", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S2|S13"},
  {use_case_id: "UC_CRM_LEAD_ASSISTANT", function_id: "FUNC_RETRIEVE_CUSTOMER_PROFILE", importance: "optional", reuse_relevance: "medium", status: "partial", confidence: "inferred", source_tag: "S6"},

  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", function_id: "FUNC_RETRIEVE_CONSENT_STATUS", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S6"},
  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", function_id: "FUNC_RETRIEVE_CUSTOMER_PROFILE", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S6"},
  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", function_id: "FUNC_LOG_INTERACTION", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S2|S6|S13"},

  {use_case_id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT", function_id: "FUNC_RETRIEVE_PRODUCT_KNOWLEDGE", importance: "required", reuse_relevance: "high", status: "available", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT", function_id: "FUNC_RETRIEVE_COMPLAINT_HISTORY", importance: "required", reuse_relevance: "high", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT", function_id: "FUNC_ESCALATE_TO_HUMAN", importance: "required", reuse_relevance: "high", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT", function_id: "FUNC_LOG_INTERACTION", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S2|S13"},

  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", function_id: "FUNC_RETRIEVE_CUSTOMER_PROFILE", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S7"},
  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", function_id: "FUNC_LOG_INTERACTION", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S2|S7|S13"},
  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", function_id: "FUNC_RETRIEVE_CONSENT_STATUS", importance: "optional", reuse_relevance: "medium", status: "partial", confidence: "inferred", source_tag: "S6|S7"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (f:ReusableFunction {id: row.function_id})
MERGE (u)-[r:NEEDS_FUNCTION]->(f)
SET r.importance = row.importance,
    r.reuse_relevance = row.reuse_relevance,
    r.function_status_for_use_case = row.status,
    r.confidence = row.confidence,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_2";

// -----------------------------------------------------------------------------
// Reusable functions are delivered by candidate shared tool/API services.
// -----------------------------------------------------------------------------
UNWIND [
  {function_id: "FUNC_RETRIEVE_CUSTOMER_PROFILE", tool_id: "TOOL_CUSTOMER_PROFILE", delivery_status: "fragmented", standardization_status: "candidate_group_standard", confidence: "medium", source_tag: "DEMO"},
  {function_id: "FUNC_CHECK_KYC_STATUS", tool_id: "TOOL_KYC_STATUS", delivery_status: "fragmented", standardization_status: "not_standardized", confidence: "medium", source_tag: "S9|DEMO"},
  {function_id: "FUNC_CHECK_PRODUCT_ELIGIBILITY", tool_id: "TOOL_PRODUCT_ELIGIBILITY", delivery_status: "fragmented", standardization_status: "not_standardized", confidence: "medium", source_tag: "DEMO"},
  {function_id: "FUNC_RETRIEVE_PRODUCT_KNOWLEDGE", tool_id: "TOOL_PRODUCT_KNOWLEDGE_RAG", delivery_status: "available", standardization_status: "candidate_group_standard", confidence: "high", source_tag: "S5"},
  {function_id: "FUNC_CREATE_CRM_LEAD", tool_id: "TOOL_CRM_LEAD", delivery_status: "fragmented", standardization_status: "candidate_group_standard", confidence: "medium", source_tag: "S6"},
  {function_id: "FUNC_RETRIEVE_CONSENT_STATUS", tool_id: "TOOL_CONSENT_STATUS", delivery_status: "fragmented", standardization_status: "candidate_group_standard", confidence: "medium", source_tag: "S6"},
  {function_id: "FUNC_ESCALATE_TO_HUMAN", tool_id: "TOOL_HUMAN_HANDOFF", delivery_status: "fragmented", standardization_status: "candidate_group_standard", confidence: "medium", source_tag: "DEMO"},
  {function_id: "FUNC_LOG_INTERACTION", tool_id: "TOOL_AUDIT_LOGGING", delivery_status: "planned", standardization_status: "candidate_group_standard", confidence: "medium", source_tag: "S2|S13"},
  {function_id: "FUNC_APPLY_RESPONSE_GUARDRAILS", tool_id: "TOOL_RESPONSE_GUARDRAILS", delivery_status: "available", standardization_status: "group_standard", confidence: "high", source_tag: "S5"},
  {function_id: "FUNC_CLASSIFY_COMPLAINT", tool_id: "TOOL_COMPLAINT_TRIAGE", delivery_status: "planned", standardization_status: "local_only", confidence: "low", source_tag: "DEMO"},
  {function_id: "FUNC_RETRIEVE_COMPLAINT_HISTORY", tool_id: "TOOL_COMPLAINT_TRIAGE", delivery_status: "planned", standardization_status: "local_only", confidence: "low", source_tag: "DEMO"},
  {function_id: "FUNC_RETRIEVE_GOVERNED_CUSTOMER_DATA", tool_id: "TOOL_GOVERNED_DATA_ACCESS", delivery_status: "planned", standardization_status: "candidate_group_standard", confidence: "medium", source_tag: "S7"}
] AS row
MATCH (f:ReusableFunction {id: row.function_id})
MATCH (t:ToolServer {id: row.tool_id})
MERGE (f)-[r:DELIVERED_BY]->(t)
SET r.delivery_status = row.delivery_status,
    r.standardization_status = row.standardization_status,
    r.confidence = row.confidence,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_2";

// -----------------------------------------------------------------------------
// Tool servers use only their realistic core systems.
// -----------------------------------------------------------------------------
UNWIND [
  {tool_id: "TOOL_CUSTOMER_PROFILE", system_id: "SYS_CUSTOMER_MASTER", usage_type: "read", criticality: "high", integration_status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {tool_id: "TOOL_CUSTOMER_PROFILE", system_id: "SYS_DATA_PLATFORM_APEX", usage_type: "read", criticality: "high", integration_status: "planned", confidence: "inferred", source_tag: "S7"},
  {tool_id: "TOOL_KYC_STATUS", system_id: "SYS_KYC_PLATFORM", usage_type: "read", criticality: "high", integration_status: "partial", confidence: "inferred", source_tag: "S9"},
  {tool_id: "TOOL_KYC_STATUS", system_id: "SYS_ONBOARDING_WORKFLOW", usage_type: "read", criticality: "high", integration_status: "partial", confidence: "inferred", source_tag: "S9"},
  {tool_id: "TOOL_PRODUCT_ELIGIBILITY", system_id: "SYS_ELIGIBILITY_RULES", usage_type: "read", criticality: "high", integration_status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {tool_id: "TOOL_PRODUCT_ELIGIBILITY", system_id: "SYS_PRODUCT_CATALOGUE", usage_type: "read", criticality: "medium", integration_status: "available", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {tool_id: "TOOL_PRODUCT_KNOWLEDGE_RAG", system_id: "SYS_PRODUCT_CATALOGUE", usage_type: "source", criticality: "high", integration_status: "available", confidence: "inferred", source_tag: "S5"},
  {tool_id: "TOOL_PRODUCT_KNOWLEDGE_RAG", system_id: "SYS_INTERNAL_GENAI_PLATFORM", usage_type: "runtime", criticality: "high", integration_status: "available", confidence: "publicly_observed", source_tag: "S5"},
  {tool_id: "TOOL_DIGITAL_HELP_RAG", system_id: "SYS_PUBLIC_WEBSITE", usage_type: "source", criticality: "medium", integration_status: "available", confidence: "hypothetical_demo", source_tag: "DEMO", created_for_story: "story_1"},
  {tool_id: "TOOL_DIGITAL_HELP_RAG", system_id: "SYS_INTERNAL_GENAI_PLATFORM", usage_type: "runtime", criticality: "medium", integration_status: "available", confidence: "publicly_observed", source_tag: "S5", created_for_story: "story_1"},
  {tool_id: "TOOL_CRM_LEAD", system_id: "SYS_CRM_CAMPAIGN", usage_type: "write", criticality: "high", integration_status: "partial", confidence: "inferred", source_tag: "S6"},
  {tool_id: "TOOL_CONSENT_STATUS", system_id: "SYS_CONSENT_MANAGEMENT", usage_type: "read", criticality: "high", integration_status: "partial", confidence: "inferred", source_tag: "S6"},
  {tool_id: "TOOL_NEXT_BEST_OFFER", system_id: "SYS_CRM_CAMPAIGN", usage_type: "runtime", criticality: "high", integration_status: "available", confidence: "inferred", source_tag: "S6", created_for_story: "story_2|story_3"},
  {tool_id: "TOOL_NEXT_BEST_OFFER", system_id: "SYS_PRODUCT_CATALOGUE", usage_type: "source", criticality: "medium", integration_status: "available", confidence: "hypothetical_demo", source_tag: "DEMO", created_for_story: "story_2|story_3"},
  {tool_id: "TOOL_HUMAN_HANDOFF", system_id: "SYS_CRM_CAMPAIGN", usage_type: "write", criticality: "medium", integration_status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {tool_id: "TOOL_AUDIT_LOGGING", system_id: "SYS_DATA_PLATFORM_APEX", usage_type: "write", criticality: "high", integration_status: "planned", confidence: "inferred", source_tag: "S2|S7|S13"},
  {tool_id: "TOOL_RESPONSE_GUARDRAILS", system_id: "SYS_CONTENT_SAFETY", usage_type: "runtime", criticality: "high", integration_status: "available", confidence: "publicly_observed", source_tag: "S5"},
  {tool_id: "TOOL_COMPLAINT_TRIAGE", system_id: "SYS_CRM_CAMPAIGN", usage_type: "read_write", criticality: "medium", integration_status: "planned", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {tool_id: "TOOL_GOVERNED_DATA_ACCESS", system_id: "SYS_DATA_PLATFORM_APEX", usage_type: "runtime", criticality: "high", integration_status: "planned", confidence: "inferred", source_tag: "S7"}
] AS row
MATCH (t:ToolServer {id: row.tool_id})
MATCH (s:System {id: row.system_id})
MERGE (t)-[r:USES_SYSTEM]->(s)
SET r.usage_type = row.usage_type,
    r.criticality = row.criticality,
    r.integration_status = row.integration_status,
    r.confidence = row.confidence,
    r.source_tag = row.source_tag,
    r.created_for_story = coalesce(row.created_for_story, "story_2");

// -----------------------------------------------------------------------------
// Tool servers expose governed access to their core data domains.
// -----------------------------------------------------------------------------
UNWIND [
  {tool_id: "TOOL_CUSTOMER_PROFILE", data_domain_id: "DATA_CUSTOMER_PROFILE", usage_purpose: "retrieval", sensitivity: "high", access_status: "restricted", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {tool_id: "TOOL_KYC_STATUS", data_domain_id: "DATA_KYC_IDENTITY", usage_purpose: "workflow", sensitivity: "high", access_status: "restricted", confidence: "inferred", source_tag: "S9"},
  {tool_id: "TOOL_PRODUCT_ELIGIBILITY", data_domain_id: "DATA_PRODUCT_CATALOGUE", usage_purpose: "recommendation", sensitivity: "medium", access_status: "approved", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {tool_id: "TOOL_PRODUCT_KNOWLEDGE_RAG", data_domain_id: "DATA_PRODUCT_CATALOGUE", usage_purpose: "retrieval", sensitivity: "low", access_status: "approved", confidence: "inferred", source_tag: "S5"},
  {tool_id: "TOOL_PRODUCT_KNOWLEDGE_RAG", data_domain_id: "DATA_KNOWLEDGE_CONTENT", usage_purpose: "retrieval", sensitivity: "low", access_status: "approved", confidence: "inferred", source_tag: "S5"},
  {tool_id: "TOOL_CRM_LEAD", data_domain_id: "DATA_CRM_INTERACTIONS", usage_purpose: "workflow", sensitivity: "high", access_status: "restricted", confidence: "inferred", source_tag: "S6"},
  {tool_id: "TOOL_CONSENT_STATUS", data_domain_id: "DATA_CONSENT", usage_purpose: "retrieval", sensitivity: "high", access_status: "restricted", confidence: "inferred", source_tag: "S6"},
  {tool_id: "TOOL_HUMAN_HANDOFF", data_domain_id: "DATA_CRM_INTERACTIONS", usage_purpose: "workflow", sensitivity: "medium", access_status: "restricted", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {tool_id: "TOOL_AUDIT_LOGGING", data_domain_id: "DATA_AUDIT_LOGS", usage_purpose: "monitoring", sensitivity: "medium", access_status: "approved", confidence: "inferred", source_tag: "S2|S7|S13"},
  {tool_id: "TOOL_COMPLAINT_TRIAGE", data_domain_id: "DATA_COMPLAINTS", usage_purpose: "classification", sensitivity: "high", access_status: "restricted", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {tool_id: "TOOL_RESPONSE_GUARDRAILS", data_domain_id: "DATA_KNOWLEDGE_CONTENT", usage_purpose: "monitoring", sensitivity: "low", access_status: "approved", confidence: "inferred", source_tag: "S5"},
  {tool_id: "TOOL_GOVERNED_DATA_ACCESS", data_domain_id: "DATA_CUSTOMER_PROFILE", usage_purpose: "retrieval", sensitivity: "high", access_status: "restricted", confidence: "inferred", source_tag: "S7"},
  {tool_id: "TOOL_GOVERNED_DATA_ACCESS", data_domain_id: "DATA_TRANSACTION_SUMMARY", usage_purpose: "retrieval", sensitivity: "high", access_status: "restricted", confidence: "inferred", source_tag: "S7"}
] AS row
MATCH (t:ToolServer {id: row.tool_id})
MATCH (d:DataDomain {id: row.data_domain_id})
MERGE (t)-[r:USES_DATA_DOMAIN]->(d)
SET r.usage_purpose = row.usage_purpose,
    r.sensitivity = row.sensitivity,
    r.access_status = row.access_status,
    r.confidence = row.confidence,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_2";

// -----------------------------------------------------------------------------
// Direct use-case data dependencies that help explain service-layer reuse.
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_DIGITAL_ONBOARDING_ASSISTANT", data_domain_id: "DATA_KYC_IDENTITY", usage_purpose: "workflow", sensitivity: "high", access_status: "restricted", confidence: "inferred", source_tag: "S9"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", data_domain_id: "DATA_CUSTOMER_PROFILE", usage_purpose: "retrieval", sensitivity: "high", access_status: "restricted", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_BRANCH_ADVISOR_COPILOT", data_domain_id: "DATA_CUSTOMER_PROFILE", usage_purpose: "retrieval", sensitivity: "high", access_status: "restricted", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_SALES_OFFER_ASSISTANT", data_domain_id: "DATA_CRM_INTERACTIONS", usage_purpose: "recommendation", sensitivity: "high", access_status: "restricted", confidence: "inferred", source_tag: "S6"},
  {use_case_id: "UC_SALES_OFFER_ASSISTANT", data_domain_id: "DATA_CONSENT", usage_purpose: "recommendation", sensitivity: "high", access_status: "restricted", confidence: "inferred", source_tag: "S6"},
  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", data_domain_id: "DATA_COMPLAINTS", usage_purpose: "classification", sensitivity: "high", access_status: "restricted", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_CRM_LEAD_ASSISTANT", data_domain_id: "DATA_CRM_INTERACTIONS", usage_purpose: "workflow", sensitivity: "high", access_status: "restricted", confidence: "inferred", source_tag: "S6"},
  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", data_domain_id: "DATA_CRM_INTERACTIONS", usage_purpose: "recommendation", sensitivity: "high", access_status: "restricted", confidence: "inferred", source_tag: "S6"},
  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", data_domain_id: "DATA_CONSENT", usage_purpose: "recommendation", sensitivity: "high", access_status: "restricted", confidence: "inferred", source_tag: "S6"},
  {use_case_id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT", data_domain_id: "DATA_COMPLAINTS", usage_purpose: "retrieval", sensitivity: "high", access_status: "restricted", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", data_domain_id: "DATA_CUSTOMER_PROFILE", usage_purpose: "retrieval", sensitivity: "high", access_status: "restricted", confidence: "inferred", source_tag: "S7"},
  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", data_domain_id: "DATA_TRANSACTION_SUMMARY", usage_purpose: "retrieval", sensitivity: "high", access_status: "restricted", confidence: "inferred", source_tag: "S7"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (d:DataDomain {id: row.data_domain_id})
MERGE (u)-[r:USES_DATA_DOMAIN]->(d)
SET r.usage_purpose = row.usage_purpose,
    r.sensitivity = row.sensitivity,
    r.access_status = row.access_status,
    r.confidence = row.confidence,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_2";

// -----------------------------------------------------------------------------
// Knowledge dependencies relevant to the shared product/help service layer.
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_DIGITAL_ONBOARDING_ASSISTANT", knowledge_id: "KB_ONBOARDING_FAQ", usage_type: "retrieval", approval_status: "approved", localization: "group", confidence: "inferred", source_tag: "S9"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", knowledge_id: "KB_PRODUCT_FAQ", usage_type: "grounding", approval_status: "approved", localization: "multi_market", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", knowledge_id: "KB_DIGITAL_HELP", usage_type: "retrieval", approval_status: "approved", localization: "multi_market", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_BRANCH_ADVISOR_COPILOT", knowledge_id: "KB_PRODUCT_FAQ", usage_type: "staff_support", approval_status: "approved", localization: "group", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_BRANCH_ADVISOR_COPILOT", knowledge_id: "KB_DIGITAL_HELP", usage_type: "staff_support", approval_status: "approved", localization: "group", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT", knowledge_id: "KB_PRODUCT_FAQ", usage_type: "staff_support", approval_status: "approved", localization: "group", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT", knowledge_id: "KB_COMPLAINT_GUIDANCE", usage_type: "answer_drafting", approval_status: "needs_review", localization: "local", confidence: "hypothetical_demo", source_tag: "DEMO"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (k:KnowledgeBase {id: row.knowledge_id})
MERGE (u)-[r:USES_KNOWLEDGE]->(k)
SET r.usage_type = row.usage_type,
    r.approval_status = row.approval_status,
    r.localization = row.localization,
    r.confidence = row.confidence,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_2";

// -----------------------------------------------------------------------------
// Service-level controls required by shared tool servers and selected use cases.
// -----------------------------------------------------------------------------
UNWIND [
  {tool_id: "TOOL_CUSTOMER_PROFILE", control_id: "CTRL_ROLE_BASED_ACCESS", requirement_level: "mandatory", source: "architecture"},
  {tool_id: "TOOL_CUSTOMER_PROFILE", control_id: "CTRL_DATA_LINEAGE", requirement_level: "mandatory", source: "policy"},
  {tool_id: "TOOL_KYC_STATUS", control_id: "CTRL_ROLE_BASED_ACCESS", requirement_level: "mandatory", source: "architecture"},
  {tool_id: "TOOL_PRODUCT_ELIGIBILITY", control_id: "CTRL_OUTPUT_GROUNDING", requirement_level: "mandatory", source: "architecture"},
  {tool_id: "TOOL_PRODUCT_KNOWLEDGE_RAG", control_id: "CTRL_OUTPUT_GROUNDING", requirement_level: "mandatory", source: "architecture"},
  {tool_id: "TOOL_PRODUCT_KNOWLEDGE_RAG", control_id: "CTRL_CONTENT_SAFETY", requirement_level: "recommended", source: "architecture"},
  {tool_id: "TOOL_CRM_LEAD", control_id: "CTRL_ROLE_BASED_ACCESS", requirement_level: "mandatory", source: "architecture"},
  {tool_id: "TOOL_CRM_LEAD", control_id: "CTRL_AUDIT_LOGGING", requirement_level: "mandatory", source: "architecture"},
  {tool_id: "TOOL_CONSENT_STATUS", control_id: "CTRL_CONSENT_CHECK", requirement_level: "mandatory", source: "policy"},
  {tool_id: "TOOL_HUMAN_HANDOFF", control_id: "CTRL_HUMAN_HANDOFF", requirement_level: "mandatory", source: "demo_rule"},
  {tool_id: "TOOL_AUDIT_LOGGING", control_id: "CTRL_AUDIT_LOGGING", requirement_level: "mandatory", source: "architecture"},
  {tool_id: "TOOL_RESPONSE_GUARDRAILS", control_id: "CTRL_CONTENT_SAFETY", requirement_level: "mandatory", source: "architecture"},
  {tool_id: "TOOL_COMPLAINT_TRIAGE", control_id: "CTRL_HUMAN_HANDOFF", requirement_level: "recommended", source: "demo_rule"},
  {tool_id: "TOOL_GOVERNED_DATA_ACCESS", control_id: "CTRL_ROLE_BASED_ACCESS", requirement_level: "mandatory", source: "architecture"},
  {tool_id: "TOOL_GOVERNED_DATA_ACCESS", control_id: "CTRL_DATA_LINEAGE", requirement_level: "mandatory", source: "policy"}
] AS row
MATCH (t:ToolServer {id: row.tool_id})
MATCH (c:Control {id: row.control_id})
MERGE (t)-[r:REQUIRES_CONTROL]->(c)
SET r.requirement_level = row.requirement_level,
    r.source = row.source,
    r.created_for_story = "story_2";

UNWIND [
  {tool_id: "TOOL_DIGITAL_HELP_RAG", control_id: "CTRL_OUTPUT_GROUNDING", requirement_level: "mandatory", source: "architecture", created_for_story: "story_1"},
  {tool_id: "TOOL_DIGITAL_HELP_RAG", control_id: "CTRL_CONTENT_SAFETY", requirement_level: "recommended", source: "architecture", created_for_story: "story_1"},
  {tool_id: "TOOL_NEXT_BEST_OFFER", control_id: "CTRL_CONSENT_CHECK", requirement_level: "mandatory", source: "policy", created_for_story: "story_2|story_3"},
  {tool_id: "TOOL_NEXT_BEST_OFFER", control_id: "CTRL_EXPLAINABILITY", requirement_level: "mandatory", source: "risk_trigger", created_for_story: "story_2|story_3"},
  {tool_id: "TOOL_NEXT_BEST_OFFER", control_id: "CTRL_FAIRNESS_BIAS_REVIEW", requirement_level: "recommended", source: "risk_trigger", created_for_story: "story_2|story_3"}
] AS row
MATCH (t:ToolServer {id: row.tool_id})
MATCH (c:Control {id: row.control_id})
MERGE (t)-[r:REQUIRES_CONTROL]->(c)
SET r.requirement_level = row.requirement_level,
    r.source = row.source,
    r.created_for_story = row.created_for_story;

UNWIND [
  {use_case_id: "UC_DIGITAL_ONBOARDING_ASSISTANT", control_id: "CTRL_AUDIT_LOGGING", requirement_level: "mandatory", source: "architecture"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", control_id: "CTRL_ROLE_BASED_ACCESS", requirement_level: "mandatory", source: "architecture"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", control_id: "CTRL_OUTPUT_GROUNDING", requirement_level: "mandatory", source: "architecture"},
  {use_case_id: "UC_SALES_OFFER_ASSISTANT", control_id: "CTRL_CONSENT_CHECK", requirement_level: "mandatory", source: "policy"},
  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", control_id: "CTRL_CONSENT_CHECK", requirement_level: "mandatory", source: "policy"},
  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", control_id: "CTRL_DATA_LINEAGE", requirement_level: "mandatory", source: "policy"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (c:Control {id: row.control_id})
MERGE (u)-[r:REQUIRES_CONTROL]->(c)
SET r.requirement_level = row.requirement_level,
    r.source = row.source,
    r.created_for_story = "story_2";

// -----------------------------------------------------------------------------
// Sparse, plausible ownership for the high-leverage service layer.
// -----------------------------------------------------------------------------
UNWIND [
  {tool_id: "TOOL_CUSTOMER_PROFILE", org_unit_id: "ORG_DATA_OFFICE", ownership_type: "data_owner", primary_owner: true},
  {tool_id: "TOOL_KYC_STATUS", org_unit_id: "ORG_CIO_API_TEAM", ownership_type: "technical_owner", primary_owner: true},
  {tool_id: "TOOL_PRODUCT_ELIGIBILITY", org_unit_id: "ORG_RETAIL_DIGITAL", ownership_type: "business_owner", primary_owner: true},
  {tool_id: "TOOL_PRODUCT_KNOWLEDGE_RAG", org_unit_id: "ORG_AICOE", ownership_type: "technical_owner", primary_owner: true},
  {tool_id: "TOOL_CRM_LEAD", org_unit_id: "ORG_CRM_CVM_TEAM", ownership_type: "business_owner", primary_owner: true},
  {tool_id: "TOOL_CONSENT_STATUS", org_unit_id: "ORG_DATA_OFFICE", ownership_type: "data_owner", primary_owner: true},
  {tool_id: "TOOL_HUMAN_HANDOFF", org_unit_id: "ORG_CONTACT_CENTER_OPS", ownership_type: "business_owner", primary_owner: true},
  {tool_id: "TOOL_AUDIT_LOGGING", org_unit_id: "ORG_CIO_API_TEAM", ownership_type: "technical_owner", primary_owner: true},
  {tool_id: "TOOL_RESPONSE_GUARDRAILS", org_unit_id: "ORG_AICOE", ownership_type: "governance_owner", primary_owner: true},
  {tool_id: "TOOL_GOVERNED_DATA_ACCESS", org_unit_id: "ORG_DATA_OFFICE", ownership_type: "data_owner", primary_owner: true}
] AS row
MATCH (t:ToolServer {id: row.tool_id})
MATCH (o:OrgUnit {id: row.org_unit_id})
MERGE (t)-[r:OWNED_BY]->(o)
SET r.ownership_type = row.ownership_type,
    r.primary_owner = row.primary_owner,
    r.created_for_story = "story_2";

// -----------------------------------------------------------------------------
// Retail Agent Tooling Blueprint fit for use cases with shared tool needs.
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_DIGITAL_ONBOARDING_ASSISTANT", fit_strength: "high", rationale: "Needs KYC status, product knowledge, logging, and handoff services that can be standardized as shared tools.", evidence_status: "inferred", source_tag: "S9|DEMO"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", fit_strength: "high", rationale: "Needs customer profile, product knowledge, handoff, logging, and guardrail services reusable across authenticated channels.", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_BRANCH_ADVISOR_COPILOT", fit_strength: "high", rationale: "Needs customer profile, product eligibility, product knowledge, CRM lead, and logging services reusable for staff copilots.", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_SALES_OFFER_ASSISTANT", fit_strength: "high", rationale: "Needs customer profile, eligibility, CRM lead, consent, and logging services that support Monetize use cases.", evidence_status: "inferred", source_tag: "S6"},
  {use_case_id: "UC_CRM_LEAD_ASSISTANT", fit_strength: "high", rationale: "Directly depends on reusable CRM lead creation and audit logging services.", evidence_status: "inferred", source_tag: "S6"},
  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", fit_strength: "high", rationale: "Needs consent, customer profile, and logging services that should be standardized for campaign automation.", evidence_status: "inferred", source_tag: "S6"},
  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", fit_strength: "medium", rationale: "Needs governed customer profile, transaction summary, consent, and audit services with stronger data controls.", evidence_status: "inferred", source_tag: "S7"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (bp:Blueprint {id: "BP_RETAIL_AGENT_TOOLING_BLUEPRINT"})
MERGE (u)-[r:CANDIDATE_FOR]->(bp)
SET r.fit_strength = row.fit_strength,
    r.rationale = row.rationale,
    r.evidence_status = row.evidence_status,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_2";

// -----------------------------------------------------------------------------
// Retail Agent Tooling Blueprint components: functions, tools, and controls.
// -----------------------------------------------------------------------------
UNWIND [
  {function_id: "FUNC_RETRIEVE_CUSTOMER_PROFILE", component_role: "core", priority: "high"},
  {function_id: "FUNC_CHECK_KYC_STATUS", component_role: "core", priority: "high"},
  {function_id: "FUNC_CHECK_PRODUCT_ELIGIBILITY", component_role: "core", priority: "high"},
  {function_id: "FUNC_RETRIEVE_PRODUCT_KNOWLEDGE", component_role: "core", priority: "high"},
  {function_id: "FUNC_CREATE_CRM_LEAD", component_role: "core", priority: "high"},
  {function_id: "FUNC_RETRIEVE_CONSENT_STATUS", component_role: "core", priority: "high"},
  {function_id: "FUNC_LOG_INTERACTION", component_role: "core", priority: "high"},
  {function_id: "FUNC_ESCALATE_TO_HUMAN", component_role: "core", priority: "medium"}
] AS row
MATCH (bp:Blueprint {id: "BP_RETAIL_AGENT_TOOLING_BLUEPRINT"})
MATCH (f:ReusableFunction {id: row.function_id})
MERGE (bp)-[r:INCLUDES_FUNCTION]->(f)
SET r.component_role = row.component_role,
    r.priority = row.priority,
    r.created_for_story = "story_2";

UNWIND [
  {tool_id: "TOOL_CUSTOMER_PROFILE", component_role: "core", standardization_target: "group_standard"},
  {tool_id: "TOOL_KYC_STATUS", component_role: "core", standardization_target: "group_standard"},
  {tool_id: "TOOL_PRODUCT_ELIGIBILITY", component_role: "core", standardization_target: "multi_market"},
  {tool_id: "TOOL_PRODUCT_KNOWLEDGE_RAG", component_role: "core", standardization_target: "group_standard"},
  {tool_id: "TOOL_CRM_LEAD", component_role: "core", standardization_target: "multi_market"},
  {tool_id: "TOOL_CONSENT_STATUS", component_role: "core", standardization_target: "group_standard"},
  {tool_id: "TOOL_AUDIT_LOGGING", component_role: "core", standardization_target: "group_standard"},
  {tool_id: "TOOL_HUMAN_HANDOFF", component_role: "core", standardization_target: "multi_market"}
] AS row
MATCH (bp:Blueprint {id: "BP_RETAIL_AGENT_TOOLING_BLUEPRINT"})
MATCH (t:ToolServer {id: row.tool_id})
MERGE (bp)-[r:INCLUDES_TOOL_SERVER]->(t)
SET r.component_role = row.component_role,
    r.standardization_target = row.standardization_target,
    r.created_for_story = "story_2";

UNWIND [
  {control_id: "CTRL_ROLE_BASED_ACCESS", control_role: "mandatory", applies_to_variant: "all"},
  {control_id: "CTRL_AUDIT_LOGGING", control_role: "mandatory", applies_to_variant: "all"},
  {control_id: "CTRL_CONSENT_CHECK", control_role: "mandatory", applies_to_variant: "authenticated"},
  {control_id: "CTRL_OUTPUT_GROUNDING", control_role: "mandatory", applies_to_variant: "all"},
  {control_id: "CTRL_HUMAN_HANDOFF", control_role: "recommended", applies_to_variant: "customer_facing"}
] AS row
MATCH (bp:Blueprint {id: "BP_RETAIL_AGENT_TOOLING_BLUEPRINT"})
MATCH (c:Control {id: row.control_id})
MERGE (bp)-[r:INCLUDES_CONTROL]->(c)
SET r.control_role = row.control_role,
    r.applies_to_variant = row.applies_to_variant,
    r.created_for_story = "story_2";
