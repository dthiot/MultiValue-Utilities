* Quick program to show the ICONV of a Date
dat = FIELD(SENTENCE()," ",2)
CRT ""
IF dat = "" THEN
   CRT "Enter Date: ":
   INPUT dat
   CRT ""
END
IF dat = "" THEN STOP
IF LEN(dat) <= 5 THEN 
   idat = dat
   odat = OCONV(idat,"D4/")
   CRT "External: ":odat
END ELSE
   odat = dat
   idat = ICONV(odat,"D")
   CRT "Internal: ":idat
END
*
internalDate = DATE()
externalDate = OCONV(internalDate,"D4/")
internalTime = TIME()
external24Time = OCONV(internalTime,"MTS")
external12Time = OCONV(internalTime,"MTHS")
*
CRT "Month (word): ":OCONV(idat,"DMA")
CRT "Month (number): ":OCONV(idat,"DM")
CRT "Day: ":OCONV(idat,"DD")
CRT "Day of Week (word): ":OCONV(idat,"DWA")
CRT "Day of Week (number): ":OCONV(idat,"DW")
CRT "Quarter: ":OCONV(idat,"DQ")
CRT "Year: ":OCONV(idat,"DY")
CRT "Current Internal Date: ":internalDate
CRT "Current External Date: ":externalDate
CRT "Current Internal Time: ":internalTime
CRT "Current External 24h Time: ":external24Time
CRT "Current External 12h Time: ":external12Time
END