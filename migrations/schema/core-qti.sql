CREATE TABLE AssessmentTest (
    id INT PRIMARY KEY,
    identifier VARCHAR(255),
    title VARCHAR(255),
    class VARCHAR(255),
    tool_name VARCHAR(255),
    tool_version VARCHAR(255),
    dataExtension TEXT,
    qti_context_declaration TEXT,
    qti_outcome_declaration TEXT,
    qti_time_limits VARCHAR(255),
    qti_stylesheet TEXT,
    qti_rubric_block TEXT,
    qti_test_part TEXT,
    qti_outcome_processing TEXT,
    qti_test_feedback TEXT
);

CREATE TABLE AssessmentStimulus (
    id INT PRIMARY KEY,
    identifier VARCHAR(255),
    title VARCHAR(255),
    label VARCHAR(255),
    language VARCHAR(255),
    tool_name VARCHAR(255),
    tool_version VARCHAR(255),
    dataExtension TEXT,
    qti_stylesheet TEXT,
    qti_stimulus_body TEXT,
    qti_catalog_info TEXT
);

CREATE TABLE AssessmentSection (
    id INT PRIMARY KEY,
    identifier VARCHAR(255),
    required BOOLEAN,
    fixed BOOLEAN,
    title VARCHAR(255),
    class VARCHAR(255),
    visible BOOLEAN,
    keep_together BOOLEAN,
    dataExtension TEXT,
    qti_pre_condition TEXT,
    qti_branch_rule TEXT,
    qti_item_session_control TEXT,
    qti_time_limits VARCHAR(255),
    adaptive BOOLEAN,
    qti_rubric_block TEXT,
    sectionPart TEXT
);

CREATE TABLE AssessmentItem (
    id INT PRIMARY KEY,
    identifier VARCHAR(255),
    title VARCHAR(255),
    label VARCHAR(255),
    language VARCHAR(255),
    tool_name VARCHAR(255),
    tool_version VARCHAR(255),
    adaptive BOOLEAN,
    time_dependent BOOLEAN,
    dataExtension TEXT,
    qti_context_declaration TEXT,
    qti_response_declaration TEXT,
    qti_outcome_declaration TEXT,
    qti_template_declaration TEXT,
    qti_template_processing TEXT,
    qti_assessment_stimulus_ref VARCHAR(255),
    qti_companion_materials_info TEXT,
    qti_stylesheet TEXT,
    qti_item_body TEXT,
    qti_catalog_info TEXT,
    qti_response_processing TEXT,
    qti_modal_feedback TEXT
);

CREATE TABLE OutcomeDeclaration (
    id INT PRIMARY KEY,
    identifier VARCHAR(255),
    cardinality VARCHAR(255),
    base_type VARCHAR(255),
    view VARCHAR(255),
    interpretation TEXT,
    long_interpretation TEXT,
    normal_maximum DECIMAL,
    normal_minimum DECIMAL,
    mastery_value DECIMAL,
    external_scored BOOLEAN,
    variable_identifier_ref VARCHAR(255)
);

CREATE TABLE OutcomeProcessing (
    id INT PRIMARY KEY,
    outcomeRule TEXT
);

CREATE TABLE OutcomeRule (
    id INT PRIMARY KEY,
    qti_lookup_outcome_value TEXT,
    qti_outcome_processing_fragment TEXT,
    qti_set_outcome_value TEXT,
    include TEXT,
    qti_exit_test TEXT,
    qti_outcome_condition TEXT
);