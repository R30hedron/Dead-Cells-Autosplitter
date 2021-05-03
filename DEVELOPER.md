# Development notes

For the debug option in the autosplitter options, you need [DebugView](https://docs.microsoft.com/en-us/sysinternals/downloads/debugview) from Microsoft.

To obtain the MD5 hashes for new versions of the game, run the following powershell commands:
```
Get-FileHash deadcells.exe -Algorithm MD5
Get-FileHash deadcells_gl.exe -Algorithm MD5
```

//TODO: Add how to update the autosplitter for future versions
