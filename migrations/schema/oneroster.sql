/* SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO"; */
/* SET AUTOCOMMIT = 0; */
/* START TRANSACTION; */
/* SET time_zone = "+00:00"; */

-- --------------------------------------------------------

--
-- Table structure for table `AcadSessionGUIDRefDType` generated from model 'AcadSessionGUIDRefDType'
-- This is the container for reference to a OneRoster &#39;Academic Session&#39; object that has an allocated sourcedId (GUID). 
--

CREATE TABLE IF NOT EXISTS `AcadSessionGUIDRefDType` (
  `href` TEXT NOT NULL COMMENT 'The URI for the type of object being referenced. Model Primitive Datatype &#x3D; AnyURI.',
  `sourcedId` TEXT NOT NULL COMMENT 'The globally unique identifier of the object being referenced. Model Primitive Datatype &#x3D; String.',
  `type` ENUM('academicSession') NOT NULL COMMENT 'The type of object being referenced i.e. an &#39;academicSession&#39;. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for reference to a OneRoster &#39;Academic Session&#39; object that has an allocated sourcedId (GUID). ';

--
-- Table structure for table `AcademicSessionDType` generated from model 'AcademicSessionDType'
-- The container for an academicSession. An academicSession represents a duration of time. Typically they are used to describe terms, grading periods, and other durations e.g. school years. Term is used to describe a period of time during which learning will take place. Other words for term could be in common use around the world e.g. Semester. The important thing is that Term is a unit of time, often many weeks long, into which classes are scheduled. Grading Period is used to represent another unit of time, that within which line items are assessed. A term may have many grading periods, a grading period belongs to a single term. A class may be assessed over several grade periods (represented by a line item being connected to a grading period). The parent / child attributes of academic sessions allow terms to be connected to their grading periods and vice-versa.  
--

CREATE TABLE IF NOT EXISTS `AcademicSessionDType` (
  `sourcedId` TEXT NOT NULL COMMENT 'The sourcedId of the object. All objects MUST be identified by a Source Identifier.',
  `status` ENUM('active', 'tobedeleted') NOT NULL COMMENT 'All objects MUST BE either &#39;active&#39; or &#39;tobedeleted&#39;.  Something which is flagged &#39;tobedeleted&#39; is to be considered safe to delete. Systems can delete records that are flagged as such if they wish, but they are not under any compulsion to do so. In v1.1 the enumeration value of &#39;inactive&#39; was removed and so for backwards compatibility all such marked objects should be interpreted as &#39;tobedeleted&#39;. ',
  `dateLastModified` DATETIME NOT NULL COMMENT 'All objects MUST be annotated with the dateTime upon which they were last modified. This enables requesters to query for just the latest objects. DateTimes MUST be expressed in W3C profile of [ISO 8601] and MUST contain the UTC timezone. Model Primitive Datatype &#x3D; DateTime.',
  `metadata` TEXT DEFAULT NULL COMMENT 'The container for the proprietary extensions. ',
  `title` TEXT NOT NULL COMMENT 'The title/label for the academic session. Model Primitive Datatype &#x3D; NormalizedString.',
  `startDate` DATE NOT NULL COMMENT 'The start date for the academic session. The start date is included in the academic session. This is in [ISO 8601] format of &#39;YYYY-MM-DD&#39;. Model Primitive Datatype &#x3D; Date.',
  `endDate` DATE NOT NULL COMMENT 'The end date for the academic session. The end date is excluded from the academic session. This is in [ISO 8601] format of &#39;YYYY-MM-DD&#39;. Model Primitive Datatype &#x3D; Date.',
  `type` TEXT NOT NULL,
  `parent` TEXT DEFAULT NULL,
  `children` TEXT DEFAULT NULL COMMENT 'The set of links to the child AcademicSessions i.e. a set of AcademicSession &#39;sourcedIds&#39;. ',
  `schoolYear` TEXT NOT NULL COMMENT 'The school year for the academic session.  This year should include the school year end e.g. 2014. This is in the [ISO 8601] format of &#39;YYYY&#39;. Model Primitive Datatype &#x3D; NormalizedString.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for an academicSession. An academicSession represents a duration of time. Typically they are used to describe terms, grading periods, and other durations e.g. school years. Term is used to describe a period of time during which learning will take place. Other words for term could be in common use around the world e.g. Semester. The important thing is that Term is a unit of time, often many weeks long, into which classes are scheduled. Grading Period is used to represent another unit of time, that within which line items are assessed. A term may have many grading periods, a grading period belongs to a single term. A class may be assessed over several grade periods (represented by a line item being connected to a grading period). The parent / child attributes of academic sessions allow terms to be connected to their grading periods and vice-versa.  ';

--
-- Table structure for table `AcademicSessionSetDType` generated from model 'AcademicSessionSetDType'
-- This is the container for a collection of academicSessions instances for a message payload. This may be empty if no instances are found that sustain the applied query constraints. The order is not significant. 
--

CREATE TABLE IF NOT EXISTS `AcademicSessionSetDType` (
  `academicSessions` TEXT DEFAULT NULL COMMENT 'The collection of academicSession instances. The order is not significant. The corresponding query constraints may result in no instances being returned. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a collection of academicSessions instances for a message payload. This may be empty if no instances are found that sustain the applied query constraints. The order is not significant. ';

--
-- Table structure for table `ClassDType` generated from model 'ClassDType'
-- A class is an instance of a course, onto which students and teachers are enrolled. A class is typically held within a term. 
--

CREATE TABLE IF NOT EXISTS `ClassDType` (
  `sourcedId` TEXT NOT NULL COMMENT 'The sourcedId of the object. All objects MUST be identified by a Source Identifier.',
  `status` ENUM('active', 'tobedeleted') NOT NULL COMMENT 'All objects MUST BE either &#39;active&#39; or &#39;tobedeleted&#39;.  Something which is flagged &#39;tobedeleted&#39; is to be considered safe to delete. Systems can delete records that are flagged as such if they wish, but they are not under any compulsion to do so. In v1.1 the enumeration value of &#39;inactive&#39; was removed and so for backwards compatibility all such marked objects should be interpreted as &#39;tobedeleted&#39;. ',
  `dateLastModified` DATETIME NOT NULL COMMENT 'All objects MUST be annotated with the dateTime upon which they were last modified. This enables requesters to query for just the latest objects. DateTimes MUST be expressed in W3C profile of [ISO 8601] and MUST contain the UTC timezone. Model Primitive Datatype &#x3D; DateTime.',
  `metadata` TEXT DEFAULT NULL COMMENT 'The container for the proprietary extensions. ',
  `title` TEXT NOT NULL COMMENT 'The tile/label for the class. Model Primitive Datatype &#x3D; NormalizedString.',
  `classCode` TEXT DEFAULT NULL COMMENT 'The class code. Model Primitive Datatype &#x3D; NormalizedString.',
  `classType` TEXT DEFAULT NULL,
  `location` TEXT DEFAULT NULL COMMENT 'The location for the class e.g. &#39;Room 19&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `grades` TEXT DEFAULT NULL COMMENT 'The grade(s) who attend the class. The permitted vocabulary should be defined as part of the adoption and deployment process. See the Implementation Guide [OR-IMPL-12] for more details on how to define/use such a vocabulary. Model Primitive Datatype &#x3D; NormalizedString.',
  `subjects` TEXT DEFAULT NULL COMMENT 'The set of subjects addressed by this class e.g. &#39;chemistry&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `course` TEXT NOT NULL,
  `school` TEXT NOT NULL,
  `terms` TEXT NOT NULL COMMENT 'The links to the set of terms or semesters (academicSession) i.e. the set of &#39;sourcedIds&#39; for the terms within the associated school year. ',
  `subjectCodes` TEXT DEFAULT NULL COMMENT 'This is a machine readable set of codes and the number should match the associated &#39;subjects&#39; attribute. The vocabulary for this characteristic should be defined as part of the local addition of this specification (see the Implementation Guide [OR-IMPL-12] for more details). Model Primitive Datatype &#x3D; NormalizedString.',
  `periods` TEXT DEFAULT NULL COMMENT 'The time slots in the day that the class will be given. Examples are 1 or a list of 1, 3, 5, etc. Model Primitive Datatype &#x3D; NormalizedString.',
  `resources` TEXT DEFAULT NULL COMMENT 'The links to the set of associated resources i.e. the Resource &#39;sourcedIds&#39;. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='A class is an instance of a course, onto which students and teachers are enrolled. A class is typically held within a term. ';

--
-- Table structure for table `ClassGUIDRefDType` generated from model 'ClassGUIDRefDType'
-- This is the container for reference to a OneRoster &#39;Class&#39; object that has an allocated sourcedId (GUID). 
--

CREATE TABLE IF NOT EXISTS `ClassGUIDRefDType` (
  `href` TEXT NOT NULL COMMENT 'The URI for the type of object being referenced. Model Primitive Datatype &#x3D; AnyURI.',
  `sourcedId` TEXT NOT NULL COMMENT 'The globally unique identifier of the object being referenced. Model Primitive Datatype &#x3D; String.',
  `type` ENUM('class') NOT NULL COMMENT 'The type of object being referenced i.e. a &#39;class&#39;. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for reference to a OneRoster &#39;Class&#39; object that has an allocated sourcedId (GUID). ';

--
-- Table structure for table `ClassSetDType` generated from model 'ClassSetDType'
-- This is the container for a collection of classes instances for a message payload. This may be empty if no instances are found that sustain the applied query constraints. The order is not significant. 
--

CREATE TABLE IF NOT EXISTS `ClassSetDType` (
  `classes` TEXT DEFAULT NULL COMMENT 'The collection of class instances. The order is not significant. The corresponding query constraints may result in no instances being returned. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a collection of classes instances for a message payload. This may be empty if no instances are found that sustain the applied query constraints. The order is not significant. ';

--
-- Table structure for table `CourseDType` generated from model 'CourseDType'
-- The information about a course. A Course is a course of study that, typically, has a shared curriculum although it may be taught to different students by different teachers. It is likely that several classes of a single course may be taught in a term. For example, a school runs Grade 9 English in the spring term. There are four classes, each with a different 30 students, taught by 4 different teachers. However the curriculum for each of those four classes is the same i.e. the course curriculum. 
--

CREATE TABLE IF NOT EXISTS `CourseDType` (
  `sourcedId` TEXT NOT NULL COMMENT 'The sourcedId of the object. All objects MUST be identified by a Source Identifier. This is a GUID  System ID for an object.',
  `status` ENUM('active', 'tobedeleted') NOT NULL COMMENT 'All objects MUST BE either &#39;active&#39; or &#39;tobedeleted&#39;.  Something which is flagged &#39;tobedeleted&#39; is to be considered safe to delete. Systems can delete records that are flagged as such if they wish, but they are not under any compulsion to do so. In v1.1 the enumeration value of &#39;inactive&#39; was removed and so for backwards compatibility all such marked objects should be interpreted as &#39;tobedeleted&#39;. ',
  `dateLastModified` DATETIME NOT NULL COMMENT 'All objects MUST be annotated with the dateTime upon which they were last modified. This enables requesters to query for just the latest objects. DateTimes MUST be expressed in W3C profile of [ISO 8601] and MUST contain the UTC timezone. Model Primitive Datatype &#x3D; DateTime.',
  `metadata` TEXT DEFAULT NULL COMMENT 'The container for the proprietary extensions. ',
  `title` TEXT NOT NULL COMMENT 'The title of the course. Model Primitive Datatype &#x3D; NormalizedString.',
  `schoolYear` TEXT DEFAULT NULL,
  `courseCode` TEXT NOT NULL COMMENT 'The assigned course code. Model Primitive Datatype &#x3D; NormalizedString.',
  `grades` TEXT DEFAULT NULL COMMENT 'Grade(s) for which the class is attended. The permitted vocabulary should be defined as part of the adoption and deployment process. See the Implementation Guide [OR-IMPL-12] for more details on how to define/use such a vocabulary. Model Primitive Datatype &#x3D; NormalizedString.',
  `subjects` TEXT DEFAULT NULL COMMENT 'The set of subjects addresse by this course. This is a set of human readable strings.   Model Primitive Datatype &#x3D; NormalizedString.',
  `org` TEXT DEFAULT NULL,
  `subjectCodes` TEXT DEFAULT NULL COMMENT 'This is a machine readable set of codes and the number should match the associated &#39;subjects&#39; attribute. The vocabulary for this characteristic should be defined as part of the local addition of this specification (see the Implementation Guide [OR-IMPL-12] for more details). Model Primitive Datatype &#x3D; NormalizedString.',
  `resources` TEXT DEFAULT NULL COMMENT 'The links to the associated resources if applicable i.e. the resource &#39;sourcedIds&#39;. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The information about a course. A Course is a course of study that, typically, has a shared curriculum although it may be taught to different students by different teachers. It is likely that several classes of a single course may be taught in a term. For example, a school runs Grade 9 English in the spring term. There are four classes, each with a different 30 students, taught by 4 different teachers. However the curriculum for each of those four classes is the same i.e. the course curriculum. ';

--
-- Table structure for table `CourseGUIDRefDType` generated from model 'CourseGUIDRefDType'
-- This is the container for reference to a OneRoster &#39;Course&#39; object that has an allocated sourcedId (GUID). 
--

CREATE TABLE IF NOT EXISTS `CourseGUIDRefDType` (
  `href` TEXT NOT NULL COMMENT 'The URI for the type of object being referenced. Model Primitive Datatype &#x3D; AnyURI.',
  `sourcedId` TEXT NOT NULL COMMENT 'The globally unique identifier of the object being referenced. Model Primitive Datatype &#x3D; String.',
  `type` ENUM('course') NOT NULL COMMENT 'The type of object being referenced i.e. a &#39;course&#39;. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for reference to a OneRoster &#39;Course&#39; object that has an allocated sourcedId (GUID). ';

--
-- Table structure for table `CourseSetDType` generated from model 'CourseSetDType'
-- This is the container for a collection of courses instances for a message payload. This may be empty if no instances are found that sustain the applied query constraints. The order is not significant. 
--

CREATE TABLE IF NOT EXISTS `CourseSetDType` (
  `courses` TEXT DEFAULT NULL COMMENT 'The collection of course instances. The order is not significant. The corresponding query constraints may result in no instances being returned. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a collection of courses instances for a message payload. This may be empty if no instances are found that sustain the applied query constraints. The order is not significant. ';

--
-- Table structure for table `CredentialDType` generated from model 'CredentialDType'
-- The container for a single set of credentials for an account. 
--

CREATE TABLE IF NOT EXISTS `CredentialDType` (
  `type` TEXT NOT NULL COMMENT 'The type of credentials for the profile. This should be indicative of when this specific credential should be used. Model Primitive Datatype &#x3D; String.',
  `username` TEXT NOT NULL COMMENT 'The username. Model Primitive Datatype &#x3D; NormalizedString.',
  `password` TEXT DEFAULT NULL COMMENT 'The password in this set of credentials.  Care should be taken to ensure that no unencrypted value is revealed. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for a single set of credentials for an account. ';

--
-- Table structure for table `DemographicsDType` generated from model 'DemographicsDType'
-- Demographics information is taken from the Common Educational Data Standards (CEDS) from the US government. (http://ceds.ed.gov). Note that demographics data is held in its own service, and that access to this service is considered privileged. Not all consumer keys will be able to request demographics data. 
--

CREATE TABLE IF NOT EXISTS `DemographicsDType` (
  `sourcedId` TEXT NOT NULL COMMENT 'The sourcedId of the object. All objects MUST be identified by a Source Identifier. This is a GUID  System ID for an object.',
  `status` ENUM('active', 'tobedeleted') NOT NULL COMMENT 'All objects MUST BE either &#39;active&#39; or &#39;tobedeleted&#39;.  Something which is flagged &#39;tobedeleted&#39; is to be considered safe to delete. Systems can delete records that are flagged as such if they wish, but they are not under any compulsion to do so. In v1.1 the enumeration value of &#39;inactive&#39; was removed and so for backwards compatibility all such marked objects should be interpreted as &#39;tobedeleted&#39;. ',
  `dateLastModified` DATETIME NOT NULL COMMENT 'All objects MUST be annotated with the dateTime upon which they were last modified. This enables requesters to query for just the latest objects. DateTimes MUST be expressed in W3C profile of [ISO 8601] and MUST contain the UTC timezone. Model Primitive Datatype &#x3D; DateTime.',
  `metadata` TEXT DEFAULT NULL COMMENT 'The container for the proprietary extensions. ',
  `birthDate` DATE DEFAULT NULL COMMENT 'the date of birth. The format is [ISO 8601] of &#39;YYYY-MM-DD&#39;. Model Primitive Datatype &#x3D; Date.',
  `sex` TEXT DEFAULT NULL,
  `americanIndianOrAlaskaNative` ENUM('true', 'false') DEFAULT NULL COMMENT 'Identification of whether or not the user is an American Indian or Alaska Native ethnicity. ',
  `asian` ENUM('true', 'false') DEFAULT NULL COMMENT 'Identification of whether or not the user is of Asian ethnicity. ',
  `blackOrAfricanAmerican` ENUM('true', 'false') DEFAULT NULL COMMENT 'Identification of whether or not the user is black or African American ethnicity. ',
  `nativeHawaiianOrOtherPacificIslander` ENUM('true', 'false') DEFAULT NULL COMMENT 'Identification of whether or not the user is Native Hawaiian or Other Pacific Islander ethnicity. ',
  `white` ENUM('true', 'false') DEFAULT NULL COMMENT 'Identification of whether or not the user is of white ethnicity. ',
  `demographicRaceTwoOrMoreRaces` ENUM('true', 'false') DEFAULT NULL COMMENT 'Identification of whether or not the user has a demographic of two or more race ethnicities. ',
  `hispanicOrLatinoEthnicity` ENUM('true', 'false') DEFAULT NULL COMMENT 'Identification of whether or not the user is Hispanic or of Latino ethnicity. ',
  `countryOfBirthCode` TEXT DEFAULT NULL COMMENT 'The country of birth code. The permitted vocabulary should be defined as part of the adoption and deployment process. See the Implementation Guide [OR-IMPL-12] for more details on how to define/use such a vocabulary. Model Primitive Datatype &#x3D; NormalizedString.',
  `stateOfBirthAbbreviation` TEXT DEFAULT NULL COMMENT 'The abbreviation for the name of the state (within the United States) or extra-state jurisdiction in which a person was born. The permitted vocabulary should be defined as part of the adoption and deployment process. See the Implementation Guide [OR-IMPL-12] for more details on how to define/use such a vocabulary. Model Primitive Datatype &#x3D; NormalizedString.',
  `cityOfBirth` TEXT DEFAULT NULL COMMENT 'The name of the city in which the user was born. Model Primitive Datatype &#x3D; NormalizedString.',
  `publicSchoolResidenceStatus` TEXT DEFAULT NULL COMMENT 'An indication of the location of a person&#39;s legal residence relative to (within or outside) the boundaries of the public school attended and its administrative unit. The permitted vocabulary should be defined as part of the adoption and deployment process. See the Implementation Guide [OR-IMPL-12] for more details on how to define/use such a vocabulary. Model Primitive Datatype &#x3D; NormalizedString.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Demographics information is taken from the Common Educational Data Standards (CEDS) from the US government. (http://ceds.ed.gov). Note that demographics data is held in its own service, and that access to this service is considered privileged. Not all consumer keys will be able to request demographics data. ';

--
-- Table structure for table `DemographicsSetDType` generated from model 'DemographicsSetDType'
-- This is the container for a collection of demographics instances for a message payload. This may be empty if no instances are found that sustain the applied query constraints. The order is not significant. 
--

CREATE TABLE IF NOT EXISTS `DemographicsSetDType` (
  `demographics` TEXT DEFAULT NULL COMMENT 'The collection of demographics instances. The order is not significant. The corresponding query constraints may result in no instances being returned. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a collection of demographics instances for a message payload. This may be empty if no instances are found that sustain the applied query constraints. The order is not significant. ';

--
-- Table structure for table `EnrollmentDType` generated from model 'EnrollmentDType'
-- An enrollment is the name given to an individual taking part in a class. In the vast majority of cases, users will be students learning in a class, or teachers teaching the class. Other roles are also possible. 
--

CREATE TABLE IF NOT EXISTS `EnrollmentDType` (
  `sourcedId` TEXT NOT NULL COMMENT 'The sourcedId of the object. All objects MUST be identified by a Source Identifier. This is a GUID  System ID for an object.',
  `status` ENUM('active', 'tobedeleted') NOT NULL COMMENT 'All objects MUST BE either &#39;active&#39; or &#39;tobedeleted&#39;.  Something which is flagged &#39;tobedeleted&#39; is to be considered safe to delete. Systems can delete records that are flagged as such if they wish, but they are not under any compulsion to do so. In v1.1 the enumeration value of &#39;inactive&#39; was removed and so for backwards compatibility all such marked objects should be interpreted as &#39;tobedeleted&#39;. ',
  `dateLastModified` DATETIME NOT NULL COMMENT 'All objects MUST be annotated with the dateTime upon which they were last modified. This enables requesters to query for just the latest objects. DateTimes MUST be expressed in W3C profile of [ISO 8601] and MUST contain the UTC timezone. Model Primitive Datatype &#x3D; DateTime.',
  `metadata` TEXT DEFAULT NULL COMMENT 'The container for the proprietary extensions. ',
  `user` TEXT NOT NULL,
  `class` TEXT NOT NULL,
  `school` TEXT NOT NULL,
  `role` TEXT NOT NULL,
  `primary` ENUM('true', 'false') DEFAULT NULL COMMENT 'Applicable only to teachers. Only one teacher should be designated as the primary teacher for a class (this value set as &#39;true&#39;) in the period defined by the begin/end dates. ',
  `beginDate` DATE DEFAULT NULL COMMENT 'The start date for the enrollment (inclusive). This date must be within the period of the associated Academic Session for the class (Term/Semester/SchoolYear). Use the [ISO 8601] format of &#39;YYYY-MM-DD&#39;. Model Primitive Datatype &#x3D; Date.',
  `endDate` DATE DEFAULT NULL COMMENT 'The end date for the enrollment (exclusive).  This date must be within the period of the associated Academic Session for the class (Term/Semester/SchoolYear). Use the [ISO 8601] format of &#39;YYYY-MM-DD&#39;. Model Primitive Datatype &#x3D; Date.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='An enrollment is the name given to an individual taking part in a class. In the vast majority of cases, users will be students learning in a class, or teachers teaching the class. Other roles are also possible. ';

--
-- Table structure for table `EnrollmentSetDType` generated from model 'EnrollmentSetDType'
-- This is the container for a collection of enrollment instances for a message payload. This may be empty if no instances are found that sustain the applied query constraints. The order is not significant. 
--

CREATE TABLE IF NOT EXISTS `EnrollmentSetDType` (
  `enrollments` TEXT DEFAULT NULL COMMENT 'The collection of enrollment instances. The order is not significant. The corresponding query constraints may result in no instances being returned. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a collection of enrollment instances for a message payload. This may be empty if no instances are found that sustain the applied query constraints. The order is not significant. ';

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
  `imsx_codeMinorFieldName` TEXT NOT NULL COMMENT 'This should contain the identity of the system that has produced the code minor status code report. In most cases this will be the target service provider denoted as &#39;TargetEndSystem&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `imsx_codeMinorFieldValue` ENUM('fullsuccess', 'invalid_filter_field', 'invalid_selection_field', 'invaliddata', 'unauthorisedrequest', 'forbidden', 'server_busy', 'unknownobject', 'internal_server_error') NOT NULL COMMENT 'The code minor status code (this is a value from the corresponding enumerated vocabulary). '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a single code minor status code. ';

--
-- Table structure for table `imsx_StatusInfoDType` generated from model 'imsxUnderscoreStatusInfoDType'
-- This is the container for the status code and associated information returned within the HTTP messages received from the Service Provider. For the OneRoster Rostering service this object will only be returned to provide information about a failed request i.e. it will NOT be in the payload for a successful request. See Appendix B for further information on the interpretation of the information contained within this class. 
--

CREATE TABLE IF NOT EXISTS `imsx_StatusInfoDType` (
  `imsx_codeMajor` ENUM('success', 'processing', 'failure', 'unsupported') NOT NULL COMMENT 'The code major value (from the corresponding enumerated vocabulary). See Appendix B for further information on the interpretation of this set of codes. The permitted vocabulary for the values for the CodeMajor field. ',
  `imsx_severity` ENUM('status', 'warning', 'error') NOT NULL COMMENT 'The severity value (from the corresponding enumerated vocabulary). See Appendix B for further information on the interpretation of this set of codes. ',
  `imsx_description` TEXT DEFAULT NULL COMMENT 'A human readable description supplied by the entity creating the status code information. Model Primitive Datatype &#x3D; String.',
  `imsx_CodeMinor` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the status code and associated information returned within the HTTP messages received from the Service Provider. For the OneRoster Rostering service this object will only be returned to provide information about a failed request i.e. it will NOT be in the payload for a successful request. See Appendix B for further information on the interpretation of the information contained within this class. ';

--
-- Table structure for table `OrgDType` generated from model 'OrgDType'
-- ORG is defined here as a structure for holding organizational information. An ORG might be a school, or it might be a local, statewide, or national entity. ORGs will typically have a parent ORG (up to the national level), and children, allowing a hierarchy to be established. School is defined here as the place where the learning happens. Most commonly this is the data that describes a bricks and mortar building, or, in the case of a virtual school, the virtual school organization. For enrollment and result reporting purposes, little information about this organization is required. A common example of a local organization is a school district. 
--

CREATE TABLE IF NOT EXISTS `OrgDType` (
  `sourcedId` TEXT NOT NULL COMMENT 'The sourcedId of the object. All objects MUST be identified by a Source Identifier. This is a GUID  System ID for an object.',
  `status` ENUM('active', 'tobedeleted') NOT NULL COMMENT 'All objects MUST BE either &#39;active&#39; or &#39;tobedeleted&#39;.  Something which is flagged &#39;tobedeleted&#39; is to be considered safe to delete. Systems can delete records that are flagged as such if they wish, but they are not under any compulsion to do so. In v1.1 the enumeration value of &#39;inactive&#39; was removed and so for backwards compatibility all such marked objects should be interpreted as &#39;tobedeleted&#39;. ',
  `dateLastModified` DATETIME NOT NULL COMMENT 'All objects MUST be annotated with the dateTime upon which they were last modified. This enables requesters to query for just the latest objects. DateTimes MUST be expressed in W3C profile of [ISO 8601] and MUST contain the UTC timezone. Model Primitive Datatype &#x3D; DateTime.',
  `metadata` TEXT DEFAULT NULL COMMENT 'The container for the proprietary extensions. ',
  `name` TEXT NOT NULL COMMENT 'The name of the organization. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT NOT NULL,
  `identifier` TEXT NOT NULL COMMENT 'Human readable identifier for this org e.g. NCES ID. Model Primitive Datatype &#x3D; String.',
  `parent` TEXT DEFAULT NULL,
  `children` TEXT DEFAULT NULL COMMENT 'The &#39;sourcedIds&#39; for the set of child organizations. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ORG is defined here as a structure for holding organizational information. An ORG might be a school, or it might be a local, statewide, or national entity. ORGs will typically have a parent ORG (up to the national level), and children, allowing a hierarchy to be established. School is defined here as the place where the learning happens. Most commonly this is the data that describes a bricks and mortar building, or, in the case of a virtual school, the virtual school organization. For enrollment and result reporting purposes, little information about this organization is required. A common example of a local organization is a school district. ';

--
-- Table structure for table `OrgGUIDRefDType` generated from model 'OrgGUIDRefDType'
-- This is the container for reference to a OneRoster &#39;Org&#39; object that has an allocated sourcedId (GUID). 
--

CREATE TABLE IF NOT EXISTS `OrgGUIDRefDType` (
  `href` TEXT NOT NULL COMMENT 'The URI for the type of object being referenced. Model Primitive Datatype &#x3D; AnyURI.',
  `sourcedId` TEXT NOT NULL COMMENT 'The globally unique identifier of the object being referenced. Model Primitive Datatype &#x3D; String.',
  `type` ENUM('org') NOT NULL COMMENT 'The type of object being referenced i.e. an &#39;org&#39;. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for reference to a OneRoster &#39;Org&#39; object that has an allocated sourcedId (GUID). ';

--
-- Table structure for table `OrgSetDType` generated from model 'OrgSetDType'
-- This is the container for a collection of org instances for a message payload. This may be empty if no instances are found that sustain the applied query constraints. The order is not significant. 
--

CREATE TABLE IF NOT EXISTS `OrgSetDType` (
  `orgs` TEXT DEFAULT NULL COMMENT 'The collection of org instances. The order is not significant. The corresponding query constraints may result in no instances being returned. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a collection of org instances for a message payload. This may be empty if no instances are found that sustain the applied query constraints. The order is not significant. ';

--
-- Table structure for table `ResourceGUIDRefDType` generated from model 'ResourceGUIDRefDType'
-- This is the container for reference to a OneRoster &#39;Resourse&#39; object that has an allocated sourcedId (GUID). 
--

CREATE TABLE IF NOT EXISTS `ResourceGUIDRefDType` (
  `href` TEXT NOT NULL COMMENT 'The URI for the type of object being referenced. Model Primitive Datatype &#x3D; AnyURI.',
  `sourcedId` TEXT NOT NULL COMMENT 'The globally unique identifier of the object being referenced. Model Primitive Datatype &#x3D; String.',
  `type` ENUM('resource') NOT NULL COMMENT 'The type of object being referenced i.e. a &#39;resource&#39;. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for reference to a OneRoster &#39;Resourse&#39; object that has an allocated sourcedId (GUID). ';

--
-- Table structure for table `RoleDType` generated from model 'RoleDType'
-- The container for one mapping between a role and an org for the user. 
--

CREATE TABLE IF NOT EXISTS `RoleDType` (
  `roleType` ENUM('primary', 'secondary') NOT NULL COMMENT 'Indicates if this role is the primary or secondary role for that org. There MUST be one, and only one, primary role for each org. ',
  `role` TEXT NOT NULL,
  `org` TEXT NOT NULL,
  `userProfile` TEXT DEFAULT NULL COMMENT 'The identifier for the system/tool/app access account that is relevant to this role in the org. The equivalent UserProfile should exist with a &#39;profileId&#39; equal to this identifier value. Model Primitive Datatype &#x3D; AnyURI.',
  `beginDate` DATE DEFAULT NULL COMMENT 'The start date on which the role becomes active (inclusive).  Model Primitive Datatype &#x3D; Date.',
  `endDate` DATE DEFAULT NULL COMMENT 'The end date on which the role becomes inactive (exclusive).  Model Primitive Datatype &#x3D; Date.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for one mapping between a role and an org for the user. ';

--
-- Table structure for table `SingleAcademicSessionDType` generated from model 'SingleAcademicSessionDType'
-- This is the container for a single academicSession instance for a message payload. 
--

CREATE TABLE IF NOT EXISTS `SingleAcademicSessionDType` (
  `academicSession` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a single academicSession instance for a message payload. ';

--
-- Table structure for table `SingleClassDType` generated from model 'SingleClassDType'
-- This is the container for a single class instance for a message payload. 
--

CREATE TABLE IF NOT EXISTS `SingleClassDType` (
  `class` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a single class instance for a message payload. ';

--
-- Table structure for table `SingleCourseDType` generated from model 'SingleCourseDType'
-- This is the container for a single course instance for a message payload. 
--

CREATE TABLE IF NOT EXISTS `SingleCourseDType` (
  `course` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a single course instance for a message payload. ';

--
-- Table structure for table `SingleDemographicsDType` generated from model 'SingleDemographicsDType'
-- This is the container for a single demographics instance for a message payload. 
--

CREATE TABLE IF NOT EXISTS `SingleDemographicsDType` (
  `demographics` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a single demographics instance for a message payload. ';

--
-- Table structure for table `SingleEnrollmentDType` generated from model 'SingleEnrollmentDType'
-- This is the container for a single enrollment instance for a message payload. 
--

CREATE TABLE IF NOT EXISTS `SingleEnrollmentDType` (
  `enrollment` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a single enrollment instance for a message payload. ';

--
-- Table structure for table `SingleOrgDType` generated from model 'SingleOrgDType'
-- This is the container for a single org instance for a message payload. 
--

CREATE TABLE IF NOT EXISTS `SingleOrgDType` (
  `org` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a single org instance for a message payload. ';

--
-- Table structure for table `SingleUserDType` generated from model 'SingleUserDType'
-- This is the container for a single user instance for a message payload. 
--

CREATE TABLE IF NOT EXISTS `SingleUserDType` (
  `user` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a single user instance for a message payload. ';

--
-- Table structure for table `UserDType` generated from model 'UserDType'
-- Users, Teachers and Students are human beings that are teaching or studying in a class respectively. A single User class is used to represent both teachers and students and a role property is used to distinguish a user&#39;s natural role.Humans may have relationships with other humans. For example, a student may have parents. The &#39;agents&#39; attribute allows for relationships between humans to be expressed. Note that these are typically from the point of view of the student - so a student will link to its parents (via the agent attribute). The reverse view MUST also be modeled, so for example, a user of role &#39;parent&#39; MUST have agents that are of type &#39;student&#39;. Note: Teachers MUST NOT be set as agents of students i.e. the teaching relationship is covered via enrollments.  
--

CREATE TABLE IF NOT EXISTS `UserDType` (
  `sourcedId` TEXT NOT NULL COMMENT 'The sourcedId of the object. All objects MUST be identified by a Source Identifier. This is a GUID  System ID for an object.',
  `status` ENUM('active', 'tobedeleted') NOT NULL COMMENT 'All objects MUST BE either &#39;active&#39; or &#39;tobedeleted&#39;.  Something which is flagged &#39;tobedeleted&#39; is to be considered safe to delete. Systems can delete records that are flagged as such if they wish, but they are not under any compulsion to do so. In v1.1 the enumeration value of &#39;inactive&#39; was removed and so for backwards compatibility all such marked objects should be interpreted as &#39;tobedeleted&#39;. ',
  `dateLastModified` DATETIME NOT NULL COMMENT 'All objects MUST be annotated with the dateTime upon which they were last modified. This enables requesters to query for just the latest objects. DateTimes MUST be expressed in W3C profile of [ISO 8601] and MUST contain the UTC timezone. Model Primitive Datatype &#x3D; DateTime.',
  `metadata` TEXT DEFAULT NULL COMMENT 'The container for the proprietary extensions. ',
  `userMasterIdentifier` TEXT DEFAULT NULL COMMENT 'The master unique identifier for this user. This is NOT the same as the user&#39;s interoperability &#39;sourcedId&#39;. This should be used to ensure that all of the system identifiers/accounts etc. can be reconciled to the same user. How this identifier is assigned and its format is beyond the scope of this specification. Model Primitive Datatype &#x3D; NormalizedString.',
  `username` TEXT DEFAULT NULL COMMENT 'The user name assigned to the user. NOTE - This has been kept for backwards compatibility with OneRoster 1.1 and the new &#39;userProfiles&#39; characteristic SHOULD be used instead. Model Primitive Datatype &#x3D; NormalizedString.',
  `userIds` TEXT DEFAULT NULL COMMENT 'The set of external user identifiers that should be used for this user, if for some reason the sourcedId cannot be used. This might be an active directory id, an LTI id, or some other machine-readable identifier that is used for this person. ',
  `enabledUser` ENUM('true', 'false') NOT NULL COMMENT 'This is used to determine whether or not the record is active in the local system. &#39;false&#39; denotes that the record is active but system access is curtailed according to the local administration rules. ',
  `givenName` TEXT NOT NULL COMMENT 'The given name. Also, known as the first name. Model Primitive Datatype &#x3D; NormalizedString.',
  `familyName` TEXT NOT NULL COMMENT 'The family name. Also, known as the last name. Model Primitive Datatype &#x3D; NormalizedString.',
  `middleName` TEXT DEFAULT NULL COMMENT 'The set of middle names. If more than one middle name is needed separate using a space e.g. &#39;Wingarde Granville&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `preferredFirstName` TEXT DEFAULT NULL COMMENT 'The user&#39;s preferred first name. This attribute was added in version 1.2. Model Primitive Datatype &#x3D; NormalizedString.',
  `preferredMiddleName` TEXT DEFAULT NULL COMMENT 'The user&#39;s preferred middle name(s). This attribute was added in version 1.2. Model Primitive Datatype &#x3D; NormalizedString.',
  `preferredLastName` TEXT DEFAULT NULL COMMENT 'The user&#39;s preferred last name. This attribute was added in version 1.2. Model Primitive Datatype &#x3D; NormalizedString.',
  `pronouns` TEXT DEFAULT NULL COMMENT 'The pronoun(s) by which this person is referenced. Examples (in the case of English) include &#39;she/her/hers&#39;, &#39;he/him/his&#39;, &#39;they/them/theirs&#39;, &#39;ze/hir/hir&#39;, &#39;xe/xir&#39;, or a statement that the person&#39;s name should be used instead of any pronoun. Model Primitive Datatype &#x3D; NormalizedString.',
  `roles` TEXT NOT NULL COMMENT 'The set of roles for each of the orgs to which the user is affilliated. This is expressed as a set of role/org tuples. ',
  `userProfiles` TEXT DEFAULT NULL COMMENT 'The set of system/app/tool profiles for the user. ',
  `primaryOrg` TEXT DEFAULT NULL,
  `identifier` TEXT DEFAULT NULL COMMENT 'An identifier for the user. NOTE - This characteristic is kept for backwards compatibility with OneRoster 1.1/1.0. The &#39;userIds&#39; characteristic SHOULD be used instead. Model Primitive Datatype &#x3D; String.',
  `email` TEXT DEFAULT NULL COMMENT 'The email address for the user. Model Primitive Datatype &#x3D; NormalizedString.',
  `sms` TEXT DEFAULT NULL COMMENT 'The SMS number for the user. Model Primitive Datatype &#x3D; NormalizedString.',
  `phone` TEXT DEFAULT NULL COMMENT 'The phone number for the user. Model Primitive Datatype &#x3D; NormalizedString.',
  `agents` TEXT DEFAULT NULL COMMENT 'The links to other people i.e. User &#39;sourcedIds&#39;. ',
  `grades` TEXT DEFAULT NULL COMMENT 'Grade(s) for which a user with role &#39;student&#39; is enrolled. The permitted vocabulary should be defined as part of the adoption and deployment process. See the Implementation Guide [OR-IMPL-12] for more details on how to define/use such a vocabulary. Model Primitive Datatype &#x3D; NormalizedString.',
  `password` TEXT DEFAULT NULL COMMENT 'A top-level password for the user. Care should be taken when using this field and the password SHOULD be encrypted. Model Primitive Datatype &#x3D; String.',
  `resources` TEXT DEFAULT NULL COMMENT 'The identifiers (GUIDs) for the set of resources that are to be made available to the user. These are the sourcedIds that should be used for obtaining the metadata about the resources using the OR 1.2 Resources Service [OR-RES-SM-12]. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Users, Teachers and Students are human beings that are teaching or studying in a class respectively. A single User class is used to represent both teachers and students and a role property is used to distinguish a user&#39;s natural role.Humans may have relationships with other humans. For example, a student may have parents. The &#39;agents&#39; attribute allows for relationships between humans to be expressed. Note that these are typically from the point of view of the student - so a student will link to its parents (via the agent attribute). The reverse view MUST also be modeled, so for example, a user of role &#39;parent&#39; MUST have agents that are of type &#39;student&#39;. Note: Teachers MUST NOT be set as agents of students i.e. the teaching relationship is covered via enrollments.  ';

--
-- Table structure for table `UserGUIDRefDType` generated from model 'UserGUIDRefDType'
-- This is the container for reference to a OneRoster &#39;User&#39; object that has an allocated sourcedId (GUID). 
--

CREATE TABLE IF NOT EXISTS `UserGUIDRefDType` (
  `href` TEXT NOT NULL COMMENT 'The URI for the type of object being referenced. Model Primitive Datatype &#x3D; AnyURI.',
  `sourcedId` TEXT NOT NULL COMMENT 'The globally unique identifier of the object being referenced. Model Primitive Datatype &#x3D; String.',
  `type` ENUM('user') NOT NULL COMMENT 'The type of object being referenced i.e. a &#39;user&#39;. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for reference to a OneRoster &#39;User&#39; object that has an allocated sourcedId (GUID). ';

--
-- Table structure for table `UserIdDType` generated from model 'UserIdDType'
-- This is the set of external user identifiers that should be used for this user, if for some reason the sourcedId cannot be used. This might be an active directory id, an LTI id, or some other machine-readable identifier that is used for this person. 
--

CREATE TABLE IF NOT EXISTS `UserIdDType` (
  `type` TEXT NOT NULL COMMENT 'The type of identifier. This is no predefined vocabuary. Model Primitive Datatype &#x3D; NormalizedString.',
  `identifier` TEXT NOT NULL COMMENT 'The user identifier. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the set of external user identifiers that should be used for this user, if for some reason the sourcedId cannot be used. This might be an active directory id, an LTI id, or some other machine-readable identifier that is used for this person. ';

--
-- Table structure for table `UserProfileDType` generated from model 'UserProfileDType'
-- The container for the information about a User Profile that will provide the user with access to some system, application, tool, etc. 
--

CREATE TABLE IF NOT EXISTS `UserProfileDType` (
  `profileId` TEXT NOT NULL COMMENT 'The unique identifier for the profile. This does not need to be a globally unique identifier but it must be unique within the scope of the user. Model Primitive Datatype &#x3D; AnyURI.',
  `profileType` TEXT NOT NULL COMMENT 'The type of profile. This should be a human readable label that has some significance in the context of the related system, app, tool, etc. Model Primitive Datatype &#x3D; NormalizedString.',
  `vendorId` TEXT NOT NULL COMMENT 'The unique identifier for the vendor of the system, tool, app, etc. which requires the use of this profile. Model Primitive Datatype &#x3D; NormalizedString.',
  `applicationId` TEXT DEFAULT NULL COMMENT 'Identifier for the application associated with the account. The nature, and how this identifier is assigned is not defined by this specification. This may have a value of &#39;default&#39; to denote this account should be used for default access to all applications related to this vendor. Model Primitive Datatype &#x3D; NormalizedString.',
  `description` TEXT DEFAULT NULL COMMENT 'A human readable description of the use of the profile. This should not contain any security information for access to the account. Model Primitive Datatype &#x3D; String.',
  `credentials` TEXT DEFAULT NULL COMMENT 'The set of credentials that are available for access to this profile. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The container for the information about a User Profile that will provide the user with access to some system, application, tool, etc. ';

--
-- Table structure for table `UserSetDType` generated from model 'UserSetDType'
-- This is the container for a collection of user instances for a message payload. This may be empty if no instances are found that sustain the applied query constraints. The order is not significant. 
--

CREATE TABLE IF NOT EXISTS `UserSetDType` (
  `users` TEXT DEFAULT NULL COMMENT 'The collection of user instances. The order is not significant. The corresponding query constraints may result in no instances being returned. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a collection of user instances for a message payload. This may be empty if no instances are found that sustain the applied query constraints. The order is not significant. ';


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
