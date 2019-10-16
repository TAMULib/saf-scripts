# SAF-Scripts
Simple Archive Format Scripts

## DSpace
A set of scripts used to perform different tasks related to DSpace and involving SAF.

### dspace-saf-deduplicate.sh
A script designed to find and remove duplicate documents specified in an SAF Batch import directory.
This performs checksum operations on the files (md5sum) and removes files whose checksums match another file.
This ensures that only one copy of a given file exists.

Example Usage: `dspace-saf-deduplicate.sh source_directory`.

### dspace-saf-find_problematic_pdfs.sh
A script designed to find incorrectly generated PDF files produced by SAFCreator.
The invalid PDF files generally occur because remove websites provide invalid data (such as setting a mimetype to 'application/pdf', returning HTTP 200, and setting the contents of the provided PDF to `404 Not Found`).
This also helps identify duplicate PDFs.

Example Usage: `dspace-saf-find_problematic_pdfs.sh source_directory`.

### dspace-saf-rename_directory.sh
A script for renaming the directories generated by SAFCreator into a name specified by a specific column in some mapping file.
SAFCreator currently does not support naming directories by some column name, so this script bridges the gap.

Example Usage: `dspace-saf-rename_directory.sh -m mapping.csv source_directory`.

## References:
- [DSpace](https://github.com/DSpace/DSpace)
- [SAFCreator](https://github.com/jcreel/SAFCreator)
