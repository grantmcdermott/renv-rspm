# Testing renv and RStudio Package Manager

This repo provides a quick example of how to combine [**renv**](https://rstudio.github.io/renv/) and [**RStudio Package Manager (RSPM)**](https://packagemanager.rstudio.com/) to create a reproducible R project.

The repo contains a single demo script, creatively called `script.R`. To install all of the R packages needed to run this script, simply clone the repo and then run the following commands in your R console:

```r
#renv::init()    ## Automatically run if you cloned/opened the repo as an RStudio project
renv::restore()  ## Enter "y" when prompted
```
This will automatically download all of the necessary packages in a sandboxed, project-specific library. You are now free to run my (amazing) script.

## Details

[**renv**](https://rstudio.github.io/renv/) generates an environment *lockfile* that snapshots package versions and dependencies. The lockfile here references against [**RSPM**](https://packagemanager.rstudio.com/) as the default package repository (i.e. where to download packages from), rather than one of the usual CRAN mirrors. Among other things, this enables time-travelling across different package versions and fast installation of pre-compiled R package binaries on Linux. 

While **renv** and **RSPM** certainly can work independently of another, they work very well as complements. One reason is that you need simply set the base **RSPM** repo URL (e.g. `options(repos = c(RSPM = "https://packagemanager.rstudio.com/all/latest"))`) and **renv** will automatically transform the URL so that it fetches the binaries appropriate for your platform (OS, distro, etc.), or whoever else you have shared your lockfile with. For this example, I have enabled this behaviour directly in the project's local [`.Rprofile` file](https://github.com/grantmcdermott/renv-rspm/blob/master/.Rprofile). I expect that this approach makes sense for the majority of use cases. As an aside, note that RSPM does not yet provide binaries for Mac, hence I am defaulting to CRAN/MRAN for those users. Here is the relevant part of the project's `.Rprofile` file:

```r
## For Linux and Windows users, we'll use RStudio Package Manager (RSPM).
if (Sys.info()[['sysname']] %in% c('Linux', 'Windows')) {
	options(repos = c(RSPM = "https://packagemanager.rstudio.com/all/latest"))
	} else {
		## For Mac users, we'll default to installing from CRAN/MRAN instead, since
		## RSPM does not yet support Mac binaries.
		options(repos = c(CRAN = "https://cran.rstudio.com/"))
		# options(renv.config.mran.enabled = TRUE) ## TRUE by default
	}
options(renv.config.repos.override = getOption("repos"))
```

Here is a [**video**](https://www.periscope.tv/grant_mcdermott/1lPJqLjlVAAGb) of me explaining the same ideas at greater length.
