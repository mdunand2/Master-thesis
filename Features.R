## Code to prepare the 12 features

# Load the raster library to load .tif files
library(raster)

# Load the raster layers
landcover<-as.factor(raster("C:/Users/Olivier/Desktop/Clip_TIFF_2/Landcover/Landcover/Landcover.tif"))
geology<-as.factor(raster("C:/Users/Olivier/Desktop/Clip_TIFF_2/Geology/Geology/Geology_class.tif"))
planCurv<-raster("C:/Users/Olivier/Desktop/Clip_TIFF_2/curv_plan_extract.tif")/100 # this because ArcGIS multiply 
profCurv<-raster("C:/Users/Olivier/Desktop/Clip_TIFF_2/curv_prof_extract.tif")/100 # ....curvature values by 100
TWI<-raster("C:/Users/Olivier/Desktop/Clip_TIFF_2/TWI_extract.tif")
Slope<-raster("C:/Users/Olivier/Desktop/Clip_TIFF_2/Slope_extract.tif")
dem<-raster("C:/Users/Olivier/Desktop/Clip_TIFF_2/DEM_extract.tif")
flow_acc <- raster("C:/Users/Olivier/Desktop/Clip_TIFF_2/FlowAcc_extract.tif")
flow_dir <- raster("C:/Users/Olivier/Desktop/Clip_TIFF_2/FlowDir_extract.tif")
dist_routes <- raster("C:/Users/Olivier/Desktop/Clip_TIFF_2/Dist_Routes_extract.tif")
dist_autoroutes <- raster("C:/Users/Olivier/Desktop/Clip_TIFF_2/Dist_Autoroutes_extract.tif")
dist_fussweg <- raster("C:/Users/Olivier/Desktop/Clip_TIFF_2/Dist_Fussweg_extract.tif")

# Load the shapefile of Swiss borders
swiss <- st_read("C:/Users/Olivier/Desktop/Clip_TIFF_2/swiss_ExportFeatures2.shp")

#The problem is that when the raster file is exported to ArcGIS Pro as a TIF file, a mask (rectangular) is created around Switzerland. That is why it was decided to create a mask from the .shp file of the Swiss borders for the layers of the 12 variables (features).

# Mask over dem

shapefile_suisse <- st_zm(swiss, drop = TRUE, what = "ZM")

# Transform the shapefile into the same projection as the raster
swiss_shp <- st_transform(shapefile_suisse, crs(dem))

# Cut the raster according to the shapefile footprint
dem_cropped <- crop(dem, swiss_shp)

# Apply the mask to remove areas outside the shapefile
dem_masked <- mask(dem_cropped, swiss_shp)

writeRaster(dem_masked, "DEM.tif", format = "GTiff", overwrite = TRUE)

# Mask over Landcover

shapefile_suisse <- st_zm(swiss, drop = TRUE, what = "ZM")

# Transform the shapefile into the same projection as the raster
swiss_shp <- st_transform(shapefile_suisse, crs(dem))

# Cut the raster according to the shapefile footprint
landcover_cropped <- crop(landcover, swiss_shp)

# Apply the mask to remove areas outside the shapefile
landcover_masked <- mask(landcover_cropped, swiss_shp)

writeRaster(landcover_masked, "Landcover.tif", format = "GTiff", overwrite = TRUE)

# Mask over Geology
shapefile_suisse <- st_zm(swiss, drop = TRUE, what = "ZM")

# Transform the shapefile into the same projection as the raster
swiss_shp <- st_transform(shapefile_suisse, crs(dem))

# Cut the raster according to the shapefile footprint
geology_cropped <- crop(geology, swiss_shp)

# Apply the mask to remove areas outside the shapefile
geology_masked <- mask(geology_cropped, swiss_shp)

writeRaster(geology_masked, "Geology.tif", format = "GTiff", overwrite = TRUE)

# Mask over planCurv
shapefile_suisse <- st_zm(swiss, drop = TRUE, what = "ZM")

# Transform the shapefile into the same projection as the raster
swiss_shp <- st_transform(shapefile_suisse, crs(dem))

# Cut the raster according to the shapefile footprint
plancurv_cropped <- crop(planCurv, swiss_shp)

# Apply the mask to remove areas outside the shapefile
plancurv_masked <- mask(plancurv_cropped, swiss_shp)

writeRaster(plancurv_masked, "plancurv.tif", format = "GTiff", overwrite = TRUE)

# Mask over profCurv
shapefile_suisse <- st_zm(swiss, drop = TRUE, what = "ZM")

