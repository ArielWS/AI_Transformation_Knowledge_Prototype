// Story 3: Governance gap by analogy relationships.
// Scope: risk triggers, implied/required controls, completed/missing controls,
// ownership/review accountability, and reusable governance blueprints only.

// -----------------------------------------------------------------------------
// Use case risk triggers for governance comparison.
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_PERSONALIZED_OFFER_ENGINE", risk_id: "RISK_PERSONAL_DATA_USE", trigger_strength: "high", evidence_status: "assumed", source_tag: "S6|S13"},
  {use_case_id: "UC_PERSONALIZED_OFFER_ENGINE", risk_id: "RISK_MARKETING_CONSENT", trigger_strength: "high", evidence_status: "assumed", source_tag: "S6|S13"},
  {use_case_id: "UC_PERSONALIZED_OFFER_ENGINE", risk_id: "RISK_INFLUENCES_PRODUCT_CHOICE", trigger_strength: "high", evidence_status: "assumed", source_tag: "S6|S13"},

  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", risk_id: "RISK_PERSONAL_DATA_USE", trigger_strength: "high", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", risk_id: "RISK_MARKETING_CONSENT", trigger_strength: "medium", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", risk_id: "RISK_INFLUENCES_PRODUCT_CHOICE", trigger_strength: "high", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", risk_id: "RISK_CUSTOMER_FACING_GENAI", trigger_strength: "medium", evidence_status: "hypothetical_demo", source_tag: "DEMO"},

  {use_case_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER", risk_id: "RISK_PERSONAL_DATA_USE", trigger_strength: "high", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER", risk_id: "RISK_CREDIT_AFFORDABILITY", trigger_strength: "high", evidence_status: "hypothetical_demo", source_tag: "DEMO"},

  {use_case_id: "UC_CREDIT_PREAPPROVAL_ASSISTANT", risk_id: "RISK_PERSONAL_DATA_USE", trigger_strength: "high", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_CREDIT_PREAPPROVAL_ASSISTANT", risk_id: "RISK_CREDIT_AFFORDABILITY", trigger_strength: "high", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_CREDIT_PREAPPROVAL_ASSISTANT", risk_id: "RISK_AUTHENTICATED_CHANNEL", trigger_strength: "medium", evidence_status: "hypothetical_demo", source_tag: "DEMO"},

  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", risk_id: "RISK_CUSTOMER_FACING_GENAI", trigger_strength: "high", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", risk_id: "RISK_AUTHENTICATED_CHANNEL", trigger_strength: "high", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", risk_id: "RISK_PERSONAL_DATA_USE", trigger_strength: "high", evidence_status: "hypothetical_demo", source_tag: "DEMO"},

  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", risk_id: "RISK_PERSONAL_DATA_USE", trigger_strength: "high", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", risk_id: "RISK_COMPLAINT_HANDLING", trigger_strength: "high", evidence_status: "hypothetical_demo", source_tag: "DEMO"},

  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", risk_id: "RISK_PERSONAL_DATA_USE", trigger_strength: "high", evidence_status: "assumed", source_tag: "S6|S13"},
  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", risk_id: "RISK_MARKETING_CONSENT", trigger_strength: "high", evidence_status: "assumed", source_tag: "S6|S13"},

  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", risk_id: "RISK_PERSONAL_DATA_USE", trigger_strength: "high", evidence_status: "assumed", source_tag: "S7|S13"},
  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", risk_id: "RISK_AUTHENTICATED_CHANNEL", trigger_strength: "medium", evidence_status: "assumed", source_tag: "S7|S13"},

  {use_case_id: "UC_AUDIT_READY_AGENT_WORKFLOW", risk_id: "RISK_WRITE_ACTION", trigger_strength: "high", evidence_status: "assumed", source_tag: "S2|S13"},
  {use_case_id: "UC_AUDIT_READY_AGENT_WORKFLOW", risk_id: "RISK_AUTHENTICATED_CHANNEL", trigger_strength: "high", evidence_status: "assumed", source_tag: "S2|S13"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (rt:RiskTrigger {id: row.risk_id})
MERGE (u)-[r:HAS_RISK_TRIGGER]->(rt)
SET r.trigger_strength = row.trigger_strength,
    r.evidence_status = row.evidence_status,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_3";

// -----------------------------------------------------------------------------
// Risk triggers imply expected controls.
// -----------------------------------------------------------------------------
UNWIND [
  {risk_id: "RISK_PERSONAL_DATA_USE", control_id: "CTRL_GDPR_PRIVACY_REVIEW", requirement_strength: "mandatory", rationale: "Personal data use requires privacy review before AI-assisted customer or staff workflows scale.", source_tag: "S2|S13"},
  {risk_id: "RISK_PERSONAL_DATA_USE", control_id: "CTRL_ROLE_BASED_ACCESS", requirement_strength: "recommended", rationale: "Personal data access should be limited to approved roles and channels.", source_tag: "S13"},

  {risk_id: "RISK_MARKETING_CONSENT", control_id: "CTRL_CONSENT_CHECK", requirement_strength: "mandatory", rationale: "Personalization and marketing outreach depend on consent checks.", source_tag: "S6|S13"},
  {risk_id: "RISK_MARKETING_CONSENT", control_id: "CTRL_FAIRNESS_BIAS_REVIEW", requirement_strength: "recommended", rationale: "Personalized offers should be reviewed for biased customer targeting or exclusion.", source_tag: "S13"},

  {risk_id: "RISK_INFLUENCES_PRODUCT_CHOICE", control_id: "CTRL_EXPLAINABILITY", requirement_strength: "mandatory", rationale: "Product recommendation influence needs an understandable recommendation rationale.", source_tag: "S13"},
  {risk_id: "RISK_INFLUENCES_PRODUCT_CHOICE", control_id: "CTRL_FAIRNESS_BIAS_REVIEW", requirement_strength: "mandatory", rationale: "Recommendations should be checked for unfair product steering or customer segmentation bias.", source_tag: "S13"},
  {risk_id: "RISK_INFLUENCES_PRODUCT_CHOICE", control_id: "CTRL_AICO_REVIEW", requirement_strength: "recommended", rationale: "Recommendation-impacting use cases are candidates for AI governance review.", source_tag: "S2|S13"},

  {risk_id: "RISK_CREDIT_AFFORDABILITY", control_id: "CTRL_AICOE_TECH_REVIEW", requirement_strength: "mandatory", rationale: "Credit-adjacent recommenders need technical AI review in lieu of a separate model-validation node in v1.", source_tag: "S13|DEMO"},
  {risk_id: "RISK_CREDIT_AFFORDABILITY", control_id: "CTRL_EXPLAINABILITY", requirement_strength: "mandatory", rationale: "Affordability-sensitive recommendations need explainable outputs for advisor or customer challenge.", source_tag: "S13|DEMO"},
  {risk_id: "RISK_CREDIT_AFFORDABILITY", control_id: "CTRL_AICO_REVIEW", requirement_strength: "recommended", rationale: "Credit-adjacent AI should be visible to the AI governance process.", source_tag: "S2|S13"},

  {risk_id: "RISK_CUSTOMER_FACING_GENAI", control_id: "CTRL_CONTENT_SAFETY", requirement_strength: "mandatory", rationale: "Customer-facing GenAI output needs safety checks.", source_tag: "S5|S13"},
  {risk_id: "RISK_CUSTOMER_FACING_GENAI", control_id: "CTRL_OUTPUT_GROUNDING", requirement_strength: "mandatory", rationale: "Customer-facing GenAI output should be grounded in approved knowledge.", source_tag: "S5|S13"},

  {risk_id: "RISK_AUTHENTICATED_CHANNEL", control_id: "CTRL_ROLE_BASED_ACCESS", requirement_strength: "mandatory", rationale: "Authenticated banking journeys require role and access boundaries.", source_tag: "S13"},
  {risk_id: "RISK_AUTHENTICATED_CHANNEL", control_id: "CTRL_AUDIT_LOGGING", requirement_strength: "mandatory", rationale: "Authenticated banking interactions need traceable logs for audit readiness.", source_tag: "S2|S7|S13"},

  {risk_id: "RISK_COMPLAINT_HANDLING", control_id: "CTRL_GDPR_PRIVACY_REVIEW", requirement_strength: "mandatory", rationale: "Complaint workflows often contain sensitive customer data and response evidence.", source_tag: "S13|DEMO"},
  {risk_id: "RISK_COMPLAINT_HANDLING", control_id: "CTRL_HUMAN_HANDOFF", requirement_strength: "recommended", rationale: "Sensitive complaint decisions should keep a clear escalation path to operations staff.", source_tag: "DEMO"},

  {risk_id: "RISK_WRITE_ACTION", control_id: "CTRL_AUDIT_LOGGING", requirement_strength: "mandatory", rationale: "Agentic write actions need traceable interaction and tool-call logs.", source_tag: "S2|S13"},
  {risk_id: "RISK_WRITE_ACTION", control_id: "CTRL_ROLE_BASED_ACCESS", requirement_strength: "mandatory", rationale: "Write-capable agent workflows need access controls around permitted actions.", source_tag: "S13"}
] AS row
MATCH (rt:RiskTrigger {id: row.risk_id})
MATCH (c:Control {id: row.control_id})
MERGE (rt)-[r:IMPLIES_CONTROL]->(c)
SET r.requirement_strength = row.requirement_strength,
    r.rationale = row.rationale,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_3";

// -----------------------------------------------------------------------------
// Completed controls create reviewed anchor cases.
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_PERSONALIZED_OFFER_ENGINE", control_id: "CTRL_GDPR_PRIVACY_REVIEW", completion_status: "complete", evidence_status: "documented", source_tag: "S6|S13"},
  {use_case_id: "UC_PERSONALIZED_OFFER_ENGINE", control_id: "CTRL_FAIRNESS_BIAS_REVIEW", completion_status: "complete", evidence_status: "documented", source_tag: "S6|S13"},
  {use_case_id: "UC_PERSONALIZED_OFFER_ENGINE", control_id: "CTRL_EXPLAINABILITY", completion_status: "complete", evidence_status: "documented", source_tag: "S6|S13"},
  {use_case_id: "UC_PERSONALIZED_OFFER_ENGINE", control_id: "CTRL_CONSENT_CHECK", completion_status: "complete", evidence_status: "documented", source_tag: "S6|S13"},

  {use_case_id: "UC_CREDIT_PREAPPROVAL_ASSISTANT", control_id: "CTRL_AICOE_TECH_REVIEW", completion_status: "partial", evidence_status: "assumed_demo", source_tag: "DEMO"},
  {use_case_id: "UC_CREDIT_PREAPPROVAL_ASSISTANT", control_id: "CTRL_EXPLAINABILITY", completion_status: "complete", evidence_status: "assumed_demo", source_tag: "DEMO"},
  {use_case_id: "UC_CREDIT_PREAPPROVAL_ASSISTANT", control_id: "CTRL_ROLE_BASED_ACCESS", completion_status: "complete", evidence_status: "assumed_demo", source_tag: "DEMO"},
  {use_case_id: "UC_CREDIT_PREAPPROVAL_ASSISTANT", control_id: "CTRL_AICO_REVIEW", completion_status: "partial", evidence_status: "assumed_demo", source_tag: "DEMO"},

  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", control_id: "CTRL_CONTENT_SAFETY", completion_status: "partial", evidence_status: "assumed_demo", source_tag: "DEMO"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", control_id: "CTRL_OUTPUT_GROUNDING", completion_status: "partial", evidence_status: "assumed_demo", source_tag: "DEMO"},

  {use_case_id: "UC_AUDIT_READY_AGENT_WORKFLOW", control_id: "CTRL_AUDIT_LOGGING", completion_status: "complete", evidence_status: "documented", source_tag: "S2|S13"},
  {use_case_id: "UC_AUDIT_READY_AGENT_WORKFLOW", control_id: "CTRL_ROLE_BASED_ACCESS", completion_status: "complete", evidence_status: "documented", source_tag: "S13"},
  {use_case_id: "UC_AUDIT_READY_AGENT_WORKFLOW", control_id: "CTRL_DATA_LINEAGE", completion_status: "partial", evidence_status: "documented", source_tag: "S7|S13"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (c:Control {id: row.control_id})
MERGE (u)-[r:HAS_COMPLETED_CONTROL]->(c)
SET r.completion_status = row.completion_status,
    r.evidence_status = row.evidence_status,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_3";

// -----------------------------------------------------------------------------
// Missing controls highlight governance gaps by analogy.
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", control_id: "CTRL_GDPR_PRIVACY_REVIEW", gap_severity: "high", reason: "Similar offer personalization anchor has privacy review, but this recommendation assistant lacks evidence.", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", control_id: "CTRL_FAIRNESS_BIAS_REVIEW", gap_severity: "high", reason: "Shared recommendation and personalization triggers imply fairness review before scaling.", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", control_id: "CTRL_EXPLAINABILITY", gap_severity: "medium", reason: "Product-choice influence needs a clear customer or advisor explanation.", evidence_status: "hypothetical_demo", source_tag: "DEMO"},

  {use_case_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER", control_id: "CTRL_AICOE_TECH_REVIEW", gap_severity: "high", reason: "Credit pre-approval anchor has technical AI review, but affordability recommender lacks comparable evidence.", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER", control_id: "CTRL_EXPLAINABILITY", gap_severity: "high", reason: "Affordability-sensitive recommendation needs explainable output before advisor reliance.", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER", control_id: "CTRL_DATA_LINEAGE", gap_severity: "medium", reason: "Credit-adjacent inputs need lineage evidence for governed use.", evidence_status: "hypothetical_demo", source_tag: "DEMO"},

  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", control_id: "CTRL_AUDIT_LOGGING", gap_severity: "high", reason: "Authenticated customer interactions need audit logging in addition to output controls.", evidence_status: "hypothetical_demo", source_tag: "DEMO"},

  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", control_id: "CTRL_GDPR_PRIVACY_REVIEW", gap_severity: "high", reason: "Complaint content contains personal data and response evidence requiring privacy review.", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", control_id: "CTRL_HUMAN_HANDOFF", gap_severity: "medium", reason: "Sensitive complaint triage needs an escalation path for uncertain or high-impact cases.", evidence_status: "hypothetical_demo", source_tag: "DEMO"},

  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", control_id: "CTRL_CONSENT_CHECK", gap_severity: "high", reason: "Consent dependency is central to campaign action but completion evidence is intentionally absent for the demo gap.", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", control_id: "CTRL_FAIRNESS_BIAS_REVIEW", gap_severity: "medium", reason: "Campaign targeting should be reviewed for biased inclusion or exclusion patterns.", evidence_status: "hypothetical_demo", source_tag: "DEMO"},

  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", control_id: "CTRL_DATA_LINEAGE", gap_severity: "high", reason: "Customer insight exploration depends on governed data lineage evidence.", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", control_id: "CTRL_ROLE_BASED_ACCESS", gap_severity: "high", reason: "Internal customer insight access should be restricted by role.", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", control_id: "CTRL_AICOE_TECH_REVIEW", gap_severity: "medium", reason: "Staff reliance on AI-generated customer insights needs technical review evidence.", evidence_status: "hypothetical_demo", source_tag: "DEMO"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (c:Control {id: row.control_id})
