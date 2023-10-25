program export_from_d3.bas
*
* Program to export data for MVsharp bulk import
* Must be flash compiled as in:
* COMPILE {yourFileName} export_from_d3 (o
*
PROMPT ""
*
EQU dot$ TO "."
EQU dash$ TO "-"
EQU underscore$ TO "_"
EQU asterisk$ TO "*"
*
EQU tabChar$ TO CHAR(9)
EQU crChar$ TO CHAR(13)
EQU lfChar$ TO CHAR(10)
*
crt sentence()
d3FileName = field(sentence(),' ',2)
*
if d3FileName ne "" then
   crt "filename: ":d3FileName
   gosub ExportFile
end else
   open "pointer-file" to pfFile else stop 201, "pointer-file"
   loop
      readnext d3FileName else exit
      crt "filename: ":d3FileName
      gosub ExportFile
   repeat
end
stop
*
ExportFile:
open d3FileName to dataFile else stop 201, d3FileName
windowsFileName = change(d3FileName,dash$,underscore$)
windowsFileName = change(windowsFileName,dot$,underscore$)
windowsFileName = change(windowsFileName,asterisk$,underscore$)
windowsFileName = "_":windowsFileName
crt "windowsFileName: ":windowsFileName

*
  include dm,bp,unix.h fcntl.h
  fname = 'c:\temp\transfer\':windowsFileName ;* Windows
***  fname = '/tmp/customers.txt' ;* Linux
  stream = (char*)%fopen(fname, 'w')
  if stream = 0 then stop "Cannot open ":fname
  select dataFile
*
  loop
   readnext id else id = "\\eof"
  until id = "\\eof" do
   read dataRec from dataFile, id then
    * Fix bad characters in data
    dataRec = change(dataRec,tabChar$,nullChar$); * Remove tabs from the data
    dataRec = change(dataRec,crChar$:lfChar$,crlfString$)
    dataRec = change(dataRec,crChar$,crString$)
    dataRec = change(dataRec,lfChar$,lfString$)
    line = id:tabChar$:dataRec
    gosub PutNextLine
   end
  repeat
  w = %fclose((char*)stream)
  return
*
PutNextLine:
  line := crChar$
  error = %fputs(line, (char*)stream)
  if error < 0 then crt "write error"
  return
 end
