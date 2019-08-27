   SUBROUTINE StandardDate(stdDate, mvDate, mvTime, Format)
* This routine will calculate a ISO 8601 Standard Date from input Pick internal date and mvTime
* or extract date and time from a ISO 8601 Standard Date and return MultiValue formatted internal
* date and time.  If all parameters are blank (blank string) then current date and time will be
* used and all 3 values returned.
* Values for format are:
*  1 = Date Only YYYY-MM-DD
*  2 = Date and time (Current System) - YYYY-MM-DDTHH:MM:SS
* The following are future implementation
*  3 = Date and Time (UTC) - YYYY-MM-DDTHH:MM:SSZ
*  4 = Date and Time (UTC) w/o punctation YYYYMMDDTHHMMSSZ
*  5 = Date Week - YYYY-WNN where NN is the week number
*  6 = Date with Week Number - YYYY-WNN-N 
   If stdDate = "" Then
      * Determine stdDate
      If mvDate = "" Then mvDate = DATE()
      If mvTime = "" Then mvTime = TIME()
      mvODate = Oconv(mvDate, "D4-")
      mvODate = mvODate[7,4]:"-":mvODate[1,2]:"-":mvODate[4,2]
      mvOTime = Oconv(mvTime, "MTS")
      Begin Case
         Case Format = 1
            stdDate = mvODate
         Case Format = 2
            stdDate = mvODate:"T":mvOTime
      End Case
   End Else
   * Determine MV Date and Time
      mvDate = Field(stdDate,"T",1)
      mvDate = mvDate[6,2]:"-":mvDate[9,2]:"-":mvDate[1,4]
      mvDate = Iconv(mvDate,"D")
      mvTime = Field(stdDate,"T",2)
      mvTime = Iconv(mvTime,"MT")
   End
   Return
End