MERGE (u)-[r:MISSING_CONTROL]->(c)
SET r.gap_severity = row.gap_severity,
    r.reason = row.reason,
    r.evidence_status = row.evidence_status,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_3";

// -----------------------------------------------------------------------------
// Selected required controls explain expected governance without mirroring every implication.
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", control_id: "CTRL_GDPR_PRIVACY_REVIEW", requirement_level: "mandatory", source: "risk_trigger"},
  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", control_id: "CTRL_FAIRNESS_BIAS_REVIEW", requirement_level: "mandatory", source: "risk_trigger"},
  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", control_id: "CTRL_EXPLAINABILITY", requirement_level: "mandatory", source: "risk_trigger"},

  {use_case_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER", control_id: "CTRL_AICOE_TECH_REVIEW", requirement_level: "mandatory", source: "demo_rule"},
  {use_case_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER", control_id: "CTRL_EXPLAINABILITY", requirement_level: "mandatory", source: "risk_trigger"},
  {use_case_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER", control_id: "CTRL_ROLE_BASED_ACCESS", requirement_level: "recommended", source: "architecture"},

  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", control_id: "CTRL_GDPR_PRIVACY_REVIEW", requirement_level: "mandatory", source: "risk_trigger"},
  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", control_id: "CTRL_HUMAN_HANDOFF", requirement_level: "recommended", source: "demo_rule"},
  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", control_id: "CTRL_AICO_REVIEW", requirement_level: "recommended", source: "policy"},

  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", control_id: "CTRL_ROLE_BASED_ACCESS", requirement_level: "mandatory", source: "architecture"},
  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", control_id: "CTRL_AICOE_TECH_REVIEW", requirement_level: "recommended", source: "demo_rule"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (c:Control {id: row.control_id})
MERGE (u)-[r:REQUIRES_CONTROL]->(c)
SET r.requirement_level = row.requirement_level,
    r.source = row.source,
    r.created_for_story = "story_3";

// -----------------------------------------------------------------------------
// Sparse ownership and review accountability for governance follow-up.
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_PERSONALIZED_OFFER_ENGINE", org_unit_id: "ORG_CRM_CVM_TEAM", ownership_type: "business_owner", primary_owner: true},
  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", org_unit_id: "ORG_RETAIL_DIGITAL", ownership_type: "business_owner", primary_owner: true},
  {use_case_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER", org_unit_id: "ORG_RETAIL_RISK", ownership_type: "business_owner", primary_owner: true},
  {use_case_id: "UC_CREDIT_PREAPPROVAL_ASSISTANT", org_unit_id: "ORG_RETAIL_RISK", ownership_type: "business_owner", primary_owner: true},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", org_unit_id: "ORG_RETAIL_DIGITAL", ownership_type: "business_owner", primary_owner: true},
  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", org_unit_id: "ORG_CONTACT_CENTER_OPS", ownership_type: "business_owner", primary_owner: true},
  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", org_unit_id: "ORG_CRM_CVM_TEAM", ownership_type: "business_owner", primary_owner: true},
  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", org_unit_id: "ORG_DATA_OFFICE", ownership_type: "data_owner", primary_owner: true}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (o:OrgUnit {id: row.org_unit_id})
MERGE (u)-[r:OWNED_BY]->(o)
SET r.ownership_type = row.ownership_type,
    r.primary_owner = row.primary_owner,
    r.created_for_story = "story_3";

UNWIND [
  {use_case_id: "UC_PERSONALIZED_OFFER_ENGINE", org_unit_id: "ORG_AICO", review_type: "AICO", review_status: "reviewed"},
  {use_case_id: "UC_PERSONALIZED_OFFER_ENGINE", org_unit_id: "ORG_LEGAL_COMPLIANCE", review_type: "GDPR", review_status: "reviewed"},

  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", org_unit_id: "ORG_AICO", review_type: "AICO", review_status: "missing_evidence"},
  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", org_unit_id: "ORG_LEGAL_COMPLIANCE", review_type: "GDPR", review_status: "missing_evidence"},

  {use_case_id: "UC_CREDIT_PREAPPROVAL_ASSISTANT", org_unit_id: "ORG_AICOE", review_type: "model_risk", review_status: "reviewed"},
  {use_case_id: "UC_CREDIT_PREAPPROVAL_ASSISTANT", org_unit_id: "ORG_AICO", review_type: "AICO", review_status: "in_review"},

  {use_case_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER", org_unit_id: "ORG_AICOE", review_type: "model_risk", review_status: "missing_evidence"},
  {use_case_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER", org_unit_id: "ORG_AICO", review_type: "AICO", review_status: "missing_evidence"},

  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", org_unit_id: "ORG_AICOE", review_type: "AICoE", review_status: "in_review"},

  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", org_unit_id: "ORG_LEGAL_COMPLIANCE", review_type: "GDPR", review_status: "in_review"},
  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", org_unit_id: "ORG_DATA_OFFICE", review_type: "business", review_status: "not_started"},

  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", org_unit_id: "ORG_LEGAL_COMPLIANCE", review_type: "GDPR", review_status: "in_review"},

  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", org_unit_id: "ORG_DATA_OFFICE", review_type: "business", review_status: "in_review"},
  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", org_unit_id: "ORG_AICOE", review_type: "AICoE", review_status: "missing_evidence"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (o:OrgUnit {id: row.org_unit_id})
MERGE (u)-[r:REVIEWED_BY]->(o)
SET r.review_type = row.review_type,
    r.review_status = row.review_status,
    r.created_for_story = "story_3";

// -----------------------------------------------------------------------------
// Governance blueprint candidates.
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", fit_strength: "high", rationale: "Customer-facing recommendation with personal data and product-choice triggers needs the reusable AI governance pattern.", evidence_status: "hypothetical_demo"},
  {use_case_id: "UC_LOAN_AFFORDABILITY_RECOMMENDER", blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", fit_strength: "medium", rationale: "Credit-adjacent recommendation can reuse the common customer-impact controls with additional technical review.", evidence_status: "hypothetical_demo"},
  {use_case_id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT", blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", fit_strength: "high", rationale: "Authenticated customer-facing GenAI needs output, access, and audit controls from the governance pattern.", evidence_status: "hypothetical_demo"},
  {use_case_id: "UC_COMPLAINT_TRIAGE_ASSISTANT", blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", fit_strength: "medium", rationale: "Complaint triage shares customer-impact and personal-data controls with customer-facing AI use cases.", evidence_status: "hypothetical_demo"},
  {use_case_id: "UC_CUSTOMER_360_INSIGHT_COPILOT", blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", fit_strength: "medium", rationale: "Internal customer insight use case can reuse data, access, and review controls from the same pattern.", evidence_status: "inferred"},

  {use_case_id: "UC_PERSONALIZED_OFFER_ENGINE", blueprint_id: "BP_PERSONALIZED_OFFER_GOVERNANCE_BLUEPRINT", fit_strength: "high", rationale: "Anchor case for personalization controls covering consent, fairness, explainability, and privacy review.", evidence_status: "inferred"},
  {use_case_id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT", blueprint_id: "BP_PERSONALIZED_OFFER_GOVERNANCE_BLUEPRINT", fit_strength: "high", rationale: "Recommendation assistant has analogous product-choice and personal-data triggers to the personalized offer engine.", evidence_status: "hypothetical_demo"},
  {use_case_id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT", blueprint_id: "BP_PERSONALIZED_OFFER_GOVERNANCE_BLUEPRINT", fit_strength: "high", rationale: "Campaign agent depends on consent and personalization controls central to the offer governance blueprint.", evidence_status: "inferred"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (bp:Blueprint {id: row.blueprint_id})
MERGE (u)-[r:CANDIDATE_FOR]->(bp)
SET r.fit_strength = row.fit_strength,
    r.rationale = row.rationale,
    r.evidence_status = row.evidence_status,
    r.source_tag = CASE row.evidence_status WHEN "hypothetical_demo" THEN "DEMO" ELSE "S2|S13" END,
    r.created_for_story = "story_3";

// -----------------------------------------------------------------------------
// Governance blueprints include only control patterns in Story 3.
// -----------------------------------------------------------------------------
UNWIND [
  {blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", control_id: "CTRL_GDPR_PRIVACY_REVIEW", control_role: "mandatory", applies_to_variant: "all"},
  {blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", control_id: "CTRL_CONTENT_SAFETY", control_role: "mandatory", applies_to_variant: "customer_facing"},
  {blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", control_id: "CTRL_OUTPUT_GROUNDING", control_role: "mandatory", applies_to_variant: "customer_facing"},
  {blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", control_id: "CTRL_AUDIT_LOGGING", control_role: "mandatory", applies_to_variant: "authenticated"},
  {blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", control_id: "CTRL_ROLE_BASED_ACCESS", control_role: "mandatory", applies_to_variant: "authenticated"},
  {blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", control_id: "CTRL_AICO_REVIEW", control_role: "recommended", applies_to_variant: "all"},
  {blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", control_id: "CTRL_AICOE_TECH_REVIEW", control_role: "recommended", applies_to_variant: "all"},
  {blueprint_id: "BP_CUSTOMER_FACING_AI_GOVERNANCE_BLUEPRINT", control_id: "CTRL_HUMAN_HANDOFF", control_role: "recommended", applies_to_variant: "customer_facing"},

  {blueprint_id: "BP_PERSONALIZED_OFFER_GOVERNANCE_BLUEPRINT", control_id: "CTRL_GDPR_PRIVACY_REVIEW", control_role: "mandatory", applies_to_variant: "customer_facing"},
  {blueprint_id: "BP_PERSONALIZED_OFFER_GOVERNANCE_BLUEPRINT", control_id: "CTRL_CONSENT_CHECK", control_role: "mandatory", applies_to_variant: "customer_facing"},
  {blueprint_id: "BP_PERSONALIZED_OFFER_GOVERNANCE_BLUEPRINT", control_id: "CTRL_FAIRNESS_BIAS_REVIEW", control_role: "mandatory", applies_to_variant: "customer_facing"},
  {blueprint_id: "BP_PERSONALIZED_OFFER_GOVERNANCE_BLUEPRINT", control_id: "CTRL_EXPLAINABILITY", control_role: "mandatory", applies_to_variant: "customer_facing"},
  {blueprint_id: "BP_PERSONALIZED_OFFER_GOVERNANCE_BLUEPRINT", control_id: "CTRL_AICO_REVIEW", control_role: "recommended", applies_to_variant: "customer_facing"}
] AS row
MATCH (bp:Blueprint {id: row.blueprint_id})
MATCH (c:Control {id: row.control_id})
MERGE (bp)-[r:INCLUDES_CONTROL]->(c)
SET r.control_role = row.control_role,
    r.applies_to_variant = row.applies_to_variant,
    r.created_for_story = "story_3";
