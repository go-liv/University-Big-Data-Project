try
pointPortugalChimere
pointPortugalEmep
pointPortugalEnsemble
pointPortugalEurad
pointPortugalMatch
pointPortugalMocage
pointPortugalSilam
catch
    ErrorMessage = 'Error while opening a model code file.';
end

fprintf("Chimere O3 mean in Portugal: %d\n", portugalO3Chimere)
fprintf("Emep O3 mean in Portugal: %d\n", portugalO3Emep)
fprintf("Ensemble O3 mean in Portugal: %d\n", portugalO3Ensemble)
fprintf("Eurad O3 mean in Portugal: %d\n", portugalO3Eurad)
fprintf("Match O3 mean in Portugal: %d\n", portugalO3Match)
fprintf("Mocage O3 mean in Portugal: %d\n", portugalO3Mocage)
fprintf("Silam O3 mean in Portugal: %d\n", portugalO3Silam)

try
models = categorical({'Chimere','Emep','Ensemble','Eurad','Match','Mocage','Silam'});
modelsO3MeanValues = [portugalO3Chimere, portugalO3Emep, portugalO3Ensemble, portugalO3Eurad, portugalO3Match, portugalO3Mocage, portugalO3Silam];
catch
    ErrorMessage = 'Error while extracting mean values from model code files.';
end

try
bar(models, modelsO3MeanValues, 'FaceColor', 'green')
title('Portugal mean O3 concentration per model')
saveas(gcf, 'ModelsBarChart.png')
catch
    ErrorMessage = 'Error while creating bar plot for the mean concentration per model.';
end