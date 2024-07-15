USE Hospital;
DELIMITER //
CREATE PROCEDURE RegisterUser(
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_role VARCHAR(255)
)
BEGIN
    DECLARE password_strength INT;
    DECLARE hashed_password VARCHAR(255);

    -- Check password strength
    SET password_strength = VALIDATE_PASSWORD_STRENGTH(p_password);
    IF password_strength < 50 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Password is too weak';
    END IF;

    -- Hash the password
    SET hashed_password = SHA2(p_password, 256);

    -- Insert the user details into the UserAccount table
    INSERT INTO UserAccount (username, password, email, role)
    VALUES (p_username, hashed_password, p_email, p_role);

    -- Assign the role to the user
    SET @sql = CONCAT('GRANT ', p_role, ' TO ''', p_username, '''@''localhost''');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UserLogin(
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(255)
)
BEGIN
    DECLARE stored_password VARCHAR(255);
    DECLARE hashed_input_password VARCHAR(255);

    -- Hash the input password
    SET hashed_input_password = SHA2(p_password, 256);

    -- Retrieve the stored password
    SELECT password INTO stored_password FROM UserAccount WHERE username = p_username;

    -- Check if the user exists and the passwords match
    IF stored_password IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User does not exist';
    ELSEIF stored_password != hashed_input_password THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorrect password';
    ELSE
        SELECT 'Login successful' AS message;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ScheduleAppointment(
    IN patientID INT,
    IN doctorID INT,
    IN appointmentDate DATETIME
)
BEGIN
    DECLARE existingAppointments INT;

    -- Check if the doctor already has an appointment at the given time
    SELECT COUNT(*)
    INTO existingAppointments
    FROM Appointments
    WHERE DoctorID = doctorID
      AND AppointmentDate = appointmentDate;

    -- If no existing appointment, schedule the new appointment
    IF existingAppointments = 0 THEN
        INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate)
        VALUES (patientID, doctorID, appointmentDate);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Doctor is not available at this time';
    END IF;
END //
DELIMITER ;
