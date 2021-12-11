CREATE OR REPLACE TABLE PROVINCE_CASES_DETAIL (
    PROVINCE VARCHAR (256),
    ISLAND VARCHAR (256),
    NEW_CASES NUMBER(38,0),
    ACTIVE_CASES NUMBER(38,0),
    NEW_DEATHS NUMBER(38,0),
    NEW_RECOVERD NUMBER(38,0),
    TOTAL_CASES NUMBER(38,0),
    TOTAL_DEATHS NUMBER(38,0),
    TOTAL_RECOVERED NUMBER(38,0),
    "YEAR" VARCHAR(4),
    "MONTH" VARCHAR (20)
);

INSERT INTO PROVINCE_CASES_DETAIL (PROVINCE,ISLAND, NEW_CASES,ACTIVE_CASES,NEW_DEATHS,NEW_RECOVERD,TOTAL_CASES,TOTAL_DEATHS,TOTAL_RECOVERED, "YEAR", "MONTH") 
SELECT PROVINCE, ISLAND, NEW_CASES,NEW_ACTIVE_CASES,NEW_DEATHS,NEW_RECOVERED,TOTAL_CASES,TOTAL_DEATHS,TOTAL_RECOVERED, YEAR(TO_DATE("DATE", 'MM/DD/YYYY')) as "YEAR",MONTH(TO_DATE("DATE", 'MM/DD/YYYY')) as "MONTH"
FROM "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS_YR"."FIVETRAN_INTERVIEW_DB_YR" WHERE 
LOCATION_LEVEL = 'Province' AND "DATE" != 'Date';