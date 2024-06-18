Create table ra_pci_dss_req in database ccDB on Amazon Web Services RDS(Relational Database Service):

![image](https://github.com/parth1314/lambda_rds/assets/97305249/d521f23b-93fb-4a7d-af67-c62214f78213)
![image](https://github.com/parth1314/lambda_rds/assets/97305249/43a67b3f-993e-48d3-b257-c163fadb2a07)


Create tables ra_appendix_c_data_kbox and ra_appendix_e_data_kbox which has primary id of ra_pci_dss_req as the foreign key:

![image](https://github.com/parth1314/lambda_rds/assets/97305249/f6ddf5a1-858d-46b7-9d6c-429ebc10ea7e)


API gateway configured with POST operation on the lambda function:

![image](https://github.com/parth1314/lambda_rds/assets/97305249/3ebdd25b-9c19-428c-8937-f6c098ca5673)


IAM role configured with policies to allow lambda function to access the RDS instance:

![image](https://github.com/parth1314/lambda_rds/assets/97305249/8f5e2a32-7bc7-46f0-b72e-cf75ecbdabb2)


Payload sent by POSTMAN api to carry out CREATE operation:

![image](https://github.com/parth1314/lambda_rds/assets/97305249/5f619107-828d-45f7-824e-1d08bfe759d9)


Record created in the table:

![image](https://github.com/parth1314/lambda_rds/assets/97305249/f9e8d9e4-dfad-4757-ab1a-fecf9615af76)


Payload sent by POSTMAN api to carry out READ operation:

![image](https://github.com/parth1314/lambda_rds/assets/97305249/73a0415c-a96b-41e4-a772-9ec717cd2737)


Payload sent by POSTMAN api to carry out UPDATE operation:

![image](https://github.com/parth1314/lambda_rds/assets/97305249/6c1085e2-ec06-44a7-af7c-49fcb12dee78)


Record updated in the table:

![image](https://github.com/parth1314/lambda_rds/assets/97305249/dc9debb3-473a-41f5-a201-69e5587e0ad5)


Payload sent by Postman API to carry out DELETE operation:

![image](https://github.com/parth1314/lambda_rds/assets/97305249/9c716219-5bb1-4223-9919-c1e633189abf)


Record deleted in the table:

![image](https://github.com/parth1314/lambda_rds/assets/97305249/f7037926-5756-4208-930d-3d0bd2272897)



