DECLARE
    v_avg_mark NUMBER(5,2);
    v_today_date DATE := SYSDATE;
    v_day_of_week VARCHAR2(10);
BEGIN
    -- Calculate the average mark of students
    SELECT AVG(mark) INTO v_avg_mark FROM students;

    -- Print each student's mark
    FOR student_rec IN (SELECT student_name, mark FROM students) LOOP
        DBMS_OUTPUT.PUT_LINE('Student: ' || student_rec.student_name || ', Mark: ' || student_rec.mark);
    END LOOP;

    -- Print the class average
    DBMS_OUTPUT.PUT_LINE('Class Average Mark: ' || v_avg_mark);

    -- Check if the class average is less than 40 and print the message if true
    IF v_avg_mark < 40 THEN
        DBMS_OUTPUT.PUT_LINE('Need improvement');
    END IF;

    -- Get the day of the week
    SELECT TO_CHAR(v_today_date, 'Day') INTO v_day_of_week FROM dual;

    -- Print today's date and day of the week
    DBMS_OUTPUT.PUT_LINE('Today''s Date: ' || TO_CHAR(v_today_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Day of the Week: ' || v_day_of_week);
END;
