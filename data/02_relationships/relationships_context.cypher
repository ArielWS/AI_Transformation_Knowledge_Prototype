// Pack 2 context relationships for the Retail AI portfolio intelligence demo.
// Scope: base graph skeleton only. Story, reuse, governance, blocker, and similarity relationships are intentionally excluded.

// -----------------------------------------------------------------------------
// RBI Group strategy context
// -----------------------------------------------------------------------------
MATCH (g:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (s:StrategyPillar {id: "STRAT_ACQUIRE"})
MERGE (g)-[:HAS_STRATEGY]->(s);

MATCH (g:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (s:StrategyPillar {id: "STRAT_ENGAGE"})
MERGE (g)-[:HAS_STRATEGY]->(s);

MATCH (g:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (s:StrategyPillar {id: "STRAT_MONETIZE"})
MERGE (g)-[:HAS_STRATEGY]->(s);

MATCH (g:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (s:StrategyPillar {id: "STRAT_DIGITAL_HUMAN_TOUCH"})
MERGE (g)-[:HAS_STRATEGY]->(s);

// -----------------------------------------------------------------------------
// RBI Group network bank / group unit context
// -----------------------------------------------------------------------------
MATCH (g:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (b:NetworkBank {id: "BANK_TATRA"})
MERGE (g)-[:HAS_NETWORK_BANK {relationship_type: "ownership_context", confidence: "publicly_observed"}]->(b);

MATCH (g:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_KOSOVO"})
MERGE (g)-[:HAS_NETWORK_BANK {relationship_type: "ownership_context", confidence: "publicly_observed"}]->(b);

MATCH (g:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_BOSNIA"})
MERGE (g)-[:HAS_NETWORK_BANK {relationship_type: "ownership_context", confidence: "publicly_observed"}]->(b);

MATCH (g:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_CROATIA"})
MERGE (g)-[:HAS_NETWORK_BANK {relationship_type: "ownership_context", confidence: "inferred"}]->(b);

MATCH (g:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_AUSTRIA"})
MERGE (g)-[:HAS_NETWORK_BANK {relationship_type: "ownership_context", confidence: "inferred"}]->(b);

MATCH (g:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_CZECH"})
MERGE (g)-[:HAS_NETWORK_BANK {relationship_type: "ownership_context", confidence: "inferred"}]->(b);

MATCH (g:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_ROMANIA"})
MERGE (g)-[:HAS_NETWORK_BANK {relationship_type: "ownership_context", confidence: "publicly_observed"}]->(b);

MATCH (g:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (b:NetworkBank {id: "BANK_AI_LAB"})
MERGE (g)-[:HAS_NETWORK_BANK {relationship_type: "group_unit", confidence: "publicly_observed"}]->(b);

// -----------------------------------------------------------------------------
// Network bank and group unit market context
// -----------------------------------------------------------------------------
MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (m:Market {id: "MKT_AT"})
MERGE (b)-[:OPERATES_IN {primary_market: true}]->(m);

MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (m:Market {id: "MKT_CEE"})
MERGE (b)-[:OPERATES_IN {primary_market: false}]->(m);

MATCH (b:NetworkBank {id: "BANK_TATRA"})
MATCH (m:Market {id: "MKT_SK"})
MERGE (b)-[:OPERATES_IN {primary_market: true}]->(m);

MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_KOSOVO"})
MATCH (m:Market {id: "MKT_XK"})
MERGE (b)-[:OPERATES_IN {primary_market: true}]->(m);

MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_BOSNIA"})
MATCH (m:Market {id: "MKT_BA"})
MERGE (b)-[:OPERATES_IN {primary_market: true}]->(m);

MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_CROATIA"})
MATCH (m:Market {id: "MKT_HR"})
MERGE (b)-[:OPERATES_IN {primary_market: true}]->(m);

MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_AUSTRIA"})
MATCH (m:Market {id: "MKT_AT"})
MERGE (b)-[:OPERATES_IN {primary_market: true}]->(m);

MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_CZECH"})
MATCH (m:Market {id: "MKT_CZ"})
MERGE (b)-[:OPERATES_IN {primary_market: true}]->(m);

MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_ROMANIA"})
MATCH (m:Market {id: "MKT_RO"})
MERGE (b)-[:OPERATES_IN {primary_market: true}]->(m);

MATCH (b:NetworkBank {id: "BANK_AI_LAB"})
MATCH (m:Market {id: "MKT_AT"})
MERGE (b)-[:OPERATES_IN {primary_market: true}]->(m);

MATCH (b:NetworkBank {id: "BANK_AI_LAB"})
MATCH (m:Market {id: "MKT_CEE"})
MERGE (b)-[:OPERATES_IN {primary_market: false}]->(m);

// -----------------------------------------------------------------------------
// High-level system availability by bank or group unit
// -----------------------------------------------------------------------------
MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (s:System {id: "SYS_INTERNAL_GENAI_PLATFORM"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "available", scope: "group"}]->(s);

MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (s:System {id: "SYS_CONTENT_SAFETY"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "available", scope: "group"}]->(s);

MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (s:System {id: "SYS_DATA_PLATFORM_APEX"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "available", scope: "group"}]->(s);

MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MATCH (s:System {id: "SYS_CRM_CAMPAIGN"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "available", scope: "multi_market"}]->(s);

MATCH (b:NetworkBank {id: "BANK_AI_LAB"})
MATCH (s:System {id: "SYS_INTERNAL_GENAI_PLATFORM"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "available", scope: "group"}]->(s);

MATCH (b:NetworkBank {id: "BANK_TATRA"})
MATCH (s:System {id: "SYS_MOBILE_BANKING"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "available", scope: "local"}]->(s);

MATCH (b:NetworkBank {id: "BANK_TATRA"})
MATCH (s:System {id: "SYS_PUBLIC_WEBSITE"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "available", scope: "local"}]->(s);

MATCH (b:NetworkBank {id: "BANK_TATRA"})
MATCH (s:System {id: "SYS_KYC_PLATFORM"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "available", scope: "local"}]->(s);

MATCH (b:NetworkBank {id: "BANK_TATRA"})
MATCH (s:System {id: "SYS_ONBOARDING_WORKFLOW"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "available", scope: "local"}]->(s);

MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_KOSOVO"})
MATCH (s:System {id: "SYS_PUBLIC_WEBSITE"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "available", scope: "local"}]->(s);

MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_KOSOVO"})
MATCH (s:System {id: "SYS_MOBILE_BANKING"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "partial", scope: "local"}]->(s);

MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_BOSNIA"})
MATCH (s:System {id: "SYS_PUBLIC_WEBSITE"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "available", scope: "local"}]->(s);

MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_CROATIA"})
MATCH (s:System {id: "SYS_PUBLIC_WEBSITE"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "available", scope: "local"}]->(s);

MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_AUSTRIA"})
MATCH (s:System {id: "SYS_CUSTOMER_MASTER"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "available", scope: "local"}]->(s);

MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_CZECH"})
MATCH (s:System {id: "SYS_CUSTOMER_MASTER"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "available", scope: "local"}]->(s);

MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_ROMANIA"})
MATCH (s:System {id: "SYS_CRM_CAMPAIGN"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "available", scope: "local"}]->(s);

MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_ROMANIA"})
MATCH (s:System {id: "SYS_CONSENT_MANAGEMENT"})
MERGE (b)-[:HAS_SYSTEM {availability_status: "partial", scope: "local"}]->(s);

// -----------------------------------------------------------------------------
// Use case implementation context
// -----------------------------------------------------------------------------
MATCH (u:UseCase {id: "UC_ADAM_TB"})
MATCH (b:NetworkBank {id: "BANK_TATRA"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "production", scope: "local", confidence: "publicly_observed"}]->(b);

MATCH (u:UseCase {id: "UC_RAIA_KOSOVO"})
MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_KOSOVO"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "production", scope: "local", confidence: "publicly_observed"}]->(b);

MATCH (u:UseCase {id: "UC_RAIA_BOSNIA"})
MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_BOSNIA"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "production", scope: "local", confidence: "publicly_observed"}]->(b);

MATCH (u:UseCase {id: "UC_RAIA_CROATIA"})
MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_CROATIA"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "planned", scope: "local", confidence: "hypothetical_demo"}]->(b);

MATCH (u:UseCase {id: "UC_RBUA_RBCZ_VOICEBOT"})
MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_AUSTRIA"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "pilot", scope: "multi_market", confidence: "inferred"}]->(b);

MATCH (u:UseCase {id: "UC_RBUA_RBCZ_VOICEBOT"})
MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_CZECH"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "pilot", scope: "multi_market", confidence: "inferred"}]->(b);

MATCH (u:UseCase {id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT"})
MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "pilot", scope: "group", confidence: "inferred"}]->(b);

MATCH (u:UseCase {id: "UC_DIGITAL_ONBOARDING_ASSISTANT"})
MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "planned", scope: "multi_market", confidence: "inferred"}]->(b);

MATCH (u:UseCase {id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT"})
MATCH (b:NetworkBank {id: "BANK_TATRA"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "planned", scope: "local", confidence: "hypothetical_demo"}]->(b);

MATCH (u:UseCase {id: "UC_BRANCH_ADVISOR_COPILOT"})
MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "planned", scope: "multi_market", confidence: "hypothetical_demo"}]->(b);

MATCH (u:UseCase {id: "UC_SALES_OFFER_ASSISTANT"})
MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_ROMANIA"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "pilot", scope: "local", confidence: "inferred"}]->(b);

MATCH (u:UseCase {id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT"})
MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "planned", scope: "multi_market", confidence: "hypothetical_demo"}]->(b);

MATCH (u:UseCase {id: "UC_PERSONALIZED_OFFER_ENGINE"})
MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_ROMANIA"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "pilot", scope: "local", confidence: "inferred"}]->(b);

MATCH (u:UseCase {id: "UC_LOAN_AFFORDABILITY_RECOMMENDER"})
MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "planned", scope: "multi_market", confidence: "hypothetical_demo"}]->(b);

MATCH (u:UseCase {id: "UC_CREDIT_PREAPPROVAL_ASSISTANT"})
MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "planned", scope: "multi_market", confidence: "hypothetical_demo"}]->(b);

MATCH (u:UseCase {id: "UC_COMPLAINT_TRIAGE_ASSISTANT"})
MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "planned", scope: "multi_market", confidence: "hypothetical_demo"}]->(b);

MATCH (u:UseCase {id: "UC_CRM_LEAD_ASSISTANT"})
MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_ROMANIA"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "planned", scope: "local", confidence: "inferred"}]->(b);

MATCH (u:UseCase {id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT"})
MATCH (b:NetworkBank {id: "BANK_RAIFFEISEN_ROMANIA"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "planned", scope: "local", confidence: "inferred"}]->(b);

MATCH (u:UseCase {id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT"})
MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "planned", scope: "multi_market", confidence: "hypothetical_demo"}]->(b);

MATCH (u:UseCase {id: "UC_MAIA_MULTILINGUAL_ASSISTANT"})
MATCH (b:NetworkBank {id: "BANK_AI_LAB"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "pilot", scope: "group", confidence: "publicly_observed"}]->(b);

MATCH (u:UseCase {id: "UC_CUSTOMER_360_INSIGHT_COPILOT"})
MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "planned", scope: "group", confidence: "inferred"}]->(b);

MATCH (u:UseCase {id: "UC_AUDIT_READY_AGENT_WORKFLOW"})
MATCH (b:NetworkBank {id: "BANK_RBI_GROUP"})
MERGE (u)-[:IMPLEMENTED_IN {implementation_status: "planned", scope: "group", confidence: "inferred"}]->(b);

// -----------------------------------------------------------------------------
// Use case user groups
// -----------------------------------------------------------------------------
MATCH (u:UseCase {id: "UC_ADAM_TB"})
MATCH (g:UserGroup {id: "USER_RETAIL_CUSTOMER"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_ADAM_TB"})
MATCH (g:UserGroup {id: "USER_AUTHENTICATED_CUSTOMER"})
MERGE (u)-[:SERVES {primary_user: false, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_RAIA_KOSOVO"})
MATCH (g:UserGroup {id: "USER_RETAIL_CUSTOMER"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_RAIA_BOSNIA"})
MATCH (g:UserGroup {id: "USER_RETAIL_CUSTOMER"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_RAIA_CROATIA"})
MATCH (g:UserGroup {id: "USER_RETAIL_CUSTOMER"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_RBUA_RBCZ_VOICEBOT"})
MATCH (g:UserGroup {id: "USER_RETAIL_CUSTOMER"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT"})
MATCH (g:UserGroup {id: "USER_CONTACT_CENTER_AGENT"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT"})
MATCH (g:UserGroup {id: "USER_BRANCH_ADVISOR"})
MERGE (u)-[:SERVES {primary_user: false, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_DIGITAL_ONBOARDING_ASSISTANT"})
MATCH (g:UserGroup {id: "USER_PROSPECT_CUSTOMER"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT"})
MATCH (g:UserGroup {id: "USER_AUTHENTICATED_CUSTOMER"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_BRANCH_ADVISOR_COPILOT"})
MATCH (g:UserGroup {id: "USER_BRANCH_ADVISOR"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_SALES_OFFER_ASSISTANT"})
MATCH (g:UserGroup {id: "USER_BRANCH_ADVISOR"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT"})
MATCH (g:UserGroup {id: "USER_AUTHENTICATED_CUSTOMER"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_PERSONALIZED_OFFER_ENGINE"})
MATCH (g:UserGroup {id: "USER_MARKETING_MANAGER"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_PERSONALIZED_OFFER_ENGINE"})
MATCH (g:UserGroup {id: "USER_RETAIL_CUSTOMER"})
MERGE (u)-[:SERVES {primary_user: false, impact_type: "affected_customer"}]->(g);

MATCH (u:UseCase {id: "UC_LOAN_AFFORDABILITY_RECOMMENDER"})
MATCH (g:UserGroup {id: "USER_BRANCH_ADVISOR"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_LOAN_AFFORDABILITY_RECOMMENDER"})
MATCH (g:UserGroup {id: "USER_RETAIL_CUSTOMER"})
MERGE (u)-[:SERVES {primary_user: false, impact_type: "affected_customer"}]->(g);

MATCH (u:UseCase {id: "UC_CREDIT_PREAPPROVAL_ASSISTANT"})
MATCH (g:UserGroup {id: "USER_AUTHENTICATED_CUSTOMER"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_COMPLAINT_TRIAGE_ASSISTANT"})
MATCH (g:UserGroup {id: "USER_CONTACT_CENTER_AGENT"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_COMPLAINT_TRIAGE_ASSISTANT"})
MATCH (g:UserGroup {id: "USER_RETAIL_CUSTOMER"})
MERGE (u)-[:SERVES {primary_user: false, impact_type: "affected_customer"}]->(g);

MATCH (u:UseCase {id: "UC_CRM_LEAD_ASSISTANT"})
MATCH (g:UserGroup {id: "USER_BRANCH_ADVISOR"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT"})
MATCH (g:UserGroup {id: "USER_MARKETING_MANAGER"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT"})
MATCH (g:UserGroup {id: "USER_CONTACT_CENTER_AGENT"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_MAIA_MULTILINGUAL_ASSISTANT"})
MATCH (g:UserGroup {id: "USER_RETAIL_CUSTOMER"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_CUSTOMER_360_INSIGHT_COPILOT"})
MATCH (g:UserGroup {id: "USER_CONTACT_CENTER_AGENT"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_CUSTOMER_360_INSIGHT_COPILOT"})
MATCH (g:UserGroup {id: "USER_BRANCH_ADVISOR"})
MERGE (u)-[:SERVES {primary_user: false, impact_type: "direct_user"}]->(g);

MATCH (u:UseCase {id: "UC_AUDIT_READY_AGENT_WORKFLOW"})
MATCH (g:UserGroup {id: "USER_BRANCH_ADVISOR"})
MERGE (u)-[:SERVES {primary_user: true, impact_type: "direct_user"}]->(g);

// -----------------------------------------------------------------------------
// Use case delivery channels
// -----------------------------------------------------------------------------
MATCH (u:UseCase {id: "UC_ADAM_TB"})
MATCH (c:Channel {id: "CH_MOBILE_APP"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "authenticated"}]->(c);

MATCH (u:UseCase {id: "UC_ADAM_TB"})
MATCH (c:Channel {id: "CH_PUBLIC_WEBSITE"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: false, access_context: "public"}]->(c);

MATCH (u:UseCase {id: "UC_ADAM_TB"})
MATCH (c:Channel {id: "CH_INTERNET_BANKING"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: false, access_context: "authenticated"}]->(c);

MATCH (u:UseCase {id: "UC_RAIA_KOSOVO"})
MATCH (c:Channel {id: "CH_PUBLIC_WEBSITE"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "public"}]->(c);

MATCH (u:UseCase {id: "UC_RAIA_KOSOVO"})
MATCH (c:Channel {id: "CH_MOBILE_APP"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: false, access_context: "authenticated"}]->(c);

MATCH (u:UseCase {id: "UC_RAIA_BOSNIA"})
MATCH (c:Channel {id: "CH_PUBLIC_WEBSITE"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "public"}]->(c);

MATCH (u:UseCase {id: "UC_RAIA_CROATIA"})
MATCH (c:Channel {id: "CH_PUBLIC_WEBSITE"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "public"}]->(c);

MATCH (u:UseCase {id: "UC_RBUA_RBCZ_VOICEBOT"})
MATCH (c:Channel {id: "CH_VOICE"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "public"}]->(c);

MATCH (u:UseCase {id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT"})
MATCH (c:Channel {id: "CH_INTERNAL_GENAI_PLATFORM"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "internal"}]->(c);

MATCH (u:UseCase {id: "UC_DIGITAL_ONBOARDING_ASSISTANT"})
MATCH (c:Channel {id: "CH_MOBILE_APP"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "public"}]->(c);

MATCH (u:UseCase {id: "UC_DIGITAL_ONBOARDING_ASSISTANT"})
MATCH (c:Channel {id: "CH_PUBLIC_WEBSITE"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: false, access_context: "public"}]->(c);

MATCH (u:UseCase {id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT"})
MATCH (c:Channel {id: "CH_MOBILE_APP"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "authenticated"}]->(c);

MATCH (u:UseCase {id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT"})
MATCH (c:Channel {id: "CH_INTERNET_BANKING"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: false, access_context: "authenticated"}]->(c);

MATCH (u:UseCase {id: "UC_BRANCH_ADVISOR_COPILOT"})
MATCH (c:Channel {id: "CH_BRANCH_DESKTOP"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "internal"}]->(c);

MATCH (u:UseCase {id: "UC_SALES_OFFER_ASSISTANT"})
MATCH (c:Channel {id: "CH_BRANCH_DESKTOP"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "internal"}]->(c);

MATCH (u:UseCase {id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT"})
MATCH (c:Channel {id: "CH_MOBILE_APP"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "authenticated"}]->(c);

MATCH (u:UseCase {id: "UC_PERSONALIZED_OFFER_ENGINE"})
MATCH (c:Channel {id: "CH_CAMPAIGN_PLATFORM"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "internal"}]->(c);

MATCH (u:UseCase {id: "UC_LOAN_AFFORDABILITY_RECOMMENDER"})
MATCH (c:Channel {id: "CH_BRANCH_DESKTOP"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "internal"}]->(c);

MATCH (u:UseCase {id: "UC_CREDIT_PREAPPROVAL_ASSISTANT"})
MATCH (c:Channel {id: "CH_MOBILE_APP"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "authenticated"}]->(c);

MATCH (u:UseCase {id: "UC_COMPLAINT_TRIAGE_ASSISTANT"})
MATCH (c:Channel {id: "CH_CONTACT_CENTER_DESKTOP"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "internal"}]->(c);

MATCH (u:UseCase {id: "UC_CRM_LEAD_ASSISTANT"})
MATCH (c:Channel {id: "CH_BRANCH_DESKTOP"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "internal"}]->(c);

MATCH (u:UseCase {id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT"})
MATCH (c:Channel {id: "CH_CAMPAIGN_PLATFORM"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "internal"}]->(c);

MATCH (u:UseCase {id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT"})
MATCH (c:Channel {id: "CH_CONTACT_CENTER_DESKTOP"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "internal"}]->(c);

MATCH (u:UseCase {id: "UC_MAIA_MULTILINGUAL_ASSISTANT"})
MATCH (c:Channel {id: "CH_PUBLIC_WEBSITE"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "public"}]->(c);

MATCH (u:UseCase {id: "UC_CUSTOMER_360_INSIGHT_COPILOT"})
MATCH (c:Channel {id: "CH_INTERNAL_GENAI_PLATFORM"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "internal"}]->(c);

MATCH (u:UseCase {id: "UC_AUDIT_READY_AGENT_WORKFLOW"})
MATCH (c:Channel {id: "CH_INTERNAL_GENAI_PLATFORM"})
MERGE (u)-[:DELIVERED_THROUGH {primary_channel: true, access_context: "internal"}]->(c);

// -----------------------------------------------------------------------------
// Use case business process context
// -----------------------------------------------------------------------------
MATCH (u:UseCase {id: "UC_ADAM_TB"})
MATCH (p:BusinessProcess {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_ADAM_TB"})
MATCH (p:BusinessProcess {id: "BP_CUSTOMER_SERVICE"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "secondary"}]->(p);

MATCH (u:UseCase {id: "UC_RAIA_KOSOVO"})
MATCH (p:BusinessProcess {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_RAIA_KOSOVO"})
MATCH (p:BusinessProcess {id: "BP_CUSTOMER_SERVICE"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "secondary"}]->(p);

MATCH (u:UseCase {id: "UC_RAIA_BOSNIA"})
MATCH (p:BusinessProcess {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_RAIA_CROATIA"})
MATCH (p:BusinessProcess {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_RBUA_RBCZ_VOICEBOT"})
MATCH (p:BusinessProcess {id: "BP_CUSTOMER_SERVICE"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_RBUA_RBCZ_VOICEBOT"})
MATCH (p:BusinessProcess {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "secondary"}]->(p);

MATCH (u:UseCase {id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT"})
MATCH (p:BusinessProcess {id: "BP_CUSTOMER_SERVICE"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT"})
MATCH (p:BusinessProcess {id: "BP_BRANCH_ADVICE"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "secondary"}]->(p);

MATCH (u:UseCase {id: "UC_DIGITAL_ONBOARDING_ASSISTANT"})
MATCH (p:BusinessProcess {id: "BP_DIGITAL_ONBOARDING"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT"})
MATCH (p:BusinessProcess {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT"})
MATCH (p:BusinessProcess {id: "BP_CUSTOMER_SERVICE"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "secondary"}]->(p);

MATCH (u:UseCase {id: "UC_BRANCH_ADVISOR_COPILOT"})
MATCH (p:BusinessProcess {id: "BP_BRANCH_ADVICE"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_SALES_OFFER_ASSISTANT"})
MATCH (p:BusinessProcess {id: "BP_DIGITAL_SALES"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_SALES_OFFER_ASSISTANT"})
MATCH (p:BusinessProcess {id: "BP_BRANCH_ADVICE"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "secondary"}]->(p);

MATCH (u:UseCase {id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT"})
MATCH (p:BusinessProcess {id: "BP_DIGITAL_SALES"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_PERSONALIZED_OFFER_ENGINE"})
MATCH (p:BusinessProcess {id: "BP_PERSONALIZED_MARKETING"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_LOAN_AFFORDABILITY_RECOMMENDER"})
MATCH (p:BusinessProcess {id: "BP_CREDIT_PREAPPROVAL"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_CREDIT_PREAPPROVAL_ASSISTANT"})
MATCH (p:BusinessProcess {id: "BP_CREDIT_PREAPPROVAL"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_CREDIT_PREAPPROVAL_ASSISTANT"})
MATCH (p:BusinessProcess {id: "BP_DIGITAL_ONBOARDING"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "secondary"}]->(p);

MATCH (u:UseCase {id: "UC_COMPLAINT_TRIAGE_ASSISTANT"})
MATCH (p:BusinessProcess {id: "BP_COMPLAINT_MANAGEMENT"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_CRM_LEAD_ASSISTANT"})
MATCH (p:BusinessProcess {id: "BP_DIGITAL_SALES"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_CRM_LEAD_ASSISTANT"})
MATCH (p:BusinessProcess {id: "BP_AGENTIC_WORKFLOW_EXECUTION"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "secondary"}]->(p);

MATCH (u:UseCase {id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT"})
MATCH (p:BusinessProcess {id: "BP_PERSONALIZED_MARKETING"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT"})
MATCH (p:BusinessProcess {id: "BP_AGENTIC_WORKFLOW_EXECUTION"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "secondary"}]->(p);

MATCH (u:UseCase {id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT"})
MATCH (p:BusinessProcess {id: "BP_CUSTOMER_SERVICE"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT"})
MATCH (p:BusinessProcess {id: "BP_COMPLAINT_MANAGEMENT"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "secondary"}]->(p);

MATCH (u:UseCase {id: "UC_MAIA_MULTILINGUAL_ASSISTANT"})
MATCH (p:BusinessProcess {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_CUSTOMER_360_INSIGHT_COPILOT"})
MATCH (p:BusinessProcess {id: "BP_CUSTOMER_SERVICE"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

MATCH (u:UseCase {id: "UC_AUDIT_READY_AGENT_WORKFLOW"})
MATCH (p:BusinessProcess {id: "BP_AGENTIC_WORKFLOW_EXECUTION"})
MERGE (u)-[:SUPPORTS_PROCESS {support_level: "primary"}]->(p);

// -----------------------------------------------------------------------------
// Use case strategic alignment
// -----------------------------------------------------------------------------
MATCH (u:UseCase {id: "UC_ADAM_TB"})
MATCH (s:StrategyPillar {id: "STRAT_ENGAGE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports digital engagement through assisted retail servicing"}]->(s);

MATCH (u:UseCase {id: "UC_RAIA_KOSOVO"})
MATCH (s:StrategyPillar {id: "STRAT_ENGAGE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports customer engagement through digital assistant support"}]->(s);

MATCH (u:UseCase {id: "UC_RAIA_BOSNIA"})
MATCH (s:StrategyPillar {id: "STRAT_ENGAGE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports customer engagement through digital assistant support"}]->(s);

MATCH (u:UseCase {id: "UC_RAIA_CROATIA"})
MATCH (s:StrategyPillar {id: "STRAT_ENGAGE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports customer engagement through assistant blueprint rollout"}]->(s);

MATCH (u:UseCase {id: "UC_RBUA_RBCZ_VOICEBOT"})
MATCH (s:StrategyPillar {id: "STRAT_ENGAGE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports engagement by improving voice service containment"}]->(s);

MATCH (u:UseCase {id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT"})
MATCH (s:StrategyPillar {id: "STRAT_DIGITAL_HUMAN_TOUCH"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports staff-enabled digital service with reusable product knowledge"}]->(s);

MATCH (u:UseCase {id: "UC_DIGITAL_ONBOARDING_ASSISTANT"})
MATCH (s:StrategyPillar {id: "STRAT_ACQUIRE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports acquisition through guided digital onboarding"}]->(s);

MATCH (u:UseCase {id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT"})
MATCH (s:StrategyPillar {id: "STRAT_ENGAGE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports authenticated customer engagement and self-service"}]->(s);

MATCH (u:UseCase {id: "UC_BRANCH_ADVISOR_COPILOT"})
MATCH (s:StrategyPillar {id: "STRAT_DIGITAL_HUMAN_TOUCH"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Augments human advisors with governed AI support"}]->(s);

MATCH (u:UseCase {id: "UC_SALES_OFFER_ASSISTANT"})
MATCH (s:StrategyPillar {id: "STRAT_MONETIZE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports offer conversion and CRM lead creation"}]->(s);

MATCH (u:UseCase {id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT"})
MATCH (s:StrategyPillar {id: "STRAT_MONETIZE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports personalized product recommendation and conversion"}]->(s);

MATCH (u:UseCase {id: "UC_PERSONALIZED_OFFER_ENGINE"})
MATCH (s:StrategyPillar {id: "STRAT_MONETIZE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports next-best-offer and campaign performance"}]->(s);

MATCH (u:UseCase {id: "UC_LOAN_AFFORDABILITY_RECOMMENDER"})
MATCH (s:StrategyPillar {id: "STRAT_ACQUIRE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports acquisition by helping evaluate credit readiness"}]->(s);

MATCH (u:UseCase {id: "UC_LOAN_AFFORDABILITY_RECOMMENDER"})
MATCH (s:StrategyPillar {id: "STRAT_DIGITAL_HUMAN_TOUCH"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "secondary", rationale: "Assists advisor-led lending conversations"}]->(s);

MATCH (u:UseCase {id: "UC_CREDIT_PREAPPROVAL_ASSISTANT"})
MATCH (s:StrategyPillar {id: "STRAT_ACQUIRE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports acquisition through pre-approved credit journeys"}]->(s);

MATCH (u:UseCase {id: "UC_COMPLAINT_TRIAGE_ASSISTANT"})
MATCH (s:StrategyPillar {id: "STRAT_ENGAGE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports engagement through faster complaint handling"}]->(s);

MATCH (u:UseCase {id: "UC_CRM_LEAD_ASSISTANT"})
MATCH (s:StrategyPillar {id: "STRAT_MONETIZE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports lead capture and sales conversion"}]->(s);

MATCH (u:UseCase {id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT"})
MATCH (s:StrategyPillar {id: "STRAT_MONETIZE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports consent-aware campaign and offer activation"}]->(s);

MATCH (u:UseCase {id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT"})
MATCH (s:StrategyPillar {id: "STRAT_ENGAGE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports engagement through better contact center support"}]->(s);

MATCH (u:UseCase {id: "UC_MAIA_MULTILINGUAL_ASSISTANT"})
MATCH (s:StrategyPillar {id: "STRAT_ENGAGE"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports engagement across multilingual customer interactions"}]->(s);

MATCH (u:UseCase {id: "UC_CUSTOMER_360_INSIGHT_COPILOT"})
MATCH (s:StrategyPillar {id: "STRAT_DIGITAL_HUMAN_TOUCH"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports staff decisions with governed customer context"}]->(s);

MATCH (u:UseCase {id: "UC_AUDIT_READY_AGENT_WORKFLOW"})
MATCH (s:StrategyPillar {id: "STRAT_DIGITAL_HUMAN_TOUCH"})
MERGE (u)-[:SUPPORTS_STRATEGY {alignment_strength: "primary", rationale: "Supports controlled agentic workflow adoption"}]->(s);

// -----------------------------------------------------------------------------
// Use case KPI context for demo queries
// -----------------------------------------------------------------------------
MATCH (u:UseCase {id: "UC_ADAM_TB"})
MATCH (k:KPI {id: "KPI_SELF_SERVICE_CONTAINMENT"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_RAIA_KOSOVO"})
MATCH (k:KPI {id: "KPI_SELF_SERVICE_CONTAINMENT"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_RAIA_BOSNIA"})
MATCH (k:KPI {id: "KPI_SELF_SERVICE_CONTAINMENT"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_RAIA_CROATIA"})
MATCH (k:KPI {id: "KPI_SELF_SERVICE_CONTAINMENT"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_RBUA_RBCZ_VOICEBOT"})
MATCH (k:KPI {id: "KPI_SELF_SERVICE_CONTAINMENT"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT"})
MATCH (k:KPI {id: "KPI_REUSE_BLUEPRINT_ADOPTION"})
MERGE (u)-[:MEASURED_BY {contribution_type: "indirect", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_DIGITAL_ONBOARDING_ASSISTANT"})
MATCH (k:KPI {id: "KPI_DIGITAL_NTB_CUSTOMERS"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_DIGITAL_ONBOARDING_ASSISTANT"})
MATCH (k:KPI {id: "KPI_ONBOARDING_COMPLETION_RATE"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_AUTHENTICATED_CUSTOMER_ASSISTANT"})
MATCH (k:KPI {id: "KPI_SELF_SERVICE_CONTAINMENT"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_BRANCH_ADVISOR_COPILOT"})
MATCH (k:KPI {id: "KPI_LEAD_CONVERSION_RATE"})
MERGE (u)-[:MEASURED_BY {contribution_type: "indirect", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_SALES_OFFER_ASSISTANT"})
MATCH (k:KPI {id: "KPI_LEAD_CONVERSION_RATE"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_PRODUCT_RECOMMENDATION_ASSISTANT"})
MATCH (k:KPI {id: "KPI_OFFER_ACCEPTANCE_RATE"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_PERSONALIZED_OFFER_ENGINE"})
MATCH (k:KPI {id: "KPI_OFFER_ACCEPTANCE_RATE"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_PERSONALIZED_OFFER_ENGINE"})
MATCH (k:KPI {id: "KPI_LEAD_CONVERSION_RATE"})
MERGE (u)-[:MEASURED_BY {contribution_type: "indirect", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_LOAN_AFFORDABILITY_RECOMMENDER"})
MATCH (k:KPI {id: "KPI_DIGITAL_NTB_CUSTOMERS"})
MERGE (u)-[:MEASURED_BY {contribution_type: "indirect", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_CREDIT_PREAPPROVAL_ASSISTANT"})
MATCH (k:KPI {id: "KPI_DIGITAL_NTB_CUSTOMERS"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_CREDIT_PREAPPROVAL_ASSISTANT"})
MATCH (k:KPI {id: "KPI_ONBOARDING_COMPLETION_RATE"})
MERGE (u)-[:MEASURED_BY {contribution_type: "indirect", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_COMPLAINT_TRIAGE_ASSISTANT"})
MATCH (k:KPI {id: "KPI_COMPLAINT_RESOLUTION_TIME"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "decrease"}]->(k);

MATCH (u:UseCase {id: "UC_CRM_LEAD_ASSISTANT"})
MATCH (k:KPI {id: "KPI_LEAD_CONVERSION_RATE"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_CONSENT_AWARE_CAMPAIGN_AGENT"})
MATCH (k:KPI {id: "KPI_OFFER_ACCEPTANCE_RATE"})
MERGE (u)-[:MEASURED_BY {contribution_type: "indirect", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_CONTACT_CENTER_KNOWLEDGE_COPILOT"})
MATCH (k:KPI {id: "KPI_SELF_SERVICE_CONTAINMENT"})
MERGE (u)-[:MEASURED_BY {contribution_type: "indirect", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_MAIA_MULTILINGUAL_ASSISTANT"})
MATCH (k:KPI {id: "KPI_SELF_SERVICE_CONTAINMENT"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "increase"}]->(k);

MATCH (u:UseCase {id: "UC_CUSTOMER_360_INSIGHT_COPILOT"})
MATCH (k:KPI {id: "KPI_GOVERNANCE_REVIEW_CYCLE_TIME"})
MERGE (u)-[:MEASURED_BY {contribution_type: "indirect", expected_direction: "decrease"}]->(k);

MATCH (u:UseCase {id: "UC_AUDIT_READY_AGENT_WORKFLOW"})
MATCH (k:KPI {id: "KPI_GOVERNANCE_REVIEW_CYCLE_TIME"})
MERGE (u)-[:MEASURED_BY {contribution_type: "direct", expected_direction: "decrease"}]->(k);
