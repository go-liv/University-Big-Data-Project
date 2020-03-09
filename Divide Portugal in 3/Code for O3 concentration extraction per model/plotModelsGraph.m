pointPortugalChimere
pointPortugalEmep
pointPortugalEnsemble
pointPortugalEurad
pointPortugalMatch
pointPortugalMocage
pointPortugalSilam

fprintf("Chimere O3 mean in Portugal: %d\n", portugalO3Chimere)
fprintf("Emep O3 mean in Portugal: %d\n", portugalO3Emep)
fprintf("Ensemble O3 mean in Portugal: %d\n", portugalO3Ensemble)
fprintf("Eurad O3 mean in Portugal: %d\n", portugalO3Eurad)
fprintf("Match O3 mean in Portugal: %d\n", portugalO3Match)
fprintf("Mocage O3 mean in Portugal: %d\n", portugalO3Mocage)
fprintf("Silam O3 mean in Portugal: %d\n", portugalO3Silam)

models = categorical({'Chimere','Emep','Ensemble','Eurad','Match','Mocage','Silam'});
modelsO3MeanValues = [portugalO3Chimere, portugalO3Emep, portugalO3Ensemble, portugalO3Eurad, portugalO3Match, portugalO3Mocage, portugalO3Silam];

bar(models, modelsO3MeanValues)
saveas(gcf, 'ModelsBarChart.png')