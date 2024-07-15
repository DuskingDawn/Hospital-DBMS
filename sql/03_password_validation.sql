-- Install the validate_password component
USE Hospital;
INSTALL COMPONENT 'file://component_validate_password';

-- Configure the password validation policy and parameters
SET GLOBAL validate_password.policy = 'MEDIUM';
SET GLOBAL validate_password.length = 8;
SET GLOBAL validate_password.mixed_case_count = 1;
SET GLOBAL validate_password.number_count = 1;
SET GLOBAL validate_password.special_char_count = 1;

SHOW VARIABLES LIKE 'validate_password%';

