# This script installs IIS and the features required for Middletier & Webtier of a PB4ALL deployment
#
# * Make sure to run this script from a Powershell Admin Prompt!
# * Make sure Powershell Execution Policy is bypassed to run these scripts:
# * YOU MAY HAVE TO RUN THIS COMMAND PRIOR TO RUNNING THIS SCRIPT!
Set-ExecutionPolicy Bypass -Scope Process

# To list all Windows Features: dism /online /Get-Features
# Get-WindowsOptionalFeature -Online 
# LIST All IIS FEATURES: 
# Get-WindowsOptionalFeature -Online | where FeatureName -like 'IIS-*'

Set-Culture -CultureInfo nl-NL

Enable-WindowsOptionalFeature -Online -FeatureName MSMQ-Server -All -NoRestart

Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CommonHttpFeatures -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpErrors -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpRedirect -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment -NoRestart

Enable-WindowsOptionalFeature -online -FeatureName NetFx4Extended-ASPNET45 -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45 -NoRestart

Enable-WindowsOptionalFeature -Online -FeatureName IIS-HealthAndDiagnostics -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpLogging -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-LoggingLibraries -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestMonitor -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpTracing -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Security -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestFiltering -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Performance -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-IIS6ManagementCompatibility -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Metabase -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-BasicAuthentication -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-StaticContent -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIExtensions -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIFilter -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionStatic -NoRestart

Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45 -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName WCF-HTTP-Activation45 -NoRestart -All


# If you need classic ASP (not recommended)
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASP

# Disable Loopback Check on a Server - to get around no local Logins on Windows Server
# New-ItemProperty HKLM:\System\CurrentControlSet\Control\Lsa -Name "DisableLoopbackCheck" -Value "1" -PropertyType dword