# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
  SELECT
    name
  FROM
    countries
  WHERE
    gdp IS NOT NULL AND gdp >
  (SELECT
    MAX(gdp)
  FROM
    countries
  WHERE
    continent = 'Europe'
  )
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
  SELECT
    continents.continent, countries.name, countries.area
  FROM
    (SELECT
      continent, MAX(area) AS max_area
    FROM
      countries
    GROUP BY
      continent) AS continents
  JOIN countries ON continents.continent = countries.continent
  WHERE
      continents.continent = countries.continent AND continents.max_area = countries.area
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
    SELECT
    continents.continent, countries.name, countries.area
  FROM
    (SELECT
      continent, MAX(area) AS max_area
    FROM
      countries
    GROUP BY
      continent) AS continents
  JOIN countries ON continents.continent = countries.continent
  WHERE
      continents.continent = countries.continent AND continents.max_area = countries.area
    FROM
  SQL
end
