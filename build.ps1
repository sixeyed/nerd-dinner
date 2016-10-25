
$msBuildPath = "$env:windir\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"

# publish website:
& $msBuildPath mvc4\NerdDinner\NerdDinner.csproj /p:DeployOnBuild=true /p:PublishProfile=docker

# publish dacpac:
& $msBuildPath mvc4\NerdDinner.Database\NerdDinner.Database.sqlproj
Copy-Item mvc4\NerdDinner.Database\bin\Debug\NerdDinner.Database.dacpac docker\db

# build images:
docker build -t nerd-dinner-web .\docker\web
docker build -t nerd-dinner-db .\docker\db
