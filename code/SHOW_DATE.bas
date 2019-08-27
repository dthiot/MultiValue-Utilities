* Quick program to show the Iconv of a Date
dat = Field(Sentence()," ",2)
Crt
If dat = "" Then
   Crt "Enter Date: ":
   Input dat
   Crt
End
If dat = "" Then Stop
If Len(dat) = 5 Then
   idat = dat
   odat = Oconv(idat,"D4/")
   Crt "External: ":odat
End Else
   odat = dat
   idat = Iconv(odat,"D")
   Crt "Internal: ":idat
End
*
internalDate = Date()
externalDate = Oconv(internalDate,"D4/")
internalTime = Time()
externalTime = Oconv(internalTime,"MTHS")
*
Crt "Month (word): ":Oconv(idat,"DMA")
Crt "Month (number): ":Oconv(idat,"DM")
Crt "Day: ":Oconv(idat,"DD")
Crt "Day of Week (word): ":Oconv(idat,"DWA")
Crt "Day of Week (number): ":Oconv(idat,"DW")
Crt "Quarter: ":Oconv(idat,"DQ")
Crt "Year: ":Oconv(idat,"DY")
Crt "Current Internal Date: ":internalDate
Crt "Current External Date: ":externalDate
Crt "Current Internal Time: ":internalTime
Crt "Current External Time: ":externalTime
End