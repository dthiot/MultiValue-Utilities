* Quick program to show the ICONV of a Date
dat = field(sentence()," ",2)
Crt
If dat = "" Then
   Crt "Enter Date: ":
   input dat
   Crt
End
If dat = "" Then Stop
If len(dat) = 5 Then
   idat = dat
   odat = oconv(idat,"D4/")
   Crt "External: ":odat
End Else
   odat = dat
   idat = iconv(odat,"D")
   Crt "Internal: ":idat
End
Crt "Month (word): ":oconv(idat,"DMA")
Crt "Month (number): ":oconv(idat,"DM")
Crt "Day: ":oconv(idat,"DD")
Crt "Day of Week (word): ":oconv(idat,"DWA")
Crt "Day of Week (number): ":oconv(idat,"DW")
Crt "Quarter: ":oconv(idat,"DQ")
Crt "Year: ":oconv(idat,"DY")
End