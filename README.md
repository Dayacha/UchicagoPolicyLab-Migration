# UChicago Policy Lab — Migration Hotspots Project

This repository contains the full data processing pipeline for the **Northern Triangle Migration Hotspots Analysis**, covering El Salvador, Guatemala, and Honduras.  
The project includes:

- Country-level cleaning workflows written in **RMarkdown**
- A fully reproducible **master pipeline** (`run_all.R`)
- Automated raw-data validation and auto-unzip functionality
- Harmonized household- and migration-level datasets
- Export-ready outputs for dashboarding and hotspot visualization

---

## 📁 Repository Structure
UchicagoPolicyLab-Migration/
│
├── run_all.R
├── README.md
│
├── Data/
│ ├── raw/
│ │ ├── El Salvador/
│ │ ├── Guatemala/
│ │ └── Honduras/
│ │
│ ├── clean/
│ └── output/
│
├── National_shapefiles/
│
└── scripts/
│ ├── Guatemala-cleaning.rmd
│ ├── Honduras-cleaning.Rmd
│ ├── Salvador-cleaning.Rmd
│ └── combining_datasets.Rmd
└── 
