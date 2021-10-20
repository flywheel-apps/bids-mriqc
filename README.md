This repository has been moved to Gitlab: [https://gitlab.com/flywheel-io/flywheel-apps/bids-mriqc](https://gitlab.com/flywheel-io/flywheel-apps/bids-mriqc)

# bids-mriqc
Gear that runs the [MRIQC](https://mriqc.readthedocs.io/en/stable/about.html) pipeline on [BIDS-curated data](https://bids.neuroimaging.io/).

MRIQC calculates [Image Quality Metrics (IQMs)](https://mriqc.readthedocs.io/en/stable/measures.html#module-mriqc.qc) and saves them as JSON files and in HTML reports.

This gear runs poldracklab/mriqc version 0.15.2 (April 6, 2020) and bids-standard/bids-validator version 1.5.7 (September 18, 2020).

This can run at the
[project](https://docs.flywheel.io/hc/en-us/articles/360017808354-EM-6-1-x-Release-Notes),
[subject](https://docs.flywheel.io/hc/en-us/articles/360038261213-Run-an-analysis-gear-on-a-subject) or
[session](https://docs.flywheel.io/hc/en-us/articles/360015505453-Analysis-Gears) level.

Inputs do not need to be provided because the mriqc pipeline will examine
the BIDS formatted data directly at the given run level.

For configuration options, please see [MRIQC command line interface](https://mriqc.readthedocs.io/en/stable/running.html#command-line-interface).  Note that arguments such as --n_procs --mem_gb and --ants-nthreads are set to use the maximum available as detected by MRIQC.

This will create a zip archive for each individual html file to allow quick
on-platform viewing: a click on the .html.zip file opens it an a new
browser tab.  Note that links in the html files will not work and
clicking on .html files directly will not display them properly.

If there are group .html.zip files, the best way to use this gear
is to run it and then download the "mriqc\_...\_.zip" file that
contains all results and open the group html files locally in a
browser.  The links in the group files to the individual file reports
will then work properly.
