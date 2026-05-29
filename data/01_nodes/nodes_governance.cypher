// Governance risk trigger, control, and organizational unit nodes for the demo graph.
// Generated from data/00_registry/node_id_registry.csv; node relationships are intentionally excluded.

// RiskTrigger
MERGE (n:RiskTrigger {id: "RISK_CUSTOMER_FACING_GENAI"})
SET n.name = "Customer-facing GenAI",
    n.description = "GenAI output is exposed directly to customers",
    n.source_tag = "S2|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_3";

MERGE (n:RiskTrigger {id: "RISK_AUTHENTICATED_CHANNEL"})
SET n.name = "Authenticated channel",
    n.description = "Use case operates in authenticated banking channel",
    n.source_tag = "S2|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_3";

MERGE (n:RiskTrigger {id: "RISK_PERSONAL_DATA_USE"})
SET n.name = "Uses personal data",
    n.description = "Use case processes customer personal data",
    n.source_tag = "S2|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_3";

MERGE (n:RiskTrigger {id: "RISK_INFLUENCES_PRODUCT_CHOICE"})
SET n.name = "Influences product recommendation",
    n.description = "Use case may influence product selection or recommendation",
    n.source_tag = "S2|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";

MERGE (n:RiskTrigger {id: "RISK_CREDIT_AFFORDABILITY"})
SET n.name = "Credit affordability sensitivity",
    n.description = "Use case involves affordability or credit-sensitive decision support",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";

MERGE (n:RiskTrigger {id: "RISK_WRITE_ACTION"})
SET n.name = "Performs write action",
    n.description = "Agent can trigger workflow write actions or CRM updates",
    n.source_tag = "S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:RiskTrigger {id: "RISK_COMPLAINT_HANDLING"})
SET n.name = "Complaint handling impact",
    n.description = "Use case affects complaint routing response or evidence handling",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";

MERGE (n:RiskTrigger {id: "RISK_MARKETING_CONSENT"})
SET n.name = "Marketing consent dependency",
    n.description = "Use case depends on consent for personalization or marketing outreach",
    n.source_tag = "S6|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";


// Control
MERGE (n:Control {id: "CTRL_CONTENT_SAFETY"})
SET n.name = "Content safety",
    n.description = "Control for harmful or inappropriate model output",
    n.source_tag = "S5",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_1|story_3";

MERGE (n:Control {id: "CTRL_OUTPUT_GROUNDING"})
SET n.name = "Output grounding",
    n.description = "Control requiring responses grounded in approved sources",
    n.source_tag = "S5",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_3";

MERGE (n:Control {id: "CTRL_HUMAN_HANDOFF"})
SET n.name = "Human handoff",
    n.description = "Control requiring clear escalation to human staff",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_4";

MERGE (n:Control {id: "CTRL_AUDIT_LOGGING"})
SET n.name = "Audit logging",
    n.description = "Control requiring logging of interactions decisions and tool calls",
    n.source_tag = "S2|S7|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:Control {id: "CTRL_GDPR_PRIVACY_REVIEW"})
SET n.name = "GDPR privacy review",
    n.description = "Privacy review for personal data usage in AI use cases",
    n.source_tag = "S2|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";

MERGE (n:Control {id: "CTRL_AICO_REVIEW"})
SET n.name = "AICO review",
    n.description = "AI governance review through AICO-style governance process",
    n.source_tag = "S2|S13",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_3";

MERGE (n:Control {id: "CTRL_AICOE_TECH_REVIEW"})
SET n.name = "AICoE technical review",
    n.description = "Technical AI review through AICoE-style process",
    n.source_tag = "S2|S13",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_3";

MERGE (n:Control {id: "CTRL_FAIRNESS_BIAS_REVIEW"})
SET n.name = "Fairness bias review",
    n.description = "Control for fairness and bias risk in recommendations or credit support",
    n.source_tag = "S2|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";

MERGE (n:Control {id: "CTRL_EXPLAINABILITY"})
SET n.name = "Explainability",
    n.description = "Control requiring understandable recommendation rationale",
    n.source_tag = "S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";

MERGE (n:Control {id: "CTRL_ROLE_BASED_ACCESS"})
SET n.name = "Role-based access control",
    n.description = "Control limiting tool and data access to approved roles",
    n.source_tag = "S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:Control {id: "CTRL_DATA_LINEAGE"})
SET n.name = "Data lineage",
    n.description = "Control requiring lineage evidence for governed data products",
    n.source_tag = "S7|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:Control {id: "CTRL_CONSENT_CHECK"})
SET n.name = "Consent check",
    n.description = "Control requiring consent verification before personalization or marketing action",
    n.source_tag = "S6|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";


// OrgUnit
MERGE (n:OrgUnit {id: "ORG_AICO"})
SET n.name = "AICO",
    n.description = "AI governance body for use-case review and controls",
    n.source_tag = "S2|S13",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_3";

MERGE (n:OrgUnit {id: "ORG_AICOE"})
SET n.name = "AICoE",
    n.description = "AI center of excellence for technical AI review and enablement",
    n.source_tag = "S2|S13",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_3";

MERGE (n:OrgUnit {id: "ORG_RETAIL_DIGITAL"})
SET n.name = "Retail Digital",
    n.description = "Retail digital business owner for customer-facing AI journeys",
    n.source_tag = "S1",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "shared";

MERGE (n:OrgUnit {id: "ORG_CRM_CVM_TEAM"})
SET n.name = "CRM CVM Team",
    n.description = "Team owning CRM campaign and customer value management capabilities",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2";

MERGE (n:OrgUnit {id: "ORG_CIO_API_TEAM"})
SET n.name = "CIO API Team",
    n.description = "Technology team owning API standardization and service enablement",
    n.source_tag = "S14",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:OrgUnit {id: "ORG_DATA_OFFICE"})
SET n.name = "Data Office",
    n.description = "Data governance owner for data products lineage and access",
    n.source_tag = "S7|S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:OrgUnit {id: "ORG_RETAIL_RISK"})
SET n.name = "Retail Risk",
    n.description = "Risk owner for credit affordability and product recommendation controls",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";

MERGE (n:OrgUnit {id: "ORG_LEGAL_COMPLIANCE"})
SET n.name = "Legal Compliance",
    n.description = "Legal and compliance review owner for privacy and regulatory controls",
    n.source_tag = "S13",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";

MERGE (n:OrgUnit {id: "ORG_CONTACT_CENTER_OPS"})
SET n.name = "Contact Center Operations",
    n.description = "Operations team for contact center and complaint handling processes",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_4";
