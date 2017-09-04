# Raw-scripts
Scripts for viewing raw files


## *open_raw_files.sh*
Opens raw files in prefered image viewer

Script can be used as default openning method of raw files. Set "open with" as following custom command: *sh {path to open_raw_files.sh} %f*.


### Working method
The script extracts the embedded images (that exists in most raw image files) from all images in directory, and places them in a temperary folder. Once all images are extracted image viewer is opened. When the user closes viewer temperary files are removed.

Script is written for .RW2 (panasonic) files. Change ".RW2" to your file extention and "xviewer" to your prefered image viewer.

Note: script is dependent on *dcraw*.
