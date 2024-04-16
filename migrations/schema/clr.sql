/* SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO"; */
/* SET AUTOCOMMIT = 0; */
/* START TRANSACTION; */
/* SET time_zone = "+00:00"; */

-- --------------------------------------------------------

--
-- Table structure for table `AchievementDType` generated from model 'AchievementDType'
-- An accomplishment such as completing a degree, mastering a competency, or course completion that may be asserted about one or more learners. 
--

CREATE TABLE IF NOT EXISTS `AchievementDType` (
  `id` TEXT NOT NULL COMMENT 'Globally unique IRI for the Achievement. If the IRI is a URL it must resolve to an Achievement resource. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this object. Normally &#39;Achievement&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `achievementType` TEXT DEFAULT NULL,
  `alignments` TEXT DEFAULT NULL COMMENT 'Alignment objects describe an alignment between this achievement and a node in an educational framework. ',
  `associations` TEXT DEFAULT NULL COMMENT 'Associations between this achievement and other achievements. ',
  `creditsAvailable` DECIMAL(20, 9) DEFAULT NULL COMMENT 'Credit hours associated with this entity, or credit hours possible. For example &#39;3.0&#39;. Model Primitive Datatype &#x3D; Float.',
  `description` TEXT DEFAULT NULL COMMENT 'A short description of the achievement. May be the same as name if no description is available. Model Primitive Datatype &#x3D; String.',
  `endorsements` TEXT DEFAULT NULL COMMENT 'Allows endorsers to make specific claims about the Achievement. ',
  `humanCode` TEXT DEFAULT NULL COMMENT 'The code, generally human readable, associated with an achievement. Model Primitive Datatype &#x3D; String.',
  `identifiers` TEXT DEFAULT NULL COMMENT 'A set of System Identifiers that represent other identifiers for this Achievement. ',
  `name` TEXT NOT NULL COMMENT 'The name of the achievement. Model Primitive Datatype &#x3D; String.',
  `fieldOfStudy` TEXT DEFAULT NULL COMMENT 'Category, subject, area of study,  discipline, or general branch of knowledge. Examples include Business, Education, Psychology, and Technology.  Model Primitive Datatype &#x3D; String.',
  `image` TEXT DEFAULT NULL COMMENT 'IRI of an image representing the achievement. May be a Data URI or the URL where the image may be found. Model Primitive Datatype &#x3D; NormalizedString.',
  `issuer` TEXT NOT NULL,
  `level` TEXT DEFAULT NULL COMMENT 'Text that describes the level of achievement apart from how the achievement was performed or demonstrated. Examples would include &#39;Level 1&#39;, &#39;Level 2&#39;, &#39;Level 3&#39;, or &#39;Bachelors&#39;, &#39;Masters&#39;, &#39;Doctoral&#39;. Model Primitive Datatype &#x3D; String.',
  `requirement` TEXT DEFAULT NULL,
  `resultDescriptions` TEXT DEFAULT NULL COMMENT 'The set of result descriptions that may be asserted as results with this achievement. ',
  `signedEndorsements` TEXT DEFAULT NULL COMMENT 'Signed endorsements in JWS Compact Serialization format. Model Primitive Datatype &#x3D; String. ',
  `specialization` TEXT DEFAULT NULL COMMENT 'Name given to the focus, concentration, or specific area of study defined in the achievement. Examples include Entrepreneurship, Technical Communication, and Finance. Model Primitive Datatype &#x3D; String.',
  `tags` TEXT DEFAULT NULL COMMENT 'Tags that describe the type of achievement. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='An accomplishment such as completing a degree, mastering a competency, or course completion that may be asserted about one or more learners. ';

--
-- Table structure for table `AddressDType` generated from model 'AddressDType'
-- Based on schema.org Address object. 
--

CREATE TABLE IF NOT EXISTS `AddressDType` (
  `id` TEXT DEFAULT NULL COMMENT 'Unique IRI for the Address. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this object. Normally &#39;Address&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `addressCountry` TEXT DEFAULT NULL COMMENT 'The country. For example, USA. You can also provide the two-letter ISO 3166-1 alpha-2 country code. Model Primitive Datatype &#x3D; String.',
  `addressLocality` TEXT DEFAULT NULL COMMENT 'The locality. For example, Mountain View. Model Primitive Datatype &#x3D; String.',
  `addressRegion` TEXT DEFAULT NULL COMMENT 'The region. For example, CA. Model Primitive Datatype &#x3D; String.',
  `postalCode` TEXT DEFAULT NULL COMMENT 'The postal code. For example, 94043. Model Primitive Datatype &#x3D; String.',
  `postOfficeBoxNumber` TEXT DEFAULT NULL COMMENT 'The post office box number for PO box addresses. Model Primitive Datatype &#x3D; String.',
  `streetAddress` TEXT DEFAULT NULL COMMENT 'The street address. For example, 1600 Amphitheatre Pkwy. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Based on schema.org Address object. ';

--
-- Table structure for table `AlignmentDType` generated from model 'AlignmentDType'
-- Alignment is based on the schema.org AlignmentObject. 
--

CREATE TABLE IF NOT EXISTS `AlignmentDType` (
  `id` TEXT DEFAULT NULL COMMENT 'Unique IRI for the object. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this entity. Normally &#39;Alignment&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `targetCode` TEXT DEFAULT NULL COMMENT 'If applicable, a locally unique string identifier that identifies the alignment target within its framework. Model Primitive Datatype &#x3D; String.',
  `targetDescription` TEXT DEFAULT NULL COMMENT 'The description of a node in an established educational framework. Model Primitive Datatype &#x3D; String.',
  `targetName` TEXT NOT NULL COMMENT 'The name of a node in an established educational framework. Model Primitive Datatype &#x3D; String.',
  `targetFramework` TEXT DEFAULT NULL COMMENT 'The name of the framework to which the resource being described is aligned. Model Primitive Datatype &#x3D; String.',
  `targetType` TEXT DEFAULT NULL,
  `targetUrl` TEXT NOT NULL COMMENT 'The URL of a node in an established educational framework. When the alignment is to a CASE framework and the CASE Service support the CASE JSON-LD binding, the URL should be the &#39;uri&#39; of the node document, otherwise the URL should be the CASE Service endpoint URL that returns the node JSON. Model Primitive Datatype &#x3D; AnyURI.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Alignment is based on the schema.org AlignmentObject. ';

--
-- Table structure for table `ArtifactDType` generated from model 'ArtifactDType'
-- An artifact that is part of an evidence object. 
--

CREATE TABLE IF NOT EXISTS `ArtifactDType` (
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of the object. Normally &#39;Artifact&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `description` TEXT DEFAULT NULL COMMENT 'A description of the artifact. Model Primitive Datatype &#x3D; String.',
  `name` TEXT DEFAULT NULL COMMENT 'The name of the artifact. Model Primitive Datatype &#x3D; String.',
  `url` TEXT DEFAULT NULL COMMENT 'IRI of the artifact. May be a Data URI or the URL where the artifact may be found. Model Primitive Datatype &#x3D; NormalizedString.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='An artifact that is part of an evidence object. ';

--
-- Table structure for table `AssertionDType` generated from model 'AssertionDType'
-- Assertions are representations of an Achievement awarded to a Learner.  It is used to share information about the Achievement Assertion, such as a result and verification method. Assertions are packaged for transmission as JSON objects with a set of mandatory and optional properties. 
--

CREATE TABLE IF NOT EXISTS `AssertionDType` (
  `id` TEXT NOT NULL COMMENT 'Globally unique IRI for the Assertion. If the IRI is a URL it must resolve to an Assertion resource. If the Assertion is verified using Hosted verification, the IRI must be a URL. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this object. Normally &#39;Assertion&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `achievement` TEXT DEFAULT NULL,
  `activityEndDate` DATETIME DEFAULT NULL COMMENT 'If present, end date for the activity. Model Primitive Datatype &#x3D; DateTime.',
  `activityStartDate` DATETIME DEFAULT NULL COMMENT 'If present, start date for the activity. Model Primitive Datatype &#x3D; DateTime.',
  `creditsEarned` DECIMAL(20, 9) DEFAULT NULL COMMENT 'The number of credits earned, generally in semester or quarter credit hours.  This field correlates with the Achievement creditsAvailable field. Model Primitive Datatype &#x3D; Float.',
  `endorsements` TEXT DEFAULT NULL COMMENT 'Allows endorsers to make specific claims about the assertion. ',
  `evidence` TEXT DEFAULT NULL COMMENT 'Evidence describing the work that the recipient did to earn the achievement. This can be a webpage that links out to other pages if linking directly to the work is infeasible. ',
  `expires` DATETIME DEFAULT NULL COMMENT 'If the achievement has some notion of expiry, this indicates a timestamp when an assertion should no longer be considered valid. After this time, the assertion should be considered expired. Model Primitive Datatype &#x3D; DateTime.',
  `image` TEXT DEFAULT NULL COMMENT 'IRI of an image representing the assertion. May be a Data URI or the URL where the image may be found. Model Primitive Datatype &#x3D; NormalizedString.',
  `issuedOn` DATETIME DEFAULT NULL COMMENT 'Timestamp of when the achievement was awarded. Required unless the assertion is revoked. Model Primitive Datatype &#x3D; DateTime.',
  `licenseNumber` TEXT DEFAULT NULL COMMENT 'The license number that was issued with this assertion. Model Primitive Datatype &#x3D; String.',
  `narrative` TEXT DEFAULT NULL COMMENT 'A narrative that describes the connection between multiple pieces of evidence. Likely only present if evidence is a multi-value array. Markdown allowed. Model Primitive Datatype &#x3D; String.',
  `recipient` TEXT DEFAULT NULL,
  `results` TEXT DEFAULT NULL COMMENT 'The set of results being asserted. ',
  `revocationReason` TEXT DEFAULT NULL COMMENT 'Optional published reason for revocation, if revoked. Model Primitive Datatype &#x3D; String.',
  `revoked` TINYINT(1) DEFAULT NULL COMMENT 'Defaults to false if this assertion is not referenced in a RevocationList. If revoked is true, only revoked and id are required properties, and many issuers strip a hosted assertion down to only those properties when revoked. Model Primitive Datatype &#x3D; Boolean.',
  `role` TEXT DEFAULT NULL COMMENT 'Role, position, or title of the learner when demonstrating or performing the achievement or evidence of learning being asserted. Examples include &#39;Student President&#39;, &#39;Intern&#39;, &#39;Captain&#39;, etc. Model Primitive Datatype &#x3D; String.',
  `signedEndorsements` TEXT DEFAULT NULL COMMENT 'Signed endorsements in JWS Compact Serialization format. Model Primitive Datatype &#x3D; String. ',
  `source` TEXT DEFAULT NULL,
  `term` TEXT DEFAULT NULL COMMENT 'The academic term in which this assertion was achieved. Model Primitive Datatype &#x3D; String.',
  `verification` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Assertions are representations of an Achievement awarded to a Learner.  It is used to share information about the Achievement Assertion, such as a result and verification method. Assertions are packaged for transmission as JSON objects with a set of mandatory and optional properties. ';

--
-- Table structure for table `AssociationDType` generated from model 'AssociationDType'
-- Association is based on the CASE AssociationLink object. An Association associates (relates) one Achievement with another Achievement. 
--

CREATE TABLE IF NOT EXISTS `AssociationDType` (
  `associationType` ENUM('exactMatchOf', 'exemplar', 'hasSkillLevel', 'isChildOf', 'isParentOf', 'isPartOf', 'isPeerOf', 'isRelatedTo', 'precedes', 'replacedBy') NOT NULL COMMENT 'The type of association. This uses an enumerated vocabulary. ',
  `targetId` TEXT NOT NULL COMMENT 'The &#39;@id&#39; of another achievement, or target of the association. Model Primitive Datatype &#x3D; NormalizedString.',
  `title` TEXT NOT NULL COMMENT 'A human readable title for the associated achievement. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Association is based on the CASE AssociationLink object. An Association associates (relates) one Achievement with another Achievement. ';

--
-- Table structure for table `ClrDType` generated from model 'ClrDType'
-- A collection of assertions for a single person reported by a single publisher. 
--

CREATE TABLE IF NOT EXISTS `ClrDType` (
  `id` TEXT NOT NULL COMMENT 'Globally unique IRI for the CLR. If the IRI is a URL is must resolve to a CLR resource and conform to the getClr endpoint format. If the CLR is verified using Hosted verification, the IRI must be a URL. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this object. Normally &#39;Clr&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `achievements` TEXT DEFAULT NULL COMMENT 'Array of achievements that are related directly or indirectly through associations with the asserted achievements in the CLR. Primarily used to represent hierarchical pathways. Asserted achievements may appear in both this array and in the achievement assertion. If asserted achievements do appear in both places, they MUST match exactly. ',
  `assertions` TEXT DEFAULT NULL COMMENT 'The learner&#39;s asserted achievements. ',
  `endorsements` TEXT DEFAULT NULL COMMENT 'Allows endorsers to make specific claims about the CLR, or any assertion, achievement, or profile referenced in the CLR. ',
  `issuedOn` DATETIME NOT NULL COMMENT 'Timestamp of when the CLR was published. Model Primitive Datatype &#x3D; DateTime.',
  `learner` TEXT NOT NULL,
  `name` TEXT DEFAULT NULL COMMENT 'Optional name of the CLR. Model Primitive Datatype &#x3D; String.',
  `partial` TINYINT(1) DEFAULT NULL COMMENT 'True if CLR does not contain all the assertions known by the publisher for the learner at the time the CLR is issued. Useful if you are sending a small set of achievements in real time when they are achieved. If False or omitted, the CLR SHOULD be interpreted as containing all the assertions for the learner known by the publisher at the time of issue. Model Primitive Datatype &#x3D; Boolean.',
  `publisher` TEXT NOT NULL,
  `revocationReason` TEXT DEFAULT NULL COMMENT 'If revoked, optional reason for revocation. Model Primitive Datatype &#x3D; String.',
  `revoked` TINYINT(1) DEFAULT NULL COMMENT 'If True the CLR is revoked. Model Primitive Datatype &#x3D; Boolean.',
  `signedAssertions` TEXT DEFAULT NULL COMMENT 'Signed assertions in JWS Compact Serialization format. Model Primitive Datatype &#x3D; String. ',
  `signedEndorsements` TEXT DEFAULT NULL COMMENT 'Signed endorsements of the CLR or any Achievement, Assertion, or Profile in the CLR; in JWS Compact Serialization format. Model Primitive Datatype &#x3D; String. ',
  `verification` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='A collection of assertions for a single person reported by a single publisher. ';

--
-- Table structure for table `ClrSetDType` generated from model 'ClrSetDType'
-- A set of CLRs. 
--

CREATE TABLE IF NOT EXISTS `ClrSetDType` (
  `@context` TEXT NOT NULL,
  `id` TEXT DEFAULT NULL COMMENT 'Unique IRI for the ClrSet. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this object. Normally &#39;ClrSet&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `clrs` TEXT DEFAULT NULL COMMENT 'A set of Clrs ',
  `signedClrs` TEXT DEFAULT NULL COMMENT 'A set of Clrs in JWS Compact Serialization format. Model Primitive Datatype &#x3D; String. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='A set of CLRs. ';

--
-- Table structure for table `CriteriaDType` generated from model 'CriteriaDType'
-- Descriptive metadata about the achievements necessary to be recognized with an Assertion of a particular AchievementType. This data is added to the AchievementType so that it may be rendered when that AchievementType is displayed, instead of simply a link to human-readable criteria external to the Achievement Assertion. Embedding criteria allows either enhancement of an external criteria page or increased portability and ease of use by allowing issuers to skip hosting the formerly-required external criteria page altogether. 
--

CREATE TABLE IF NOT EXISTS `CriteriaDType` (
  `id` TEXT DEFAULT NULL COMMENT 'The URI of a webpage that describes the criteria for the Achievement in a human-readable format. Model Primitive Datatype &#x3D; AnyURI.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this object. Normally &#39;Criteria&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `narrative` TEXT DEFAULT NULL COMMENT 'A narrative of what is needed to earn the achievement. Markdown allowed. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Descriptive metadata about the achievements necessary to be recognized with an Assertion of a particular AchievementType. This data is added to the AchievementType so that it may be rendered when that AchievementType is displayed, instead of simply a link to human-readable criteria external to the Achievement Assertion. Embedding criteria allows either enhancement of an external criteria page or increased portability and ease of use by allowing issuers to skip hosting the formerly-required external criteria page altogether. ';

--
-- Table structure for table `CryptographicKeyDType` generated from model 'CryptographicKeyDType'
-- Based on the Key class from the W3C Web Payments Community Group Security Vocabulary. A CryptographicKey document identifies and describes a public key used to verify signed Assertions. 
--

CREATE TABLE IF NOT EXISTS `CryptographicKeyDType` (
  `id` TEXT NOT NULL COMMENT 'The URI of the CryptographicKey document. Used during signed verification. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this object. Normally &#39;CryptographicKey&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `owner` TEXT NOT NULL COMMENT 'The identifier for the Profile that owns this PUBLIC KEY and the PRIVATE KEY used to sign the assertion or endorsement. Model Primitive Datatype &#x3D; NormalizedString.',
  `publicKeyPem` TEXT NOT NULL COMMENT 'The PUBLIC KEY in PEM format corresponding to the PRIVATE KEY used by the owner to sign the assertion or endorsement. The PEM key encoding is a widely-used method to express public keys, compatible with almost every Secure Sockets Layer library implementation. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Based on the Key class from the W3C Web Payments Community Group Security Vocabulary. A CryptographicKey document identifies and describes a public key used to verify signed Assertions. ';

--
-- Table structure for table `DiscoveryDocumentDType` generated from model 'DiscoveryDocumentDType'
-- Configuration information about the provider implementation. 
--

CREATE TABLE IF NOT EXISTS `DiscoveryDocumentDType` (
  `@context` TEXT NOT NULL,
  `authorizationUrl` TEXT NOT NULL COMMENT 'A fully qualifed URL to the provider&#39;s OAuth 2.0 Authorization endpoint. Model Primitive Datatype &#x3D; AnyURI.',
  `image` TEXT DEFAULT NULL COMMENT 'An image representing the provider. May be a Data URI or the URL where the image may be found. Model Primitive Datatype &#x3D; NormalizedString.',
  `name` TEXT NOT NULL COMMENT 'The user-facing name of the platform providing CLR services. Model Primitive Datatype &#x3D; String.',
  `privacyPolicyUrl` TEXT NOT NULL COMMENT 'A fully qualified URL to the provider&#39;s privacy policy. Model Primitive Datatype &#x3D; AnyURI.',
  `registrationUrl` TEXT NOT NULL COMMENT 'A fully qualified URL to the provider&#39;s OAuth 2.0 Registration endpoint. Model Primitive Datatype &#x3D; AnyURI.',
  `scopesOffered` TEXT NOT NULL COMMENT 'An array of OAuth 2.0 Scopes supported by the provider. Model Primitive Datatype &#x3D; AnyURI.',
  `termsOfServiceUrl` TEXT NOT NULL COMMENT 'A fully qualified URL to the provider&#39;s terms of service. Model Primitive Datatype &#x3D; AnyURI.',
  `tokenUrl` TEXT NOT NULL COMMENT 'A fully qualified URL to the provider&#39;s OAuth 2.0 Token endpoint. Model Primitive Datatype &#x3D; AnyURI.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Configuration information about the provider implementation. ';

--
-- Table structure for table `EndorsementClaimDType` generated from model 'EndorsementClaimDType'
-- An entity, identified by an id and additional properties that the endorser would like to claim about that entity. 
--

CREATE TABLE IF NOT EXISTS `EndorsementClaimDType` (
  `id` TEXT NOT NULL COMMENT 'The &#39;id&#39; of the Profile, Achievement, Assertion, or CLR being endorsed. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this entity. Normally &#39;EndorsementClaim&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `endorsementComment` TEXT DEFAULT NULL COMMENT 'An endorser&#39;s comment about the quality or fitness of the endorsed entity. Markdown allowed. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='An entity, identified by an id and additional properties that the endorser would like to claim about that entity. ';

--
-- Table structure for table `EndorsementDType` generated from model 'EndorsementDType'
-- An endorsement claim. 
--

CREATE TABLE IF NOT EXISTS `EndorsementDType` (
  `id` TEXT NOT NULL COMMENT 'Globally unique IRI for the Endorsement. If this Endorsement will be verified using Hosted verification, the value should be the URL of the hosted version of the Endorsement. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this entity. Normally &#39;Endorsement&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `claim` TEXT NOT NULL,
  `issuedOn` DATETIME NOT NULL COMMENT 'Timestamp of when the endorsement was published. Model Primitive Datatype &#x3D; DateTime.',
  `issuer` TEXT NOT NULL,
  `revocationReason` TEXT DEFAULT NULL COMMENT 'If revoked, optional reason for revocation. Model Primitive Datatype &#x3D; String.',
  `revoked` TINYINT(1) DEFAULT NULL COMMENT 'If True the endorsement is revoked. Model Primitive Datatype &#x3D; Boolean.',
  `verification` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='An endorsement claim. ';

--
-- Table structure for table `EndorsementProfileDType` generated from model 'EndorsementProfileDType'
-- A Profile is a collection of information that describes the person or organization using Comprehensive Learner Record (CLR). Publishers, learners, and issuers must be represented as profiles. Recipients, endorsers, or other entities may also be represented using this vocabulary. An EndorsementProfile cannot have endorsements. 
--

CREATE TABLE IF NOT EXISTS `EndorsementProfileDType` (
  `id` TEXT NOT NULL COMMENT 'Globally unique IRI for the Profile. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this entity. Normally &#39;Profile&#39;. Unlike the Profile object, the EndorsementProfile object does not have an &#39;endorsements&#39; property. Model Primitive Datatype &#x3D; NormalizedString.',
  `additionalName` TEXT DEFAULT NULL COMMENT 'An additional name for a person, can be used for a middle name. Model Primitive Datatype &#x3D; String.',
  `address` TEXT DEFAULT NULL,
  `description` TEXT DEFAULT NULL COMMENT 'A short description of the individual or organization. Model Primitive Datatype &#x3D; String.',
  `email` TEXT DEFAULT NULL COMMENT 'A contact email address for the individual or organization. Model Primitive Datatype &#x3D; String.',
  `familyName` TEXT DEFAULT NULL COMMENT 'Family name of a person. In the U.S., the last name of a person. Model Primitive Datatype &#x3D; String.',
  `givenName` TEXT DEFAULT NULL COMMENT 'Given name of a person. In the U.S., the first name of a person. Model Primitive Datatype &#x3D; String.',
  `identifiers` TEXT DEFAULT NULL COMMENT 'A set of System Identifiers that represent other identifiers for this Profile. ',
  `image` TEXT DEFAULT NULL COMMENT 'Image representing the individual or organization. Model Primitive Datatype &#x3D; NormalizedString.',
  `name` TEXT DEFAULT NULL COMMENT 'The full name of the individual or organization. Model Primitive Datatype &#x3D; String.',
  `official` TEXT DEFAULT NULL COMMENT 'The name of the authorized official for the Issuer. Model Primitive Datatype &#x3D; String.',
  `publicKey` TEXT DEFAULT NULL,
  `revocationList` TEXT DEFAULT NULL COMMENT 'The URL of the Revocation List document used for marking revocation of signed Assertions, CLRs, and Endorsements. Required for issuer profiles. Model Primitive Datatype &#x3D; AnyURI.',
  `sourcedId` TEXT DEFAULT NULL COMMENT 'The individual&#39;s unique &#39;sourcedId&#39; value, which is used for providing interoperability with IMS Learning Information Services (LIS). Model Primitive Datatype &#x3D; String.',
  `studentId` TEXT DEFAULT NULL COMMENT 'An institution&#39;s student identifier for the person. This is frequently issued through a Student Information System. Model Primitive Datatype &#x3D; String.',
  `telephone` TEXT DEFAULT NULL COMMENT 'Primary phone number for the individual or organization. Model Primitive Datatype &#x3D; String.',
  `url` TEXT DEFAULT NULL COMMENT 'Web resource that uniquely represents or belongs to the individual. This may be a resource about the individual, hosting provided by the institution to the individual, or an web resource independently controlled by the individual. Model Primitive Datatype &#x3D; AnyURI.',
  `verification` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='A Profile is a collection of information that describes the person or organization using Comprehensive Learner Record (CLR). Publishers, learners, and issuers must be represented as profiles. Recipients, endorsers, or other entities may also be represented using this vocabulary. An EndorsementProfile cannot have endorsements. ';

--
-- Table structure for table `EvidenceDType` generated from model 'EvidenceDType'
-- One or more artifacts that represent supporting evidence for the record. Examples include text, media, websites, etc. 
--

CREATE TABLE IF NOT EXISTS `EvidenceDType` (
  `id` TEXT DEFAULT NULL COMMENT 'The URI of a webpage presenting evidence of achievement. Model Primitive Datatype &#x3D; AnyURI.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this entity. Normally &#39;Evidence&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `artifacts` TEXT DEFAULT NULL COMMENT 'Artifacts that are part of the evidence. ',
  `audience` TEXT DEFAULT NULL COMMENT 'A description of the intended audience for a piece of evidence. Model Primitive Datatype &#x3D; String.',
  `description` TEXT DEFAULT NULL COMMENT 'A longer description of the evidence. Model Primitive Datatype &#x3D; String.',
  `genre` TEXT DEFAULT NULL COMMENT 'A string that describes the type of evidence. For example, Poetry, Prose, Film. Model Primitive Datatype &#x3D; String.',
  `name` TEXT NOT NULL COMMENT 'The name of the evidence. Model Primitive Datatype &#x3D; String.',
  `narrative` TEXT DEFAULT NULL COMMENT 'A narrative that describes the evidence and process of achievement that led to an assertion. Markdown allowed. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='One or more artifacts that represent supporting evidence for the record. Examples include text, media, websites, etc. ';

--
-- Table structure for table `GetAssertionPayloadDType` generated from model 'GetAssertionPayloadDType'
-- Payload for the &#39;getAssertion&#39; operation. 
--

CREATE TABLE IF NOT EXISTS `GetAssertionPayloadDType` (
  `@context` TEXT NOT NULL,
  `id` TEXT NOT NULL COMMENT 'Globally unique IRI for the Assertion. If the IRI is a URL it must resolve to an Assertion resource. If the Assertion is verified using Hosted verification, the IRI must be a URL. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this object. Normally &#39;Assertion&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `achievement` TEXT DEFAULT NULL,
  `activityEndDate` DATETIME DEFAULT NULL COMMENT 'If present, end date for the activity. Model Primitive Datatype &#x3D; DateTime.',
  `activityStartDate` DATETIME DEFAULT NULL COMMENT 'If present, start date for the activity. Model Primitive Datatype &#x3D; DateTime.',
  `creditsEarned` DECIMAL(20, 9) DEFAULT NULL COMMENT 'The number of credits earned, generally in semester or quarter credit hours.  This field correlates with the Achievement creditsAvailable field. Model Primitive Datatype &#x3D; Float.',
  `endorsements` TEXT DEFAULT NULL COMMENT 'Allows endorsers to make specific claims about the assertion. ',
  `evidence` TEXT DEFAULT NULL COMMENT 'Evidence describing the work that the recipient did to earn the achievement. This can be a webpage that links out to other pages if linking directly to the work is infeasible. ',
  `expires` DATETIME DEFAULT NULL COMMENT 'If the achievement has some notion of expiry, this indicates a timestamp when an assertion should no longer be considered valid. After this time, the assertion should be considered expired. Model Primitive Datatype &#x3D; DateTime.',
  `image` TEXT DEFAULT NULL COMMENT 'IRI of an image representing the assertion. May be a Data URI or the URL where the image may be found. Model Primitive Datatype &#x3D; NormalizedString.',
  `issuedOn` DATETIME DEFAULT NULL COMMENT 'Timestamp of when the achievement was awarded. Required unless the assertion is revoked. Model Primitive Datatype &#x3D; DateTime.',
  `licenseNumber` TEXT DEFAULT NULL COMMENT 'The license number that was issued with this assertion. Model Primitive Datatype &#x3D; String.',
  `narrative` TEXT DEFAULT NULL COMMENT 'A narrative that describes the connection between multiple pieces of evidence. Likely only present if evidence is a multi-value array. Markdown allowed. Model Primitive Datatype &#x3D; String.',
  `recipient` TEXT DEFAULT NULL,
  `results` TEXT DEFAULT NULL COMMENT 'The set of results being asserted. ',
  `revocationReason` TEXT DEFAULT NULL COMMENT 'Optional published reason for revocation, if revoked. Model Primitive Datatype &#x3D; String.',
  `revoked` TINYINT(1) DEFAULT NULL COMMENT 'Defaults to false if this assertion is not referenced in a RevocationList. If revoked is true, only revoked and id are required properties, and many issuers strip a hosted assertion down to only those properties when revoked. Model Primitive Datatype &#x3D; Boolean.',
  `role` TEXT DEFAULT NULL COMMENT 'Role, position, or title of the learner when demonstrating or performing the achievement or evidence of learning being asserted. Examples include &#39;Student President&#39;, &#39;Intern&#39;, &#39;Captain&#39;, etc. Model Primitive Datatype &#x3D; String.',
  `signedEndorsements` TEXT DEFAULT NULL COMMENT 'Signed endorsements in JWS Compact Serialization format. Model Primitive Datatype &#x3D; String. ',
  `source` TEXT DEFAULT NULL,
  `term` TEXT DEFAULT NULL COMMENT 'The academic term in which this assertion was achieved. Model Primitive Datatype &#x3D; String.',
  `verification` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Payload for the &#39;getAssertion&#39; operation. ';

--
-- Table structure for table `GetClrPayloadDType` generated from model 'GetClrPayloadDType'
-- Payload for the &#39;getClr&#39; operation. 
--

CREATE TABLE IF NOT EXISTS `GetClrPayloadDType` (
  `@context` TEXT NOT NULL,
  `id` TEXT NOT NULL COMMENT 'Globally unique IRI for the CLR. If the IRI is a URL is must resolve to a CLR resource and conform to the getClr endpoint format. If the CLR is verified using Hosted verification, the IRI must be a URL. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this object. Normally &#39;Clr&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `achievements` TEXT DEFAULT NULL COMMENT 'Array of achievements that are related directly or indirectly through associations with the asserted achievements in the CLR. Primarily used to represent hierarchical pathways. Asserted achievements may appear in both this array and in the achievement assertion. If asserted achievements do appear in both places, they MUST match exactly. ',
  `assertions` TEXT DEFAULT NULL COMMENT 'The learner&#39;s asserted achievements. ',
  `endorsements` TEXT DEFAULT NULL COMMENT 'Allows endorsers to make specific claims about the CLR, or any assertion, achievement, or profile referenced in the CLR. ',
  `issuedOn` DATETIME NOT NULL COMMENT 'Timestamp of when the CLR was published. Model Primitive Datatype &#x3D; DateTime.',
  `learner` TEXT NOT NULL,
  `name` TEXT DEFAULT NULL COMMENT 'Optional name of the CLR. Model Primitive Datatype &#x3D; String.',
  `partial` TINYINT(1) DEFAULT NULL COMMENT 'True if CLR does not contain all the assertions known by the publisher for the learner at the time the CLR is issued. Useful if you are sending a small set of achievements in real time when they are achieved. If False or omitted, the CLR SHOULD be interpreted as containing all the assertions for the learner known by the publisher at the time of issue. Model Primitive Datatype &#x3D; Boolean.',
  `publisher` TEXT NOT NULL,
  `revocationReason` TEXT DEFAULT NULL COMMENT 'If revoked, optional reason for revocation. Model Primitive Datatype &#x3D; String.',
  `revoked` TINYINT(1) DEFAULT NULL COMMENT 'If True the CLR is revoked. Model Primitive Datatype &#x3D; Boolean.',
  `signedAssertions` TEXT DEFAULT NULL COMMENT 'Signed assertions in JWS Compact Serialization format. Model Primitive Datatype &#x3D; String. ',
  `signedEndorsements` TEXT DEFAULT NULL COMMENT 'Signed endorsements of the CLR or any Achievement, Assertion, or Profile in the CLR; in JWS Compact Serialization format. Model Primitive Datatype &#x3D; String. ',
  `verification` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Payload for the &#39;getClr&#39; operation. ';

--
-- Table structure for table `GetCryptographicKeyPayloadDType` generated from model 'GetCryptographicKeyPayloadDType'
-- Payload for the &#39;getKey&#39; operation. 
--

CREATE TABLE IF NOT EXISTS `GetCryptographicKeyPayloadDType` (
  `@context` TEXT NOT NULL,
  `id` TEXT NOT NULL COMMENT 'The URI of the CryptographicKey document. Used during signed verification. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this object. Normally &#39;CryptographicKey&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `owner` TEXT NOT NULL COMMENT 'The identifier for the Profile that owns this PUBLIC KEY and the PRIVATE KEY used to sign the assertion or endorsement. Model Primitive Datatype &#x3D; NormalizedString.',
  `publicKeyPem` TEXT NOT NULL COMMENT 'The PUBLIC KEY in PEM format corresponding to the PRIVATE KEY used by the owner to sign the assertion or endorsement. The PEM key encoding is a widely-used method to express public keys, compatible with almost every Secure Sockets Layer library implementation. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Payload for the &#39;getKey&#39; operation. ';

--
-- Table structure for table `GetEndorsementPayloadDType` generated from model 'GetEndorsementPayloadDType'
-- Payload for the &#39;getEndorsement&#39; operation. 
--

CREATE TABLE IF NOT EXISTS `GetEndorsementPayloadDType` (
  `@context` TEXT NOT NULL,
  `id` TEXT NOT NULL COMMENT 'Globally unique IRI for the Endorsement. If this Endorsement will be verified using Hosted verification, the value should be the URL of the hosted version of the Endorsement. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this entity. Normally &#39;Endorsement&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `claim` TEXT NOT NULL,
  `issuedOn` DATETIME NOT NULL COMMENT 'Timestamp of when the endorsement was published. Model Primitive Datatype &#x3D; DateTime.',
  `issuer` TEXT NOT NULL,
  `revocationReason` TEXT DEFAULT NULL COMMENT 'If revoked, optional reason for revocation. Model Primitive Datatype &#x3D; String.',
  `revoked` TINYINT(1) DEFAULT NULL COMMENT 'If True the endorsement is revoked. Model Primitive Datatype &#x3D; Boolean.',
  `verification` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Payload for the &#39;getEndorsement&#39; operation. ';

--
-- Table structure for table `GetRevocationListPayloadDType` generated from model 'GetRevocationListPayloadDType'
-- Payload for the &#39;getRevocationList&#39; operation. 
--

CREATE TABLE IF NOT EXISTS `GetRevocationListPayloadDType` (
  `@context` TEXT NOT NULL,
  `id` TEXT NOT NULL COMMENT 'The URI of the RevocationList document. Used during Signed verification. Model Primitive Datatype &#x3D; AnyURI.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this entity. Normally &#39;RevocationList&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `issuer` TEXT NOT NULL COMMENT 'The id of the Issuer. Model Primitive Datatype &#x3D; NormalizedString.',
  `revokedAssertions` TEXT DEFAULT NULL COMMENT 'The ids of revoked Assertions, Clrs, and Endorsements. Model Primitive Datatype &#x3D; NormalizedString. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Payload for the &#39;getRevocationList&#39; operation. ';

--
-- Table structure for table `IdentityDType` generated from model 'IdentityDType'
-- A collection of information about the recipient of an achievement assertion. 
--

CREATE TABLE IF NOT EXISTS `IdentityDType` (
  `id` TEXT DEFAULT NULL COMMENT 'Unique IRI for the Identity. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT NOT NULL COMMENT 'The type should identify the property by which the recipient of an Assertion is identified. This value should be an IRI mapped in the present context. For example, &#39;id&#39; indicates that the identity property value is the id of the recipient&#39;s profile. Model Primitive Datatype &#x3D; NormalizedString.',
  `identity` TEXT NOT NULL COMMENT 'Either the hash of the identity or the plaintext value. If it&#39;s possible that the plaintext transmission and storage of the identity value would leak personally identifiable information where there is an expectation of privacy, it is strongly recommended that an IdentityHash be used. Model Primitive Datatype &#x3D; String.',
  `hashed` TINYINT(1) NOT NULL COMMENT 'Whether or not the identity value is hashed. Model Primitive Datatype &#x3D; Boolean.',
  `salt` TEXT DEFAULT NULL COMMENT 'If the recipient is hashed, this should contain the string used to salt the hash. If this value is not provided, it should be assumed that the hash was not salted. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='A collection of information about the recipient of an achievement assertion. ';

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
  `imsx_codeMinorFieldValue` ENUM('forbidden', 'fullsuccess', 'internal_server_error', 'invalid_data', 'invalid_query_parameter', 'misdirected_request', 'not_acceptable', 'not_allowed', 'not_modified', 'server_busy', 'unauthorizedrequest', 'unknown') NOT NULL COMMENT 'The code minor status code (this is a value from the corresponding enumerated vocabulary). '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for a single code minor status code. ';

--
-- Table structure for table `imsx_StatusInfoDType` generated from model 'imsxUnderscoreStatusInfoDType'
-- This is the container for the status code and associated information returned within the HTTP messages received from the Service Provider. 
--

CREATE TABLE IF NOT EXISTS `imsx_StatusInfoDType` (
  `@context` TEXT NOT NULL,
  `imsx_codeMajor` ENUM('success', 'failure', 'processing', 'unsupported') NOT NULL COMMENT 'The code major value (from the corresponding enumerated vocabulary). ',
  `imsx_severity` ENUM('status', 'warning', 'error') NOT NULL COMMENT 'The severity value (from the corresponding enumerated vocabulary). ',
  `imsx_description` TEXT DEFAULT NULL COMMENT 'A human readable description supplied by the entity creating the status code information. Model Primitive Datatype &#x3D; String.',
  `imsx_codeMinor` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This is the container for the status code and associated information returned within the HTTP messages received from the Service Provider. ';

--
-- Table structure for table `PostClrPayloadDType` generated from model 'PostClrPayloadDType'
-- Payload for the &#39;postClr&#39; operation. Only one format (signed or unsigned) is allowed. 
--

CREATE TABLE IF NOT EXISTS `PostClrPayloadDType` (
  `@context` TEXT NOT NULL,
  `clr` TEXT DEFAULT NULL,
  `signedClr` TEXT DEFAULT NULL COMMENT 'The signed Clr in JWS Compact Serialization format. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Payload for the &#39;postClr&#39; operation. Only one format (signed or unsigned) is allowed. ';

--
-- Table structure for table `ProfileDType` generated from model 'ProfileDType'
-- A Profile is a collection of information that describes the person or organization using Comprehensive Learner Record (CLR). Publishers, learners, and issuers must be represented as profiles. Recipients, endorsers, or other entities may also be represented using this vocabulary. 
--

CREATE TABLE IF NOT EXISTS `ProfileDType` (
  `id` TEXT NOT NULL COMMENT 'Globally unique IRI for the Learner, Publisher, and Issuer Profile. If the IRI is a URL it must resolve to a Profile resource. The Assertion Recipient is identified by reference to the Learner&#39;s Profile via the id, email, url, telephone, sourcedId, or studentId property. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this object. Normally &#39;Profile&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `address` TEXT DEFAULT NULL,
  `additionalName` TEXT DEFAULT NULL COMMENT 'An additional name for a person, can be used for a middle name. Model Primitive Datatype &#x3D; String.',
  `birthDate` DATE DEFAULT NULL COMMENT 'Birthdate of the person. Model Primitive Datatype &#x3D; Date.',
  `description` TEXT DEFAULT NULL COMMENT 'A short description of the individual or organization. Model Primitive Datatype &#x3D; String.',
  `email` TEXT DEFAULT NULL COMMENT 'A contact email address for the individual or organization. Model Primitive Datatype &#x3D; String.',
  `endorsements` TEXT DEFAULT NULL COMMENT 'Allows endorsers to make specific claims about the individual or organization represented by this profile. ',
  `familyName` TEXT DEFAULT NULL COMMENT 'Family name of a person. In the U.S., the last name of a person. Model Primitive Datatype &#x3D; String.',
  `givenName` TEXT DEFAULT NULL COMMENT 'Given name of a person. In the U.S., the first name of a person. Model Primitive Datatype &#x3D; String.',
  `identifiers` TEXT DEFAULT NULL COMMENT 'A set of System Identifiers that represent other identifiers for this Profile. ',
  `image` TEXT DEFAULT NULL COMMENT 'IRI of an image representing the individual or organization. May be a DATA URI or the URL where the image may be found. Model Primitive Datatype &#x3D; NormalizedString.',
  `name` TEXT DEFAULT NULL COMMENT 'The full name of the individual or organization. Model Primitive Datatype &#x3D; String.',
  `official` TEXT DEFAULT NULL COMMENT 'The name of the authorized official for the Issuer. Model Primitive Datatype &#x3D; String.',
  `parentOrg` TEXT DEFAULT NULL,
  `publicKey` TEXT DEFAULT NULL,
  `revocationList` TEXT DEFAULT NULL COMMENT 'The URL of the Revocation List document used for marking revocation of signed Assertions, CLRs, and Endorsements. Required for issuer profiles. Model Primitive Datatype &#x3D; AnyURI.',
  `signedEndorsements` TEXT DEFAULT NULL COMMENT 'Signed endorsements in JWS Compact Serialization format. Model Primitive Datatype &#x3D; String. ',
  `sourcedId` TEXT DEFAULT NULL COMMENT 'The individual&#39;s or organization&#39;s unique &#39;sourcedId&#39; value, which is used for providing interoperability with other identity systems. Model Primitive Datatype &#x3D; String.',
  `studentId` TEXT DEFAULT NULL COMMENT 'An institution&#39;s student identifier for the person. This is frequently issued through a Student Information System. Model Primitive Datatype &#x3D; String.',
  `telephone` TEXT DEFAULT NULL COMMENT 'Primary phone number for the individual or organization. Model Primitive Datatype &#x3D; String.',
  `url` TEXT DEFAULT NULL COMMENT 'Web resource that uniquely represents or belongs to the individual. This may be a resource about the individual, hosting provided by the institution to the individual, or an web resource independently controlled by the individual. Model Primitive Datatype &#x3D; AnyURI.',
  `verification` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='A Profile is a collection of information that describes the person or organization using Comprehensive Learner Record (CLR). Publishers, learners, and issuers must be represented as profiles. Recipients, endorsers, or other entities may also be represented using this vocabulary. ';

--
-- Table structure for table `ResultDType` generated from model 'ResultDType'
-- Describes a result of an achievement. 
--

CREATE TABLE IF NOT EXISTS `ResultDType` (
  `id` TEXT DEFAULT NULL COMMENT 'Unique IRI for the object. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this object. Normally &#39;Result&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `achievedLevel` TEXT DEFAULT NULL COMMENT 'The id of the RubricCriterionLevel achieved. Model Primitive Datatype &#x3D; NormalizedString.',
  `alignments` TEXT DEFAULT NULL COMMENT 'The alignments between this result and nodes in external frameworks. This set of alignments are in addition to the set of alignments defined in the corresponding ResultDescription object. ',
  `resultDescription` TEXT NOT NULL COMMENT 'The id of the ResultDescription describing this result. Model Primitive Datatype &#x3D; NormalizedString.',
  `status` ENUM('Completed', 'Enrolled', 'Failed', 'InProgress', 'OnHold', 'Withdrew') DEFAULT NULL COMMENT 'The status of the achievement. Required if &#39;ResultType&#39; is &#39;Status&#39;. ',
  `value` TEXT DEFAULT NULL COMMENT 'A grade or value representing the result of the performance, or demonstration, of the achievement.  For example, &#39;A&#39; if the recipient received a grade of A in the class.  Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Describes a result of an achievement. ';

--
-- Table structure for table `ResultDescriptionDType` generated from model 'ResultDescriptionDType'
-- Describes a possible achievement result. 
--

CREATE TABLE IF NOT EXISTS `ResultDescriptionDType` (
  `id` TEXT NOT NULL COMMENT 'Unique IRI for the ResultDescription. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this object. Normally &#39;ResultDescription&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `alignments` TEXT DEFAULT NULL COMMENT 'The alignments between this result description and nodes in external frameworks. ',
  `allowedValues` TEXT DEFAULT NULL COMMENT 'The ordered from &#39;low&#39; to &#39;high&#39; set of allowed values. Model Primitive Datatype &#x3D; String.',
  `name` TEXT NOT NULL COMMENT 'The name of the result. Model Primitive Datatype &#x3D; String.',
  `requiredLevel` TEXT DEFAULT NULL COMMENT 'The id of the RubricCriterionLevel required to &#39;pass&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `requiredValue` TEXT DEFAULT NULL COMMENT 'The value from allowedValues or within the range of valueMin to valueMax required to &#39;pass&#39;. Model Primitive Datatype &#x3D; String.',
  `resultType` TEXT NOT NULL,
  `rubricCriterionLevels` TEXT DEFAULT NULL COMMENT 'The ordered from &#39;low&#39; to &#39;high&#39; set of rubric criterion levels that may be asserted. ',
  `valueMax` TEXT DEFAULT NULL COMMENT 'The maximum possible result that may be asserted. Model Primitive Datatype &#x3D; String.',
  `valueMin` TEXT DEFAULT NULL COMMENT 'The minimum possible result that may be asserted. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Describes a possible achievement result. ';

--
-- Table structure for table `RubricCriterionLevelDType` generated from model 'RubricCriterionLevelDType'
-- Describes a rubric criterion level. 
--

CREATE TABLE IF NOT EXISTS `RubricCriterionLevelDType` (
  `id` TEXT NOT NULL COMMENT 'Unique IRI for the ResultCriterionLevel. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this object. Normally &#39;RubricCriterionLevel&#39;. Model Primitive Datatype &#x3D; String.',
  `alignments` TEXT DEFAULT NULL COMMENT 'The alignments between this rubric criterion level and nodes in external frameworks. ',
  `description` TEXT DEFAULT NULL COMMENT 'A description of the rubric criterion level. Model Primitive Datatype &#x3D; String.',
  `level` TEXT DEFAULT NULL COMMENT 'The rubric performance level in terms of success. Model Primitive Datatype &#x3D; String.',
  `name` TEXT NOT NULL COMMENT 'The name of the RubricCriterionLevel. Model Primitive Datatype &#x3D; String.',
  `points` TEXT DEFAULT NULL COMMENT 'The number of grade points corresponding to a specific rubric level. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Describes a rubric criterion level. ';

--
-- Table structure for table `SystemIdentifierDType` generated from model 'SystemIdentifierDType'
-- A SystemIdentifier represents a single, system-local identifier for an Achievement. 
--

CREATE TABLE IF NOT EXISTS `SystemIdentifierDType` (
  `type` TEXT DEFAULT NULL COMMENT 'The JSON-LD type of this object. Normally &#39;SystemIdentifier&#39;. Model Primitive Datatype &#x3D; NormalizedString.',
  `identifier` TEXT NOT NULL COMMENT 'Opaque string representing the system identifier value. Model Primitive Datatype &#x3D; String.',
  `identifierType` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='A SystemIdentifier represents a single, system-local identifier for an Achievement. ';

--
-- Table structure for table `VerificationDType` generated from model 'VerificationDType'
-- Information a reviewer can use to verify an Assertion, Clr, or Endorsement. 
--

CREATE TABLE IF NOT EXISTS `VerificationDType` (
  `id` TEXT DEFAULT NULL COMMENT 'Unique IRI for the Verification. Model Primitive Datatype &#x3D; NormalizedString.',
  `type` ENUM('Hosted', 'Signed', 'Verification') NOT NULL COMMENT 'The JSON-LD type of this object. The strongly typed value indicates the verification method. ',
  `allowedOrigins` TEXT DEFAULT NULL COMMENT 'The host registered name subcomponent of an allowed origin. Any given id URI will be considered valid. Model Primitive Datatype &#x3D; String.',
  `creator` TEXT DEFAULT NULL COMMENT 'The (HTTP) id of the key used to sign the Assertion, CLR, or Endorsement. If not present, verifiers will check the public key declared in the referenced issuer Profile. If a key is declared here, it must be authorized in the issuer Profile as well. creator is expected to be the dereferencable URI of a document that describes a CryptographicKey. Model Primitive Datatype &#x3D; AnyURI.',
  `startsWith` TEXT DEFAULT NULL COMMENT 'The URI fragment that the verification property must start with. Valid Assertions, Clrs, and Endorsements must have an id within this scope. Multiple values allowed, and Assertions, Clrs, and Endorsements will be considered valid if their id starts with one of these values. Model Primitive Datatype &#x3D; String.',
  `verificationProperty` TEXT DEFAULT NULL COMMENT 'The property to be used for verification. Only &#39;id&#39; is supported. Verifiers will consider &#39;id&#39; the default value if verificationProperty is omitted or if an issuer Profile has no explicit verification instructions, so it may be safely omitted. Model Primitive Datatype &#x3D; String.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Information a reviewer can use to verify an Assertion, Clr, or Endorsement. ';


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
