Create table ra_pci_dss_req in database ccDB on Amazon Web Services RDS(Relational Database Service):

![image](https://github.com/parth1314/lambda_rds/assets/97305249/d521f23b-93fb-4a7d-af67-c62214f78213)
![image](https://github.com/parth1314/lambda_rds/assets/97305249/43a67b3f-993e-48d3-b257-c163fadb2a07)


Create tables ra_appendix_c_data_kbox and ra_appendix_e_data_kbox which has primary id of ra_pci_dss_req as the foreign key:

![image](https://github.com/parth1314/lambda_rds/assets/97305249/f6ddf5a1-858d-46b7-9d6c-429ebc10ea7e)


API gateway configured with POST operation on the lambda function:

![image](https://github.com/parth1314/lambda_rds/assets/97305249/3ebdd25b-9c19-428c-8937-f6c098ca5673)


Payload sent by POSTMAN api to carry out create operation:

![image](https://github.com/parth1314/lambda_rds/assets/97305249/5f619107-828d-45f7-824e-1d08bfe759d9)


Record updated in the table:

![image](https://github.com/parth1314/lambda_rds/assets/97305249/f9e8d9e4-dfad-4757-ab1a-fecf9615af76)

