# escape=`

FROM microsoft/iis:10.0.14393.206
MAINTAINER Elton Stoneman <elton@sixeyed.com>
SHELL ["powershell", "-command"]

# Install ASP.NET
RUN Install-WindowsFeature NET-Framework-45-ASPNET; `
    Install-WindowsFeature Web-Asp-Net45

# Install SQL Server LocalDB
RUN Invoke-WebRequest -OutFile c:\SqlLocalDB.msi -Uri http://download.microsoft.com/download/8/D/D/8DD7BDBA-CEF7-4D8E-8C16-D9F69527F909/ENU/x64/SqlLocalDB.MSI
RUN ["cmd", "/S", "/C", "c:\\windows\\syswow64\\msiexec", "/i", "c:\\SqlLocalDB.msi", "IACCEPTSQLLOCALDBLICENSETERMS=YES", "/qn"]
RUN & 'C:\Program Files\Microsoft SQL Server\110\Tools\Binn\sqllocaldb' start "v11.0"

# Configure website
EXPOSE 8081
RUN Remove-Website -Name 'Default Web Site'; `
    md c:\nerd-dinner; `
    md c:\databases; `
    New-Website -Name 'nerd-dinner' `
                -Port 8081 -PhysicalPath 'c:\nerd-dinner' `
                -ApplicationPool '.NET v4.5'

# Setup app pool for LocalDB access
RUN Import-Module WebAdministration; `
    Set-ItemProperty 'IIS:\AppPools\.NET v4.5' -Name 'processModel.loadUserProfile' -Value 'True'; `
    Set-ItemProperty 'IIS:\AppPools\.NET v4.5' -Name 'processModel.setProfileEnvironment' -Value 'True'

# Unlock custom config
RUN & c:\windows\system32\inetsrv\appcmd.exe `
      unlock config `
      /section:system.webServer/handlers

COPY nerd-dinner c:\nerd-dinner