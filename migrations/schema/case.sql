/* SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO"; */
/* SET AUTOCOMMIT = 0; */
/* START TRANSACTION; */
/* SET time_zone = "+00:00"; */

-- --------------------------------------------------------

--
-- Table structure for table `CFAssociationGrouping.Type` generated from model 'CFAssociationGroupingPeriodType'
-- This is the container for information about a set of associations that have been labelled as a group (the nature of the group being defined by this container). 
--

CREATE TABLE IF NOT EXISTS `CFAssociationGrouping.Type` (
  `identifier` TEXT NOT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI',
  `title` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `description` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String',
  `lastChangeDateTime` DATETIME NOT NULL COMMENT 'Model Primitive Datatype &#x3D; DateTime'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for information about a set of associations that have been labelled as a group (the nature of the group being defined by this container). ';

--
-- Table structure for table `CFAssociationSet.Type` generated from model 'CFAssociationSetPeriodType'
-- This is the container for a collection of CFAssociations. There must be at least one CFAssociation. Note that the association can be between CFDocuments or between CFItems. 
--

CREATE TABLE IF NOT EXISTS `CFAssociationSet.Type` (
  `CFItem` TEXT NOT NULL,
  `CFAssociations` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a collection of CFAssociations. There must be at least one CFAssociation. Note that the association can be between CFDocuments or between CFItems. ';

--
-- Table structure for table `CFAssociation.Type` generated from model 'CFAssociationPeriodType'
-- This is the container for the data about the relationship between two CFDocuments or between two CFItems outside of the context of a CFPackage or CFItem. 
--

CREATE TABLE IF NOT EXISTS `CFAssociation.Type` (
  `identifier` TEXT NOT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `associationType` ENUM('isChildOf', 'isPeerOf', 'isPartOf', 'exactMatchOf', 'precedes', 'isRelatedTo', 'replacedBy', 'exemplar', 'hasSkillLevel') NOT NULL,
  `sequenceNumber` INT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Integer',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI',
  `originNodeURI` TEXT NOT NULL,
  `destinationNodeURI` TEXT NOT NULL,
  `CFAssociationGroupingURI` TEXT DEFAULT NULL,
  `lastChangeDateTime` DATETIME NOT NULL COMMENT 'Model Primitive Datatype &#x3D; DateTime',
  `CFDocumentURI` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the data about the relationship between two CFDocuments or between two CFItems outside of the context of a CFPackage or CFItem. ';

--
-- Table structure for table `CFConceptSet.Type` generated from model 'CFConceptSetPeriodType'
-- The container for the set of CFConcepts supplied in the response payload. The relationship between the CFConcepts is determined by the &#39;hierarchyCode&#39;. The first CFConcept is that which has been specified in the call. The other CFConcepts are the set of children as determined by their place in the &#39;hierarchyCode&#39; of the CFConcept. 
--

CREATE TABLE IF NOT EXISTS `CFConceptSet.Type` (
  `CFConcepts` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the set of CFConcepts supplied in the response payload. The relationship between the CFConcepts is determined by the &#39;hierarchyCode&#39;. The first CFConcept is that which has been specified in the call. The other CFConcepts are the set of children as determined by their place in the &#39;hierarchyCode&#39; of the CFConcept. ';

--
-- Table structure for table `CFConcept.Type` generated from model 'CFConceptPeriodType'
-- The container for the definition of a concept which is addressed by the competency framework. 
--

CREATE TABLE IF NOT EXISTS `CFConcept.Type` (
  `identifier` TEXT NOT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI',
  `title` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `keywords` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `hierarchyCode` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `description` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String',
  `lastChangeDateTime` DATETIME NOT NULL COMMENT 'Model Primitive Datatype &#x3D; DateTime'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the definition of a concept which is addressed by the competency framework. ';

--
-- Table structure for table `CFDefinition.Type` generated from model 'CFDefinitionPeriodType'
-- The container for the set of definitions used for the competency framework i.e. the set of CFSubjects, CFConcepts, CFItemTypes, CFAssociationGroupings and CFLicenses. 
--

CREATE TABLE IF NOT EXISTS `CFDefinition.Type` (
  `CFConcepts` TEXT DEFAULT NULL,
  `CFSubjects` TEXT DEFAULT NULL,
  `CFLicenses` TEXT DEFAULT NULL,
  `CFItemTypes` TEXT DEFAULT NULL,
  `CFAssociationGroupings` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the set of definitions used for the competency framework i.e. the set of CFSubjects, CFConcepts, CFItemTypes, CFAssociationGroupings and CFLicenses. ';

--
-- Table structure for table `CFDocumentSet.Type` generated from model 'CFDocumentSetPeriodType'
-- This is the container for a collection of CFDocuments. There must be at least one CFDocument. 
--

CREATE TABLE IF NOT EXISTS `CFDocumentSet.Type` (
  `CFDocuments` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a collection of CFDocuments. There must be at least one CFDocument. ';

--
-- Table structure for table `CFDocument.Type` generated from model 'CFDocumentPeriodType'
-- The container for the data about a competency framework document (CFDocument) when exchanged outside of the context of a CFPackage. A CFDocument is the root for the creation of a learning standard/competency. 
--

CREATE TABLE IF NOT EXISTS `CFDocument.Type` (
  `identifier` TEXT NOT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI',
  `creator` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `title` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `lastChangeDateTime` DATETIME NOT NULL COMMENT 'Model Primitive Datatype &#x3D; DateTime',
  `officialSourceURL` TEXT DEFAULT NULL COMMENT 'The data-type for establishing a Uniform Resource Locator (URL) as defined by W3C. ',
  `publisher` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `description` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `subject` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `subjectURI` TEXT DEFAULT NULL,
  `language` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Language',
  `version` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `adoptionStatus` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `statusStartDate` DATE DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Date',
  `statusEndDate` DATE DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Date',
  `licenseURI` TEXT DEFAULT NULL,
  `notes` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String',
  `CFPackageURI` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the data about a competency framework document (CFDocument) when exchanged outside of the context of a CFPackage. A CFDocument is the root for the creation of a learning standard/competency. ';

--
-- Table structure for table `CFItem.Type` generated from model 'CFItemPeriodType'
-- This is the container for the CFItem data outside of the context of a CFPackage. This is the content that either describes a specific competency (learning objective) or describes a grouping of competencies within the taxonomy of a Competency Framework Document.  
--

CREATE TABLE IF NOT EXISTS `CFItem.Type` (
  `identifier` TEXT NOT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `fullStatement` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `alternativeLabel` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `CFItemType` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI',
  `humanCodingScheme` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `listEnumeration` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `abbreviatedStatement` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `conceptKeywords` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `conceptKeywordsURI` TEXT DEFAULT NULL,
  `notes` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String',
  `language` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Language',
  `educationLevel` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `CFItemTypeURI` TEXT DEFAULT NULL,
  `licenseURI` TEXT DEFAULT NULL,
  `statusStartDate` DATE DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Date',
  `statusEndDate` DATE DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Date',
  `lastChangeDateTime` DATETIME NOT NULL COMMENT 'Model Primitive Datatype &#x3D; DateTime',
  `CFDocumentURI` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the CFItem data outside of the context of a CFPackage. This is the content that either describes a specific competency (learning objective) or describes a grouping of competencies within the taxonomy of a Competency Framework Document.  ';

--
-- Table structure for table `CFItemTypeSet.Type` generated from model 'CFItemTypeSetPeriodType'
-- The container for the set of CFItemTypes supplied in the response payload. The relationship between the CFItemTypes is determined by the &#39;hierarchyCode&#39;. The first CFItemType is that which has been specified in the call. The other CFItemTypes are the set of children as determined by their place in the &#39;hierarchyCode&#39; of the CFItemType. 
--

CREATE TABLE IF NOT EXISTS `CFItemTypeSet.Type` (
  `CFItemTypes` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the set of CFItemTypes supplied in the response payload. The relationship between the CFItemTypes is determined by the &#39;hierarchyCode&#39;. The first CFItemType is that which has been specified in the call. The other CFItemTypes are the set of children as determined by their place in the &#39;hierarchyCode&#39; of the CFItemType. ';

--
-- Table structure for table `CFItemType.Type` generated from model 'CFItemTypePeriodType'
-- The container for the ItemType information use within the competency framework. 
--

CREATE TABLE IF NOT EXISTS `CFItemType.Type` (
  `identifier` TEXT NOT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI',
  `title` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `description` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; String',
  `hierarchyCode` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `typeCode` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `lastChangeDateTime` DATETIME NOT NULL COMMENT 'Model Primitive Datatype &#x3D; DateTime'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the ItemType information use within the competency framework. ';

--
-- Table structure for table `CFLicense.Type` generated from model 'CFLicensePeriodType'
-- The container for the information about a license used within the competency framework. 
--

CREATE TABLE IF NOT EXISTS `CFLicense.Type` (
  `identifier` TEXT NOT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI',
  `title` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `description` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String',
  `licenseText` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; String',
  `lastChangeDateTime` DATETIME NOT NULL COMMENT 'Model Primitive Datatype &#x3D; DateTime'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the information about a license used within the competency framework. ';

--
-- Table structure for table `CFPackage.Type` generated from model 'CFPackagePeriodType'
-- This is the container for all of the data for a Competency Framework Package i.e. the root CFDocument and ALL of the corresponding components i.e. the CFItems, CFAssociations and CFDefinitions. 
--

CREATE TABLE IF NOT EXISTS `CFPackage.Type` (
  `CFDocument` TEXT NOT NULL,
  `CFItems` TEXT DEFAULT NULL,
  `CFAssociations` TEXT DEFAULT NULL,
  `CFDefinitions` TEXT DEFAULT NULL,
  `CFRubrics` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for all of the data for a Competency Framework Package i.e. the root CFDocument and ALL of the corresponding components i.e. the CFItems, CFAssociations and CFDefinitions. ';

--
-- Table structure for table `CFPckgAssociation.Type` generated from model 'CFPckgAssociationPeriodType'
-- This is the container for the data about the relationship between two CFDocuments or between two CFItems within the context of a CFPackage. 
--

CREATE TABLE IF NOT EXISTS `CFPckgAssociation.Type` (
  `identifier` TEXT NOT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `associationType` ENUM('isChildOf', 'isPeerOf', 'isPartOf', 'exactMatchOf', 'precedes', 'isRelatedTo', 'replacedBy', 'exemplar', 'hasSkillLevel') NOT NULL,
  `sequenceNumber` INT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Integer',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI',
  `originNodeURI` TEXT NOT NULL,
  `destinationNodeURI` TEXT NOT NULL,
  `CFAssociationGroupingURI` TEXT DEFAULT NULL,
  `lastChangeDateTime` DATETIME NOT NULL COMMENT 'Model Primitive Datatype &#x3D; DateTime'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the data about the relationship between two CFDocuments or between two CFItems within the context of a CFPackage. ';

--
-- Table structure for table `CFPckgDocument.Type` generated from model 'CFPckgDocumentPeriodType'
-- The container for the data about a competency framework document (CFDocument) within a CFPackage. A CFDocument is the root for the creation of a learning standard/competency. 
--

CREATE TABLE IF NOT EXISTS `CFPckgDocument.Type` (
  `identifier` TEXT NOT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI',
  `creator` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `title` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `lastChangeDateTime` DATETIME NOT NULL COMMENT 'Model Primitive Datatype &#x3D; DateTime',
  `officialSourceURL` TEXT DEFAULT NULL COMMENT 'The data-type for establishing a Uniform Resource Locator (URL) as defined by W3C. ',
  `publisher` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `description` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `subject` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `subjectURI` TEXT DEFAULT NULL,
  `language` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Language',
  `version` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `adoptionStatus` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `statusStartDate` DATE DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Date',
  `statusEndDate` DATE DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Date',
  `licenseURI` TEXT DEFAULT NULL,
  `notes` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the data about a competency framework document (CFDocument) within a CFPackage. A CFDocument is the root for the creation of a learning standard/competency. ';

--
-- Table structure for table `CFPckgItem.Type` generated from model 'CFPckgItemPeriodType'
-- This is the container for the CFItem data within the context of a CFPackage. This is the content that either describes a specific competency (learning objective) or describes a grouping of competencies within the taxonomy of a Competency Framework Document.  
--

CREATE TABLE IF NOT EXISTS `CFPckgItem.Type` (
  `identifier` TEXT NOT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `fullStatement` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `alternativeLabel` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `CFItemType` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI',
  `humanCodingScheme` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `listEnumeration` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `abbreviatedStatement` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `conceptKeywords` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `conceptKeywordsURI` TEXT DEFAULT NULL,
  `notes` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String',
  `language` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Language',
  `educationLevel` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `CFItemTypeURI` TEXT DEFAULT NULL,
  `licenseURI` TEXT DEFAULT NULL,
  `statusStartDate` DATE DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Date',
  `statusEndDate` DATE DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Date',
  `lastChangeDateTime` DATETIME NOT NULL COMMENT 'Model Primitive Datatype &#x3D; DateTime'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the CFItem data within the context of a CFPackage. This is the content that either describes a specific competency (learning objective) or describes a grouping of competencies within the taxonomy of a Competency Framework Document.  ';

--
-- Table structure for table `CFRubricCriterionLevel.Type` generated from model 'CFRubricCriterionLevelPeriodType'
-- The container for the definition of a criterion level which is addressed by the competency framework. 
--

CREATE TABLE IF NOT EXISTS `CFRubricCriterionLevel.Type` (
  `identifier` TEXT NOT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI',
  `description` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String',
  `quality` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `score` DECIMAL(20, 9) DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Float',
  `feedback` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String',
  `position` INT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Integer',
  `rubricCriterionId` TEXT DEFAULT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `lastChangeDateTime` DATETIME NOT NULL COMMENT 'Model Primitive Datatype &#x3D; DateTime'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the definition of a criterion level which is addressed by the competency framework. ';

--
-- Table structure for table `CFRubricCriterion.Type` generated from model 'CFRubricCriterionPeriodType'
-- The container for the definition of a rubric criterion which is addressed by the competency framework. 
--

CREATE TABLE IF NOT EXISTS `CFRubricCriterion.Type` (
  `identifier` TEXT NOT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI',
  `category` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `description` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String',
  `CFItemURI` TEXT DEFAULT NULL,
  `weight` DECIMAL(20, 9) DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Float',
  `position` INT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; Integer',
  `rubricId` TEXT DEFAULT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `lastChangeDateTime` DATETIME NOT NULL COMMENT 'Model Primitive Datatype &#x3D; DateTime',
  `CFRubricCriterionLevels` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the definition of a rubric criterion which is addressed by the competency framework. ';

--
-- Table structure for table `CFRubric.Type` generated from model 'CFRubricPeriodType'
-- The container for the definition of a rubric which is addressed by the competency framework. This includes the set of associated CFRubricCriteria and CFRubricCriterionLevels. 
--

CREATE TABLE IF NOT EXISTS `CFRubric.Type` (
  `identifier` TEXT NOT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI',
  `title` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `description` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `lastChangeDateTime` DATETIME NOT NULL COMMENT 'Model Primitive Datatype &#x3D; DateTime',
  `CFRubricCriteria` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the definition of a rubric which is addressed by the competency framework. This includes the set of associated CFRubricCriteria and CFRubricCriterionLevels. ';

--
-- Table structure for table `CFSubjectSet.Type` generated from model 'CFSubjectSetPeriodType'
-- The container for the set of CFSubjects supplied in the response payload. The relationship between the CFSubjects is determined by the &#39;hierarchyCode&#39;. The first CFSubject is that which has been specified in the call. The other CFSubjects are the set of children as determined by their place in the &#39;hierarchyCode&#39; of the CFSubject. 
--

CREATE TABLE IF NOT EXISTS `CFSubjectSet.Type` (
  `CFSubjects` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the set of CFSubjects supplied in the response payload. The relationship between the CFSubjects is determined by the &#39;hierarchyCode&#39;. The first CFSubject is that which has been specified in the call. The other CFSubjects are the set of children as determined by their place in the &#39;hierarchyCode&#39; of the CFSubject. ';

--
-- Table structure for table `CFSubject.Type` generated from model 'CFSubjectPeriodType'
-- The container for the definition of a topic or academic subject which is addressed by the competency framework. 
--

CREATE TABLE IF NOT EXISTS `CFSubject.Type` (
  `identifier` TEXT NOT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI',
  `title` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `hierarchyCode` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `description` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String',
  `lastChangeDateTime` DATETIME NOT NULL COMMENT 'Model Primitive Datatype &#x3D; DateTime'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the definition of a topic or academic subject which is addressed by the competency framework. ';

--
-- Table structure for table `imsx_CodeMinorField.Type` generated from model 'imsxUnderscoreCodeMinorFieldPeriodType'
-- This is the container for a single code minor status code. 
--

CREATE TABLE IF NOT EXISTS `imsx_CodeMinorField.Type` (
  `imsx_codeMinorFieldName` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `imsx_codeMinorFieldValue` ENUM('fullsuccess', 'invalid_sort_field', 'invalid_selection_field', 'forbidden', 'unauthorisedrequest', 'internal_server_error', 'unknownobject', 'server_busy', 'invaliduuid') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a single code minor status code. ';

--
-- Table structure for table `imsx_CodeMinor.Type` generated from model 'imsxUnderscoreCodeMinorPeriodType'
-- This is the container for the set of code minor status codes reported in the responses from the Service Provider. 
--

CREATE TABLE IF NOT EXISTS `imsx_CodeMinor.Type` (
  `imsx_codeMinorField` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the set of code minor status codes reported in the responses from the Service Provider. ';

--
-- Table structure for table `imsx_StatusInfo.Type` generated from model 'imsxUnderscoreStatusInfoPeriodType'
-- This is the container for the status code and associated information returned within the HTTP messages received from the Service Provider. For the CASE service this object will only be returned to provide information about a failed request i.e. it will NOT be in the payload for a successful request. See Appendix B for further information on the interpretation of the information contained within this class 
--

CREATE TABLE IF NOT EXISTS `imsx_StatusInfo.Type` (
  `imsx_codeMajor` ENUM('success', 'processing', 'failure', 'unsupported') NOT NULL,
  `imsx_severity` ENUM('status', 'warning', 'error') NOT NULL,
  `imsx_description` TEXT DEFAULT NULL COMMENT 'Model Primitive Datatype &#x3D; String',
  `imsx_codeMinor` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the status code and associated information returned within the HTTP messages received from the Service Provider. For the CASE service this object will only be returned to provide information about a failed request i.e. it will NOT be in the payload for a successful request. See Appendix B for further information on the interpretation of the information contained within this class ';

--
-- Table structure for table `LinkGenURI.Type` generated from model 'LinkGenURIPeriodType'
-- A container for the information that is used to achieve the link data reference. 
--

CREATE TABLE IF NOT EXISTS `LinkGenURI.Type` (
  `title` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `identifier` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='A container for the information that is used to achieve the link data reference. ';

--
-- Table structure for table `LinkURI.Type` generated from model 'LinkURIPeriodType'
-- A container for the information that is used to achieve the link data reference. 
--

CREATE TABLE IF NOT EXISTS `LinkURI.Type` (
  `title` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; NormalizedString',
  `identifier` TEXT NOT NULL COMMENT 'The data-type for establishing a Globally Unique Identifier (GUID). The form of the GUID is a Universally Unique Identifier (UUID) of 16 hexadecimal characters (lower case) in the format 8-4-4-4-12. All permitted versions (1-5) and variants (1-2) are supported. ',
  `uri` TEXT NOT NULL COMMENT 'Model Primitive Datatype &#x3D; AnyURI'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='A container for the information that is used to achieve the link data reference. ';


