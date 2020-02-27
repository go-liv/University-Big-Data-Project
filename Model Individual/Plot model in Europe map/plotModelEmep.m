ncfile = 'W_fr-meteofrance,MODEL,EMEP+FORECAST+SURFACE+O3+0H24H_C_LFPW_20180701000000.nc';

lon = ncread(ncfileO3, 'longitude') ;
lat = ncread(ncfileO3, 'latitude') ;
data = ncread(ncfile, 'unknown');

X = double(lat);
Y = double(lon);
whos data

worldmap('Europe');

load coastlines
plotm(coastlat, coastlon)

land = shaperead('landareas', 'UseGeoCoords', true);
geoshow(gca, land, 'FaceColor', [0.5 0.7 0.5]);

lakes = shaperead('worldlakes', 'UseGeoCoords', true);
geoshow(lakes, 'FaceColor', 'blue');

rivers = shaperead('worldrivers', 'UseGeoCoords', true);
geoshow(rivers, 'Color', 'blue');

cities = shaperead('worldcities', 'UseGeoCoords', true);
geoshow(cities, 'Marker', '.', 'Color', 'red');

surfm(X, Y, data(:,:,10), 'EdgeColor', 'none', 'FaceAlpha', 0.5)
saveas(gcf, 'EmepHour10.png')

