# Corporate Data Infrastructure: Optimizing Intel's Global Device Repurposing & Sustainability Matrix

## Executive Summary
Intel is committed to reducing its organizational carbon footprint and driving lifecycle circularity across its devices. A vital part of this effort is their device repurposing program, which diverts hardware from e-waste streams, offsets manufacturing emissions, and reduces energy footprints. 

Using structural telemetry tracking over **601,740 hardware assets processed in 2024**, this project builds an analytical optimization pipeline using PostgreSQL. The goal is to evaluate program performance, isolate operational signals across hardware form factors and geographical energy grids, and deliver data-backed recommendations to maximize ecological returns.

---

## Tech Stack & Database Architecture
* **Language:** SQL (PostgreSQL Compliant)
* **Analytical Techniques:** Multi-table Relational Joins, Vectorized Common Table Expressions (CTEs), Sub-query Window Aggregations, Case-Logic Feature Categorization.
* **Structural Context:** Modeled to replicate key data schemas and properties found within enterprise-level sustainability infrastructures.

---

## Database Schema Map
The data pipeline normalizes and merges records across two primary tracking landscapes:
* **`intel.device_data`**: Hardware specifications (`device_id`, `device_type`, `model_year`).
* **`intel.impact_data`**: Environmental asset impact tracking metrics (`impact_id`, `usage_purpose`, `power_consumption`, `energy_savings_yr`, `co2_saved_kg_yr`, `region`).

---

## Key Analytical Insights & Takeaways

### 1. Global Program Milestone Summary
The execution pipeline consolidated all 2024 assets to reveal a massive aggregate program benefit:
* **Total Assets Diverted:** 601,740 units
* **Cumulative Energy Conserved:** ~15.5 Million kWh per year (Capable of powering roughly **1,475 average U.S. households**).
* **Net Atmospheric Carbon Saved:** 6,768 Tons of $CO_2$ emissions (Equivalent to taking **1,470 combustion vehicles off the road** for an entire calendar year).

### 2. The Lifespan Paradox (Age vs. Volume Optimization)
Grouping analysis across temporal age bins (`newer` $\le 3\text{ yrs}$, `mid-age` $4\text{-}6\text{ yrs}$, `older` $> 6\text{ yrs}$) revealed a distinct strategic variance:
* **The Volume Distribution:** Newer devices represent the highest volume share of the processing stream.
* **The Efficiency Margin:** Older assets deliver the highest individual per-device return—generating more than double the average energy and $CO_2$ savings compared to newer assets.

### 3. Regional Carbon Intensity Discrepancy
While individual per-device energy savings remained structurally stable across regions, net avoided carbon shifts dramatically based on local electricity grids:
* **High-Intensity Returns:** Asset deployments in **Asia** and **North America** yield substantially higher $CO_2$ offsets per kilowatt-hour due to the higher baseline fossil fuel utilization profile of their regional grids.

---

## Proportional Allocation Matrix (Regional Insights)
The final stage optimization query computed the localized contribution margins of device classifications within specific regional grids:

| Geographical Grid | Device Type | Volumetric Allocation | Total Energy Savings (kWh) | Avoided Carbon (Tons) | Proportional Energy Contribution | Proportional Carbon Offset |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Asia** | Laptop | *High Volume* | Optimized | High Offset | **Dominant Share** | **Dominant Share** |
| **Asia** | Desktop | *Mid Volume* | High Baseline | High Offset | Stable Baseline | High Core Return |
| **North America** | Laptop | *High Volume* | Optimized | Mid-High Offset | **Dominant Share** | **Dominant Share** |

---

## Strategic Recommendations for Intel Leadership
Based on the data output signatures, Intel can optimize its programmatic sustainability roadmap without inflating operational scale by acting on two vectors:
1. **Targeted Lifecycle Sourcing:** Systematically incentivize the acquisition and repurposing of older desktops. Though lower in volume, their high power profiles mean extending their life offsets much larger manufacturing and grid footprints.
2. **Carbon-Intensive Grid Prioritization:** Strategically route repurposed hardware flows into high carbon-intensity grids like Asia and North America. This ensures every kilowatt-hour of energy saved results in the maximum possible reduction in real-world atmospheric carbon emissions.

---

## Privacy & Data Constraints Notice
> **Notice:** The underlying relational datasets utilize secure synthetic schemas managed for data protection frameworks. All core metrics, execution models, and evaluation CTE arrays are configured to maintain absolute compliance with proprietary organizational protection parameters while preserving accurate structural logic.
