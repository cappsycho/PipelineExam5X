CREATE OR REPLACE TABLE CASES_RATE_PER_MIL (
    TOTAL_CASES_PER_MIL FLOAT,
    TOTAL_DEATHS_PER_MIL FLOAT,
    NEW_CASES_PER_MIL FLOAT,
    NEW_DEATHS_PER_MIL FLOAT,
    LOCATION VARCHAR(256),
    "MONTH" VARCHAR(30),
    "YEAR" VARCHAR(4)
);

INSERT INTO CASES_RATE_PER_MIL (TOTAL_CASES_PER_MIL,TOTAL_DEATHS_PER_MIL,NEW_CASES_PER_MIL,NEW_DEATHS_PER_MIL, LOCATION,"MONTH","YEAR")
SELECT TOTAL_CASES_PER_MILLION, TOTAL_DEATHS_PER_MILLION,NEW_CASES_PER_MILLION,NEW_DEATHS_PER_MILLION,LOCATION,MONTHNAME(to_date("DATE", 'MM/DD/YYYY')) as "MONTH" ,YEAR(to_date("DATE", 'MM/DD/YYYY')) as "YEAR"
FROM "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS_YR"."FIVETRAN_INTERVIEW_DB_YR" WHERE "DATE" != 'Date';
