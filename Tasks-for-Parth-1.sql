CREATE TABLE `ra_pci_dss_req` (
	`id` INT(10) NOT NULL AUTO_INCREMENT,
	`control` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`pci_dss_req` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`describe_assessment_finding_was_selected` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`indicate_Customized_Approach_used` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`indicate_Compensating_Approach_used` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`is_archived` TINYINT(1) NOT NULL DEFAULT '0',
	`is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `control` (`control`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT INTO `ra_pci_dss_req` (`id`, `control`, `pci_dss_req`, `describe_assessment_finding_was_selected`, `indicate_Customized_Approach_used`, `indicate_Compensating_Approach_used`, `created_at`, `updated_at`, `is_archived`, `is_deleted`) VALUES (1, '1.1.1', '1.1.1 All security policies and operational procedures that are identified in Requirement 1 are: ,Documented.,Kept up to date.,In use.,Known to all affected parties.', 'YES', 'YES', 'YES', '2023-03-13 06:43:23', '2023-03-13 06:43:23', 0, 0);


CREATE TABLE `ra_appendix_c_data_kbox` (
	`primary_id` INT(10) NOT NULL AUTO_INCREMENT,
	`project_id` INT(10) NOT NULL DEFAULT '0',
	`CC_reference_number` VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`aspect_requ_CC_was_used` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`doc_tech_or_business_constraints_precluding_compliance_with_the_` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`define_compe_con_explain_how_they_address_the_objectives_of_the_` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`define_the_objective_of_the_original_con` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`identify_the_objective_met_by_the_compensating_control_requireme` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`identify_any_additional_risk_posed_by_the_lack_of_the_original_c` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`define_how_the_compensating_controls_were_validated_and_tested` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`define_process_and_controls_in_place_to_maintain_compensating_co` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`is_deleted` TINYINT(3) NULL DEFAULT '0',
	`is_archived` TINYINT(3) NULL DEFAULT '0',
	`added_by` INT(10) NULL DEFAULT NULL,
	`updated_by` INT(10) NULL DEFAULT NULL,
	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`primary_id`) USING BTREE,
	INDEX `CC_reference_number` (`CC_reference_number`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `ra_appendix_e_data_kbox` (
	`primary_id` INT(10) NOT NULL AUTO_INCREMENT,
	`project_id` INT(10) NOT NULL DEFAULT '0',
	`CA_reference_number` VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`aspect_of_req_where_CA_was_used` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`identify_CC_name_or_identifier_for_each_control_used_to_meet_CA` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`describe_each_control_used_to_meet_the_CA_Objective` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`describe_how_the_control_meet_the_CA_Objective` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`identifyth_Controls_Matrix_doc_reviewed_that_supports_CA_for_req` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`Identify_the_targeted_risk` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`identify_name_of_the_assessor_who_attests` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`assessor_derived_testing_procedure` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`identify_what_was_tested_individuals_interviewed_sys_components` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`identify_all_evidence_examined_for_testing_procedure` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`describe_results_of_testing_done_by_assessor_testing_procedure` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`document_assessor_derived_testing_procedure` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`document_identify_what_tested_individuals_int_sys_components` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`document_identify_all_evidence_examined_for_testing_procedure` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`document_describe_res_of_testing_done_by_assessor_testing_proced` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`is_deleted` TINYINT(3) NULL DEFAULT '0',
	`is_archived` TINYINT(3) NULL DEFAULT '0',
	`added_by` INT(10) NULL DEFAULT NULL,
	`updated_by` INT(10) NULL DEFAULT NULL,
	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`primary_id`) USING BTREE,
	INDEX `CA_reference_number` (`CA_reference_number`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
