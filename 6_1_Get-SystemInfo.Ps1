Write-Host "Show Operating System Information:" -ForegroundColor Blue
Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, LastBootUpTime, BuildNumber, BuildType
Write-Host "Show Manufacturer Information:" -ForegroundColor Green
Get-CimInstance Win32_ComputerSystem | Select-Object Manufacturer, Model, @{name="RAM_GB"; Expression={[MATH]::Round($_.TotalPhysicalMemory /1gb)}}
Write-Host "Show information regarding the disks, free space and percentage of free space:" -ForegroundColor Red
Get-CimInstance Win32_LogicalDisk -Filter "DriveType =3" | Select-Object DeviceID,  @{Name="FreeSpace_GB"; Expression={[math]::Round($_.FreeSpace /1gb)}}, @{Name="FreSpace_%"; Expression={[math]::Round(($_.FreeSpace/ $_.Size)*100)}}