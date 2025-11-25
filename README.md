# UChicago Policy Lab — Migration Hotspots Project

This repository contains the full data processing pipeline for the **Northern Triangle Migration Hotspots Analysis**, covering El Salvador, Guatemala, and Honduras.  
The project includes:

- Country-level cleaning workflows written in **RMarkdown**
- A fully reproducible **master pipeline** (`run_all.R`)
- Automated raw-data validation and auto-unzip functionality
- Harmonized household- and migration-level datasets
- Export-ready outputs for dashboarding and hotspot visualization

  This project intends to visualize migration hotspots via a Tableau Dashboard.

---
## ▶️ How to Run the Project
1. **Clone the repository**
   ```sh
   git clone https://github.com/<your-org>/UchicagoPolicyLab-Migration
   
2. **Run the complete pipeline**
    ```sh
      source("run_all.R")

## Dashboard
This project intends to visualize migration hotspots via a Tableau Dashboard.

## 🔄 Reproducibility Pipeline

The script automatically:

- Checks whether raw data folders exist  
- Automatically unzips `.zip` files inside `/Data/raw`  
- Renders each country’s cleaning `.Rmd`  
- Saves cleaned datasets to `/Data/clean`  
- Renders the dataset combining script  
- Produces final harmonized datasets in `/Data/output`  

---

## 🔗 Data Sources

### 🇸🇻 El Salvador — Encuesta de Hogares de Propósitos Múltiples (EHPM)

**Source:** Dirección General de Estadística y Censos (DIGESTYC)  
**Link:** https://www.digestyc.gob.sv/
**Granulatity** Municipality data

**Description:**  
Hogar-level survey including income, employment, education, housing, access to services, poverty, and geo-identifiers (department & municipality).  
Provides core socioeconomic indicators used to build education and employment metrics.

---

### 🇬🇹 Guatemala — Encuesta Nacional de Empleo e Ingresos (ENEI)

**Source:** Instituto Nacional de Estadística (INE)  
**Link:** https://www.ine.gob.gt/
**Granulatity** Municipality data

**Description:**  
National employment and income survey covering labor status, NEET rate, vulnerable employment, education levels, income sources, and household characteristics with geo-identifiers.  
Core source for Guatemala’s socioeconomic indicators.

---

### 🇭🇳 Honduras — Encuestas Utilizadas

**Sources:**  
Instituto Nacional de Estadísticas (INE) — https://www.ine.gob.hn/  
Banco Central de Honduras (BCH) — https://www.bch.hn/

---

#### Encuesta de Migración y Remesas 2023  
**Granulatity** Municipality data
Household-level migration survey capturing the number of emigrants, remittance flows, motives for migration, and key demographic and labor characteristics.  
Provides Honduras’ primary indicators on migration dynamics and remittance dependence.

---

#### Encuesta Permanente de Hogares de Propósitos Múltiples (EPHPM) 2024  
**Granulatity** Department data
National employment and household survey covering labor status, educational attainment, income, household conditions, and urban/rural classification.  
Serves as the core socioeconomic dataset contextualizing Honduras’ migration patterns.

---

### 🌎 World Bank LAC Data

**Source:** The World Bank Data Catalog  
**Link:** https://data.worldbank.org/

**Description:**  
Regional socioeconomic indicators used for contextualization and validation, including education, health, poverty, inequality, and violence-related metrics.

---

### 🗺 National Shapefiles

**Sources:**  
- OpenStreetMap Boundaries — https://osm-boundaries.com/  
- National statistical offices (INE Guatemala, DIGESTYC El Salvador, INE Honduras)

**Description:**  
Department- and municipality-level shapefiles used to generate hotspot maps and geographic visualizations.

---

## 🧹 Cleaning Scripts

### `scripts/Guatemala-cleaning.rmd`

- Cleans and standardizes ENEI data  
- Generates employment, NEET, education, household, and urban/rural indicators  
- Saves output to `Data/clean/hogares_gt.rds`

### `scripts/Honduras-cleaning.Rmd`

- Cleans Honduras Migration & Remittances data  
- Applies household expansion factors  
- Computes migration, remittances, and socioeconomic indicators  
- Saves output to `Data/clean/hogares_hn.rds`

### `scripts/Salvador-cleaning.Rmd`

- Processes EHPM survey  
- Standardizes education, employment, poverty, and housing variables  
- Saves output to `Data/clean/hogares_sv.rds`

---

## 🔗 Combining Datasets

### `scripts/combining_datasets.Rmd`

This script:

- Loads the three cleaned datasets  
- Harmonizes names and structures  
- Adds a country identifier  
- Produces the final integrated dataset:


