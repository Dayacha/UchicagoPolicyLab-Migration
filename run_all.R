# ============================================================
# run_all.R
# Master script: runs all country cleaning Rmds and then
# the combining_datasets Rmd.
# ============================================================
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

library(rmarkdown)
library(fs)
library(zip)

# ============================================================
# 0. DATA AVAILABILITY CHECK + AUTO-UNZIP
# ============================================================
message("=== Checking raw data availability ===")

# List of required raw folders
raw_paths <- c(
  "Data/raw/Guatemala",
  "Data/raw/Honduras",
  "Data/raw/El Salvador"
)

# 0.1 Check raw directories exist
for (p in raw_paths) {
  if (!dir_exists(p)) {
    stop(paste("Missing folder:", p, "\nPlease add the raw data folders."), call. = FALSE)
  }
}

# 0.2 Automatically unzip any .zip files inside Data/raw
zip_files <- dir_ls("Data/raw", recurse = TRUE, type = "file", glob = "*.zip")

if (length(zip_files) > 0) {
  message("📦 Found zipped raw files. Unzipping...")
  
  for (zf in zip_files) {
    out_dir <- path_dir(zf)
    unzip(zf, exdir = out_dir)
    message(paste("Unzipped:", basename(zf)))
  }
} else {
  message("No zipped files found.")
}

message("=== Raw data check completed ===")


message("=== 1. Running country cleaning scripts ===")

# Guatemala
render("scripts/Guatemala-cleaning.Rmd", quiet = FALSE)

# Honduras
render("scripts/Honduras-cleaning.Rmd", quiet = FALSE)

# El Salvador
render("scripts/Salvador-cleaning.Rmd", quiet = FALSE)

message("=== Country cleaning completed ===")

message("=== 2. Combining cleaned datasets ===")

render("scripts/combining_datasets.Rmd", quiet = FALSE)

message("=== Pipeline finished successfully ===")
