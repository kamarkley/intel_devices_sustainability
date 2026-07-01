# Data Dictionary: Intel Device Sustainability Database

This schema documentation details the data assets, tracking variables, and data structures utilized in the 2024 Intel Lifespan and Sustainability optimization framework.

---

## 1. Table: `intel.device_data`
This table acts as the hardware baseline register, cataloging the foundational physical properties of every asset tracking unit processed by the repurposing streams.

| Column Name | Data Type | Key Type | Description & Domain Constraints |
| :--- | :--- | :---: | :--- |
| `device_id` | `VARCHAR(50)` | Primary Key | Unique alpha-numeric token assigned to each individual hardware asset unit. |
| `device_type` | `VARCHAR(20)` | - | Specifies the physical structural form factor of the device. Restricted to domain values: `Laptop` or `Desktop`. |
| `model_year` | `INTEGER` | - | The calendar year the hardware unit was originally manufactured (e.g., 2018, 2021). Used to derive physical asset age metrics. |

---

## 2. Table: `intel.impact_data`
This table captures environmental telemetry records, mapping operational usage classifications alongside localized carbon metrics for the lifecycle footprint calculations.

| Column Name | Data Type | Key Type | Description & Domain Constraints |
| :--- | :--- | :---: | :--- |
| `impact_id` | `VARCHAR(50)` | Primary Key | Unique tracker key identifying a distinct asset ecological environmental profile entry. |
| `device_id` | `VARCHAR(50)` | Foreign Key | Relational link token referencing back to `intel.device_data(device_id)` to preserve structural constraint integrity. |
| `usage_purpose` | `VARCHAR(100)` | - | The designated socioeconomic pipeline for the asset. Operational values include: `Education & Digital Literacy`, `Corporate & Enterprise`, `Government & Public Sector`, `Environmental Sustainability Programs`, or `Social Impact & Non-Profit`. |
| `power_consumption`| `NUMERIC(6,2)`| - | Active system power requirements, monitored and logged in Watts (W) when in standard configuration usage. |
| `energy_savings_yr`| `NUMERIC(8,2)`| - | Estimated computational grid energy conserved per device per year relative to deployment of a brand new asset, measured in Kilowatt-Hours (kWh). |
| `co2_saved_kg_yr` | `NUMERIC(8,2)`| - | Quantified baseline carbon dioxide emissions completely averted from localized production lifecycle sequences, tracked annually in Kilograms (kg). |
| `recycling_rate` | `NUMERIC(5,2)`| - | The audited mass percentage of the physical device infrastructure capable of being entirely recovered or safely processed back into core raw material streams. |
| `region` | `VARCHAR(30)` | - | The geographic territory location overseeing the asset lifecycle processing loop. Restricted to domain values: `North America`, `Europe`, or `Asia`. |
