// Reference nodes for network banks, markets, strategy pillars, user groups, channels, and business processes.
// Generated from data/00_registry/node_id_registry.csv; node relationships are intentionally excluded.

// NetworkBank
MERGE (n:NetworkBank {id: "BANK_RBI_GROUP"})
SET n.name = "RBI Group",
    n.description = "Group-level RBI organization and shared platform context",
    n.source_tag = "S1|S4",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "shared";

MERGE (n:NetworkBank {id: "BANK_TATRA"})
SET n.name = "Tatra banka",
    n.description = "Slovak network bank context for Adam TB and digital banking examples",
    n.source_tag = "S10|S12",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_1";

MERGE (n:NetworkBank {id: "BANK_RAIFFEISEN_KOSOVO"})
SET n.name = "Raiffeisen Bank Kosovo",
    n.description = "Kosovo network bank context for RAIA examples",
    n.source_tag = "S10|S11",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_1";

MERGE (n:NetworkBank {id: "BANK_RAIFFEISEN_BOSNIA"})
SET n.name = "Raiffeisen Bank Bosnia",
    n.description = "Bosnia network bank context for RAIA assistant examples",
    n.source_tag = "S10",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_1";

MERGE (n:NetworkBank {id: "BANK_RAIFFEISEN_CROATIA"})
SET n.name = "Raiffeisen Bank Croatia",
    n.description = "Croatian network bank context for assistant blueprint variant",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:NetworkBank {id: "BANK_RAIFFEISEN_AUSTRIA"})
SET n.name = "Raiffeisen Bank Austria",
    n.description = "Austria network bank context for voicebot and digital service variant",
    n.source_tag = "S3|S12",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:NetworkBank {id: "BANK_RAIFFEISEN_CZECH"})
SET n.name = "Raiffeisenbank Czech Republic",
    n.description = "Czech network bank context for voicebot or retail AI variant",
    n.source_tag = "S3",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:NetworkBank {id: "BANK_RAIFFEISEN_ROMANIA"})
SET n.name = "Raiffeisen Bank Romania",
    n.description = "Romania network bank context for digital banking examples",
    n.source_tag = "S12",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2";

MERGE (n:NetworkBank {id: "BANK_AI_LAB"})
SET n.name = "RBI Group AI Lab",
    n.description = "Group AI Lab context for multilingual assistant and applied AI examples",
    n.source_tag = "S8",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "shared";


// Market
MERGE (n:Market {id: "MKT_AT"})
SET n.name = "Austria",
    n.description = "Austrian and group headquarters market context",
    n.source_tag = "S3|S4",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "shared";

MERGE (n:Market {id: "MKT_SK"})
SET n.name = "Slovakia",
    n.description = "Slovak market for Tatra banka assistant examples",
    n.source_tag = "S10|S12",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_1";

MERGE (n:Market {id: "MKT_XK"})
SET n.name = "Kosovo",
    n.description = "Kosovo market for RAIA assistant examples",
    n.source_tag = "S10|S11",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_1";

MERGE (n:Market {id: "MKT_BA"})
SET n.name = "Bosnia and Herzegovina",
    n.description = "Bosnia market for RAIA assistant examples",
    n.source_tag = "S10",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_1";

MERGE (n:Market {id: "MKT_HR"})
SET n.name = "Croatia",
    n.description = "Croatian market for assistant blueprint variant",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:Market {id: "MKT_CZ"})
SET n.name = "Czech Republic",
    n.description = "Czech market for voicebot variant",
    n.source_tag = "S3",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:Market {id: "MKT_RO"})
SET n.name = "Romania",
    n.description = "Romanian digital banking market context",
    n.source_tag = "S12",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2";

MERGE (n:Market {id: "MKT_CEE"})
SET n.name = "Central and Eastern Europe",
    n.description = "Regional CEE context for multi-market blueprint reuse",
    n.source_tag = "S4|S8",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "shared";


// StrategyPillar
MERGE (n:StrategyPillar {id: "STRAT_ACQUIRE"})
SET n.name = "Acquire",
    n.description = "Acquire new retail customers through digital and assisted channels",
    n.source_tag = "S1",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "shared";

MERGE (n:StrategyPillar {id: "STRAT_ENGAGE"})
SET n.name = "Engage",
    n.description = "Increase customer engagement through digital and human-assisted experiences",
    n.source_tag = "S1",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "shared";

MERGE (n:StrategyPillar {id: "STRAT_MONETIZE"})
SET n.name = "Monetize",
    n.description = "Grow retail value through personalized offers and conversion",
    n.source_tag = "S1",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "shared";

MERGE (n:StrategyPillar {id: "STRAT_DIGITAL_HUMAN_TOUCH"})
SET n.name = "Digital Bank with Human Touch",
    n.description = "Strategic narrative for digital bank experiences with human support",
    n.source_tag = "S1|S4",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "shared";


