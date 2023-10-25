PROGRAM EXPORT_D3_TO_MVSHARP
*
* Program to export data for MVsharp bulk import
*
PROMPT ""
*
equ dot$ to "."
equ dash$ to "-"
equ underscore$ to "_"
equ asterisk$ to "*"
*
equ tabChar$ to CHAR(9)
equ crChar$ to CHAR(13)
equ lfChar$ to CHAR(10)
equ crlfString$ to "%%CRLF%%"
equ crString$ to "%%CR%%"
equ lfString$ to "%%LF%%"
equ tabString to "%%TAB%%"
*
crt sentence()
d3FileName = field(sentence(),' ',2)
*
if d3FileName ne "" then
   crt "filename: ":d3FileName
   gosub ExportFile
end else
   open "md" to mdFile else stop 201, "md"
   read d3FileList from mdFile, "d3FileList" else
      crt "Unable to read the program list from md d3FileList."
      exit
   end
   loop
      d3FileName = d3FileList<1>
      if d3FileName = "" then exit
      d3FileList = delete(d3FileList,1,0,0)
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
   readnext id else exit
   read dataRec from dataFile, id then
    * Fix bad characters in data
    dataRec = change(dataRec,tabChar$,tabChar$); * Remove tabs from the data
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
