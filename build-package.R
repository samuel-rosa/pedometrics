# Build package

# Dependencies
devtools::update(devtools::package_deps())

# turn on/off development mode
devtools::dev_mode()

# check examples and documentation
roxygen2::roxygenise()
devtools::check_doc()
devtools::run_examples()

# check the package for Linux and Windows
devtools::check()
devtools::build_win()
devtools::build()

# Check all downstream dependencies
source("revdep/check.R")

# Upload to CRAN
devtools::release()

