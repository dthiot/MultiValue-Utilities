# MultiValue-Utilities
This repository contains utility programs that can be used with MultiValue databases.  These utilities are written in MultiValue BASIC.


The routines are as follows:

*SHOW_DATE.bas - simple BASIC program that accepts a standard date in the format of MM/DD/YYYY or an internal MultiValue date and returns the date in several different formats using ICONV and OCONV.  It needs support for international date formats and various MultiValue databases.  The current version has been tested on OpenQM, Universe and jBASE.

*SHOW_DATE_UPPER.bas - version of SHOW_DATE that works with jBASE 3.x/4.x and mvBASE.

*StandardDate.bas - Subroutine that accepts either an ISO 8601 formatted date string and returns MultiValue internal date and time or accepts a MultiValue internal date and time and returns an ISO 8601 formatted date string.  Without any parameters, it will return an ISO 8601 formatted date using the current system date and time.  Needs support for several of the ISO 8601 format options as well as internation date format support.

*Test_StandardDate.bas - Test routine that calls StandardDate using different options and displaying the returned data.


There are more utilities to come.
