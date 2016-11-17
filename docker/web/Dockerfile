# escape=`

FROM microsoft/iis
MAINTAINER Elton Stoneman <elton@sixeyed.com>
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

# Install ASP.NET
RUN Install-WindowsFeature NET-Framework-45-ASPNET; `
    Install-WindowsFeature Web-Asp-Net45

# Configure website
EXPOSE 8081
RUN Remove-Website -Name 'Default Web Site'; `
    md c:\nerd-dinner; `
    New-Website -Name 'nerd-dinner' `
                -Port 8081 -PhysicalPath 'c:\nerd-dinner' `
                -ApplicationPool '.NET v4.5'

# check if needed
# Setup app pool for LocalDB access
RUN Import-Module WebAdministration; `
    Set-ItemProperty 'IIS:\AppPools\.NET v4.5' -Name 'processModel.loadUserProfile' -Value 'True'; `
    Set-ItemProperty 'IIS:\AppPools\.NET v4.5' -Name 'processModel.setProfileEnvironment' -Value 'True'

# Unlock custom config
RUN & c:\windows\system32\inetsrv\appcmd.exe `
      unlock config `
      /section:system.webServer/handlers

# REMARK: Temporary workaround for Windows DNS client weirdness
RUN set-itemproperty -path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ServerPriorityTimeLimit -Value 0 -Type DWord

ENV BING_MAPS_KEY `
    IP_INFO_DB_KEY `
    AUTH_DB_CONNECTION_STRING `
    APP_DB_CONNECTION_STRING

COPY NerdDinner c:\nerd-dinner
COPY bootstrap.ps1 \

ENTRYPOINT ./bootstrap.ps1