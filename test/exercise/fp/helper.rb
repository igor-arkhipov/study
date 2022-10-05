require 'csv'
# require './test/test_helper'
require 'pp'
require_relative './solution'

array = CSV.readlines('../../../test/fixtures/films.csv', headers: true)

# puts array.inspect
# puts array.class
# puts array.kind_of?(Array)
# puts array.is_a?(Enumerable)
# puts array.class.ancestors
# puts array.methods




# Посчитать средний рейтинг фильмов по версии кинопоиска у которых две или больше стран
# Фильмы у которых рейтиг не задан или равен 0 не учитывать в расчете среднего.

def rating(films)
  selected_films = films.map do |film|
    film['rating_kinopoisk'].to_f if film['country'].to_s.split(',').size >= 2 && film['rating_kinopoisk'].to_f.positive?
  end
  # binding.irb
  selected_films.compact.reduce(0, :+) / selected_films.compact.size
end

# Посчитать количесвто букв 'и' в названиях всех фильмов с рейтингом кинопоиска больше или равным заданному значению
def chars_count(films, threshold)
  selected_chars = films.map do |film|
    if film['rating_kinopoisk'].to_f >= threshold
      then film['name'].count('и')
      # else 0
    end
  end
  selected_chars.compact.reduce(0, :+)
end


# puts  'assert result1 == 6.809410385259628'
# puts '---'
# puts rating(array)

# puts 'assert result21 == 3850'
# puts 'chars_count(array, 5)'
# puts chars_count(array, 5)

# puts 'assert result == 40'
# puts 'chars_count(array, 8.5)'
# puts chars_count(array, 8.5)
