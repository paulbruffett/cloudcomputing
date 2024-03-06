SELECT AVG(e.goldsteinscale) AS stability, SUM(e.numarticles) AS articles,SUM(e.numsources) AS sources, 
SUM(e.nummentions) AS mentions, e.year
FROM gdelt.parquetevents e
WHERE e.actor1countrycode = 'YEM'
GROUP BY e.year
ORDER BY e.year ASC

#http://data.gdeltproject.org/documentation/GDELT-Data_Format_Codebook.pdf