# Transform the shapefile into the same projection as the raster
swiss_shp <- st_transform(shapefile_suisse, crs(dem))

# Cut the raster according to the shapefile footprint
profcurv_cropped <- crop(profCurv, swiss_shp)

# Apply the mask to remove areas outside the shapefile
profcurv_masked <- mask(profcurv_cropped, swiss_shp)

writeRaster(profcurv_masked, "profcurv.tif", format = "GTiff", overwrite = TRUE)

# Mask over TWI
shapefile_suisse <- st_zm(swiss, drop = TRUE, what = "ZM")

# Transform the shapefile into the same projection as the raster
swiss_shp <- st_transform(shapefile_suisse, crs(dem))

# Cut the raster according to the shapefile footprint
twi_cropped <- crop(TWI, swiss_shp)

# Apply the mask to remove areas outside the shapefile
twi_masked <- mask(twi_cropped, swiss_shp)

writeRaster(profcurv_masked, "TWI.tif", format = "GTiff", overwrite = TRUE)

# Mask over slope
shapefile_suisse <- st_zm(swiss, drop = TRUE, what = "ZM")

# Transform the shapefile into the same projection as the raster
swiss_shp <- st_transform(shapefile_suisse, crs(dem))

# Cut the raster according to the shapefile footprint
slope_cropped <- crop(Slope, swiss_shp)

# Apply the mask to remove areas outside the shapefile
slope_masked <- mask(slope_cropped, swiss_shp)

writeRaster(slope_masked, "Slope.tif", format = "GTiff", overwrite = TRUE)

# Mask over FlowAcc
shapefile_suisse <- st_zm(swiss, drop = TRUE, what = "ZM")

# Transform the shapefile into the same projection as the raster
swiss_shp <- st_transform(shapefile_suisse, crs(dem))

# Cut the raster according to the shapefile footprint
flowacc_cropped <- crop(flow_acc, swiss_shp)

# Apply the mask to remove areas outside the shapefile
flowacc_masked <- mask(flowacc_cropped, swiss_shp)

writeRaster(flowacc_masked, "Flow_acc.tif", format = "GTiff", overwrite = TRUE)


# Mask over FlowDir
shapefile_suisse <- st_zm(swiss, drop = TRUE, what = "ZM")

# Transform the shapefile into the same projection as the raster
swiss_shp <- st_transform(shapefile_suisse, crs(dem))

# Cut the raster according to the shapefile footprint
flowdir_cropped <- crop(flow_dir, swiss_shp)

# Apply the mask to remove areas outside the shapefile
flowdir_masked <- mask(flowdir_cropped, swiss_shp)

writeRaster(flowdir_masked, "Flow_dir.tif", format = "GTiff", overwrite = TRUE)


# Mask over DistRoutes
shapefile_suisse <- st_zm(swiss, drop = TRUE, what = "ZM")

# Transform the shapefile into the same projection as the raster
swiss_shp <- st_transform(shapefile_suisse, crs(dem))

# Cut the raster according to the shapefile footprint
dist_routes_cropped <- crop(dist_routes, swiss_shp)

# Apply the mask to remove areas outside the shapefile
dist_routes_masked <- mask(dist_routes_cropped, swiss_shp)

writeRaster(dist_routes_masked, "Dist_Routes.tif", format = "GTiff", overwrite = TRUE)

# Mask ocer Dist_autoroutes
shapefile_suisse <- st_zm(swiss, drop = TRUE, what = "ZM")

# Transform the shapefile into the same projection as the raster
swiss_shp <- st_transform(shapefile_suisse, crs(dem))

# Cut the raster according to the shapefile footprint
dist_autoroutes_cropped <- crop(dist_autoroutes, swiss_shp)

# Apply the mask to remove areas outside the shapefile
dist_autoroutes_masked <- mask(dist_autoroutes_cropped, swiss_shp)

writeRaster(dist_autoroutes_masked, "Dist_Autoroutes.tif", format = "GTiff", overwrite = TRUE)


# Mask over Fussweg
shapefile_suisse <- st_zm(swiss, drop = TRUE, what = "ZM")

# Transform the shapefile into the same projection as the raster
swiss_shp <- st_transform(shapefile_suisse, crs(dem))

# Cut the raster according to the shapefile footprint
dist_fussweg_cropped <- crop(dist_fussweg, swiss_shp)

# Apply the mask to remove areas outside the shapefile
dist_fussweg_masked <- mask(dist_fussweg_cropped, swiss_shp)

writeRaster(dist_fussweg_masked, "Dist_Fussweg.tif", format = "GTiff", overwrite = TRUE)