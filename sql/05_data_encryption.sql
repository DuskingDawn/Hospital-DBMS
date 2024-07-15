INSTALL COMPONENT 'file://component_keyring_file';

USE Hospital;
-- Enable encryption by default for new tables
SET GLOBAL default_table_encryption=ON;
-- Create schema with encryption
ALTER SCHEMA Hospital DEFAULT ENCRYPTION='Y';

-- Enable redo log and undo log encryption
SET GLOBAL innodb_redo_log_encrypt=ON;
SET GLOBAL innodb_undo_log_encrypt=ON;
