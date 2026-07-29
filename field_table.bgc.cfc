"prog_tracers","ocean_mod","temp"
horizontal-advection-scheme = mdppm
vertical-advection-scheme = mdppm
restart_file = ocean_temp_salt.res.nc
ppm_hlimiter=2
ppm_vlimiter=2
/
"prog_tracers","ocean_mod","salt"
horizontal-advection-scheme = mdppm
vertical-advection-scheme = mdppm
restart_file = ocean_temp_salt.res.nc
ppm_hlimiter=2
ppm_vlimiter=2
/
"tracer_packages","ocean_mod","ocean_age_tracer"
names = global
horizontal-advection-scheme = mdppm
vertical-advection-scheme = mdppm
restart_file = ocean_age.res.nc
min_tracer_limit=0.0
/
"prog_tracers","ocean_mod","age_global"
const_init_tracer = t
const_init_value = 0.0
/
"namelists","ocean_mod","ocean_age_tracer/global"
slat = -90.0
nlat =  90.0
wlon =   0.0
elon = 360.0
/

 "TRACER", "atmos_mod", "sphum"
           "longname",     "specific humidity"
           "units",        "kg/kg"
           "profile_type", "fixed", "surface_value=3.e-6" /
# sphum must be present on land as well
 "TRACER", "land_mod",     "sphum"
           "longname",     "specific humidity"
           "units",        "kg/kg" /

"tracer_packages","ocean_mod","ocmip2_cfc"
names = _
horizontal-advection-scheme = mdppm
vertical-advection-scheme = mdppm
min_tracer_limit=0.0
const_init_tracer=.true.
/

"rayleigh_damp_table","ocean_mod","rayleigh_damp_table"
"rayleigh","Ombai","itable=44,jtable=111,ktable_1=1,ktable_2=29,rayleigh_damp_table=5400"
"rayleigh","Lombok","itable=36,jtable=112,ktable_1=1,ktable_2=19,rayleigh_damp_table=3600"
"rayleigh","Torres","itable=62,jtable=105,ktable_1=1,ktable_2=50,rayleigh_damp_table=3600"
"rayleigh","Torres","itable=62,jtable=106,ktable_1=1,ktable_2=50,rayleigh_damp_table=3600"
"rayleigh","Torres","itable=62,jtable=107,ktable_1=1,ktable_2=50,rayleigh_damp_table=3600"
"rayleigh","Torres","itable=62,jtable=108,ktable_1=1,ktable_2=50,rayleigh_damp_table=3600"/


"tracer_packages","ocean_mod","csiro_bgc"

names = _
horizontal-advection-scheme = mdppm
vertical-advection-scheme = mdppm
restart_file  = csiro_bgc.res.nc
min_tracer_limit=-1e6
max_tracer_limit=1e6
min_range=-1e6
max_range=1e6
/

"prog_tracers","ocean_mod","adic"

horizontal-advection-scheme = mdppm
vertical-advection-scheme = mdppm
restart_file  = csiro_bgc.res.nc
longname = adic
/

"prog_tracers","ocean_mod","caco3"

horizontal-advection-scheme = mdppm
vertical-advection-scheme = mdppm
restart_file  = csiro_bgc.res.nc
longname = caco3
/

"prog_tracers","ocean_mod","alk"

horizontal-advection-scheme = mdppm
vertical-advection-scheme = mdppm
restart_file  = csiro_bgc.res.nc
longname = alk
/

"prog_tracers","ocean_mod","dic"

horizontal-advection-scheme = mdppm
vertical-advection-scheme = mdppm
restart_file  = csiro_bgc.res.nc
longname = dic
/

"prog_tracers","ocean_mod","no3"

horizontal-advection-scheme = mdppm
vertical-advection-scheme = mdppm
restart_file  = csiro_bgc.res.nc
longname = no3
/

"prog_tracers","ocean_mod","phy"

horizontal-advection-scheme = mdppm
vertical-advection-scheme = mdppm
restart_file  = csiro_bgc.res.nc
longname = phy
/

"prog_tracers","ocean_mod","o2"

horizontal-advection-scheme = mdppm
vertical-advection-scheme = mdppm
restart_file  = csiro_bgc.res.nc
longname = o2
/

"prog_tracers","ocean_mod","fe"

horizontal-advection-scheme = mdppm
vertical-advection-scheme = mdppm
restart_file  = csiro_bgc.res.nc
longname = fe
/

"prog_tracers","ocean_mod","zoo"

horizontal-advection-scheme = mdppm
vertical-advection-scheme = mdppm
restart_file  = csiro_bgc.res.nc
longname = zoo
/

"prog_tracers","ocean_mod","det"

horizontal-advection-scheme = mdppm
vertical-advection-scheme = mdppm
restart_file  = csiro_bgc.res.nc
longname = det
/

"namelists","ocean_mod","csiro_bgc/_"
/

"namelists","ocean_mod","csiro_bgc/*global*"

atmpress_file = INPUT/ocmip2_press_monthly_om1p5_bc.nc
atmpress_name = p
pistonveloc_file = INPUT/gasx.core1.access.nc
pistonveloc_name = gas_exchange
seaicefract_file = INPUT/ocmip2_fice_monthly_om1p5_bc.nc
seaicefract_name = fice
aco2_file = INPUT/co2_obs.nc
aco2_name = co2
dust_file = INPUT/dust.nc
dust_name = dust
ice_file4gasx = .false.
zero_floor = .false.

s_npp=-0.01
bio_version = 3
qbio_model = csiro
id_no3 = 1
id_phy = 2
id_o2 = 3
id_zoo = 4
id_det = 5
id_caco3 = 6
id_dic = 7
id_alk = 8
id_adic = 9
id_fe = 10
id_o2def = 11
/



