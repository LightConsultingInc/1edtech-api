/* SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO"; */
/* SET AUTOCOMMIT = 0; */
/* START TRANSACTION; */
/* SET time_zone = "+00:00"; */

-- --------------------------------------------------------

--
-- Table structure for table `AssessmentResultDType` generated from model 'AssessmentResultDType'
-- An Assessment Result is used to report the results of a candidate&#39;s interaction with a test and/or one or more items attempted. Information about the test is optional, in some systems it may be possible to interact with items that are not organized into a test at all. For example, items that are organized with learning resources and presented individually in a formative context. 
--

CREATE TABLE IF NOT EXISTS `AssessmentResultDType` (
  `context` TEXT DEFAULT NULL,
  `testResult` TEXT DEFAULT NULL,
  `itemResult` TEXT DEFAULT NULL COMMENT 'When a test result is given the following item results must relate only to items that were selected for presentation as part of the corresponding test session. Furthermore, all items selected for presentation should be reported with a corresponding itemResult. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='An Assessment Result is used to report the results of a candidate&#39;s interaction with a test and/or one or more items attempted. Information about the test is optional, in some systems it may be possible to interact with items that are not organized into a test at all. For example, items that are organized with learning resources and presented individually in a formative context. ';

--
-- Table structure for table `CandidateResponseDType` generated from model 'CandidateResponseDType'
-- The response given by the candidate. 
--

CREATE TABLE IF NOT EXISTS `CandidateResponseDType` (
  `value` TEXT DEFAULT NULL COMMENT 'The value(s) of the response variable. A NULL value, resulting from no response, is indicated by the absence of any value. The order of the values is significant only if the response was declared with ordered cardinality. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The response given by the candidate. ';

--
-- Table structure for table `ContextDType` generated from model 'ContextDType'
-- This is the context for the &#39;assessmentResult&#39;. It provides the corresponding set of identifiers. 
--

CREATE TABLE IF NOT EXISTS `ContextDType` (
  `sourcedId` TEXT DEFAULT NULL COMMENT 'A unique identifier for the test candidate. Model Primitive Datatype &#x3D; NCName.',
  `sessionIdentifiers` TEXT DEFAULT NULL COMMENT 'The system that creates the result (for example, the test delivery system) should assign a session identifier that it can use to identify the session. Subsequent systems that process the result might assign their own identifier to the session which should be added to the context if the result is modified and exported for transport again. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the context for the &#39;assessmentResult&#39;. It provides the corresponding set of identifiers. ';

--
-- Table structure for table `CorrectResponseDType` generated from model 'CorrectResponseDType'
-- The correct response may be output as part of the report if desired. Systems are not limited to reporting correct responses declared in responseDeclarations. For example, a correct response may be set by a templateRule or may simply have been suppressed from the declaration passed to the delivery engine e.g. for security. 
--

CREATE TABLE IF NOT EXISTS `CorrectResponseDType` (
  `interpretation` TEXT DEFAULT NULL COMMENT 'A human readable interpretation of the correct value. Model Primitive Datatype &#x3D; String.',
  `value` TEXT DEFAULT NULL COMMENT 'The order of the values is signficant only when the response is of ordered cardinality. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The correct response may be output as part of the report if desired. Systems are not limited to reporting correct responses declared in responseDeclarations. For example, a correct response may be set by a templateRule or may simply have been suppressed from the declaration passed to the delivery engine e.g. for security. ';

--
-- Table structure for table `CreateSectionResponseBodyDType` generated from model 'CreateSectionResponseBodyDType'
-- The response code for when the new Section has been created in the CAT Engine and the associated identifier has been returned. 
--

CREATE TABLE IF NOT EXISTS `CreateSectionResponseBodyDType` (
  `sectionIdentifier` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NCName.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The response code for when the new Section has been created in the CAT Engine and the associated identifier has been returned. ';

--
-- Table structure for table `CreateSessionResponseBodyDType` generated from model 'CreateSessionResponseBodyDType'
-- The response code for when the new Session has been created in the CAT Engine and the associated identifier has been returned. The response message consists of the identifier allocated to the session, the initial set of Items to be presented and the session state to be used for later requests. 
--

CREATE TABLE IF NOT EXISTS `CreateSessionResponseBodyDType` (
  `sessionIdentifier` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NCName.',
  `nextItems` TEXT DEFAULT NULL,
  `sessionState` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The response code for when the new Session has been created in the CAT Engine and the associated identifier has been returned. The response message consists of the identifier allocated to the session, the initial set of Items to be presented and the session state to be used for later requests. ';

--
-- Table structure for table `GetSectionResponseBodyDType` generated from model 'GetSectionResponseBodyDType'
-- The response code for when the list of Items in the section&#39;s item pool has been returned. The response message contains the list of Items, the section configuration used to create the section, and any qtiUsagedata and qtiMetadata used to create the section. 
--

CREATE TABLE IF NOT EXISTS `GetSectionResponseBodyDType` (
  `items` TEXT DEFAULT NULL,
  `section` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The response code for when the list of Items in the section&#39;s item pool has been returned. The response message contains the list of Items, the section configuration used to create the section, and any qtiUsagedata and qtiMetadata used to create the section. ';

--
-- Table structure for table `imsx_CodeMinorDType` generated from model 'imsxUnderscoreCodeMinorDType'
-- This is the container for the set of code minor status codes reported in the responses from the Service Provider. 
--

CREATE TABLE IF NOT EXISTS `imsx_CodeMinorDType` (
  `imsx_codeMinorField` TEXT NOT NULL COMMENT 'Each reported code minor status code. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the set of code minor status codes reported in the responses from the Service Provider. ';

--
-- Table structure for table `imsx_CodeMinorFieldDType` generated from model 'imsxUnderscoreCodeMinorFieldDType'
-- This is the container for a single code minor status code. 
--

CREATE TABLE IF NOT EXISTS `imsx_CodeMinorFieldDType` (
  `imsx_codeMinorFieldName` TEXT NOT NULL COMMENT 'This should contain the identity of the system that has produced the code minor status code report. Model Primitive Datatype &#x3D; NormalizedString.',
  `imsx_codeMinorFieldValue` ENUM('fullsuccess', 'forbidden', 'invaliddata', 'unauthorisedrequest', 'internal_server_error', 'server_busy', 'unknownobject') NOT NULL COMMENT 'The code minor status code (this is a value from the corresponding enumerated vocabulary). '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a single code minor status code. ';

--
-- Table structure for table `imsx_StatusInfoDType` generated from model 'imsxUnderscoreStatusInfoDType'
-- This is the container for the status code and associated information returned within the HTTP messages received from the Service Provider. 
--

CREATE TABLE IF NOT EXISTS `imsx_StatusInfoDType` (
  `imsx_codeMajor` ENUM('success', 'processing', 'failure', 'unsupported') NOT NULL COMMENT 'The code major value (from the corresponding enumerated vocabulary). ',
  `imsx_severity` ENUM('status', 'warning', 'error') NOT NULL COMMENT 'The severity value (from the corresponding enumerated vocabulary). ',
  `imsx_description` TEXT DEFAULT NULL COMMENT 'A human readable description supplied by the entity creating the status code information. Model Primitive Datatype &#x3D; String.',
  `imsx_codeMinor` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the status code and associated information returned within the HTTP messages received from the Service Provider. ';

--
-- Table structure for table `ItemResultDType` generated from model 'ItemResultDType'
-- The result of an item session is reported with an itemResult. A report may contain multiple results for the same instance of an item representing multiple attempts, progression through an adaptive item or even more detailed tracking. In these cases, each item result must have a different datestamp. 
--

CREATE TABLE IF NOT EXISTS `ItemResultDType` (
  `identifier` TEXT NOT NULL COMMENT 'The identifier of the item for which this is a result. For item results that are reported as part of a test result this is the identifier used to refer to the item in the test (see assessmentItemRef). For item results that are reported on their own, this can be any suitable identifier for the item. Where possible, the value should match the identifier attribute on the associated assessmentItem. Model Primitive Datatype &#x3D; NCName.',
  `sequenceIndex` INT UNSIGNED DEFAULT NULL COMMENT 'For item results that are reported as part of a test, this attribute must be used to indicate the position of the item within the specific instance of the test. The first item of the first part of the test is defined to have sequence index 1. Model Primitive Datatype &#x3D; NonNegativeInteger.',
  `datestamp` DATETIME NOT NULL COMMENT 'The date stamp of when this result was recorded. Model Primitive Datatype &#x3D; DateTime.',
  `sessionStatus` ENUM('final', 'initial', 'pendingResponseProcessing', 'pendingSubmission') NOT NULL COMMENT 'The session status is used to interpret the values of the item variables. See the sessionStatus vocabulary. ',
  `responseVariables` TEXT DEFAULT NULL COMMENT 'Indicates that a Response Variable is being reported. This is the value of one of the responses associated with an Item in the corresponding ASI instance. ',
  `templateVariables` TEXT DEFAULT NULL COMMENT 'Indicates that a Template Variable is being reported. This is the value of one of the template variables associated with an Item in the corresponding ASI instance. ',
  `outcomeVariables` TEXT DEFAULT NULL COMMENT 'Indicates that an Outcome Variable is being reported. This is the value of one of the outcomes associated with either an Item or Test and defined in the corresponding ASI instance. ',
  `candidateComment` TEXT DEFAULT NULL COMMENT 'An optional comment supplied by the candidate (see the allowComment in the ASI documentation [QTI, 20a]). Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The result of an item session is reported with an itemResult. A report may contain multiple results for the same instance of an item representing multiple attempts, progression through an adaptive item or even more detailed tracking. In these cases, each item result must have a different datestamp. ';

--
-- Table structure for table `ItemSetDType` generated from model 'ItemSetDType'
-- A set of Item identfiers. 
--

CREATE TABLE IF NOT EXISTS `ItemSetDType` (
  `itemIdentifiers` TEXT NOT NULL COMMENT 'The Identifiers for the set of Items. These should be the GUIDs that have been assigned to AssessmentItems when defined using IMS QTI. Model Primitive Datatype &#x3D; NCName. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='A set of Item identfiers. ';

--
-- Table structure for table `KeyValuePairDType` generated from model 'KeyValuePairDType'
-- The container for the values assigned to the Key/Value pair. 
--

CREATE TABLE IF NOT EXISTS `KeyValuePairDType` (
  `glossaryURI` TEXT DEFAULT NULL COMMENT 'This is a URI to the definition of the data being supplied in this accompanying key/value pair. This definition should provide a human readable description of the data-type and value space for the value being identified by its key.  Model Primitive Datatype &#x3D; AnyURI.',
  `key` TEXT NOT NULL COMMENT 'The key for the value to be supplied. Model Primitive Datatype &#x3D; String.',
  `value` TEXT NOT NULL COMMENT 'The value being supplied. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the values assigned to the Key/Value pair. ';

--
-- Table structure for table `NextItemSetDType` generated from model 'NextItemSetDType'
-- The container for the information about the set of next Items that should be presented to the examinee. 
--

CREATE TABLE IF NOT EXISTS `NextItemSetDType` (
  `itemIdentifiers` TEXT NOT NULL COMMENT 'The Identifiers for the set of Items that should be presented next. These should be the GUIDs that have been assigned to AssessmentItems when defined using IMS QTI. Model Primitive Datatype &#x3D; NCName. ',
  `stageLength` INT UNSIGNED DEFAULT NULL COMMENT 'The (minimum) number of items the CAT Engine can present before requesting next items Model Primitive Datatype &#x3D; NonNegativeInteger.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the information about the set of next Items that should be presented to the examinee. ';

--
-- Table structure for table `OutcomeVariableDType` generated from model 'OutcomeVariableDType'
-- The Item result information related to an &#39;Outcome Variable&#39;. 
--

CREATE TABLE IF NOT EXISTS `OutcomeVariableDType` (
  `identifier` TEXT NOT NULL COMMENT 'The identifier of the Outcome Variable. Model Primitive Datatype &#x3D; NCName.',
  `cardinality` ENUM('multiple', 'ordered', 'record', 'single') NOT NULL COMMENT 'The cardinality of the Outcome Variable, taken from the corresponding declaration or definition. ',
  `baseType` ENUM('boolean', 'directedPair', 'duration', 'file', 'float', 'identifier', 'integer', 'pair', 'point', 'string', 'uri') DEFAULT NULL COMMENT 'The base type of the Outcome Variable, taken from the corresponding declaration of definition. This value is omitted only for variables with record cardinality. ',
  `view` TEXT DEFAULT NULL COMMENT 'The views (if any) declared for the outcome must be copied to the report to enable systems that render the report to hide information not relevant in a specific situation. If no values are given, the outcome&#39;s value should be considered relevant in all views. ',
  `interpretation` TEXT DEFAULT NULL COMMENT 'A human readable interpretation of the default value. Model Primitive Datatype &#x3D; String.',
  `longInterpretation` TEXT DEFAULT NULL COMMENT 'An optional link to an extended interpretation of the outcome variable&#39;s value. Model Primitive Datatype &#x3D; AnyURI.',
  `normalMaximum` DECIMAL(20, 9) DEFAULT NULL COMMENT 'The normalMaximum attribute optionally defines the maximum magnitude of numeric outcome variables, it must be a positive value. If given, the outcome&#39;s value can be divided by normalMaximum and then truncated (if necessary) to obtain a normalized score in the range [-1.0,1.0]. normalMaximum has no affect on responseProcessing or the values that the outcome variable itself can take. Model Primitive Datatype &#x3D; Double.',
  `normalMinimum` DECIMAL(20, 9) DEFAULT NULL COMMENT 'The normalMinimum attribute optionally defines the minimum value of numeric outcome variables, it may be negative. Model Primitive Datatype &#x3D; Double.',
  `masteryValue` DECIMAL(20, 9) DEFAULT NULL COMMENT 'The masteryValue attribute optionally defines a value for numeric outcome variables above which the aspect being measured is considered to have been mastered by the candidate. Model Primitive Datatype &#x3D; Double.',
  `value` TEXT DEFAULT NULL COMMENT 'The value(s) of the outcome variable. The order of the values is significant only if the outcome was declared with ordered cardinality. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The Item result information related to an &#39;Outcome Variable&#39;. ';

--
-- Table structure for table `PCIContextDType` generated from model 'PCIContextDType'
-- This is the container for the contextual information that can be supplied for a PCI used within an Item. The contained information is only relevant when there is an &#39;interactionType&#39; of &#39;portableCustomInteraction&#39;. 
--

CREATE TABLE IF NOT EXISTS `PCIContextDType` (
  `customTypeIdentifier` TEXT DEFAULT NULL COMMENT 'This is used alongside an &#39;interactionType&#39; value of &#39;portableCustomInteraction&#39; to disambiguate which class of PCI is in use as PCIs can vary widely in terms of how they might need to be psychometrically analyzed. This field could potentially also be used to identify which type of a traditional customInteraction is in use by the item. Model Primitive Datatype &#x3D; NormalizedString.',
  `interactionKind` TEXT DEFAULT NULL COMMENT 'This is used to provide insight into the nature of the PCI e.g. this is a PCI which allows a user to add notes to a musical stave to author some music that might be given a description of &#39;authoring&#39;. This information could be used by a psychometrician, etc. as an indication of a similar type of standard interaction. Model Primitive Datatype &#x3D; NormalizedString.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the contextual information that can be supplied for a PCI used within an Item. The contained information is only relevant when there is an &#39;interactionType&#39; of &#39;portableCustomInteraction&#39;. ';

--
-- Table structure for table `QTIMetadataDType` generated from model 'QTIMetadataDType'
-- This contains the new category of metadata for the recording of QTI specific information. 
--

CREATE TABLE IF NOT EXISTS `QTIMetadataDType` (
  `itemTemplate` TINYINT(1) DEFAULT NULL COMMENT 'True if the item is actually an item template, in other words, the item changes its appearance based on some random or external factor. An assessmentItem that contains a templateProcessing section. Model Primitive Datatype &#x3D; Boolean.',
  `timeDependent` TINYINT(1) DEFAULT NULL COMMENT 'Whether or not the item is time dependent. A time dependent item takes the length of time taken for an attempt into consideration when scoring. Model Primitive Datatype &#x3D; Boolean.',
  `composite` TINYINT(1) DEFAULT NULL COMMENT 'True if the item comprises more than one interaction, for example, an assessmentItem that contains more than one interaction. Model Primitive Datatype &#x3D; Boolean.',
  `interactionType` TEXT DEFAULT NULL COMMENT 'The interaction type(s) of the item. The vocabulary is comprised of the names, as defined in the information model, of the leaf classes derived from interaction. ',
  `portableCustomInteractionContext` TEXT DEFAULT NULL,
  `feedbackType` ENUM('adaptive', 'nonadaptive', 'none') DEFAULT NULL COMMENT 'Describes the type of feedback, if any, available in the item. If feedback is available then it is described as being non-adaptive or adaptive depending on whether the item is itself adaptive. A non-adaptive item generates feedback based on the responses submitted as part of (the last) attempt only. An adaptive item generates feedback that takes into consideration the path taken through the item, in other words, feedback based on the accumulation of all attempts and not just the last. ',
  `solutionAvailable` TINYINT(1) DEFAULT NULL COMMENT 'Set to true if a model solution is available for the item. For example, an assessmentItem that provides correct responses for all declared response variables. Model Primitive Datatype &#x3D; Boolean.',
  `scoringMode` TEXT DEFAULT NULL COMMENT 'The scoringMode is used to denote that the way in which the scoring is achieved. If the Item includes the response processing then the mode is &#39;responseprocessing&#39;. If human scoring is required the value is &#39;human&#39; and if some form of machine processing is required then the value is &#39;externalmachine&#39;. ',
  `toolName` TEXT DEFAULT NULL COMMENT 'The name of the tool used to author the evaluation object. Model Primitive Datatype &#x3D; String.',
  `toolVersion` TEXT DEFAULT NULL COMMENT 'The version of the tool used to author the evaluation object. Model Primitive Datatype &#x3D; String.',
  `toolVendor` TEXT DEFAULT NULL COMMENT 'The company which produced the tool used to author the evaluation object. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This contains the new category of metadata for the recording of QTI specific information. ';

--
-- Table structure for table `ResponseVariableDType` generated from model 'ResponseVariableDType'
-- The Item result information related to a &#39;Response Variable&#39;. 
--

CREATE TABLE IF NOT EXISTS `ResponseVariableDType` (
  `identifier` TEXT NOT NULL COMMENT 'The identifier of the Response Variable. Model Primitive Datatype &#x3D; NCName.',
  `cardinality` ENUM('multiple', 'ordered', 'record', 'single') NOT NULL COMMENT 'The cardinality of the Response Variable, taken from the corresponding declaration or definition. ',
  `baseType` ENUM('boolean', 'directedPair', 'duration', 'file', 'float', 'identifier', 'integer', 'pair', 'point', 'string', 'uri') DEFAULT NULL COMMENT 'The base type of the Response Variable, taken from the corresponding declaration of definition. This value is omitted only for variables with record cardinality. ',
  `choiceSequence` TEXT DEFAULT NULL COMMENT 'When a response variable is bound to an interaction that supports the shuffling of choices, the sequence of choices experienced by the candidate will vary between test instances. When shuffling is in effect, the sequence of choices should be reported as a sequence of choice identifiers using this attribute. Model Primitive Datatype &#x3D; NCName. ',
  `correctResponse` TEXT DEFAULT NULL,
  `candidateResponse` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The Item result information related to a &#39;Response Variable&#39;. ';

--
-- Table structure for table `ResultsDType` generated from model 'ResultsDType'
-- This is the container for the results that have been accrued by the examinee. These are passed to the CAT Engine to support the selection of the next set of Items. 
--

CREATE TABLE IF NOT EXISTS `ResultsDType` (
  `assessmentResult` TEXT NOT NULL,
  `sessionState` TEXT DEFAULT NULL COMMENT 'The session state information. This is the data that was supplied by the CAT Engine when the session was created or the next set of Items was requested. Model Primitive Datatype &#x3D; NormalizedString.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the results that have been accrued by the examinee. These are passed to the CAT Engine to support the selection of the next set of Items. ';

--
-- Table structure for table `SectionDType` generated from model 'SectionDType'
-- The container for the definition of the Section that is to be created in the CAT Engine. A Section is aligned to a QTI AssessmentSection [QTI, 20a]. 
--

CREATE TABLE IF NOT EXISTS `SectionDType` (
  `qtiMetadata` TEXT DEFAULT NULL,
  `qtiUsagedata` TEXT DEFAULT NULL COMMENT 'This is the Base64 encoded XML conforming to IMS QTI 3.0 Usage Date data model [QTI, 20c]. Model Primitive Datatype &#x3D; String.',
  `sectionConfiguration` TEXT NOT NULL COMMENT 'This is the Base64 encoded data containing section configuration, aligned with adaptive engine (black box). This format will be proprietary to each adaptive CAT Engine. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the definition of the Section that is to be created in the CAT Engine. A Section is aligned to a QTI AssessmentSection [QTI, 20a]. ';

--
-- Table structure for table `SessionDType` generated from model 'SessionDType'
-- This is the container for the session configuration data that must be supplied to the CAT Engine when the session is to be created. 
--

CREATE TABLE IF NOT EXISTS `SessionDType` (
  `personalNeedsAndPreferences` TEXT DEFAULT NULL COMMENT 'This is the Base64 encoded XML data for the Personal Needs and Preferences (PNP) for the examinee.  This data conforms to the XML as defined in the IMS Access for All Personal Needs and Preferences (AfAPNP) 3.0 XML Binding specification [AFAPNP, 20]. Model Primitive Datatype &#x3D; NormalizedString.',
  `demographics` TEXT DEFAULT NULL COMMENT 'The Base64 encoding of the JSON data for the Demographics information for the examinee. This data conforms to the JSON as defined in the IMS OneRoster 1.1 specification [OR, 17]. Model Primitive Datatype &#x3D; NormalizedString.',
  `priorData` TEXT DEFAULT NULL COMMENT 'This is proprietary data that is supplied to the CAT Engine as a key/value pairs. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the session configuration data that must be supplied to the CAT Engine when the session is to be created. ';

--
-- Table structure for table `SessionIdentifierDType` generated from model 'SessionIdentifierDType'
-- The system that creates the result (for example, the test delivery system) should assign a session identifier that it can use to identify the session. 
--

CREATE TABLE IF NOT EXISTS `SessionIdentifierDType` (
  `sourceID` TEXT NOT NULL COMMENT 'A unique identifier of the system which added this identifier to the result. Model Primitive Datatype &#x3D; AnyURI.',
  `identifier` TEXT NOT NULL COMMENT 'The system that creates the report should add a session identifier. Subsequent systems that process the results might use their own identifier for the session and should add this too if the result is exported again for further transport. Model Primitive Datatype &#x3D; NCName.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The system that creates the result (for example, the test delivery system) should assign a session identifier that it can use to identify the session. ';

--
-- Table structure for table `SubmitResultsResponseBodyDType` generated from model 'SubmitResultsResponseBodyDType'
-- The response code for when the next set of Items to be presented to the examinee has been returned. The response message contains the next set of Items, the session state to be used in later requests and, optionally, the assessment results. 
--

CREATE TABLE IF NOT EXISTS `SubmitResultsResponseBodyDType` (
  `nextItems` TEXT DEFAULT NULL,
  `assessmentResult` TEXT DEFAULT NULL,
  `sessionState` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The response code for when the next set of Items to be presented to the examinee has been returned. The response message contains the next set of Items, the session state to be used in later requests and, optionally, the assessment results. ';

--
-- Table structure for table `TemplateVariableDType` generated from model 'TemplateVariableDType'
-- The Item result information related to a &#39;Template Variable&#39;. 
--

CREATE TABLE IF NOT EXISTS `TemplateVariableDType` (
  `identifier` TEXT NOT NULL COMMENT 'The identifier of the Template Variable. Model Primitive Datatype &#x3D; NCName.',
  `cardinality` ENUM('multiple', 'ordered', 'record', 'single') NOT NULL COMMENT 'The cardinality of the Template Variable, taken from the corresponding declaration or definition. ',
  `baseType` ENUM('boolean', 'directedPair', 'duration', 'file', 'float', 'identifier', 'integer', 'pair', 'point', 'string', 'uri') DEFAULT NULL COMMENT 'The base type of the Template Variable, taken from the corresponding declaration of definition. This value is omitted only for variables with record cardinality. ',
  `value` TEXT DEFAULT NULL COMMENT 'The value(s) of the template variable. The order of the values is significant only if the template variable was declared with ordered cardinality. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The Item result information related to a &#39;Template Variable&#39;. ';

--
-- Table structure for table `TestResultDType` generated from model 'TestResultDType'
-- The container for the Test result. When a test result is given the following item results must relate only to items that were selected for presentation as part of the corresponding test session. Furthermore, all items selected for presentation should be reported with a corresponding itemResult. 
--

CREATE TABLE IF NOT EXISTS `TestResultDType` (
  `identifier` TEXT NOT NULL COMMENT 'The identifier of the test for which this is a result. Model Primitive Datatype &#x3D; NCName.',
  `datestamp` DATETIME NOT NULL COMMENT 'The date stamp of when this result was recorded. Model Primitive Datatype &#x3D; DateTime.',
  `responseVariables` TEXT DEFAULT NULL COMMENT 'Indicates that a Response Variable is being reported. This is the value of one of the responses associated with an Item in the corresponding ASI instance [QTI, 20a]. ',
  `templateVariables` TEXT DEFAULT NULL COMMENT 'Indicates that a Template Variable is being reported. This is the value of one of the template variables associated with an Item in the corresponding ASI instance [QTI, 20a]. ',
  `outcomeVariables` TEXT DEFAULT NULL COMMENT 'Indicates that an Outcome Variable is being reported. This is the value of one of the outcomes associated with either an Item or Test and defined in the corresponding ASI instance [QTI, 20a]. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the Test result. When a test result is given the following item results must relate only to items that were selected for presentation as part of the corresponding test session. Furthermore, all items selected for presentation should be reported with a corresponding itemResult. ';

--
-- Table structure for table `ValueDType` generated from model 'ValueDType'
-- A class that can represent a single value of any baseType in variable declarations and result reports. The base-type is defined by the baseType attribute of the declaration except in the case of variables with record cardinality. 
--

CREATE TABLE IF NOT EXISTS `ValueDType` (
  `fieldIdentifier` TEXT DEFAULT NULL COMMENT 'This attribute is only used for specifying the field identifier for a value that forms part of a record. Model Primitive Datatype &#x3D; NCName.',
  `baseType` ENUM('boolean', 'directedPair', 'duration', 'file', 'float', 'identifier', 'integer', 'pair', 'point', 'string', 'uri') DEFAULT NULL COMMENT 'This attribute is only used for specifying the base-type of a value that forms part of a record. ',
  `value` TEXT NOT NULL COMMENT 'The value being supplied. Model Primitive Datatype &#x3D; NormalizedString.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='A class that can represent a single value of any baseType in variable declarations and result reports. The base-type is defined by the baseType attribute of the declaration except in the case of variables with record cardinality. ';


--
-- OAuth2 framework tables
-- Thanks to https://github.com/dsquier/oauth2-server-php-mysql repo
--

--
-- Table structure for table `oauth_clients`
--
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `client_id`            VARCHAR(80)    NOT NULL,
  `client_secret`        VARCHAR(80)    DEFAULT NULL,
  `redirect_uri`         VARCHAR(2000)  DEFAULT NULL,
  `grant_types`          VARCHAR(80)    DEFAULT NULL,
  `scope`                VARCHAR(4000)  DEFAULT NULL,
  `user_id`              VARCHAR(80)    DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `oauth_access_tokens`
--
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `access_token`         VARCHAR(40)    NOT NULL,
  `client_id`            VARCHAR(80)    DEFAULT NULL,
  `user_id`              VARCHAR(80)    DEFAULT NULL,
  `expires`              TIMESTAMP      NOT NULL,
  `scope`                VARCHAR(4000)  DEFAULT NULL,
  PRIMARY KEY (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `oauth_authorization_codes`
--
CREATE TABLE IF NOT EXISTS `oauth_authorization_codes` (
  `authorization_code`  VARCHAR(40)    NOT NULL,
  `client_id`           VARCHAR(80)    DEFAULT NULL,
  `user_id`             VARCHAR(80)    DEFAULT NULL,
  `redirect_uri`        VARCHAR(2000)  NOT NULL,
  `expires`             TIMESTAMP      NOT NULL,
  `scope`               VARCHAR(4000)  DEFAULT NULL,
  `id_token`            VARCHAR(1000)  DEFAULT NULL,
  PRIMARY KEY (`authorization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `oauth_refresh_tokens`
--
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `refresh_token`       VARCHAR(40)    NOT NULL,
  `client_id`           VARCHAR(80)    DEFAULT NULL,
  `user_id`             VARCHAR(80)    DEFAULT NULL,
  `expires`             TIMESTAMP      on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `scope`               VARCHAR(4000)  DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `oauth_users`
--
CREATE TABLE IF NOT EXISTS `oauth_users` (
  `username`            VARCHAR(80)    DEFAULT NULL,
  `password`            VARCHAR(255)   DEFAULT NULL,
  `first_name`          VARCHAR(80)    DEFAULT NULL,
  `last_name`           VARCHAR(80)    DEFAULT NULL,
  `email`               VARCHAR(2000)  DEFAULT NULL,
  `email_verified`      TINYINT(1)     DEFAULT NULL,
  `scope`               VARCHAR(4000)  DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `oauth_scopes`
--
CREATE TABLE IF NOT EXISTS `oauth_scopes` (
  `scope`               VARCHAR(80)  NOT NULL,
  `is_default`          TINYINT(1)   DEFAULT NULL,
  PRIMARY KEY (`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `oauth_jwt`
--
CREATE TABLE IF NOT EXISTS `oauth_jwt` (
  `client_id`           VARCHAR(80)    NOT NULL,
  `subject`             VARCHAR(80)    DEFAULT NULL,
  `public_key`          VARCHAR(2000)  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `oauth_jti`
--
CREATE TABLE IF NOT EXISTS `oauth_jti` (
  `issuer`              VARCHAR(80)    NOT NULL,
  `subject`             VARCHAR(80)    DEFAULT NULL,
  `audience`            VARCHAR(80)    DEFAULT NULL,
  `expires`             TIMESTAMP      NOT NULL,
  `jti`                 VARCHAR(2000)  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `oauth_public_keys`
--
CREATE TABLE IF NOT EXISTS `oauth_public_keys` (
  `client_id`            VARCHAR(80)    DEFAULT NULL,
  `public_key`           VARCHAR(2000)  DEFAULT NULL,
  `private_key`          VARCHAR(2000)  DEFAULT NULL,
  `encryption_algorithm` VARCHAR(100)   DEFAULT 'RS256'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
