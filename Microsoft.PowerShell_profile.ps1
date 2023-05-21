# PowerShell RC file
# By Nicholas Grogg

# Configure autocomplete to function more like ZSH
Import-Module Microsoft.Powershell.UnixCompleters
Import-Module Microsoft.PowerShell.UnixTabCompletion
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Import-UnixCompleters

# Append to path
$env:Path += ":~/bin"

# Aliases
set-alias cat "get-content"
function gits {
	chdir ~/Documents/gits
	dir }
function ll {
	bash -c "ls -l" }
