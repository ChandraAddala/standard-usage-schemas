# Changelog for Usage Schema


**usage-schema-1.28.0**  
2013-10-22 | B-57395: get rid of CloudIdentity dups in productSchema-wadl, more clean ups (Shinta Smith)  
2013-10-22 | B-57395: clean up samples (Shinta Smith)  
2013-10-21 | B-57395 rebase to master and fix resourceType conflict (Bryan Taylor)  
2013-10-21 | B-57395 implement transormation to calculate big data aggregatedClusterDuration (Bryan Taylor)  
2013-10-21 | B-58641: rename client_username to clientUsername and agent_username to agentUsername (Shinta Smith)  
2013-10-17 | B-58136: rename usageerror/events to usagedeadletter/events (Shinta Smith)  
2013-10-17 | B-58429: add unvalidated /netdevice feed to wadl (Shinta Smith)  
2013-10-17 | Fix merge B-51154 (Greg Sharek)  
2013-10-17 | Merge B-51154 (Greg Sharek)  
2013-10-16 | B-51154: got rid of extranous variables (Shinta Smith)  
2013-10-16 | B-51154: add wadl asserts to restrict the use of GLOBAL dataCenter and region (Shinta Smith)  
2013-10-15 | B-56175: remove billable attribute from product schemas (Shinta Smith)  
2013-10-15 | B-40572: remove lbaas.xsl and lbaas-stopgap-tests.scala (Shinta Smith)  
2013-10-15 | B-40572: remove lbaas unit test on the transformation, generate wadl (Shinta Smith)  
2013-10-15 | B-40572: remove SSL transformation on LBaaS usage event (Shinta Smith)  

**usage-schema-1.27.0**  
2013-10-08 | B-54028 - Update Big Data Usage Event - flavorName and flavorId cannot be empty String. (Greg Sharek)  
2013-10-07 | B-56849 - Add Metadata to Define Tenant Enrichment (Greg Sharek)  
2013-10-07 | B-54030: add minLength to string types (Shinta Smith)  
2013-10-07 | B-54030: add minLength to nova's flavorId and flavorName attributes (Shinta Smith)  
2013-10-02 | B-53783 - Add delegated/impersonation/agent username to Core Schema (Greg Sharek)  

**usage-schema-1.26.3**  

**usage-schema-1.26.2**  

**usage-schema-1.26.0**  
2013-09-27 | B-57395 adding synthesized attributes & using them for aggregatedClusterDuration in bigdata (Bryan Taylor)  

**usage-schema-1.25.0**  
2013-09-24 | B-55600: add UPDATE action for sites subscription (Shinta Smith)  
2013-09-24 | B-56944: update resourceTypes for bigdata (Shinta Smith)  
2013-09-12 | B-56207 - Update CDB Usage Event - Remove aggregateFunction on Memory & Storage (Greg Sharek)  

**usage-schema-1.24.1**  
2013-09-11 | B-53705: add atom_hopper_observer.wadl into rpm (Shinta Smith)  

**usage-schema-1.24.0**  
2013-09-09 | Revert "Merge pull request #83 from shintasmith/B-50883" (Greg Sharek)  
2013-08-30 | B-53705: remove test related feeds from the readonly wadl (Shinta Smith)  
2013-08-30 | B-53705: add atom_hopper_observer.wadl that will be used by ahaas/Atom Hopper public/Cloud Feeds (Shinta Smith)  

**usage-schema-1.23.3**  
2013-08-30 | B-55725 - Sites feed:  increase requestCount to 50M max. (Greg Sharek)  
2013-08-16 | B-54382 - Update CDB Usage Event - Add aggregateFunction of WEIGHTED_AVG (Greg Sharek)  
2013-08-16 | B-54666 - Update aggregate Functions - Remove CUMULATIVE_AVG, add WEIGHED_AVG (Greg Sharek)  

**usage-schema-1.23.2**  
2013-08-13 | B-50562: add range for v2 (Shinta Smith)  

