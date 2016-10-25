
#deploy or upgrade the database:
$SqlPackagePath = 'C:\Program Files (x86)\Microsoft SQL Server\110\DAC\bin\SqlPackage.exe'
& $SqlPackagePath  /sf:NerdDinner.Database.dacpac /a:Publish #/pr:"$DatabasePublishXmlPath"

