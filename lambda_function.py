import pymysql
import json
import os
from datetime import datetime

# RDS settings
rds_host = os.environ['RDS_HOST']
rds_username = os.environ['DB_USERNAME']
rds_password = os.environ['DB_PASSWORD']
rds_db_name = os.environ['DB_NAME']

connection = pymysql.connect(
    host=rds_host,
    user=rds_username,
    password=rds_password,
    db=rds_db_name
)

def lambda_handler(event, context):
    false_flag = event.get('false_flag')
    table = event.get('table')
    
    if false_flag == "create":
        return create_record(event, table)
    elif false_flag == "read":
        return read_record(event, table)
    elif false_flag == "update":
        return update_record(event, table)
    elif false_flag == "delete":
        return delete_record(event, table)
    else:
        return {"statusCode": 400, "body": json.dumps("Invalid false_flag value")}

def create_record(event, table):
    try:
        primary_id = event.get('primary_id', None)
        
        # Check if primary_id exists in the referenced table
        with connection.cursor() as cursor:
            cursor.execute("SELECT id FROM ra_pci_dss_req WHERE id = %s", (primary_id,))
            if cursor.fetchone() is None:
                return {"statusCode": 400, "body": json.dumps("Foreign key id does not exist in ra_pci_dss_req table")}
        
        # Insert record into the target table
        with connection.cursor() as cursor:
            sql = f"INSERT INTO {table} (project_id, CC_reference_number, aspect_requ_CC_was_used, doc_tech_or_business_constraints_precluding_compliance_with_the_, define_compe_con_explain_how_they_address_the_objectives_of_the_, define_the_objective_of_the_original_con, identify_the_objective_met_by_the_compensating_control_requireme, identify_any_additional_risk_posed_by_the_lack_of_the_original_c, define_how_the_compensating_controls_were_validated_and_tested, define_process_and_controls_in_place_to_maintain_compensating_co, added_by, updated_by, primary_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            cursor.execute(sql, (
                event['project_id'], event['CC_reference_number'], event['aspect_requ_CC_was_used'], 
                event['doc_tech_or_business_constraints_precluding_compliance_with_the_'], 
                event['define_compe_con_explain_how_they_address_the_objectives_of_the_'], 
                event['define_the_objective_of_the_original_con'], 
                event['identify_the_objective_met_by_the_compensating_control_requireme'], 
                event['identify_any_additional_risk_posed_by_the_lack_of_the_original_c'], 
                event['define_how_the_compensating_controls_were_validated_and_tested'], 
                event['define_process_and_controls_in_place_to_maintain_compensating_co'], 
                event['added_by'], event['updated_by'], primary_id
            ))
            connection.commit()
        return {"statusCode": 200, "body": json.dumps("Record created successfully")}
    except Exception as e:
        return {"statusCode": 500, "body": json.dumps(str(e))}

def read_record(event, table):
    try:
        with connection.cursor() as cursor:
            sql = f"SELECT * FROM {table} WHERE primary_id = %s"
            cursor.execute(sql, (event['primary_id'],))
            result = cursor.fetchone()
            if result:
                # Get column names from cursor description
                column_names = [desc[0] for desc in cursor.description]
                result_dict = dict(zip(column_names, result))
                # Convert datetime objects to strings
                for key, value in result_dict.items():
                    if isinstance(value, datetime):
                        result_dict[key] = value.strftime('%Y-%m-%d %H:%M:%S')
                return {"statusCode": 200, "body": json.dumps(result_dict)}
            else:
                return {"statusCode": 404, "body": json.dumps("Record not found")}
    except Exception as e:
        return {"statusCode": 500, "body": json.dumps(str(e))}

def update_record(event, table):
    try:
        with connection.cursor() as cursor:
            sql = f"UPDATE {table} SET project_id = %s, CC_reference_number = %s, aspect_requ_CC_was_used = %s, doc_tech_or_business_constraints_precluding_compliance_with_the_ = %s, define_compe_con_explain_how_they_address_the_objectives_of_the_ = %s, define_the_objective_of_the_original_con = %s, identify_the_objective_met_by_the_compensating_control_requireme = %s, identify_any_additional_risk_posed_by_the_lack_of_the_original_c = %s, define_how_the_compensating_controls_were_validated_and_tested = %s, define_process_and_controls_in_place_to_maintain_compensating_co = %s, added_by = %s, updated_by = %s WHERE primary_id = %s"
            cursor.execute(sql, (event['project_id'], event['CC_reference_number'], event['aspect_requ_CC_was_used'], event['doc_tech_or_business_constraints_precluding_compliance_with_the_'], event['define_compe_con_explain_how_they_address_the_objectives_of_the_'], event['define_the_objective_of_the_original_con'], event['identify_the_objective_met_by_the_compensating_control_requireme'], event['identify_any_additional_risk_posed_by_the_lack_of_the_original_c'], event['define_how_the_compensating_controls_were_validated_and_tested'], event['define_process_and_controls_in_place_to_maintain_compensating_co'], event['added_by'], event['updated_by'], event['primary_id']))
            connection.commit()
        return {"statusCode": 200, "body": json.dumps("Record updated successfully")}
    except Exception as e:
        return {"statusCode": 500, "body": json.dumps(str(e))}

def delete_record(event, table):
    try:
        with connection.cursor() as cursor:
            sql = f"DELETE FROM {table} WHERE primary_id = %s"
            cursor.execute(sql, (event['primary_id'],))
            connection.commit()
        return {"statusCode": 200, "body": json.dumps("Record deleted successfully")}
    except Exception as e:
        return {"statusCode": 500, "body": json.dumps(str(e))}
