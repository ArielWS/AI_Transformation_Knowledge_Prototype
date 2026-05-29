// -----------------------------------------------------------------------------
// Pack 6 / Story 4: scaling blocker propagation relationships
// -----------------------------------------------------------------------------
// Scope: blocker propagation only. All nodes are defined in Pack 1, and all
// use-case context, reusable-function, service-layer, governance, blueprint, and
// similarity relationships remain in their earlier/final packs.

// -----------------------------------------------------------------------------
// Use cases directly blocked by scaling dependencies.
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_DIGITAL_ONBOARDING_ASSISTANT", blocker_id: "BLK_KYC_API_NOT_STANDARDIZED", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Digital onboarding needs a reusable KYC status dependency before the pattern can scale across markets.", source_tag: "S9|S14"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", blocker_id: "BLK_KYC_API_NOT_STANDARDIZED", impact_level: "medium", blocking_status: "partial", impact_rationale: "Authenticated customer journeys may need identity-status context for safe assisted servicing.", source_tag: "S9|DEMO"},
  {use_case_id: "UC_CREDIT_PREAPPROVAL_ASSISTANT", blocker_id: "BLK_KYC_API_NOT_STANDARDIZED", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Credit pre-approval needs reliable identity and KYC context before broader rollout.", source_tag: "DEMO"},

  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", blocker_id: "BLK_CUSTOMER_PROFILE_ACCESS_NOT_APPROVED", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "The assistant cannot personalize authenticated support without approved customer profile access.", source_tag: "DEMO"},
  {use_case_id: "UC_BRANCH_ADVISOR_COPILOT", blocker_id: "BLK_CUSTOMER_PROFILE_ACCESS_NOT_APPROVED", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Branch advisors need governed customer profile context for meaningful assisted recommendations.", source_tag: "DEMO"},
  {use_case_id: "UC_SALES_OFFER_ASSISTANT", blocker_id: "BLK_CUSTOMER_PROFILE_ACCESS_NOT_APPROVED", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Sales offer orchestration depends on governed customer profile signals.", source_tag: "S6|DEMO"},
  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", blocker_id: "BLK_CUSTOMER_PROFILE_ACCESS_NOT_APPROVED", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "The insight copilot depends on approved access to customer profile data products.", source_tag: "S7|S13"},
  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", blocker_id: "BLK_CUSTOMER_PROFILE_ACCESS_NOT_APPROVED", impact_level: "medium", blocking_status: "partial", impact_rationale: "Campaign personalization is limited when customer profile access is not approved.", source_tag: "S6|S13"},

  {use_case_id: "UC_BRANCH_ADVISOR_COPILOT", blocker_id: "BLK_PRODUCT_ELIGIBILITY_FRAGMENTED", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Branch advice cannot scale consistently while eligibility rules remain fragmented.", source_tag: "DEMO"},
  {use_case_id: "UC_SALES_OFFER_ASSISTANT", blocker_id: "BLK_PRODUCT_ELIGIBILITY_FRAGMENTED", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Offer selection depends on consistent eligibility checks.", source_tag: "S6|DEMO"},
  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", blocker_id: "BLK_PRODUCT_ELIGIBILITY_FRAGMENTED", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Recommendations need a reusable eligibility function to avoid inconsistent product steering.", source_tag: "DEMO"},
  {use_case_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER", blocker_id: "BLK_PRODUCT_ELIGIBILITY_FRAGMENTED", impact_level: "medium", blocking_status: "partial", impact_rationale: "Affordability-sensitive recommendations are limited by fragmented product eligibility logic.", source_tag: "DEMO"},
  {use_case_id: "UC_CREDIT_PREAPPROVAL_ASSISTANT", blocker_id: "BLK_PRODUCT_ELIGIBILITY_FRAGMENTED", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Credit pre-approval depends on consistent eligibility rules before scaled rollout.", source_tag: "DEMO"},

  {use_case_id: "UC_SALES_OFFER_ASSISTANT", blocker_id: "BLK_CRM_LEAD_API_NOT_REUSABLE", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Sales conversations cannot reliably convert without reusable CRM lead creation.", source_tag: "S6|S14"},
  {use_case_id: "UC_CRM_LEAD_ASSISTANT", blocker_id: "BLK_CRM_LEAD_API_NOT_REUSABLE", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "The CRM lead assistant directly depends on a reusable lead creation workflow API.", source_tag: "S6|S14"},
  {use_case_id: "UC_BRANCH_ADVISOR_COPILOT", blocker_id: "BLK_CRM_LEAD_API_NOT_REUSABLE", impact_level: "medium", blocking_status: "partial", impact_rationale: "Branch-assisted sales handoff is limited without reusable CRM lead creation.", source_tag: "S6|DEMO"},

  {use_case_id: "UC_AUDIT_READY_AGENT_WORKFLOW", blocker_id: "BLK_AUDIT_LOGGING_PATTERN_MISSING", impact_level: "high", blocking_status: "full", impact_rationale: "Audit-ready agentic workflows require a standard tool-call logging pattern.", source_tag: "S2|S7|S13"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", blocker_id: "BLK_AUDIT_LOGGING_PATTERN_MISSING", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Authenticated assistant interactions need traceable logs before scaled production use.", source_tag: "S2|S13|DEMO"},
  {use_case_id: "UC_DIGITAL_ONBOARDING_ASSISTANT", blocker_id: "BLK_AUDIT_LOGGING_PATTERN_MISSING", impact_level: "medium", blocking_status: "partial", impact_rationale: "Onboarding journeys need audit evidence around status checks and assisted actions.", source_tag: "S2|S9|S13"},
  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", blocker_id: "BLK_AUDIT_LOGGING_PATTERN_MISSING", impact_level: "medium", blocking_status: "partial", impact_rationale: "Complaint handling needs traceable interaction evidence for operational review.", source_tag: "S13|DEMO"},
  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", blocker_id: "BLK_AUDIT_LOGGING_PATTERN_MISSING", impact_level: "medium", blocking_status: "partial", impact_rationale: "Customer-data exploration needs audit evidence for governed access and use.", source_tag: "S7|S13"},

  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", blocker_id: "BLK_CONSENT_DATA_PRODUCT_INCOMPLETE", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Campaign actions cannot scale without a reusable consent status data product.", source_tag: "S6|S13"},
  {use_case_id: "UC_PERSONALIZED_OFFER_ENGINE", blocker_id: "BLK_CONSENT_DATA_PRODUCT_INCOMPLETE", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Personalized offers depend on consent checks before activation.", source_tag: "S6|S13"},
  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", blocker_id: "BLK_CONSENT_DATA_PRODUCT_INCOMPLETE", impact_level: "medium", blocking_status: "partial", impact_rationale: "Product recommendations may need consent-aware personalization boundaries.", source_tag: "DEMO"},
  {use_case_id: "UC_SALES_OFFER_ASSISTANT", blocker_id: "BLK_CONSENT_DATA_PRODUCT_INCOMPLETE", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Sales offers need consent status before marketing or next-best-offer action.", source_tag: "S6|S13"},

  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", blocker_id: "BLK_CUSTOMER_DATA_LINEAGE_INCOMPLETE", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Customer insight exploration needs lineage evidence for governed data reuse.", source_tag: "S7|S13"},
  {use_case_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER", blocker_id: "BLK_CUSTOMER_DATA_LINEAGE_INCOMPLETE", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Affordability-sensitive recommendations need traceable customer data lineage.", source_tag: "S7|S13|DEMO"},
  {use_case_id: "UC_CREDIT_PREAPPROVAL_ASSISTANT", blocker_id: "BLK_CUSTOMER_DATA_LINEAGE_INCOMPLETE", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Credit pre-approval needs governed lineage for customer data used in eligibility signals.", source_tag: "S7|S13|DEMO"},
  {use_case_id: "UC_AUDIT_READY_AGENT_WORKFLOW", blocker_id: "BLK_CUSTOMER_DATA_LINEAGE_INCOMPLETE", impact_level: "medium", blocking_status: "partial", impact_rationale: "Audit-ready workflows need lineage evidence where customer data is used by tools.", source_tag: "S7|S13"},

  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", blocker_id: "BLK_COMPLAINT_RETENTION_CONTROL_MISSING", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Complaint triage cannot scale until retention and privacy evidence are clear.", source_tag: "DEMO"},
  {use_case_id: "UC_AUDIT_READY_AGENT_WORKFLOW", blocker_id: "BLK_COMPLAINT_RETENTION_CONTROL_MISSING", impact_level: "medium", blocking_status: "partial", impact_rationale: "Reference agent workflows involving complaints need retention-control evidence.", source_tag: "DEMO"},

  {use_case_id: "UC_RBUA_RBCZ_VOICEBOT", blocker_id: "BLK_LOCAL_INTEGRATION_UNAVAILABLE", impact_level: "medium", blocking_status: "partial", impact_rationale: "Selected voicebot rollouts are limited when local channel or core-system integrations are unavailable.", source_tag: "DEMO"},
  {use_case_id: "UC_RAIA_CROATIA", blocker_id: "BLK_LOCAL_INTEGRATION_UNAVAILABLE", impact_level: "medium", blocking_status: "partial", impact_rationale: "A local assistant variant may remain limited without integration to local service channels.", source_tag: "DEMO"},

  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", blocker_id: "BLK_AICO_REVIEW_NOT_COMPLETED", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Recommendation-impacting AI should not scale before AICO review evidence is completed.", source_tag: "S2|S13|DEMO"},
  {use_case_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER", blocker_id: "BLK_AICO_REVIEW_NOT_COMPLETED", impact_level: "high", blocking_status: "risk_to_scale", impact_rationale: "Credit-adjacent AI needs governance review before broad production release.", source_tag: "S2|S13|DEMO"},
  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", blocker_id: "BLK_AICO_REVIEW_NOT_COMPLETED", impact_level: "medium", blocking_status: "partial", impact_rationale: "Complaint triage benefits from governance review before scaling sensitive response support.", source_tag: "S13|DEMO"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (b:Blocker {id: row.blocker_id})
MERGE (u)-[r:BLOCKED_BY]->(b)
SET r.impact_level = row.impact_level,
    r.blocking_status = row.blocking_status,
    r.impact_rationale = row.impact_rationale,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_4";

// -----------------------------------------------------------------------------
// Blockers that prevent or limit reusable functions.
// -----------------------------------------------------------------------------
UNWIND [
  {blocker_id: "BLK_KYC_API_NOT_STANDARDIZED", function_id: "FUNC_CHECK_KYC_STATUS", block_strength: "high", resolution_dependency: "API standardization", source_tag: "S9|S14"},
  {blocker_id: "BLK_CUSTOMER_PROFILE_ACCESS_NOT_APPROVED", function_id: "FUNC_RETRIEVE_CUSTOMER_PROFILE", block_strength: "high", resolution_dependency: "data access approval", source_tag: "S7|S13"},
  {blocker_id: "BLK_PRODUCT_ELIGIBILITY_FRAGMENTED", function_id: "FUNC_CHECK_PRODUCT_ELIGIBILITY", block_strength: "high", resolution_dependency: "rules standardization", source_tag: "DEMO"},
  {blocker_id: "BLK_CRM_LEAD_API_NOT_REUSABLE", function_id: "FUNC_CREATE_CRM_LEAD", block_strength: "high", resolution_dependency: "API standardization", source_tag: "S6|S14"},
  {blocker_id: "BLK_AUDIT_LOGGING_PATTERN_MISSING", function_id: "FUNC_LOG_INTERACTION", block_strength: "high", resolution_dependency: "control implementation", source_tag: "S2|S7|S13"},
  {blocker_id: "BLK_CONSENT_DATA_PRODUCT_INCOMPLETE", function_id: "FUNC_RETRIEVE_CONSENT_STATUS", block_strength: "high", resolution_dependency: "data product completion", source_tag: "S6|S13"},
  {blocker_id: "BLK_CUSTOMER_DATA_LINEAGE_INCOMPLETE", function_id: "FUNC_RETRIEVE_GOVERNED_CUSTOMER_DATA", block_strength: "high", resolution_dependency: "lineage evidence", source_tag: "S7|S13"},
  {blocker_id: "BLK_COMPLAINT_RETENTION_CONTROL_MISSING", function_id: "FUNC_RETRIEVE_COMPLAINT_HISTORY", block_strength: "medium", resolution_dependency: "control implementation", source_tag: "DEMO"},
  {blocker_id: "BLK_LOCAL_INTEGRATION_UNAVAILABLE", function_id: "FUNC_ESCALATE_TO_HUMAN", block_strength: "medium", resolution_dependency: "local integration", source_tag: "DEMO"},
  {blocker_id: "BLK_AICO_REVIEW_NOT_COMPLETED", function_id: "FUNC_APPLY_RESPONSE_GUARDRAILS", block_strength: "medium", resolution_dependency: "governance review", source_tag: "S2|S13"}
] AS row
MATCH (b:Blocker {id: row.blocker_id})
MATCH (f:ReusableFunction {id: row.function_id})
MERGE (b)-[r:BLOCKS_FUNCTION]->(f)
SET r.block_strength = row.block_strength,
    r.resolution_dependency = row.resolution_dependency,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_4";

// -----------------------------------------------------------------------------
// Blockers that prevent or limit shared tool servers.
// -----------------------------------------------------------------------------
UNWIND [
  {blocker_id: "BLK_KYC_API_NOT_STANDARDIZED", tool_server_id: "TOOL_KYC_STATUS", block_strength: "high", status: "in_progress", source_tag: "S9|S14"},
  {blocker_id: "BLK_CUSTOMER_PROFILE_ACCESS_NOT_APPROVED", tool_server_id: "TOOL_CUSTOMER_PROFILE", block_strength: "high", status: "in_progress", source_tag: "S7|S13"},
  {blocker_id: "BLK_PRODUCT_ELIGIBILITY_FRAGMENTED", tool_server_id: "TOOL_PRODUCT_ELIGIBILITY", block_strength: "high", status: "not_started", source_tag: "DEMO"},
  {blocker_id: "BLK_CRM_LEAD_API_NOT_REUSABLE", tool_server_id: "TOOL_CRM_LEAD", block_strength: "high", status: "in_progress", source_tag: "S6|S14"},
  {blocker_id: "BLK_AUDIT_LOGGING_PATTERN_MISSING", tool_server_id: "TOOL_AUDIT_LOGGING", block_strength: "high", status: "in_progress", source_tag: "S2|S7|S13"},
  {blocker_id: "BLK_CONSENT_DATA_PRODUCT_INCOMPLETE", tool_server_id: "TOOL_CONSENT_STATUS", block_strength: "high", status: "in_progress", source_tag: "S6|S13"},
  {blocker_id: "BLK_CUSTOMER_DATA_LINEAGE_INCOMPLETE", tool_server_id: "TOOL_GOVERNED_DATA_ACCESS", block_strength: "medium", status: "in_progress", source_tag: "S7|S13"},
  {blocker_id: "BLK_COMPLAINT_RETENTION_CONTROL_MISSING", tool_server_id: "TOOL_COMPLAINT_TRIAGE", block_strength: "medium", status: "not_started", source_tag: "DEMO"},
  {blocker_id: "BLK_LOCAL_INTEGRATION_UNAVAILABLE", tool_server_id: "TOOL_HUMAN_HANDOFF", block_strength: "medium", status: "not_started", source_tag: "DEMO"},
  {blocker_id: "BLK_AICO_REVIEW_NOT_COMPLETED", tool_server_id: "TOOL_RESPONSE_GUARDRAILS", block_strength: "medium", status: "in_progress", source_tag: "S2|S5|S13"}
] AS row
MATCH (b:Blocker {id: row.blocker_id})
MATCH (t:ToolServer {id: row.tool_server_id})
MERGE (b)-[r:BLOCKS_TOOL_SERVER]->(t)
SET r.block_strength = row.block_strength,
    r.status = row.status,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_4";

// -----------------------------------------------------------------------------
// Blockers that prevent governed data product readiness.
// -----------------------------------------------------------------------------
UNWIND [
  {blocker_id: "BLK_KYC_API_NOT_STANDARDIZED", data_product_id: "DP_KYC_STATUS", block_strength: "high", data_readiness_issue: "access", source_tag: "S9|S14"},
  {blocker_id: "BLK_CUSTOMER_PROFILE_ACCESS_NOT_APPROVED", data_product_id: "DP_CUSTOMER_360", block_strength: "high", data_readiness_issue: "access", source_tag: "S7|S13"},
  {blocker_id: "BLK_CONSENT_DATA_PRODUCT_INCOMPLETE", data_product_id: "DP_CONSENT_STATUS", block_strength: "high", data_readiness_issue: "coverage", source_tag: "S6|S13"},
  {blocker_id: "BLK_CUSTOMER_DATA_LINEAGE_INCOMPLETE", data_product_id: "DP_CUSTOMER_360", block_strength: "high", data_readiness_issue: "lineage", source_tag: "S7|S13"},
  {blocker_id: "BLK_COMPLAINT_RETENTION_CONTROL_MISSING", data_product_id: "DP_COMPLAINT_HISTORY", block_strength: "medium", data_readiness_issue: "ownership", source_tag: "DEMO"},
  {blocker_id: "BLK_AUDIT_LOGGING_PATTERN_MISSING", data_product_id: "DP_AUDIT_LOG_EVENTS", block_strength: "high", data_readiness_issue: "quality", source_tag: "S2|S7|S13"}
] AS row
MATCH (b:Blocker {id: row.blocker_id})
MATCH (dp:DataProduct {id: row.data_product_id})
MERGE (b)-[r:BLOCKS_DATA_PRODUCT]->(dp)
SET r.block_strength = row.block_strength,
    r.data_readiness_issue = row.data_readiness_issue,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_4";

// -----------------------------------------------------------------------------
// Blockers that prevent control implementation or evidence.
// -----------------------------------------------------------------------------
UNWIND [
  {blocker_id: "BLK_CUSTOMER_PROFILE_ACCESS_NOT_APPROVED", control_id: "CTRL_ROLE_BASED_ACCESS", block_strength: "high", evidence_status: "partial", source_tag: "S7|S13"},
  {blocker_id: "BLK_AUDIT_LOGGING_PATTERN_MISSING", control_id: "CTRL_AUDIT_LOGGING", block_strength: "high", evidence_status: "missing", source_tag: "S2|S7|S13"},
  {blocker_id: "BLK_CONSENT_DATA_PRODUCT_INCOMPLETE", control_id: "CTRL_CONSENT_CHECK", block_strength: "high", evidence_status: "partial", source_tag: "S6|S13"},
  {blocker_id: "BLK_CUSTOMER_DATA_LINEAGE_INCOMPLETE", control_id: "CTRL_DATA_LINEAGE", block_strength: "high", evidence_status: "partial", source_tag: "S7|S13"},
  {blocker_id: "BLK_COMPLAINT_RETENTION_CONTROL_MISSING", control_id: "CTRL_GDPR_PRIVACY_REVIEW", block_strength: "medium", evidence_status: "missing", source_tag: "DEMO"},
  {blocker_id: "BLK_AICO_REVIEW_NOT_COMPLETED", control_id: "CTRL_AICO_REVIEW", block_strength: "high", evidence_status: "missing", source_tag: "S2|S13"}
] AS row
MATCH (b:Blocker {id: row.blocker_id})
MATCH (c:Control {id: row.control_id})
MERGE (b)-[r:BLOCKS_CONTROL]->(c)
SET r.block_strength = row.block_strength,
    r.evidence_status = row.evidence_status,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_4";

// -----------------------------------------------------------------------------
// Blockers mapped to downstream strategic and operational KPIs.
// -----------------------------------------------------------------------------
UNWIND [
  {blocker_id: "BLK_KYC_API_NOT_STANDARDIZED", kpi_id: "KPI_DIGITAL_NTB_CUSTOMERS", impact_type: "reduced_conversion", impact_strength: "high"},
  {blocker_id: "BLK_KYC_API_NOT_STANDARDIZED", kpi_id: "KPI_ONBOARDING_COMPLETION_RATE", impact_type: "delay", impact_strength: "high"},
  {blocker_id: "BLK_KYC_API_NOT_STANDARDIZED", kpi_id: "KPI_API_REUSE_RATE", impact_type: "blocked_scale", impact_strength: "medium"},

  {blocker_id: "BLK_CUSTOMER_PROFILE_ACCESS_NOT_APPROVED", kpi_id: "KPI_SELF_SERVICE_CONTAINMENT", impact_type: "blocked_scale", impact_strength: "high"},
  {blocker_id: "BLK_CUSTOMER_PROFILE_ACCESS_NOT_APPROVED", kpi_id: "KPI_LEAD_CONVERSION_RATE", impact_type: "reduced_conversion", impact_strength: "high"},

  {blocker_id: "BLK_PRODUCT_ELIGIBILITY_FRAGMENTED", kpi_id: "KPI_OFFER_ACCEPTANCE_RATE", impact_type: "reduced_conversion", impact_strength: "high"},
  {blocker_id: "BLK_PRODUCT_ELIGIBILITY_FRAGMENTED", kpi_id: "KPI_LEAD_CONVERSION_RATE", impact_type: "reduced_conversion", impact_strength: "high"},

  {blocker_id: "BLK_CRM_LEAD_API_NOT_REUSABLE", kpi_id: "KPI_LEAD_CONVERSION_RATE", impact_type: "reduced_conversion", impact_strength: "high"},
  {blocker_id: "BLK_CRM_LEAD_API_NOT_REUSABLE", kpi_id: "KPI_API_REUSE_RATE", impact_type: "blocked_scale", impact_strength: "medium"},

  {blocker_id: "BLK_AUDIT_LOGGING_PATTERN_MISSING", kpi_id: "KPI_GOVERNANCE_REVIEW_CYCLE_TIME", impact_type: "delay", impact_strength: "medium"},
  {blocker_id: "BLK_AUDIT_LOGGING_PATTERN_MISSING", kpi_id: "KPI_REUSE_BLUEPRINT_ADOPTION", impact_type: "blocked_scale", impact_strength: "high"},

  {blocker_id: "BLK_CONSENT_DATA_PRODUCT_INCOMPLETE", kpi_id: "KPI_OFFER_ACCEPTANCE_RATE", impact_type: "reduced_conversion", impact_strength: "high"},
  {blocker_id: "BLK_CONSENT_DATA_PRODUCT_INCOMPLETE", kpi_id: "KPI_GOVERNANCE_REVIEW_CYCLE_TIME", impact_type: "risk", impact_strength: "medium"},

  {blocker_id: "BLK_CUSTOMER_DATA_LINEAGE_INCOMPLETE", kpi_id: "KPI_GOVERNANCE_REVIEW_CYCLE_TIME", impact_type: "delay", impact_strength: "high"},
  {blocker_id: "BLK_CUSTOMER_DATA_LINEAGE_INCOMPLETE", kpi_id: "KPI_REUSE_BLUEPRINT_ADOPTION", impact_type: "blocked_scale", impact_strength: "medium"},

  {blocker_id: "BLK_COMPLAINT_RETENTION_CONTROL_MISSING", kpi_id: "KPI_COMPLAINT_RESOLUTION_TIME", impact_type: "delay", impact_strength: "medium"},
  {blocker_id: "BLK_COMPLAINT_RETENTION_CONTROL_MISSING", kpi_id: "KPI_GOVERNANCE_REVIEW_CYCLE_TIME", impact_type: "risk", impact_strength: "medium"},

  {blocker_id: "BLK_LOCAL_INTEGRATION_UNAVAILABLE", kpi_id: "KPI_SELF_SERVICE_CONTAINMENT", impact_type: "blocked_scale", impact_strength: "medium"},
  {blocker_id: "BLK_LOCAL_INTEGRATION_UNAVAILABLE", kpi_id: "KPI_REUSE_BLUEPRINT_ADOPTION", impact_type: "blocked_scale", impact_strength: "medium"},

  {blocker_id: "BLK_AICO_REVIEW_NOT_COMPLETED", kpi_id: "KPI_GOVERNANCE_REVIEW_CYCLE_TIME", impact_type: "delay", impact_strength: "high"},
  {blocker_id: "BLK_AICO_REVIEW_NOT_COMPLETED", kpi_id: "KPI_REUSE_BLUEPRINT_ADOPTION", impact_type: "blocked_scale", impact_strength: "medium"}
] AS row
MATCH (b:Blocker {id: row.blocker_id})
MATCH (k:KPI {id: row.kpi_id})
MERGE (b)-[r:AFFECTS_KPI]->(k)
SET r.impact_direction = "negative",
    r.impact_type = row.impact_type,
    r.impact_strength = row.impact_strength,
    r.created_for_story = "story_4";

// -----------------------------------------------------------------------------
// Blockers mapped to reusable blueprints affected by unresolved dependencies.
// -----------------------------------------------------------------------------
UNWIND [
  {blocker_id: "BLK_KYC_API_NOT_STANDARDIZED", blueprint_id: "BP_DIGITAL_ONBOARDING_ASSISTANT_BLUEPRINT", impact_level: "high", impact_rationale: "Onboarding blueprint cannot scale without a reusable KYC status service."},
  {blocker_id: "BLK_KYC_API_NOT_STANDARDIZED", blueprint_id: "BP_RETAIL_AGENT_TOOLING_BLUEPRINT", impact_level: "medium", impact_rationale: "Retail agent tooling reuse is limited where KYC context is needed."},

  {blocker_id: "BLK_CUSTOMER_PROFILE_ACCESS_NOT_APPROVED", blueprint_id: "BP_RETAIL_AGENT_TOOLING_BLUEPRINT", impact_level: "high", impact_rationale: "Agent tooling blueprint depends on approved customer profile access."},
  {blocker_id: "BLK_CUSTOMER_PROFILE_ACCESS_NOT_APPROVED", blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", impact_level: "medium", impact_rationale: "Customer-facing governance pattern needs approved data-access boundaries."},

  {blocker_id: "BLK_PRODUCT_ELIGIBILITY_FRAGMENTED", blueprint_id: "BP_RETAIL_AGENT_TOOLING_BLUEPRINT", impact_level: "high", impact_rationale: "Tooling blueprint cannot standardize product advice without reusable eligibility logic."},
  {blocker_id: "BLK_CRM_LEAD_API_NOT_REUSABLE", blueprint_id: "BP_RETAIL_AGENT_TOOLING_BLUEPRINT", impact_level: "high", impact_rationale: "Retail agent tooling blueprint is limited when CRM lead creation remains local."},

  {blocker_id: "BLK_AUDIT_LOGGING_PATTERN_MISSING", blueprint_id: "BP_RETAIL_AGENT_TOOLING_BLUEPRINT", impact_level: "high", impact_rationale: "Agent tooling blueprint requires standard audit logging for tool calls."},
  {blocker_id: "BLK_AUDIT_LOGGING_PATTERN_MISSING", blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", impact_level: "high", impact_rationale: "Customer-facing AI governance blueprint needs reusable audit evidence."},

  {blocker_id: "BLK_CONSENT_DATA_PRODUCT_INCOMPLETE", blueprint_id: "BP_RETAIL_AGENT_TOOLING_BLUEPRINT", impact_level: "medium", impact_rationale: "Retail agent tooling reuse is constrained where personalization requires consent checks."},
  {blocker_id: "BLK_CONSENT_DATA_PRODUCT_INCOMPLETE", blueprint_id: "BP_PERSONALIZED_OFFER_GOVERNANCE_BLUEPRINT", impact_level: "high", impact_rationale: "Personalized offer governance pattern depends on reusable consent status."},

  {blocker_id: "BLK_CUSTOMER_DATA_LINEAGE_INCOMPLETE", blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", impact_level: "high", impact_rationale: "Governance blueprint cannot scale customer-data AI without lineage evidence."},
  {blocker_id: "BLK_CUSTOMER_DATA_LINEAGE_INCOMPLETE", blueprint_id: "BP_PERSONALIZED_OFFER_GOVERNANCE_BLUEPRINT", impact_level: "medium", impact_rationale: "Personalized offer governance needs customer-data lineage for trusted segmentation."},

  {blocker_id: "BLK_COMPLAINT_RETENTION_CONTROL_MISSING", blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", impact_level: "medium", impact_rationale: "Customer-facing governance pattern must address complaint retention evidence for sensitive workflows."},

  {blocker_id: "BLK_LOCAL_INTEGRATION_UNAVAILABLE", blueprint_id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT_BLUEPRINT", impact_level: "medium", impact_rationale: "Conversational assistant blueprint reuse may require local channel and handoff integration."},

  {blocker_id: "BLK_AICO_REVIEW_NOT_COMPLETED", blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", impact_level: "high", impact_rationale: "Customer-facing governance blueprint cannot demonstrate reusable approval without AICO review completion."},
  {blocker_id: "BLK_AICO_REVIEW_NOT_COMPLETED", blueprint_id: "BP_PERSONALIZED_OFFER_GOVERNANCE_BLUEPRINT", impact_level: "medium", impact_rationale: "Personalized offer governance pattern needs review evidence before reuse."}
] AS row
MATCH (b:Blocker {id: row.blocker_id})
MATCH (bp:Blueprint {id: row.blueprint_id})
MERGE (b)-[r:AFFECTS_BLUEPRINT]->(bp)
SET r.impact_level = row.impact_level,
    r.impact_rationale = row.impact_rationale,
    r.created_for_story = "story_4";

// -----------------------------------------------------------------------------
// Sparse, plausible blocker ownership for prioritization and remediation.
// -----------------------------------------------------------------------------
UNWIND [
  {blocker_id: "BLK_KYC_API_NOT_STANDARDIZED", org_unit_id: "ORG_CIO_API_TEAM", ownership_type: "technical_owner", primary_owner: true},
  {blocker_id: "BLK_CUSTOMER_PROFILE_ACCESS_NOT_APPROVED", org_unit_id: "ORG_DATA_OFFICE", ownership_type: "data_owner", primary_owner: true},
  {blocker_id: "BLK_PRODUCT_ELIGIBILITY_FRAGMENTED", org_unit_id: "ORG_RETAIL_RISK", ownership_type: "business_owner", primary_owner: true},
  {blocker_id: "BLK_CRM_LEAD_API_NOT_REUSABLE", org_unit_id: "ORG_CRM_CVM_TEAM", ownership_type: "business_owner", primary_owner: true},
  {blocker_id: "BLK_CONSENT_DATA_PRODUCT_INCOMPLETE", org_unit_id: "ORG_DATA_OFFICE", ownership_type: "data_owner", primary_owner: true},
  {blocker_id: "BLK_AUDIT_LOGGING_PATTERN_MISSING", org_unit_id: "ORG_CIO_API_TEAM", ownership_type: "technical_owner", primary_owner: true},
  {blocker_id: "BLK_CUSTOMER_DATA_LINEAGE_INCOMPLETE", org_unit_id: "ORG_DATA_OFFICE", ownership_type: "data_owner", primary_owner: true},
  {blocker_id: "BLK_COMPLAINT_RETENTION_CONTROL_MISSING", org_unit_id: "ORG_CONTACT_CENTER_OPS", ownership_type: "business_owner", primary_owner: true},
  {blocker_id: "BLK_LOCAL_INTEGRATION_UNAVAILABLE", org_unit_id: "ORG_CIO_API_TEAM", ownership_type: "technical_owner", primary_owner: true},
  {blocker_id: "BLK_AICO_REVIEW_NOT_COMPLETED", org_unit_id: "ORG_AICO", ownership_type: "governance_owner", primary_owner: true}
] AS row
MATCH (b:Blocker {id: row.blocker_id})
MATCH (o:OrgUnit {id: row.org_unit_id})
MERGE (b)-[r:OWNED_BY]->(o)
SET r.ownership_type = row.ownership_type,
    r.primary_owner = row.primary_owner,
    r.created_for_story = "story_4";
