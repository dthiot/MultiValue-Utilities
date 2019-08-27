* Program to test StandardDate Subroutine
*
stdDate = "2019-08-27T15:34:40"
mvDate = ""
mvTime = ""
dateFormat = 1
Crt "Test 1 - Pass Standard Date of ":stdDate
Call StandardDate(stdDate,mvDate,mvTime,dateFormat)
Crt "Standard Date: ":StdDate
Crt "Internal Date: ":mvDate
Crt "External Date: ":Oconv(mvDate,"D4-")
Crt "Internal Time: ":mvTime
Crt "External Time: ":Oconv(mvTime,"MTS")
Crt "---"
stdDate = ""
mvDate = Date()
mvTime = Time()
dateFormat = 1
Crt "Test 2 - Pass mvDate of ":mvDate:" and mvTime of ":mvTime:" with format 1."
Call StandardDate(stdDate,mvDate,mvTime,dateFormat)
Crt "Standard Date: ":StdDate
Crt "Internal Date: ":mvDate
Crt "External Date: ":Oconv(mvDate,"D4-")
Crt "Internal Time: ":mvTime
Crt "External Time: ":Oconv(mvTime,"MTS")
Crt "---"
stdDate = ""
mvDate = Date()
mvTime = Time()
dateFormat = 2
Crt "Test 3 - Pass mvDate of ":mvDate:" and mvTime of ":mvTime:" with format 2."
Call StandardDate(stdDate,mvDate,mvTime,dateFormat)
Crt "Standard Date: ":StdDate
Crt "Internal Date: ":mvDate
Crt "External Date: ":Oconv(mvDate,"D4-")
Crt "Internal Time: ":mvTime
Crt "External Time: ":Oconv(mvTime,"MTS")
Crt "---"
stdDate = ""
mvDate = ""
mvTime = ""
dateFormat = 1
Crt "Test 4 - Pass mvDate of ":mvDate:" and mvTime of ":mvTime:" with format 1."
Call StandardDate(stdDate,mvDate,mvTime,dateFormat)
Crt "Standard Date: ":StdDate
Crt "Internal Date: ":mvDate
Crt "External Date: ":Oconv(mvDate,"D4-")
Crt "Internal Time: ":mvTime
Crt "External Time: ":Oconv(mvTime,"MTS")
Crt "---"
stdDate = ""
mvDate = ""
mvTime = ""
dateFormat = 2
Crt "Test 5 - Pass mvDate of ":mvDate:" and mvTime of ":mvTime:" with format 2."
Call StandardDate(stdDate,mvDate,mvTime,dateFormat)
Crt "Standard Date: ":StdDate
Crt "Internal Date: ":mvDate
Crt "External Date: ":Oconv(mvDate,"D4-")
Crt "Internal Time: ":mvTime
Crt "External Time: ":Oconv(mvTime,"MTS")
End
