* Quick program to show the ICONV of a Date
     DAT = FIELD(SENTENCE()," ",2)
     CRT ""
     IF DAT = "" THEN
        CRT "Enter Date: ":
        INPUT DAT
        CRT ""
     END
     IF DAT = "" THEN STOP
     IF LEN(DAT) <= 5 THEN
        IDAT = DAT
        ODAT = OCONV(IDAT,"D4/")
        CRT "External: ":ODAT
     END ELSE
        ODAT = DAT
        IDAT = ICONV(ODAT,"D")
        CRT "Internal: ":IDAT
     END
     *
     INTERNAL.DATE = DATE()
     EXTERNAL.DATE = OCONV(INTERNAL.DATE,"D4/")
     INTERNAL.TIME = TIME()
     EXTERNAL.24.TIME = OCONV(INTERNAL.TIME,"MTS")
     EXTERNAL.12.TIME = OCONV(INTERNAL.TIME,"MTHS")
     *
     CRT "Month (word): ":OCONV(IDAT,"DMA")
     CRT "Month (number): ":OCONV(IDAT,"DM")
     CRT "Day: ":OCONV(IDAT,"DD")
     CRT "Day of Week (word): ":OCONV(IDAT,"DWA")
     CRT "Day of Week (number): ":OCONV(IDAT,"DW")
     CRT "Quarter: ":OCONV(IDAT,"DQ")
     CRT "Year: ":OCONV(IDAT,"DY")
     CRT "Current Internal Date: ":INTERNAL.DATE
     CRT "Current External Date: ":EXTERNAL.DATE
     CRT "Current Internal Time: ":INTERNAL.TIME
     CRT "Current External 24h Time: ":EXTERNAL.24.TIME
     CRT "Current External 12h Time: ":EXTERNAL.12.TIME
  END