source("renv/activate.R")
options(repos = c(RSPM = "https://packagemanager.rstudio.com/all/latest"))
## For Mac users, we'll default to install binaries from CRAN instead
if (!(Sys.info()[['sysname']] %in% c('Linux', 'Windows'))) {
  options(repos = c(CRAN = "https://cran.rstudio.com/"))
  options(renv.config.repos.override = getOption("repos"))
}