**usage-schema-1.23.1**  
2013-08-12 | B-52649: add namespace restriction for the any element other than event element, fix unit tests that do not have the expect error 400 (Shinta Smith)  
2013-08-06 | B-50799: add /usagerecovery and /usageerror feeds (Shinta Smith)  
2013-08-06 | B-50562: add min/max for monitoring zones (Shinta Smith)  

**usage-schema-1.23.0**  
2013-08-05 | B-50560: add bad sample files (Shinta Smith)  
2013-08-05 | B-50560: add range for freeops and costops for files storange events (Shinta Smith)  
2013-07-31 | B-47908: add serverName to glance (Shinta Smith)  
2013-07-31 | B-52644: modify bigdata schema, flavor=>flavorId, add flavorName, add resourceName in samples (Shinta Smith)  
2013-07-31 | B-53194 - Add Cloud Queues Usage Event (Greg Sharek)  
2013-07-22 | B-50935: make the 'use' attribute a required attribute (Shinta Smith)  
2013-07-22 | B-50883: convert nova's assert to using xpathAssert (Shinta Smith)  
2013-07-19 | B-52483 - Add username to Core Schema (Greg Sharek)  
2013-07-19 | B-50883 need capability to add WADL assertion in productSchema (Greg Sharek)  

**usage-schema-1.22.0**  
2013-07-17 | B-52648: add new feeds (Shinta Smith)  
2013-07-16 | B-50561: add min, max for memory and storage (Shinta Smith)  
2013-07-15 | B-50523: add min, max to bandwidthIn, bandwidthOut and storage attributes (Shinta Smith)  
2013-07-15 | B-50883: add xpath asssertions for wadl, adapt the generation of <assert> in XSD, change identity xpath assert (Shinta Smith)  
2013-07-08 | B-51717 Add Dedicated feed -Modified atom hopper wadl file to support dedicated feed. (Srikanth Kambhampati)  
2013-07-08 | B-50281 Removed feed links for Quantum and Melange, added feed for perftest (Srikanth Kambhampati)  
2013-07-05 | B-51658 Add Autoscale Feed -Modified wadl file to add support for new autoscale feed. (Srikanth Kambhampati)  
2013-07-01 | B-50281 Removed feed links for Quantum and Melange, added feed for perftest (Srikanth Kambhampati)  

**usage-schema-1.21.1**  
2013-06-25 | B-49764: update nova with flavorId, flavorName, status (Shinta Smith)  
2013-06-25 | B-51417: allow string and string* types to specify optional maxLength attribute (Shinta Smith)  
2013-06-24 | B-49810: add assert for v2 non-UPDATE, the updatedAttributes attribute should not be used (Shinta Smith)  

**usage-schema-1.21.0**  
2013-06-19 | B-50937: add the use="optional" attribute to all product schema that does not have it (Shinta Smith)  
2013-06-18 | B-49579: change resourceType=SLICE to SERVER, add samples (Shinta Smith)  
2013-06-17 | B-48562: add monitoring product enum and productInstanceId (Shinta Smith)  
2013-06-14 | B-49810: add identity type=UPDATE version 2 with required updatedAttributes (Shinta Smith)  

**usage-schema-1.20.0**  
2013-05-31 | B-49811 - add aggregation periods for cloud sites product event metadata. (Benjamin Truitt)  
2013-05-31 | B-38000: add bad samples (Shinta Smith)  
2013-05-30 | B-38000: add sample response files (Shinta Smith)  
2013-05-30 | B-38000: Cloud DNS create and delete system events (Shinta Smith)  

**usage-schema-1.19.1**  
2013-05-28 | B-48322: package atom_hopper_identity.wadl in the RPM (Shinta Smith)  
2013-05-28 | B-48178: Update Sites Email Usage Event (mattkovacs)  

**usage-schema-1.19.0**  
2013-05-22 | B-48307: Update Nova Host Server Down Event - Remove 'status' attribute (mattkovacs)  
2013-05-16 | Add aggregation durations to product metadata for B-43160. (Benjamin Truitt)  

