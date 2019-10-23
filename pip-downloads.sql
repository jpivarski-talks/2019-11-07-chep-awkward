SELECT
  DATE(timestamp) AS date,
  CASE WHEN country_code = "US" THEN "United States"
       WHEN country_code = "CH" THEN "Switzerland"
       WHEN country_code = "AU" THEN "Australia"
       WHEN country_code = "VA" OR country_code = "AD" OR country_code = "EE" OR country_code = "IS" OR country_code = "AM" OR country_code = "AL" OR country_code = "CZ" OR country_code = "GE" OR country_code = "AT" OR country_code = "IE" OR country_code = "GI" OR country_code = "GR" OR country_code = "NL" OR country_code = "PT" OR country_code = "NO" OR country_code = "LV" OR country_code = "LT" OR country_code = "LU" OR country_code = "ES" OR country_code = "IT" OR country_code = "RO" OR country_code = "PL" OR country_code = "BE" OR country_code = "FR" OR country_code = "BG" OR country_code = "DK" OR country_code = "HR" OR country_code = "DE" OR country_code = "HU" OR country_code = "BA" OR country_code = "FI" OR country_code = "BY" OR country_code = "FO" OR country_code = "MC" OR country_code = "CY" OR country_code = "MK" OR country_code = "SK" OR country_code = "MT" OR country_code = "SI" OR country_code = "SM" OR country_code = "SE" OR country_code = "GB" THEN "Europe"
       WHEN country_code = "CK" OR country_code = "PW" OR country_code = "TV" OR country_code = "NA" OR country_code = "KI" OR country_code = "MH" OR country_code = "NU" OR country_code = "TO" OR country_code = "NZ" OR country_code = "VU" OR country_code = "SB" OR country_code = "WS" OR country_code = "FJ" OR country_code = "FM" THEN "Oceana"
       WHEN country_code = "GW" OR country_code = "ZM" OR country_code = "CI" OR country_code = "EH" OR country_code = "GQ" OR country_code = "EG" OR country_code = "CG" OR country_code = "CF" OR country_code = "AO" OR country_code = "GA" OR country_code = "ET" OR country_code = "GN" OR country_code = "GM" OR country_code = "ZW" OR country_code = "CV" OR country_code = "GH" OR country_code = "RW" OR country_code = "TZ" OR country_code = "CM" OR country_code = "NA" OR country_code = "NE" OR country_code = "NG" OR country_code = "TN" OR country_code = "LR" OR country_code = "LS" OR country_code = "TG" OR country_code = "TD" OR country_code = "ER" OR country_code = "LY" OR country_code = "BF" OR country_code = "DJ" OR country_code = "SL" OR country_code = "BI" OR country_code = "BJ" OR country_code = "ZA" OR country_code = "BW" OR country_code = "DZ" OR country_code = "SZ" OR country_code = "MG" OR country_code = "MA" OR country_code = "KE" OR country_code = "ML" OR country_code = "KM" OR country_code = "ST" OR country_code = "MU" OR country_code = "MW" OR country_code = "SO" OR country_code = "SN" OR country_code = "MR" OR country_code = "SC" OR country_code = "UG" OR country_code = "SD" OR country_code = "MZ" THEN "Africa"
       WHEN country_code = "MN" OR country_code = "CN" OR country_code = "AF" OR country_code = "AM" OR country_code = "VN" OR country_code = "GE" OR country_code = "IN" OR country_code = "AZ" OR country_code = "ID" OR country_code = "RU" OR country_code = "LA" OR country_code = "TW" OR country_code = "TR" OR country_code = "LK" OR country_code = "TM" OR country_code = "TJ" OR country_code = "PG" OR country_code = "TH" OR country_code = "NP" OR country_code = "PK" OR country_code = "PH" OR country_code = "BD" OR country_code = "UA" OR country_code = "BN" OR country_code = "JP" OR country_code = "BT" OR country_code = "HK" OR country_code = "KG" OR country_code = "UZ" OR country_code = "MM" OR country_code = "SG" OR country_code = "MO" OR country_code = "KH" OR country_code = "KR" OR country_code = "MV" OR country_code = "KZ" OR country_code = "MY" THEN "Asia"
       WHEN country_code = "GT" OR country_code = "AG" OR country_code = "VG" OR country_code = "AI" OR country_code = "VI" OR country_code = "CA" OR country_code = "GD" OR country_code = "AW" OR country_code = "CR" OR country_code = "CU" OR country_code = "PR" OR country_code = "NI" OR country_code = "TT" OR country_code = "GP" OR country_code = "PA" OR country_code = "DO" OR country_code = "DM" OR country_code = "BB" OR country_code = "HT" OR country_code = "JM" OR country_code = "HN" OR country_code = "BS" OR country_code = "BZ" OR country_code = "SX" OR country_code = "SV" OR country_code = "MQ" OR country_code = "MS" OR country_code = "KY" OR country_code = "MX" THEN "North America"
       WHEN country_code = "GD" OR country_code = "PY" OR country_code = "CO" OR country_code = "VE" OR country_code = "CL" OR country_code = "SR" OR country_code = "BO" OR country_code = "EC" OR country_code = "GF" OR country_code = "AR" OR country_code = "GY" OR country_code = "BR" OR country_code = "PE" OR country_code = "UY" OR country_code = "FK" THEN "South America"
       WHEN country_code = "OM" OR country_code = "LB" OR country_code = "IQ" OR country_code = "YE" OR country_code = "IR" OR country_code = "BH" OR country_code = "SY" OR country_code = "QA" OR country_code = "JO" OR country_code = "KW" OR country_code = "IL" OR country_code = "AE" OR country_code = "SA" THEN "MiddleEast"
       ELSE "Other" END AS place,
  CASE WHEN details.distro.name LIKE "%Scientific%" THEN "Scientific Linux"
       WHEN details.system.name = "Linux" THEN "Other Linux"
       WHEN details.system.name = "Darwin" THEN "MacOS"
       WHEN details.system.name = "Windows" THEN "Windows"
       ELSE "Other" END AS os,
  file.project AS project,
  REGEXP_REPLACE(file.version, "\\.[0123456789]{1,}$", "") AS version,
  COUNT(*) AS count
FROM `the-psf.pypi.downloads*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160101' AND '20191024'
  AND (file.project = "uproot" OR
       file.project = "uproot-methods" OR
       file.project = "awkward" OR
       file.project = "coffea" OR
       file.project = "iminuit" OR
       file.project = "root-numpy" OR
       file.project = "rootpy" OR
       file.project = "matplotlib" OR
       file.project = "pandas" OR
       file.project = "numpy" OR
       file.project = "tensorflow" OR
       file.project = "torch" OR
       file.project = "Keras" OR
       file.project = "scikit-learn" OR
       file.project = "scipy")
  AND details.installer.name = "pip"
GROUP BY project, version, date, place, os
ORDER BY project, version, date, place, os
