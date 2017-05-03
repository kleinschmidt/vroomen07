# Raw data

This directory contains the raw data as it came to me.  The processed data is
taken from the `Data I` and `Data 13` subdirectories.  The subject numbers for
the `Data 13` batch need to be incremented by 16 (e.g., subject 1 in that
subdirectory is 17 in the processed dataset) to avoid conflicts with the `Data
I` subject numbers.

There's one `.dat` data file for each block (two pretest blocks and a number of
adaptation blocks), with condition information embedded in the filenames.  I'm
using the _file's_ timestamps to get the order of the individual blocks (since
that varies across sessions).

The individual files have the same format: space separated columns for:

  * Trial (number)
  * Movie (filename)
  * Response ("Z" or "M", for "b" and "d" responses respectively, and "#" for no
    response)
  * Time (seconds with comma decimal. RT?).