// UserGroup
MERGE (n:UserGroup {id: "USER_RETAIL_CUSTOMER"})
SET n.name = "Retail customer",
    n.description = "End customer using retail banking services",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "shared";

MERGE (n:UserGroup {id: "USER_PROSPECT_CUSTOMER"})
SET n.name = "Prospect customer",
    n.description = "Prospective customer in onboarding or acquisition journeys",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_4";

MERGE (n:UserGroup {id: "USER_AUTHENTICATED_CUSTOMER"})
SET n.name = "Authenticated customer",
    n.description = "Customer using authenticated digital banking services",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_2";

MERGE (n:UserGroup {id: "USER_BRANCH_ADVISOR"})
SET n.name = "Branch advisor",
    n.description = "Frontline branch staff advising retail customers",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2";

MERGE (n:UserGroup {id: "USER_CONTACT_CENTER_AGENT"})
SET n.name = "Contact center agent",
    n.description = "Operations staff handling service and complaint interactions",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1|story_2";

MERGE (n:UserGroup {id: "USER_MARKETING_MANAGER"})
SET n.name = "Marketing manager",
    n.description = "Business user configuring campaigns and offers",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_3";


// Channel
MERGE (n:Channel {id: "CH_MOBILE_APP"})
SET n.name = "Mobile app",
    n.description = "Customer mobile banking application channel",
    n.source_tag = "S4|S12",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_1";

MERGE (n:Channel {id: "CH_PUBLIC_WEBSITE"})
SET n.name = "Public website",
    n.description = "Public web channel for customer assistance and product information",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:Channel {id: "CH_VOICE"})
SET n.name = "Voice channel",
    n.description = "Phone or voicebot service channel",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:Channel {id: "CH_INTERNET_BANKING"})
SET n.name = "Internet banking",
    n.description = "Authenticated internet banking channel for digital customer assistance",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:Channel {id: "CH_INTERNAL_GENAI_PLATFORM"})
SET n.name = "Internal GenAI platform",
    n.description = "Internal GenAI platform channel for staff-facing assistants",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:Channel {id: "CH_BRANCH_DESKTOP"})
SET n.name = "Branch desktop",
    n.description = "Internal staff desktop channel for branch assistance",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2";

MERGE (n:Channel {id: "CH_CONTACT_CENTER_DESKTOP"})
SET n.name = "Contact center desktop",
    n.description = "Internal desktop channel for contact center support",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2";

MERGE (n:Channel {id: "CH_CAMPAIGN_PLATFORM"})
SET n.name = "Campaign platform",
    n.description = "Business campaign orchestration channel",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_3";


// BusinessProcess
MERGE (n:BusinessProcess {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT"})
SET n.name = "Retail conversational assistance",
    n.description = "Customer conversational assistance for retail banking questions",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:BusinessProcess {id: "BP_DIGITAL_ONBOARDING"})
SET n.name = "Digital onboarding",
    n.description = "Journey for opening an account digitally with identity verification",
    n.source_tag = "S9",
    n.confidence = "publicly_observed",
    n.is_hypothetical_demo_case = false,
    n.created_for_story = "story_4";

MERGE (n:BusinessProcess {id: "BP_CUSTOMER_SERVICE"})
SET n.name = "Customer service",
    n.description = "General customer service and support process",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_1";

MERGE (n:BusinessProcess {id: "BP_BRANCH_ADVICE"})
SET n.name = "Branch advice",
    n.description = "Branch advisory conversations and preparation",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2";

MERGE (n:BusinessProcess {id: "BP_PERSONALIZED_MARKETING"})
SET n.name = "Personalized marketing",
    n.description = "Campaign and offer personalization process",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_3";

MERGE (n:BusinessProcess {id: "BP_DIGITAL_SALES"})
SET n.name = "Digital sales",
    n.description = "Digital conversion and lead creation process",
    n.source_tag = "S6",
    n.confidence = "inferred",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";

MERGE (n:BusinessProcess {id: "BP_CREDIT_PREAPPROVAL"})
SET n.name = "Credit pre-approval",
    n.description = "Pre-approval support for eligible credit products",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3";

MERGE (n:BusinessProcess {id: "BP_COMPLAINT_MANAGEMENT"})
SET n.name = "Complaint management",
    n.description = "Complaint triage routing and response support",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_3|story_4";

MERGE (n:BusinessProcess {id: "BP_AGENTIC_WORKFLOW_EXECUTION"})
SET n.name = "Agentic workflow execution",
    n.description = "Read-write workflow actions performed by approved AI agents",
    n.source_tag = "DEMO",
    n.confidence = "hypothetical_demo",
    n.is_hypothetical_demo_case = true,
    n.created_for_story = "story_2|story_4";
