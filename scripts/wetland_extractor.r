library(here)
library(tidyr)
library(arcgisbinding)

arc.check_product()

wetland_modeled <- "T:/HabitatMapUpdate/HabitatMap_OtherLandcover.gdb/ModeledWetlands_2013_Pennsylvania"
wetland_restorable <- "T:/HabitatMapUpdate/HabitatMap_OtherLandcover.gdb/ModeledRestorableWetlands_2013_Pennsylvania"

serverPath <- paste("C:/Users/",Sys.getenv("USERNAME"),"/AppData/Roaming/ESRI/ArcGISPro/Favorites/StateLayers.Default.pgh-gis0.sde/",sep="")


wetland_modeled <- arc.open(wetland_modeled)
wetland_modeled <- arc.select(wetland_modeled)
wetland_modeled_sf <- arc.data2sf(wetland_modeled)

wetland_restorable <- arc.open(wetland_restorable)
wetland_restorable <- arc.select(wetland_restorable)
wetland_restorable_sf <- arc.data2sf(wetland_restorable)


Protect_State <- arc.open(paste(serverPath,"StateLayers.DBO.PALTA_State", sep=""))
Protect_State <- arc.select(Protect_State)
Protect_State <- arc.data2sf(Protect_State)

ProtectWetland_State <- st_intersection(wetland_modeled_sf, Protect_State)



StateLayers.DBO.PALTA_Federal
