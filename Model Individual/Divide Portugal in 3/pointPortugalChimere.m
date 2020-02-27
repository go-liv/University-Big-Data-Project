ncfile = 'W_fr-meteofrance,MODEL,CHIMERE+FORECAST+SURFACE+O3+0H24H_C_LFPW_20180701000000.nc';

lon = ncread(ncfile, 'longitude');
lat = ncread(ncfile, 'latitude');
data = ncread(ncfile, 'unknown');

northLon = find(lon == -8.1500);
northLat = find(lat == 42.1500);

southLon = find(lon == -7.8500);
southLat = find(lat == 36.9500);

centreLon = find(lon == -7.8500);
centreLat = find(lat == 39.9500);

for i = 1:25
    fprintf("Hour: %d\n", i)
    
    northPT = data(279, 169, i);
    fprintf("North: %d\n", northPT)
    
    centrePT = data(301, 172, i);
    fprintf("Centre: %d\n", centrePT)    
    
    southPT = data(331, 172, i);
    fprintf("South: %d\n", southPT)
    
    print("\n\n")
end
