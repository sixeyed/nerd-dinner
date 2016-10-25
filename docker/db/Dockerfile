# escape=`

FROM microsoft/mssql-server-2016-express-windows:windowsservercore-10.0.14393.206
MAINTAINER Elton Stoneman <elton@sixeyed.com>
SHELL ["powershell", "-command"]

VOLUME c:\databases

WORKDIR c:/nerd-dinner
COPY NerdDinner.Database.dacpac .
COPY Initialize-Database.ps1 .