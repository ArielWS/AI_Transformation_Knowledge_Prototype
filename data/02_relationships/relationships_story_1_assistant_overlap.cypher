// -----------------------------------------------------------------------------
// Pack 3 / Story 1: assistant overlap and reusable blueprint discovery
// -----------------------------------------------------------------------------
// Scope: reuse, knowledge, system, risk/control, and blueprint relationships only.
// All source and target nodes are defined in Pack 1 node files and the registry.

// -----------------------------------------------------------------------------
// Shared reusable functions for strong-overlap customer assistants
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_ADAM_TB", function_id: "FUNC_RETRIEVE_PRODUCT_KNOWLEDGE", importance: "required", reuse_relevance: "high", status: "available", confidence: "publicly_observed", source_tag: "S10"},
  {use_case_id: "UC_ADAM_TB", function_id: "FUNC_RETRIEVE_DIGITAL_HELP", importance: "required", reuse_relevance: "high", status: "available", confidence: "inferred", source_tag: "S10"},
  {use_case_id: "UC_ADAM_TB", function_id: "FUNC_ESCALATE_TO_HUMAN", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "DEMO"},
  {use_case_id: "UC_ADAM_TB", function_id: "FUNC_LOG_INTERACTION", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S2|S13"},
  {use_case_id: "UC_ADAM_TB", function_id: "FUNC_APPLY_RESPONSE_GUARDRAILS", importance: "required", reuse_relevance: "high", status: "available", confidence: "inferred", source_tag: "S5"},

  {use_case_id: "UC_RAIA_KOSOVO", function_id: "FUNC_RETRIEVE_PRODUCT_KNOWLEDGE", importance: "required", reuse_relevance: "high", status: "available", confidence: "publicly_observed", source_tag: "S10|S11"},
  {use_case_id: "UC_RAIA_KOSOVO", function_id: "FUNC_RETRIEVE_DIGITAL_HELP", importance: "required", reuse_relevance: "high", status: "available", confidence: "publicly_observed", source_tag: "S10|S11"},
  {use_case_id: "UC_RAIA_KOSOVO", function_id: "FUNC_ESCALATE_TO_HUMAN", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "DEMO"},
  {use_case_id: "UC_RAIA_KOSOVO", function_id: "FUNC_LOG_INTERACTION", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S2|S13"},
  {use_case_id: "UC_RAIA_KOSOVO", function_id: "FUNC_APPLY_RESPONSE_GUARDRAILS", importance: "required", reuse_relevance: "high", status: "available", confidence: "inferred", source_tag: "S5"},

  {use_case_id: "UC_RAIA_BOSNIA", function_id: "FUNC_RETRIEVE_PRODUCT_KNOWLEDGE", importance: "required", reuse_relevance: "high", status: "available", confidence: "publicly_observed", source_tag: "S10"},
  {use_case_id: "UC_RAIA_BOSNIA", function_id: "FUNC_RETRIEVE_DIGITAL_HELP", importance: "required", reuse_relevance: "high", status: "available", confidence: "publicly_observed", source_tag: "S10"},
  {use_case_id: "UC_RAIA_BOSNIA", function_id: "FUNC_ESCALATE_TO_HUMAN", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "DEMO"},
  {use_case_id: "UC_RAIA_BOSNIA", function_id: "FUNC_LOG_INTERACTION", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S2|S13"},
  {use_case_id: "UC_RAIA_BOSNIA", function_id: "FUNC_APPLY_RESPONSE_GUARDRAILS", importance: "required", reuse_relevance: "high", status: "available", confidence: "inferred", source_tag: "S5"},

  {use_case_id: "UC_RAIA_CROATIA", function_id: "FUNC_RETRIEVE_PRODUCT_KNOWLEDGE", importance: "required", reuse_relevance: "high", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_RAIA_CROATIA", function_id: "FUNC_RETRIEVE_DIGITAL_HELP", importance: "required", reuse_relevance: "high", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_RAIA_CROATIA", function_id: "FUNC_ESCALATE_TO_HUMAN", importance: "required", reuse_relevance: "high", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_RAIA_CROATIA", function_id: "FUNC_LOG_INTERACTION", importance: "required", reuse_relevance: "high", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_RAIA_CROATIA", function_id: "FUNC_APPLY_RESPONSE_GUARDRAILS", importance: "required", reuse_relevance: "high", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (f:ReusableFunction {id: row.function_id})
MERGE (u)-[r:NEEDS_FUNCTION]->(f)
SET r.importance = row.importance,
    r.reuse_relevance = row.reuse_relevance,
    r.function_status_for_use_case = row.status,
    r.confidence = row.confidence,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_1";

// -----------------------------------------------------------------------------
// Partial variants: voicebot and internal/staff product-knowledge assistant
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_RBUA_RBCZ_VOICEBOT", function_id: "FUNC_ESCALATE_TO_HUMAN", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S3"},
  {use_case_id: "UC_RBUA_RBCZ_VOICEBOT", function_id: "FUNC_LOG_INTERACTION", importance: "required", reuse_relevance: "high", status: "partial", confidence: "inferred", source_tag: "S2|S13"},
  {use_case_id: "UC_RBUA_RBCZ_VOICEBOT", function_id: "FUNC_APPLY_RESPONSE_GUARDRAILS", importance: "required", reuse_relevance: "medium", status: "partial", confidence: "inferred", source_tag: "S5"},
  {use_case_id: "UC_RBUA_RBCZ_VOICEBOT", function_id: "FUNC_RETRIEVE_PRODUCT_KNOWLEDGE", importance: "optional", reuse_relevance: "medium", status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},

  {use_case_id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT", function_id: "FUNC_RETRIEVE_PRODUCT_KNOWLEDGE", importance: "required", reuse_relevance: "high", status: "available", confidence: "inferred", source_tag: "S5"},
  {use_case_id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT", function_id: "FUNC_APPLY_RESPONSE_GUARDRAILS", importance: "required", reuse_relevance: "medium", status: "available", confidence: "inferred", source_tag: "S5"},
  {use_case_id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT", function_id: "FUNC_LOG_INTERACTION", importance: "optional", reuse_relevance: "medium", status: "partial", confidence: "inferred", source_tag: "S2|S7|S13"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (f:ReusableFunction {id: row.function_id})
MERGE (u)-[r:NEEDS_FUNCTION]->(f)
SET r.importance = row.importance,
    r.reuse_relevance = row.reuse_relevance,
    r.function_status_for_use_case = row.status,
    r.confidence = row.confidence,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_1";

// -----------------------------------------------------------------------------
// Knowledge dependencies used for answer grounding and retrieval
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_ADAM_TB", knowledge_id: "KB_PRODUCT_FAQ", usage_type: "grounding", approval_status: "approved", localization: "local", confidence: "publicly_observed", source_tag: "S10"},
  {use_case_id: "UC_ADAM_TB", knowledge_id: "KB_DIGITAL_HELP", usage_type: "retrieval", approval_status: "approved", localization: "local", confidence: "inferred", source_tag: "S10"},
  {use_case_id: "UC_ADAM_TB", knowledge_id: "KB_LOCALIZED_ASSISTANT_CONTENT", usage_type: "grounding", approval_status: "local_only", localization: "local", confidence: "inferred", source_tag: "S10"},

  {use_case_id: "UC_RAIA_KOSOVO", knowledge_id: "KB_DIGITAL_HELP", usage_type: "retrieval", approval_status: "approved", localization: "local", confidence: "publicly_observed", source_tag: "S10|S11"},
  {use_case_id: "UC_RAIA_KOSOVO", knowledge_id: "KB_LOCALIZED_ASSISTANT_CONTENT", usage_type: "grounding", approval_status: "local_only", localization: "local", confidence: "publicly_observed", source_tag: "S10|S11"},

  {use_case_id: "UC_RAIA_BOSNIA", knowledge_id: "KB_PRODUCT_FAQ", usage_type: "grounding", approval_status: "approved", localization: "local", confidence: "publicly_observed", source_tag: "S10"},
  {use_case_id: "UC_RAIA_BOSNIA", knowledge_id: "KB_LOCALIZED_ASSISTANT_CONTENT", usage_type: "grounding", approval_status: "local_only", localization: "local", confidence: "publicly_observed", source_tag: "S10"},

  {use_case_id: "UC_RAIA_CROATIA", knowledge_id: "KB_PRODUCT_FAQ", usage_type: "grounding", approval_status: "needs_review", localization: "local", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_RAIA_CROATIA", knowledge_id: "KB_LOCALIZED_ASSISTANT_CONTENT", usage_type: "grounding", approval_status: "needs_review", localization: "local", confidence: "hypothetical_demo", source_tag: "DEMO"},

  {use_case_id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT", knowledge_id: "KB_PRODUCT_FAQ", usage_type: "retrieval", approval_status: "approved", localization: "group", confidence: "inferred", source_tag: "S5"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (k:KnowledgeBase {id: row.knowledge_id})
MERGE (u)-[r:USES_KNOWLEDGE]->(k)
SET r.usage_type = row.usage_type,
    r.approval_status = row.approval_status,
    r.localization = row.localization,
    r.confidence = row.confidence,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_1";

// -----------------------------------------------------------------------------
// Direct system dependencies relevant to Story 1 assistant reuse
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_ADAM_TB", system_id: "SYS_MOBILE_BANKING", usage_type: "channel", criticality: "high", integration_status: "available", confidence: "publicly_observed", source_tag: "S10|S12"},
  {use_case_id: "UC_ADAM_TB", system_id: "SYS_CONTENT_SAFETY", usage_type: "runtime", criticality: "high", integration_status: "available", confidence: "inferred", source_tag: "S5"},
  {use_case_id: "UC_ADAM_TB", system_id: "SYS_PRODUCT_CATALOGUE", usage_type: "read", criticality: "medium", integration_status: "partial", confidence: "hypothetical_demo", source_tag: "DEMO"},

  {use_case_id: "UC_RAIA_KOSOVO", system_id: "SYS_PUBLIC_WEBSITE", usage_type: "channel", criticality: "high", integration_status: "available", confidence: "publicly_observed", source_tag: "S10|S11"},
  {use_case_id: "UC_RAIA_KOSOVO", system_id: "SYS_CONTENT_SAFETY", usage_type: "runtime", criticality: "high", integration_status: "available", confidence: "inferred", source_tag: "S5"},

  {use_case_id: "UC_RAIA_BOSNIA", system_id: "SYS_PUBLIC_WEBSITE", usage_type: "channel", criticality: "high", integration_status: "available", confidence: "publicly_observed", source_tag: "S10"},
  {use_case_id: "UC_RAIA_BOSNIA", system_id: "SYS_CONTENT_SAFETY", usage_type: "runtime", criticality: "high", integration_status: "available", confidence: "inferred", source_tag: "S5"},

  {use_case_id: "UC_RAIA_CROATIA", system_id: "SYS_PUBLIC_WEBSITE", usage_type: "channel", criticality: "high", integration_status: "planned", confidence: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_RAIA_CROATIA", system_id: "SYS_CONTENT_SAFETY", usage_type: "runtime", criticality: "high", integration_status: "planned", confidence: "hypothetical_demo", source_tag: "DEMO"},

  {use_case_id: "UC_RBUA_RBCZ_VOICEBOT", system_id: "SYS_CONTENT_SAFETY", usage_type: "runtime", criticality: "medium", integration_status: "partial", confidence: "inferred", source_tag: "S5"},

  {use_case_id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT", system_id: "SYS_INTERNAL_GENAI_PLATFORM", usage_type: "runtime", criticality: "high", integration_status: "available", confidence: "publicly_observed", source_tag: "S5"},
  {use_case_id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT", system_id: "SYS_CONTENT_SAFETY", usage_type: "runtime", criticality: "high", integration_status: "available", confidence: "publicly_observed", source_tag: "S5"},
  {use_case_id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT", system_id: "SYS_PRODUCT_CATALOGUE", usage_type: "read", criticality: "medium", integration_status: "partial", confidence: "inferred", source_tag: "S5|DEMO"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (s:System {id: row.system_id})
MERGE (u)-[r:USES_SYSTEM]->(s)
SET r.usage_type = row.usage_type,
    r.criticality = row.criticality,
    r.integration_status = row.integration_status,
    r.confidence = row.confidence,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_1";

// -----------------------------------------------------------------------------
// Risk triggers for customer-facing and authenticated-channel assistants
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_ADAM_TB", risk_id: "RISK_CUSTOMER_FACING_GENAI", trigger_strength: "high", evidence_status: "observed", source_tag: "S10"},
  {use_case_id: "UC_ADAM_TB", risk_id: "RISK_AUTHENTICATED_CHANNEL", trigger_strength: "high", evidence_status: "observed", source_tag: "S10|S12"},
  {use_case_id: "UC_RAIA_KOSOVO", risk_id: "RISK_CUSTOMER_FACING_GENAI", trigger_strength: "high", evidence_status: "observed", source_tag: "S10|S11"},
  {use_case_id: "UC_RAIA_BOSNIA", risk_id: "RISK_CUSTOMER_FACING_GENAI", trigger_strength: "high", evidence_status: "observed", source_tag: "S10"},
  {use_case_id: "UC_RAIA_CROATIA", risk_id: "RISK_CUSTOMER_FACING_GENAI", trigger_strength: "high", evidence_status: "hypothetical_demo", source_tag: "DEMO"},
  {use_case_id: "UC_RBUA_RBCZ_VOICEBOT", risk_id: "RISK_CUSTOMER_FACING_GENAI", trigger_strength: "medium", evidence_status: "assumed", source_tag: "S3"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (rt:RiskTrigger {id: row.risk_id})
MERGE (u)-[r:HAS_RISK_TRIGGER]->(rt)
SET r.trigger_strength = row.trigger_strength,
    r.evidence_status = row.evidence_status,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_1";

// -----------------------------------------------------------------------------
// Required controls for Story 1 assistant patterns
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_ADAM_TB", control_id: "CTRL_CONTENT_SAFETY", requirement_level: "mandatory", source: "risk_trigger"},
  {use_case_id: "UC_ADAM_TB", control_id: "CTRL_OUTPUT_GROUNDING", requirement_level: "mandatory", source: "architecture"},
  {use_case_id: "UC_ADAM_TB", control_id: "CTRL_HUMAN_HANDOFF", requirement_level: "mandatory", source: "demo_rule"},
  {use_case_id: "UC_ADAM_TB", control_id: "CTRL_AUDIT_LOGGING", requirement_level: "mandatory", source: "architecture"},

  {use_case_id: "UC_RAIA_KOSOVO", control_id: "CTRL_CONTENT_SAFETY", requirement_level: "mandatory", source: "risk_trigger"},
  {use_case_id: "UC_RAIA_KOSOVO", control_id: "CTRL_OUTPUT_GROUNDING", requirement_level: "mandatory", source: "architecture"},
  {use_case_id: "UC_RAIA_KOSOVO", control_id: "CTRL_HUMAN_HANDOFF", requirement_level: "mandatory", source: "demo_rule"},
  {use_case_id: "UC_RAIA_KOSOVO", control_id: "CTRL_AUDIT_LOGGING", requirement_level: "mandatory", source: "architecture"},

  {use_case_id: "UC_RAIA_BOSNIA", control_id: "CTRL_CONTENT_SAFETY", requirement_level: "mandatory", source: "risk_trigger"},
  {use_case_id: "UC_RAIA_BOSNIA", control_id: "CTRL_OUTPUT_GROUNDING", requirement_level: "mandatory", source: "architecture"},
  {use_case_id: "UC_RAIA_BOSNIA", control_id: "CTRL_HUMAN_HANDOFF", requirement_level: "mandatory", source: "demo_rule"},
  {use_case_id: "UC_RAIA_BOSNIA", control_id: "CTRL_AUDIT_LOGGING", requirement_level: "mandatory", source: "architecture"},

  {use_case_id: "UC_RAIA_CROATIA", control_id: "CTRL_CONTENT_SAFETY", requirement_level: "mandatory", source: "risk_trigger"},
  {use_case_id: "UC_RAIA_CROATIA", control_id: "CTRL_OUTPUT_GROUNDING", requirement_level: "mandatory", source: "architecture"},
  {use_case_id: "UC_RAIA_CROATIA", control_id: "CTRL_HUMAN_HANDOFF", requirement_level: "mandatory", source: "demo_rule"},
  {use_case_id: "UC_RAIA_CROATIA", control_id: "CTRL_AUDIT_LOGGING", requirement_level: "mandatory", source: "architecture"},

  {use_case_id: "UC_RBUA_RBCZ_VOICEBOT", control_id: "CTRL_CONTENT_SAFETY", requirement_level: "recommended", source: "risk_trigger"},
  {use_case_id: "UC_RBUA_RBCZ_VOICEBOT", control_id: "CTRL_HUMAN_HANDOFF", requirement_level: "mandatory", source: "demo_rule"},
  {use_case_id: "UC_RBUA_RBCZ_VOICEBOT", control_id: "CTRL_AUDIT_LOGGING", requirement_level: "mandatory", source: "architecture"},

  {use_case_id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT", control_id: "CTRL_CONTENT_SAFETY", requirement_level: "recommended", source: "architecture"},
  {use_case_id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT", control_id: "CTRL_OUTPUT_GROUNDING", requirement_level: "mandatory", source: "architecture"},
  {use_case_id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT", control_id: "CTRL_AUDIT_LOGGING", requirement_level: "recommended", source: "architecture"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (c:Control {id: row.control_id})
MERGE (u)-[r:REQUIRES_CONTROL]->(c)
SET r.requirement_level = row.requirement_level,
    r.source = row.source,
    r.created_for_story = "story_1";

// -----------------------------------------------------------------------------
// Blueprint fit: strong candidates and partial channel/staff variants
// -----------------------------------------------------------------------------
UNWIND [
  {use_case_id: "UC_ADAM_TB", fit_strength: "high", rationale: "Shares core assistant functions, customer-facing channel pattern, grounded knowledge, and control needs.", evidence_status: "observed", source_tag: "S10"},
  {use_case_id: "UC_RAIA_KOSOVO", fit_strength: "high", rationale: "Shares core assistant functions, customer-facing channel pattern, grounded knowledge, and control needs.", evidence_status: "observed", source_tag: "S10|S11"},
  {use_case_id: "UC_RAIA_BOSNIA", fit_strength: "high", rationale: "Shares core assistant functions, customer-facing channel pattern, grounded knowledge, and control needs.", evidence_status: "observed", source_tag: "S10"},
  {use_case_id: "UC_RAIA_CROATIA", fit_strength: "high", rationale: "Hypothetical RAIA-style variant sharing the same core functions, knowledge pattern, and controls.", evidence_status: "hypothetical_demo", source_tag: "DEMO"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (bp:Blueprint {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT_BLUEPRINT"})
MERGE (u)-[r:CANDIDATE_FOR]->(bp)
SET r.fit_strength = row.fit_strength,
    r.rationale = row.rationale,
    r.evidence_status = row.evidence_status,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_1";

UNWIND [
  {use_case_id: "UC_RBUA_RBCZ_VOICEBOT", variant_type: "voice_variant", fit_strength: "medium", rationale: "Shares handoff, logging, and guardrail needs but differs by voice channel and conversational constraints.", source_tag: "S3"},
  {use_case_id: "UC_RETAIL_PRODUCT_KNOWLEDGE_YGPT", variant_type: "internal_staff_variant", fit_strength: "medium", rationale: "Shares product knowledge retrieval and grounding but is staff-facing rather than customer-facing.", source_tag: "S5"}
] AS row
MATCH (u:UseCase {id: row.use_case_id})
MATCH (bp:Blueprint {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT_BLUEPRINT"})
MERGE (u)-[r:PARTIAL_VARIANT_OF]->(bp)
SET r.variant_type = row.variant_type,
    r.fit_strength = row.fit_strength,
    r.rationale = row.rationale,
    r.source_tag = row.source_tag,
    r.created_for_story = "story_1";

// -----------------------------------------------------------------------------
// Blueprint components derived from shared Story 1 assistant patterns
// -----------------------------------------------------------------------------
UNWIND [
  {function_id: "FUNC_RETRIEVE_PRODUCT_KNOWLEDGE", component_role: "core", priority: "high"},
  {function_id: "FUNC_RETRIEVE_DIGITAL_HELP", component_role: "core", priority: "high"},
  {function_id: "FUNC_ESCALATE_TO_HUMAN", component_role: "core", priority: "high"},
  {function_id: "FUNC_LOG_INTERACTION", component_role: "core", priority: "high"},
  {function_id: "FUNC_APPLY_RESPONSE_GUARDRAILS", component_role: "core", priority: "high"}
] AS row
MATCH (bp:Blueprint {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT_BLUEPRINT"})
MATCH (f:ReusableFunction {id: row.function_id})
MERGE (bp)-[r:INCLUDES_FUNCTION]->(f)
SET r.component_role = row.component_role,
    r.priority = row.priority,
    r.created_for_story = "story_1";

UNWIND [
  {control_id: "CTRL_CONTENT_SAFETY", control_role: "mandatory", applies_to_variant: "customer_facing"},
  {control_id: "CTRL_OUTPUT_GROUNDING", control_role: "mandatory", applies_to_variant: "all"},
  {control_id: "CTRL_HUMAN_HANDOFF", control_role: "mandatory", applies_to_variant: "customer_facing"},
  {control_id: "CTRL_AUDIT_LOGGING", control_role: "mandatory", applies_to_variant: "all"}
] AS row
MATCH (bp:Blueprint {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT_BLUEPRINT"})
MATCH (c:Control {id: row.control_id})
MERGE (bp)-[r:INCLUDES_CONTROL]->(c)
SET r.control_role = row.control_role,
    r.applies_to_variant = row.applies_to_variant,
    r.created_for_story = "story_1";

UNWIND [
  {channel_id: "CH_MOBILE_APP", channel_role: "core", access_context: "authenticated"},
  {channel_id: "CH_PUBLIC_WEBSITE", channel_role: "core", access_context: "public"},
  {channel_id: "CH_INTERNET_BANKING", channel_role: "optional", access_context: "authenticated"},
  {channel_id: "CH_VOICE", channel_role: "variant", access_context: "public"},
  {channel_id: "CH_INTERNAL_GENAI_PLATFORM", channel_role: "variant", access_context: "internal"}
] AS row
MATCH (bp:Blueprint {id: "BP_RETAIL_CONVERSATIONAL_ASSISTANT_BLUEPRINT"})
MATCH (ch:Channel {id: row.channel_id})
MERGE (bp)-[r:INCLUDES_CHANNEL_PATTERN]->(ch)
SET r.channel_role = row.channel_role,
    r.access_context = row.access_context,
    r.created_for_story = "story_1";
