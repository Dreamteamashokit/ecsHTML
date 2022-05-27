select * from [ESHomeCareDB.QA]..tblUserType
select * from [ESHomeCareDB.IND]..tblUserType

--truncate table [ESHomeCareDB.QA]..tblUserType
--insert into [ESHomeCareDB.QA]..tblUserType
truncate table [ESHomeCareDB.QA]..tblEmpType

select * from [ESHomeCareDB.QA]..tblEmpType



--insert into [ESHomeCareDB.QA]..tblEmpType
select * from [ESHomeCareDB.IND]..tblEmpType

select * from [ESHomeCareDB.QA]..tblUser

select * from [ESHomeCareDB.QA]..tblEmployee

select * from [ESHomeCareDB.IND]..tblEmployee

--Alter table [ESHomeCareDB.QA]..tblEmployee  alter column Dependents int
	select top 2 * from [ESHomeCareDB.IND]..tblUser
	
	Alter table [ESHomeCareDB.IND]..tblEmployee  alter column Dependents int

	select * from [ESHomeCareDB.IND]..tblLocation
		select * from [ESHomeCareDB.IND]..tblAddress


	Select x.*,y.LastName ELastName,y.FirstName EFirstName,y.CellPhone ECellPhone,z.EmpType,p.TypeName 
	from  tblMeeting x inner join tblUser y on x.EmpId=y.UserId inner join tblEmployee z on y.UserId=z.UserId 
	inner join tblEmpType p on z.EmpType=p.TypeId where x.MeetingDate>=GETDATE() and x.ClientId=56



	select * from [ESHomeCareDB.QA]..tblAddress
	
		select * from [ESHomeCareDB.QA]..tblClient


			select top 2 * from [ESHomeCareDB.IND]..tblUser x Left join [ESHomeCareDB.IND]..tblAddress y on x.UserId=y.UserId


			








