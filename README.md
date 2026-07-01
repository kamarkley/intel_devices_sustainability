# Corporate Data Infrastructure: Optimizing Intel's Global Device Repurposing & Sustainability Matrix

## Executive Business Overview
Intel is committed to reducing its organizational carbon footprint and improving device lifecycle circularity. A vital part of this effort is their repurposing and recycling program, which diverts hardware from e-waste streams, offsets manufacturing emissions, and reduces energy consumption by extending the life of functional devices. 

Using structural telemetry tracking over **601,740 hardware assets processed in 2024**, this project builds an analytical optimization pipeline using PostgreSQL. The goal is to evaluate program performance, isolate operational signals across hardware form factors and geographical energy grids, and deliver data-backed recommendations to maximize ecological returns.

## Tech Stack & Database Architecture
* **Core Languages & Query Engines:** SQL (PostgreSQL Compliant)
* **Analytical Frameworks:** Multi-table Relational Joins, Vectorized Common Table Expressions (CTEs), Sub-query Window Aggregations, Case-Logic Feature Categorization.
* **Structural Context:** Modeled to replicate enterprise-level database schemas while protecting proprietary corporate infrastructure data.

## Database Schema & Map
The data pipeline normalizes and merges records across two primary tracking landscapes:
* **`intel.device_data`**: Hardware specifications (`device_id`, `device_type`, `model_year`).
* **`intel.impact_data`**: Environmental asset impact tracking metrics (`impact_id`, `usage_purpose`, `power_consumption`, `energy_savings_yr`, `co2_saved_kg_yr`, `region`).

## Installation & Project Reproducibility
> **Data Privacy Notice:** The underlying relational datasets utilize secure synthetic schemas managed for data protection frameworks. All core metrics, execution models, and evaluation CTE arrays are configured to maintain absolute compliance with proprietary organizational protection parameters while preserving accurate structural logic.

To review the analytical pipeline or execute the queries locally, run the script within any standard SQL client (e.g., pgAdmin, DBeaver, or DataGrip) connected to a PostgreSQL database engine.

## Strategic Analytics Summary & Insights
* **Global Milestone Impact:** The 2024 cohort saved ~15.5 million kWh of electricity (enough to power roughly 1,475 homes) and reduced net atmospheric carbon by 6,768 tons of $CO_2$ (equivalent to removing 1,470 cars from the road for an entire year).
* **The Lifespan Paradox:** Older devices represent the smallest percentage of volume in the pipeline, but they generate the highest per-device environmental benefit—saving more than double the average energy and carbon emissions of newer devices.
* **Regional Carbon Intensity:** While per-device energy savings stay stable across regions, net avoided carbon shifts drastically based on local electricity grids. Deployments in Asia and North America yield significantly higher $CO_2$ offsets due to the fossil-fuel-heavy reliance of their regional power grids.
* **Data-Driven Priority Recommendation:** Intel should optimize its program without increasing scale by prioritizing the acquisition of older desktop units and strategically routing hardware reuse distribution directly into high-intensity grid regions like Asia.
