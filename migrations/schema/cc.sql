/* SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO"; */
/* SET AUTOCOMMIT = 0; */
/* START TRANSACTION; */
/* SET time_zone = "+00:00"; */

-- --------------------------------------------------------

--
-- Table structure for table `CCLTILink.Type` generated from model 'CCLTILinkPeriodType'
-- The extended set of information used to define the presence of an LTI Link resource (this is based upon the definition for including an LTI link inside an IMS Common Cartridge or IMS Thin Common Cartridge).
--

CREATE TABLE IF NOT EXISTS `CCLTILink.Type` (
  `title` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The human readable title/label for the activity being addressed by the content available through the LTI link.',
  `description` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String. A human readable description of the activity addressed by the content supplied via the LTI link.',
  `custom` TEXT DEFAULT NULL,
  `extensions` TEXT DEFAULT NULL,
  `launch_url` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. The URL for the LTI launch. One of either the launch_url or the secure_launch_url must be specified. It is acceptable to specify both and if both are specified, the Tool Consumer (TC) decides which to use. Typically, the TC will use a secure_launch_url when embedding the Tool in a secure page and the launch_url when embedding the tool in a non-secure page. So, it is important that the Tool Provider (TP) provides the same functionality whether the launch_url or secure_launch_url is used.',
  `secure_launch_url` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. A secure URL for the LTI launch. One of either the launch_url or the secure_launch_url must be specified. It is acceptable to specify both and if both are specified, the Tool Consumer (TC) decides which to use. Typically, the TC will use a secure_launch_url when embedding the Tool in a secure page and the launch_url when embedding the tool in a non-secure page. So, it is important that the Tool Provider (TP) provides the same functionality whether the launch_url or secure_launch_url is used.',
  `icon` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. A URL to an icon for this tool.',
  `secure_icon` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. A secure URL to an icon for this tool.',
  `vendor` TEXT NOT NULL,
  `cartridge_bundle` TEXT DEFAULT NULL,
  `cartridge_icon` TEXT DEFAULT NULL,
  `metadata` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The extended set of information used to define the presence of an LTI Link resource (this is based upon the definition for including an LTI link inside an IMS Common Cartridge or IMS Thin Common Cartridge).';

--
-- Table structure for table `CSMSet.Type` generated from model 'CSMSetPeriodType'
-- This is the is the container for the set of curriculum standards metadata. Each member of the set contains the curriculum standards metadata for a specific source of the GUIDs.
--

CREATE TABLE IF NOT EXISTS `CSMSet.Type` (
  `resourceLabel` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. This is a human readable label used to identify the type of resource, or part of resource, to which the enclosed metadata refers.',
  `resourcePartId` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. This is used to contain the appropriate identifier that is used to identify the resource part.',
  `curriculumStandardsMetadata` TEXT NOT NULL COMMENT 'The curriculum standards associated from a single source of the curriculum standards definition.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the is the container for the set of curriculum standards metadata. Each member of the set contains the curriculum standards metadata for a specific source of the GUIDs.';

--
-- Table structure for table `CurriculumStandardsMetadata.Type` generated from model 'CurriculumStandardsMetadataPeriodType'
-- This is the container for the special metadata for curriculum standards for a particular domain of GUID provider.
--

CREATE TABLE IF NOT EXISTS `CurriculumStandardsMetadata.Type` (
  `providerId` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. This is used to denote the originator of the GUID scheme.',
  `setOfGUIDs` TEXT NOT NULL COMMENT 'The set of curriculum standards GUIDs that apply to the learning associated resource.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the special metadata for curriculum standards for a particular domain of GUID provider.';

--
-- Table structure for table `imsx_CodeMinorField.Type` generated from model 'imsxUnderscoreCodeMinorFieldPeriodType'
-- This is the container for a single code minor status code.
--

CREATE TABLE IF NOT EXISTS `imsx_CodeMinorField.Type` (
  `imsx_codeMinorFieldName` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. This should contain the identity of the system that has produced the code minor status code report.',
  `imsx_codeMinorFieldValue` ENUM('fullsuccess', 'forbidden', 'invalid_query_parameter', 'unauthorisedrequest', 'internal_server_error', 'server_busy', 'invalid_data') NOT NULL COMMENT 'The code minor status code (this is a value from the corresponding enumerated vocabulary).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a single code minor status code.';

--
-- Table structure for table `imsx_CodeMinor.Type` generated from model 'imsxUnderscoreCodeMinorPeriodType'
-- This is the container for the set of code minor status codes reported in the responses from the Service Provider.
--

CREATE TABLE IF NOT EXISTS `imsx_CodeMinor.Type` (
  `imsx_codeMinorField` TEXT NOT NULL COMMENT 'Each reported code minor status code.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the set of code minor status codes reported in the responses from the Service Provider.';

--
-- Table structure for table `imsx_StatusInfo.Type` generated from model 'imsxUnderscoreStatusInfoPeriodType'
-- This is the container for the status code and associated information returned within the HTTP messages received from the Service Provider.
--

CREATE TABLE IF NOT EXISTS `imsx_StatusInfo.Type` (
  `imsx_codeMajor` ENUM('success', 'processing', 'failure', 'unsupported') NOT NULL COMMENT 'The code major value (from the corresponding enumerated vocabulary).',
  `imsx_severity` ENUM('status', 'warning', 'error') NOT NULL COMMENT 'The severity value (from the corresponding enumerated vocabulary).',
  `imsx_description` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String. A human readable description supplied by the entity creating the status code information.',
  `imsx_codeMinor` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the status code and associated information returned within the HTTP messages received from the Service Provider.';

--
-- Table structure for table `LTILinkResourceRef.Type` generated from model 'LTILinkResourceRefPeriodType'
-- The container for the link information.
--

CREATE TABLE IF NOT EXISTS `LTILinkResourceRef.Type` (
  `name` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The name of the type of content supplied by the link.',
  `resourceUri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. The URI for the link.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the link information.';

--
-- Table structure for table `LTILink.Type` generated from model 'LTILinkPeriodType'
-- The container for all of the core information about an LTI Link. 
--

CREATE TABLE IF NOT EXISTS `LTILink.Type` (
  `title` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The human readable title/label for the activity being addressed by the content available through the LTI link.',
  `description` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String. A human readable description of the activity addressed by the content supplied via the LTI link.',
  `custom` TEXT DEFAULT NULL,
  `extensions` TEXT DEFAULT NULL,
  `launch_url` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. The URL for the LTI launch. One of either the launch_url or the secure_launch_url must be specified. It is acceptable to specify both and if both are specified, the Tool Consumer (TC) decides which to use. Typically, the TC will use a secure_launch_url when embedding the Tool in a secure page and the launch_url when embedding the tool in a non-secure page. So, it is important that the Tool Provider (TP) provides the same functionality whether the launch_url or secure_launch_url is used.',
  `secure_launch_url` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. A secure URL for the LTI launch. One of either the launch_url or the secure_launch_url must be specified. It is acceptable to specify both and if both are specified, the Tool Consumer (TC) decides which to use. Typically, the TC will use a secure_launch_url when embedding the Tool in a secure page and the launch_url when embedding the tool in a non-secure page. So, it is important that the Tool Provider (TP) provides the same functionality whether the launch_url or secure_launch_url is used.',
  `icon` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. A URL to an icon for this tool.',
  `secure_icon` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. A secure URL to an icon for this tool.',
  `vendor` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for all of the core information about an LTI Link. ';

--
-- Table structure for table `LabelledGUID.Type` generated from model 'LabelledGUIDPeriodType'
-- The labelled curriculum standard GUID.
--

CREATE TABLE IF NOT EXISTS `LabelledGUID.Type` (
  `label` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. A human readable string to provide a clue about the nature of the curriculum standard.',
  `caseItemURI` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. The corresponding Competency and Academic Standards (CASE) URI. This is the URI used for alignment with the IMS CASE Service 1.0 specification [CASE, 17].',
  `GUID` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The GUID itself.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The labelled curriculum standard GUID.';

--
-- Table structure for table `LearningObjectives.Type` generated from model 'LearningObjectivesPeriodType'
-- The container for the learning objectives which are addressed by the resource.
--

CREATE TABLE IF NOT EXISTS `LearningObjectives.Type` (
  `alignmentType` ENUM('assesses', 'teaches', 'requires', 'textComplexity', 'readingLevel', 'educationalSubject', 'educationLevel') NOT NULL COMMENT 'A category of alignment between the learning resource and the framework node.',
  `educationalFramework` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The framework to which the resource being described is aligned.',
  `targetDescription` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The description of a node in an established educational framework.',
  `targetName` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The name of a node in an established educational framework.',
  `targetURL` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. The URL of a node in an established educational framework.',
  `caseItemUri` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. Reference to a CASE CFItem for a standard or skill [CASE, 17].',
  `caseItemGUID` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. Reference to CASE CFItem as a GUID [CASE, 17].'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the learning objectives which are addressed by the resource.';

--
-- Table structure for table `Metadata.Type` generated from model 'MetadataPeriodType'
-- The container for all of the metadata associated with the LTI link. Currently this metadata is restricted to the set of curriculum standards annotations.
--

CREATE TABLE IF NOT EXISTS `Metadata.Type` (
  `curriculumStandardsMetadataSet` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for all of the metadata associated with the LTI link. Currently this metadata is restricted to the set of curriculum standards annotations.';

--
-- Table structure for table `PlatformPropertySet.Type` generated from model 'PlatformPropertySetPeriodType'
-- The container for the collection of properties that are available for a specific platform.
--

CREATE TABLE IF NOT EXISTS `PlatformPropertySet.Type` (
  `platform` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The identifier for the authoring environment.',
  `properties` TEXT NOT NULL COMMENT 'The set of extension properties for the identified platform.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the collection of properties that are available for a specific platform.';

--
-- Table structure for table `PropertySet.Type` generated from model 'PropertySetPeriodType'
-- The container for the collection of properties that have been specified.
--

CREATE TABLE IF NOT EXISTS `PropertySet.Type` (
  `properties` TEXT NOT NULL COMMENT 'The set of properties for the identified platform or orginal authoring platform.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the collection of properties that have been specified.';

--
-- Table structure for table `Property.Type` generated from model 'PropertyPeriodType'
-- The container for the name/value pair for a specific property.
--

CREATE TABLE IF NOT EXISTS `Property.Type` (
  `name` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The name of the key for the property.',
  `value` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The value for the property.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the name/value pair for a specific property.';

--
-- Table structure for table `ResourceSet.Type` generated from model 'ResourceSetPeriodType'
-- The container for the set of resources that have been supplied by the service provider. This may be empty if none of the resources fulfill the search criteria. The order of resources is not significant.
--

CREATE TABLE IF NOT EXISTS `ResourceSet.Type` (
  `resources` TEXT DEFAULT NULL COMMENT 'The actual resources supplied by the service provider. The order of resources is not significant.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the set of resources that have been supplied by the service provider. This may be empty if none of the resources fulfill the search criteria. The order of resources is not significant.';

--
-- Table structure for table `Resource.Type` generated from model 'ResourcePeriodType'
-- The container for the information about a resource that is supported by a LOR.
--

CREATE TABLE IF NOT EXISTS `Resource.Type` (
  `name` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The name/title of resource.',
  `description` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. A human readable description of the contents of the resource.',
  `subject` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The subject(s) of the resource. May have multiple subjects tagged.',
  `url` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. How to access resource over Internet e.g. HTTP, FTP, etc. A resource must have either a URL or or a LTI Link.',
  `ltiLink` TEXT DEFAULT NULL,
  `learningResourceType` TEXT NOT NULL COMMENT 'The type of the resource. There may be multiple types.',
  `language` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Language. The languages used in the resource. International two digit code for language e.g. &#39;en&#39; for English. Use the [RFC 3066] annotation.',
  `thumbnailUrl` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. Link to a thumbnail representing resource.',
  `typicalAgeRange` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. Age of the typical intended user. This is described as EITHER the minimum-maximum age range (the format is &#39;11-12&#39;, &#39;5-7&#39;, etc. with ONLY integers permitted) OR the age as a single integer e.g. &#39;9&#39;.',
  `textComplexity` TEXT DEFAULT NULL COMMENT 'A number indicating text complexity based on number of established measures.',
  `learningObjectives` TEXT DEFAULT NULL COMMENT 'The set of learning objectives addressed by the resource.',
  `author` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. Author or creator of the resource.',
  `publisher` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. Owner of the rights to the resource or who made it available (company or person).',
  `useRightsURL` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. URL describing how resource can be licensed. Could be Creative Commons license link or link to other specific open or proprietary license.',
  `timeRequired` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Duration. Time that the resource takes to consume. Use the [ISO 8601] format for a duration.',
  `technicalFormat` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. A valid MIME type format for the resource e.g. text, HTML, PDF, MPEG, MP3, etc. See https://www.iana.org/assignments/media-types/media-types.xhtml.',
  `educationalAudience` TEXT DEFAULT NULL COMMENT 'For whom the resource is intended.',
  `accessibilityAPI` TEXT DEFAULT NULL COMMENT 'Which (if any) accessibility API is supported by the resource.',
  `accessibilityInputMethods` TEXT DEFAULT NULL COMMENT 'How the resource can be controlled by the user, which includes full keyboard controllability, mouse controllability, and voice controllability.',
  `accessibilityFeatures` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. These include alternatives and listed enhancements for the resource. These can be transformation features, navigation features, control features or augmentation features.',
  `accessibilityHazards` TEXT DEFAULT NULL COMMENT 'The set of accessibility hazards which are encountered when using this resource.',
  `accessMode` TEXT DEFAULT NULL COMMENT 'The human sensory perceptual system or cognitive faculty through which a person may process or perceive information.',
  `publishDate` DATE DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Date. Date the resource was published by the publisher. The &#39;date&#39; using the [ISO 8601] format.',
  `rating` ENUM('1', '2', '3', '4', '5') DEFAULT NULL COMMENT 'A rating of the quality of the resource determined by the Search Provider. Often derived from crowdsource ratings.',
  `relevance` DECIMAL(20, 9) DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Float. This is a floating point value based on relevance to the specific search. Higher relevance has a higher number.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the information about a resource that is supported by a LOR.';

--
-- Table structure for table `SetOfGUIDs.Type` generated from model 'SetOfGUIDsPeriodType'
-- The  container for the set of GUIDs that annotate a resource for a particular geographical/socio-political/etc. region.
--

CREATE TABLE IF NOT EXISTS `SetOfGUIDs.Type` (
  `region` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The region responsible for the definition. ',
  `version` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. This is used to denote any relevant versioning information.',
  `labelledGUID` TEXT NOT NULL COMMENT 'The actual GUID plus the corresponding labelling information.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The  container for the set of GUIDs that annotate a resource for a particular geographical/socio-political/etc. region.';

--
-- Table structure for table `SubjectSet.Type` generated from model 'SubjectSetPeriodType'
-- The container for the set of subjects that have been supplied by the service provider. This may be empty if none of the subjects fulfill the search criteria. The order of subjects is not significant.
--

CREATE TABLE IF NOT EXISTS `SubjectSet.Type` (
  `subjects` TEXT DEFAULT NULL COMMENT 'The actual list of subject supplied by the service provider. The order of subjects is not significant.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the set of subjects that have been supplied by the service provider. This may be empty if none of the subjects fulfill the search criteria. The order of subjects is not significant.';

--
-- Table structure for table `Subject.Type` generated from model 'SubjectPeriodType'
-- This is the container for the details of a subject that is covered by the content within a LOR.
--

CREATE TABLE IF NOT EXISTS `Subject.Type` (
  `identifier` INT UNSIGNED NOT NULL COMMENT 'Model Primitive Datatype &#x3D; PositiveInteger. The unique identifier, an integer, of the subject node. For the root node the value will be &#39;null&#39;. ',
  `name` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The name of the subject node, which may have any character and need not be unique with the returned taxonomy. ',
  `parent` INT UNSIGNED NOT NULL COMMENT 'Model Primitive Datatype &#x3D; PositiveInteger. An integer (the identifier of that subject node) that references the single parent of this node. The returned data must be a true rooted tree, where each node returned has a single parent. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the details of a subject that is covered by the content within a LOR.';

--
-- Table structure for table `TextComplexity.Type` generated from model 'TextComplexityPeriodType'
-- The name/pair value container for a text complexity annotation.
--

CREATE TABLE IF NOT EXISTS `TextComplexity.Type` (
  `name` ENUM('Lexile', 'Flesch-Kincaid', 'Dale-Schall', 'DRA', 'Fountas-Pinnell') NOT NULL COMMENT 'The name of the complexity measure. This is taken from an enumerated vocabulary.',
  `value` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The text complexity measure in terms of the named measuring scale.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The name/pair value container for a text complexity annotation.';

--
-- Table structure for table `Vendor.Type` generated from model 'VendorPeriodType'
-- The container for the information about the vendor who created the resource.
--

CREATE TABLE IF NOT EXISTS `Vendor.Type` (
  `code` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. An identification code for the vendor.',
  `name` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. The name of the vendor.',
  `description` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String. A human readable description of the vendor.',
  `url` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI. A URL for the vendor.',
  `emailContact` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString. Contact email for the vendor.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the information about the vendor who created the resource.';


