﻿alter table tblRoleToUserMapping add constraint tblRoleToUserMapping_EmployeeId_Fk
Foreign key(EmployeeId) references tblEmployee(EmployeeId) 