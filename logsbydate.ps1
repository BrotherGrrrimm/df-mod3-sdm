# Create the folder where the logs will be stored.
$logFolder = "C:\PhillipsG-Projects\df-mod3-sdm\logs"
# Test to ensure the folder exists
if (!(Test-Path -Path $logFolder)) {
    New-Item -ItemType Directory -Path $logFolder
}
# generate the log file name with the current date
$date = Get-Date -Format "yyyy-MM-dd"
$logFileName = "logs_$date.txt"
# Create the full path for the log file
$logFilePath = Join-Path -Path $logFolder -ChildPath $logFileName
# Retrieve the last 20 eventries from the Security log
$logContent = Get-WinEvent -LogName System -MaxEvents 20 | Out-String
# Write the log content to the file
$logContent | Out-File -FilePath $logFilePath -Encoding UTF8
# Output the log file path.
Write-Output "Log file saved to: $logFilePath"
