try
ncfile = 'W_fr-meteofrance,MODEL,MOCAGE+FORECAST+SURFACE+O3+0H24H_C_LFPW_20180701000000.nc';

lon = ncread(ncfile, 'longitude');
lat = ncread(ncfile, 'latitude');
data = ncread(ncfile, 'unknown');
sumNorth = 0;
sumCentre = 0;
sumSouth = 0;

Accuracy = 0.01; % adjust this to set how close the lat/lon value must be to your required value.
catch
    ErrorMessage = 'Error loading model file or initializing variables';
end

%Extracting the index from lon where the Portugal longitudes are
for idxLon = 1:700
    try
    % find value that are greater within 'Accuracy' of the required value
    if lon(idxLon) > -8.15-Accuracy && lon(idxLon)<= -8.15+Accuracy
        idxNorthLon = idxLon;
    end
    if lon(idxLon) > -7.85-Accuracy && lon(idxLon)<= -7.85+Accuracy
        idxCentreLon = idxLon;
    end
    if lon(idxLon) > -7.85-Accuracy && lon(idxLon)<= -7.85+Accuracy
        idxSouthLon = idxLon;
    end
    catch
        ErrorMessage = ['Index lon ' idxLon ' inexistent.'];
    end
end

%Extracting the index from lat where the Portugal latitudes are
for idxLat = 1:400
    try
    if lat(idxLat) >42.15-Accuracy && lat(idxLat)<= 42.15+Accuracy
        idxNorthLat = idxLat;
    end
    if lat(idxLat) > 36.95-Accuracy && lat(idxLat)<= 36.95+Accuracy
        idxCentreLat = idxLat;
    end
    if lat(idxLat) > 39.95-Accuracy && lat(idxLat)<= 39.95+Accuracy
        idxSouthLat = idxLat;
    end
    catch
        ErrorMessage = ['Index lat ' idxLat ' inexistent.'];
    end
end

%Grabbing the O3 data per hour and summing it so we can calculate the means
for j = 1:25
    try
    fprintf("Hour: %d\n", j)
    
    northO3 = data(idxNorthLon, idxNorthLat, j);
    fprintf("North: %d\n", northO3)
    sumNorth = sumNorth + northO3;
    
    centreO3 = data(idxCentreLon, idxCentreLat, j);
    fprintf("Centre: %d\n", centreO3)
    sumCentre = sumCentre + centreO3;
    
    
    southO3 = data(idxSouthLon, idxSouthLat, j);
    fprintf("South: %d\n", southO3)
    sumSouth = sumSouth + southO3;
    
    fprintf("\n\n")
    catch
        ErrorMessage = ['Hour ' j ' error.'];
    end
end

%Calculating the mean concentration of O3 in Portugal
try
northMean = sumNorth/25;
centreMean = sumCentre/25;
southMean = sumSouth/25;

portugalO3Mocage = (northMean + centreMean + southMean)/3;
catch
    ErrorMessage = 'Error while calculating the means.';
end