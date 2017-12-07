# PsychoPath

## About this repository

This repository is NOT a jailbreak.

The repository is here so people can contribute knowledge.

Currently the project contains code I personally wrote and a kernel exploit by @Siguza

## Contents
- An unfinished path traversal exploit for iOS up to 11.1 in a component of the StreamingZip Private Framework.
- An example of multiple reverse engineered private API's with a full working demonstration of MSVZipArchive.
- A VERY unrelated kernel exploit for the IOSurface kernel component in 64-bit devices up to 11.1.2 by @Siguza.

## StreamingZip
- As far as I know, you can extract outside the sandbox by using ../../../../../../
- The extraction needs to handle the XPC transaction correctly in order to function
- The archive to be extracted can overwrite existing files
- You can specify a sandboxtoken, I think this is how we can extract outside of the sandbo
- The vulnerability was found by Luca Todesco from KJC Research without providing a public exploit
- Sem Voigtlander then reverse engineered the framework as well and found the vulnerability
- CoffeeBreakers and everyone who contributes to this repository is now trying to make use of this vulnerability for modifying files in /var


##MSVZipArchive
- Normal sandbox restrictions apply
- Can extract zip files to a given output directory
- Is fast and reliable
- Working proof of concept
- Found and reverse engineered + PoC by Sem Voigtlander

##MBFileManager
- Just a extension on the NSFileManager class
- Normal sandbox restrictions apply
- used in iOS backups
- Working proof of concept
- Found and reverse engineered + PoC by Sem Voigtlander

##V0rtex IOSurface bad locking exploit
- Found by @Siguza
- For 64-bit only
- Patched in 11.1.2
- Very fast
- Bypasses kASLR
- Gives control over the kernel process counter
- No TFP0 yet
- KAUTH_Ref offset incorrect?
- It's a race condition and may take multiple tries
- A9 processors and below only (no iP7 and higher)
