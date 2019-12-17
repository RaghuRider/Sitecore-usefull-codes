#define parameters 
$prefix = "sitename"
$XConnectCollectionService = "$prefix.xconnect"
$sitecoreSiteName = "$prefix.local"
$SolrUrl = "https://localhost:8983/solr"
$SolrRoot = "C:\solr-6.6.2\"
$SolrService = "solr"
$SqlServer = "DESKTOP-CHKJ1CC"
$SqlAdminUser = "sa"
$SqlAdminPassword = "admin_123" 
$SqlAccountUser = "$prefix"
$SqlAccountPassword = "Pa##w0rd" 
$FilesRoot = "C:\Sitecore2"
 
#install client certificate for xconnect 
$certParams = 
@{     
    Path = "$FilesRoot\xconnect-createcert.json"     
    CertificateName = "$prefix.xconnect_client" 
} 
Install-SitecoreConfiguration @certParams -Verbose



#install solr cores for xdb 
$solrParams = 
@{
    Path = "$FilesRoot\xconnect-solr.json"     
    SolrUrl = $SolrUrl    
    SolrRoot = $SolrRoot  
    SolrService = $SolrService  
    CorePrefix = $prefix 
} 
Install-SitecoreConfiguration @solrParams -Verbose

#deploy xconnect instance 
$xconnectParams = 
@{
    Path = "$FilesRoot\xconnect-xp0.json"     
    Package = "C:\Sitecore2\Sitecore 9.0.2 rev. 180604 (OnPrem)_xp0xconnect.scwdp.zip"
    LicenseFile = "$FilesRoot\license.xml"
    Sitename = $XConnectCollectionService   
    XConnectCert = $certParams.CertificateName    
    SqlDbPrefix = $prefix  
    SqlServer = $SqlServer  
    SqlAdminUser = $SqlAdminUser
    SqlAdminPassword = $SqlAdminPassword
    SolrCorePrefix = $prefix
    SolrURL = $SolrUrl      
    SqlCollectionUser = $SqlAccountUser
    SqlCollectionPassword = $SqlAccountPassword
    SqlMarketingAutomationUser = $SqlAccountUser
    SqlMarketingAutomationPassword = $SqlAccountPassword
    SqlReferenceDataUser = $SqlAccountUser
    SqlReferenceDataPassword = $SqlAccountPassword
    SqlProcessingPoolsUser = $SqlAccountUser
    SqlProcessingPoolsPassword = $SqlAccountPassword
} 
Install-SitecoreConfiguration @xconnectParams -Verbose

#install solr cores for sitecore 
$solrParams = 
@{
    Path = "$FilesRoot\sitecore-solr.json"
    SolrUrl = $SolrUrl
    SolrRoot = $SolrRoot
    SolrService = $SolrService     
    CorePrefix = $prefix 
} 
Install-SitecoreConfiguration @solrParams -Verbose
 
#install sitecore instance 
$sitecoreParams = 
@{     
    Path = "$FilesRoot\sitecore-XP0.json"  
    Package = "C:\Sitecore2\Sitecore 9.0.2 rev. 180604 (OnPrem)_single.scwdp.zip" 
    LicenseFile = "$FilesRoot\license.xml"
    SqlDbPrefix = $prefix  
    SqlServer = $SqlServer  
    SqlAdminUser = $SqlAdminUser     
    SqlAdminPassword = $SqlAdminPassword     
    SolrCorePrefix = $prefix  
    SolrUrl = $SolrUrl     
    XConnectCert = $certParams.CertificateName     
    Sitename = $sitecoreSiteName         
    XConnectCollectionService = "https://$XConnectCollectionService"    
    SqlCoreUser = $SqlAccountUser
    SqlCorePassword = $SqlAccountPassword
    SqlMasterUser = $SqlAccountUser
    SqlMasterPassword = $SqlAccountPassword
    SqlWebUser = $SqlAccountUser
    SqlWebPassword = $SqlAccountPassword
    SqlFormsUser = $SqlAccountUser
    SqlFormsPassword = $SqlAccountPassword
    SqlProcessingTasksUser = $SqlAccountUser
    SqlProcessingTasksPassword = $SqlAccountPassword
    SqlReportingUser = $SqlAccountUser
    SqlReportingPassword = $SqlAccountPassword
    SqlMarketingAutomationUser = $SqlAccountUser
    SqlMarketingAutomationPassword = $SqlAccountPassword
    SqlReferenceDataUser = $SqlAccountUser
    SqlReferenceDataPassword = $SqlAccountPassword
    SqlProcessingPoolsUser = $SqlAccountUser
    SqlProcessingPoolsPassword = $SqlAccountPassword
} 
Install-SitecoreConfiguration @sitecoreParams -Verbose
