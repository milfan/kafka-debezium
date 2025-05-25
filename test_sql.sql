

EXEC sys.sp_cdc_help_jobs;


EXEC sys.sp_cdc_enable_db;

EXEC sys.sp_cdc_enable_table   
  @source_schema = N'dbo',   
  @source_name   = N'Prospeks',   
  @role_name     = NULL;


EXEC sys.sp_cdc_enable_table   
  @source_schema = N'dbo',   
  @source_name   = N'ProfileData',   
  @role_name     = NULL;


SELECT name, is_cdc_enabled FROM sys.databases WHERE name = 'InisiasiData';

SELECT s.name AS schema_name, t.name AS table_name, is_tracked_by_cdc
FROM sys.tables t
JOIN sys.schemas s ON s.schema_id = t.schema_id
WHERE t.name IN ('Prospeks', 'ProfileData');

SELECT * FROM cdc.change_tables;


-- Check if the capture instance is enabled and what tables have CDC enabled
SELECT 
    s.name AS schema_name,
    t.name AS table_name,
    ct.capture_instance
FROM 
    sys.tables t
JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
LEFT JOIN 
    cdc.change_tables ct ON ct.source_object_id = t.object_id;


EXEC sys.sp_cdc_disable_table
    @source_schema = N'dbo',
    @source_name = N'Prospeks',
    @capture_instance = N'dbo_Prospeks';


EXEC sys.sp_cdc_disable_table
    @source_schema = N'dbo',
    @source_name = N'ProfileData',
    @capture_instance = N'dbo_ProfileData';


SELECT * FROM cdc.dbo_Prospeks_CT;


SELECT * FROM cdc.change_tables WHERE source_object_id = OBJECT_ID('dbo.Prospeks');
SELECT * FROM cdc.change_tables WHERE source_object_id = OBJECT_ID('dbo.ProfileData');

SELECT * FROM sys.dm_server_services WHERE servicename LIKE '%SQL Server Agent%';




