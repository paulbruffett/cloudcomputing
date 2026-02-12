#How many events tagged Barack Obama over the years in the dataset?
SELECT year,
       COUNT(globaleventid) AS nb_events
FROM gdelt.events
WHERE UPPER(actor1name)='BARACK OBAMA'
GROUP BY year
ORDER BY year ASC;

#how does the average sentiment vary by event type?
SELECT AVG(e.avgtone) AS tone, SUM(e.nummentions) AS mentions, c.description 
FROM gdelt.eventsparquet e JOIN gdelt.eventcodes c ON e.eventcode = c.code 
GROUP BY c.description 
ORDER BY 1 DESC;

#what countries have the most destabilizing events?
SELECT AVG(e.goldsteinscale) AS stability, SUM(e.numarticles) AS articles,SUM(e.numsources) AS sources, 
SUM(e.nummentions) AS mentions, c.country
FROM gdelt.eventsparquet e JOIN gdelt.countries c ON e.actor1countrycode = c.code 
GROUP BY c.country
ORDER BY 1 ASC;

#let's take a closer look at Yemen, get its country code
SELECT code, country FROM countries WHERE country = 'Yemen';

#query Yemen's stability by year
SELECT 
    AVG(e.goldsteinscale) AS stability, 
    SUM(e.numarticles) AS articles,
    SUM(e.numsources) AS sources, 
    SUM(e.nummentions) AS mentions, 
    -- Athena/Presto method:
    CAST(CAST(e.year AS VARCHAR) || '-01-01' AS DATE) AS event_date
FROM gdelt.eventsparquet e
WHERE e.actor1countrycode = 'YEM'
GROUP BY 5  -- References the 5th column (event_date)
ORDER BY event_date ASC;