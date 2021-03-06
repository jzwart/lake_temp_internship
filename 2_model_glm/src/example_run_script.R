# running GLM model example

library(glmtools)

source('2_model_glm/src/run_glm.R') # sourcing function for running glm simulation

nhd_id = 'nhd_13293262' # Lake Mendota's nhd ID

start = '2010-04-01' #start of simulation
stop = '2011-10-01' # end of simulation
add_rain = T # adding rain so that lake level stays the same
burnin_years = 4 # adding burnin time period so that model stabilizes

sim_out = run_simulation(config_path = '2_model_glm/cfg/Mendota_glm_config.txt',
                         orig_meteo_file = 'mendota_driver_data.csv',
                         meteo_file = sprintf('%s_meteo.csv', nhd_id),
                         meteo_dir = '1_data/in')

# sim_out = run_simulation(config_path = '2_model_glm/cfg/Mendota_glm_config.txt',
#                          orig_meteo_file = 'mendota_driver_data.csv',
#                          meteo_file = sprintf('%s_meteo.csv', nhd_id),
#                          meteo_dir = '1_data/in',
#                          start = start,
#                          stop = stop,
#                          add_rain = add_rain,
#                          burnin_years = burnin_years)

glmtools::plot_temp(sim_out$ncpath)

