-- ============================================================================
-- Intel Device Sustainability Performance Matrix
-- Author: Kenzie Markley
-- Description: End-to-end analytical pipeline assessing lifecycle e-waste 
--              mitigation, energy conservation, and regional carbon intensity.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- TASK 1 & 2: Structural Pipeline, Feature Extraction, and Global Aggregates
-- ----------------------------------------------------------------------------

-- Context: Merging device attributes with metrics to evaluate global volume, 
-- average age, cumulative energy savings, and total CO2 reduction in tons.
WITH joined_data AS (
    SELECT 
        a.device_id,
        a.device_type,
        a.model_year,
        b.impact_id,
        b.usage_purpose,
        b.power_consumption,
        b.energy_savings_yr,
        b.co2_saved_kg_yr,
        b.recycling_rate,
        b.region,
        (2024 - a.model_year) AS device_age,
        CASE
            WHEN (2024 - a.model_year) <= 3 THEN 'newer'
            WHEN (2024 - a.model_year) > 3 AND (2024 - a.model_year) <= 6 THEN 'mid-age'
            ELSE 'older'
        END AS device_age_bucket
    FROM intel.device_data a
    INNER JOIN intel.impact_data b
        ON a.device_id = b.device_id
)
SELECT
    COUNT(*) AS total_devices_repurposed,
    ROUND(AVG(device_age), 2) AS avg_device_age_years,
    ROUND(AVG(energy_savings_yr), 2) AS avg_energy_savings_kwh,
    ROUND(SUM(co2_saved_kg_yr) / 1000.0, 2) AS total_co2_saved_tons
FROM joined_data;


-- ----------------------------------------------------------------------------
-- TASK 3: Segmentation Matrix (Device Type, Temporal Buckets, and Geography)
-- ----------------------------------------------------------------------------

-- Step A: Performance breakdown mapped by Device Structural Form Factors
WITH joined_data AS (
    SELECT a.device_type, b.energy_savings_yr, b.co2_saved_kg_yr
    FROM intel.device_data a
    INNER JOIN intel.impact_data b ON a.device_id = b.device_id
)
SELECT
    device_type,
    COUNT(*) AS total_devices,
    ROUND(AVG(energy_savings_yr), 2) AS avg_energy_savings_kwh,
    ROUND(AVG(co2_saved_kg_yr) / 1000.0, 4) AS avg_co2_saved_tons
FROM joined_data
GROUP BY device_type;


-- Step C: Performance breakdown mapped by Temporal Lifespan Categorizations
WITH joined_data AS (
    SELECT 
        (2024 - a.model_year) AS device_age,
        CASE
            WHEN (2024 - a.model_year) <= 3 THEN 'newer'
            WHEN (2024 - a.model_year) > 3 AND (2024 - a.model_year) <= 6 THEN 'mid-age'
            ELSE 'older'
        END AS device_age_bucket,
        b.energy_savings_yr,
        b.co2_saved_kg_yr
    FROM intel.device_data a
    INNER JOIN intel.impact_data b ON a.device_id = b.device_id
)
SELECT
    device_age_bucket,
    COUNT(*) AS total_devices,
    ROUND(AVG(energy_savings_yr), 2) AS avg_energy_savings_kwh,
    ROUND(AVG(co2_saved_kg_yr) / 1000.0, 4) AS avg_co2_saved_tons
FROM joined_data
GROUP BY device_age_bucket
ORDER BY avg_energy_savings_kwh DESC;


-- Step E: Performance breakdown mapped by Geographical Region
WITH joined_data AS (
    SELECT b.region, b.energy_savings_yr, b.co2_saved_kg_yr
    FROM intel.device_data a
    INNER JOIN intel.impact_data b ON a.device_id = b.device_id
)
SELECT
    region,
    COUNT(*) AS total_devices,
    ROUND(AVG(energy_savings_yr), 2) AS avg_energy_savings_kwh,
    ROUND(AVG(co2_saved_kg_yr) / 1000.0, 4) AS avg_co2_saved_tons
FROM joined_data
GROUP BY region;


-- ----------------------------------------------------------------------------
-- LEVEL UP: Advanced Proportional Projections within Regional Clusters
-- ----------------------------------------------------------------------------

-- Evaluates internal percentage contribution metrics for device groups 
-- relative to total baseline performance of their regional grid.
WITH joined_data AS (
    SELECT 
        a.device_type,
        b.region,
        b.energy_savings_yr,
        b.co2_saved_kg_yr
    FROM intel.device_data a
    INNER JOIN intel.impact_data b ON a.device_id = b.device_id
),
regional_totals AS (
    SELECT 
        region,
        SUM(energy_savings_yr) AS total_energy_region,
        SUM(co2_saved_kg_yr) AS total_co2_region
    FROM joined_data
    GROUP BY region
)
SELECT
    d.region,
    d.device_type,
    COUNT(*) AS total_devices_allocated,
    ROUND(SUM(d.energy_savings_yr), 2) AS total_energy_savings_kwh,
    ROUND(SUM(d.co2_saved_kg_yr) / 1000.0, 2) AS total_co2_saved_tons,
    ROUND((SUM(d.energy_savings_yr) / CAST(r.total_energy_region AS NUMERIC)) * 100, 2) AS pct_energy_contribution,
    ROUND((SUM(d.co2_saved_kg_yr) / CAST(r.total_co2_region AS NUMERIC)) * 100, 2) AS pct_co2_contribution
FROM joined_data d
INNER JOIN regional_totals r 
    ON d.region = r.region
GROUP BY 
    d.region, 
    d.device_type,
    r.total_energy_region, 
    r.total_co2_region
ORDER BY 
    d.region ASC, 
    pct_energy_contribution DESC;
