try
ncfile = 'W_fr-meteofrance,MODEL,SILAM+FORECAST+SURFACE+O3+0H24H_C_LFPW_20180701000000.nc';

lon = ncread(ncfile, 'longitude') ;
lat = ncread(ncfile, 'latitude') ;
data = ncread(ncfile, 'unknown');
catch
    ErrorMessage = 'Error loading model file or variables';
end

%the number three means that we are getting all of the values of data
%and calculating the mean for the 3rd collumn which is time
try
O3 = mean(data, 3);

X = double(lat);
Y = double(lon);
catch
    ErrorMessage = 'Error converting 3D matrix to 2D or X and Y to double.';
end

try
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

surfm(X, Y, O3(:, :), 'EdgeColor', 'none', 'FaceAlpha', 0.5)
saveas(gcf, 'SilamMean.png')
catch
    ErrorMessage = 'Error plotting data on map.';
end

