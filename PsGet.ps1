#Search and install PowerShell modules easy.

(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex