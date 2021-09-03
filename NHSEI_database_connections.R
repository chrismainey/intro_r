
library(DBI)


# For using NCDR data warehouse:  there is a data source name called 'NCDR' so you
# can use:

con <- dbConnect(odbc::odbc(), "NCDR", timeout = 10)


# Or specifying the server connection details rather than DSN
con <- dbConnect(odbc::odbc()
                  , Driver="SQL Server"
                  , Server = "PRODNHSESQL101"
                  , Trusted_Connection="yes")




# For SIP: This is for the UAT server though
con <- dbConnect(odbc::odbc()
                     , Driver="ODBC Driver 17 for SQL Server"
                     , Server="apsc2a-ctl01.apspr3.irnhsft.local,17001"
                     , Trusted_Connection="yes" 
                     , encoding = "windows-1252"
                     , database = "WS_00036_PSIMS"
                     
)

# SIP This is for the UAT server though
con <- dbConnect(odbc::odbc()
                     , Driver="ODBC Driver 17 for SQL Server"
                     , Server="apsc2a-ctl01.apspr3.irnhsft.local,17001"
                     , Trusted_Connection="yes" 
                     , encoding = "windows-1252"
                     , database = "WS_00036_PSIMS"
                     
)


