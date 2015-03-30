------------------------------------------------------------
--- This is extracted from real data for sounding id
--- 20100207003330
------------------------------------------------------------

require "fixed_level_base_config"

config = FixedLevelBaseConfig:new()
---- Input for HDF file
config.spectrum_file = "20100207003330_data/l1_20100207003330.h5"
config.sid_string = "20100207003330"

--- Use HDF Level 1 file rather than ASCII
config.fm.l1b.creator = AcosConfig.level1b_hdf
config.fm.l1b.noise.creator = AcosConfig.gosat_noise

--- Cloud file to go with this.
config.cloud_file = "20100207003330_data/cld_20100207003330.h5"

--- Pressure from ECMWF
config.ecmwf_file = "20100207003330_data/ecm_20100207003330.h5"
config.fm.atmosphere.pressure.apriori = ConfigCommon.ecmwf_pressure
config.fm.atmosphere.temperature.levels.apriori = ConfigCommon.ecmwf_temperature
config.fm.atmosphere.absorber.H2O.apriori = ConfigCommon.ecmwf_h2o_vmr

--- Get apriori values from text file generated by python.
config.fm.instrument.dispersion.apriori = 
   ConfigCommon.ascii_dispersion("20100207003330_data/dispersion_20100207003330.dat", "cm^-1")
config.fm.atmosphere.absorber.CO2.apriori = 
   ConfigCommon.ascii_read("20100207003330_data/co2_apriori_20100207003330.dat", "co2")
config.fm.atmosphere.ground.lambertian.apriori =
   ConfigCommon.ascii_ground_apriori("20100207003330_data/albedo_20100207003330.dat")

config:do_config()
