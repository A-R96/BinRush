# BinRush

A PowerShell script to convert you're bin & cue files into single ISO files automatically.

### Prerequisites

* Bchunk
* Windows 10 or 11
* PowerShell

### Installation & Usage

To use this script you will need a copy of bchunk.

1. Download Bchunk from [here](https://github.com/extramaster/bchunk "Bchunk")
2. Save the bchunk executable to a permenant location
3. Add bchunk to your $PATH (environment variable) so that it can called from any working directory within PowerShell
4. Download the BinRush script
5. Open PowerShell as administrator and run the BinRush script type (.\BinRush.ps1) then hit ENTER
6. Follow the first prompt and enter the path to your folder containing the .bin and .cue files you want to convert to .iso files
   ex. C:\Users\<YOURNAME>\Desktop\Bins&Cues
7. Follow the second prompt and enter the path to where you want to store the newely created ISOs
   ex. C:\Users\<YOURNAME>\Desktop\convertedToISO
