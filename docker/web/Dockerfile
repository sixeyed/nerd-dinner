# escape=`

FROM microsoft/iis:10.0.14393.206
MAINTAINER Elton Stoneman <elton@sixeyed.com>
SHELL ["powershell", "-command"]

# Install ASP.NET
RUN Install-WindowsFeature NET-Framework-45-ASPNET; `
    Install-WindowsFeature Web-Asp-Net45

# Configure website
EXPOSE 8081
RUN Remove-Website -Name 'Default Web Site'; `
    md c:\nerd-dinner; `
    md c:\databases; `
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

COPY nerd-dinner c:\nerd-dinner