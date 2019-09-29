
EXEC [dbo].[Types_Create] 'users', 'status_type', '0', 'Statuses', 'Inactive';
EXEC [dbo].[Types_Create] 'users', 'status_type', '1', 'Statuses', 'Active';
EXEC [dbo].[Types_Create] 'users', 'status_type', '2', 'Statuses', 'Deleted';
EXEC [dbo].[Types_Create] 'users', 'status_type', '3', 'Statuses', 'Locked';
EXEC [dbo].[Types_Create] 'users', 'status_type', '4', 'Statuses', 'Deleted';
EXEC [dbo].[Types_Create] 'users', 'email_type', '0', 'Email Types', 'None';
EXEC [dbo].[Types_Create] 'users', 'email_type', '1', 'Email Types', 'Primary';
EXEC [dbo].[Types_Create] 'users', 'email_type', '2', 'Email Types', 'Work';
EXEC [dbo].[Types_Create] 'users', 'email_type', '3', 'Email Types', 'Personal';
EXEC [dbo].[Types_Create] 'users', 'address_type', '0', 'Address Types', 'None';
EXEC [dbo].[Types_Create] 'users', 'address_type', '1', 'Address Types', 'Home';
EXEC [dbo].[Types_Create] 'users', 'address_type', '2', 'Address Types', 'Work';