**usage-schema-1.18.1**  
2013-05-13 | B-48551: combine several identity feeds into one as /identity/events (Shinta Smith)  
2013-05-13 | B-48528: Add CloudBackLicense version two event (mattkovacs)  

**usage-schema-1.17.4**  
**usage-schema-1.17.3**  

**usage-schema-1.17.1**  
**usage-schema-1.17.0**  
2013-04-29 | B-46480: add additional IP for First Gen Cloud Servers (Shinta Smith)  
2013-04-29 | B-47501: Update Legacy Server Slice Action Event (mattkovacs)  
2013-04-29 | B-44343: make serverId optional, add optional serverName (Shinta Smith)  
2013-04-29 | B-47354: CBU License usage event update (mattkovacs)  
2013-04-26 | B-44343: rename all references to plural IP to singular IP (Shinta Smith)  
2013-04-26 | B-37262: fix permission (Shinta Smith)  
2013-04-26 | B-37262: change pom.xml version to 1.1.17 since R0016 is already out (Shinta Smith)  
2013-04-25 | B-44343: add Nova IP usage event (Shinta Smith)  
2013-04-25 | B-46594: Add LBaaS System Event for DELETE (mattkovacs)  
2013-04-25 | B-47481: minor formatting (Shinta Smith)  
2013-04-25 | B-47481: add instructions on how to generate XSD 1.0 schemas (Shinta Smith)  
2013-04-24 | B-47481: semi-automate the generation of the XSD 1.0 (Shinta Smith)  
2013-04-24 | B-47481: add SYD to XSD 1.0 (Shinta Smith)  
2013-04-24 | B-37262: correct permissions (Shinta Smith)  
2013-04-22 | B-37262: rpm-ize usage-schema (Shinta Smith)  


2013-04-10 | B-46506: Update servers slice action Event - Add password attribute (mattkovacs)  
2013-04-09 | B-37309, B-44543: fix some of the malform response files (Shinta Smith)  
2013-04-09 | B-37309,B-44534 (Kari Davis)  
2013-04-09 | B-40571: add new usage for Sites email (Shinta Smith)  
2013-04-09 | B-41580: Adding public flag to all attributes, default is false. (mattkovacs)  
2013-04-08 | B-41470: add more files to bigdata usage events (Shinta Smith)  
2013-04-08 | B-41470: add bigdata usage events (Shinta Smith)  
2013-04-03 | \[B-45250\] remove aggregateFunction for numFiles attribute, update descriptions of other attributes (Shinta Smith)  
2013-04-02 | \[B-45726\] for Sites Metered usage, add default 0 for computeCyles if not specified (Shinta Smith)  

2013-03-26 | \[B-43299\] add new Legacy server slice actions (Shinta Smith)  
2013-03-25 | B-39660: Add Next Gen Servers Usage Event (mattkovacs)  
2013-03-25 | B-43746: Add Next Gen Servers Usage Event (mattkovacs)  
2013-03-22 | \[B-44637\] update domain event to add endUserTenantId and remove domainGoLiveDate (Shinta Smith)  
2013-03-22 | \[B-43478\] fix unit test break caused by the move of domain events out of sites feed (Shinta Smith)  
2013-03-20 | \[B-43478\] add new domain feed and remove it from sites (Shinta Smith)  
2013-03-19 | B-43746: Adding action attribute to sites subscription event (mattkovacs)  

2013-03-18 | \[B-44127\]\[TK-77618\] added unit test for LBaaS SSL=ON rule (Shinta Smith)  
2013-02-28 | Add aggregation durations to product metadata for B-43160. (Benjamin Truitt)  



2013-01-28 | Address B-40007 by adding groupBy public IPs, private IPs and Flavor. (Jorge L. Williams)  
2012-12-17 | Add min and max values for bandwidth, flavor, extra IPs (see B-36951). (Benjamin Truitt)  






