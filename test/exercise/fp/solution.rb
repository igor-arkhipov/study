module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]

      # Посчитать средний рейтинг фильмов по версии кинопоиска у которых две или больше стран
      # Фильмы у которых рейтиг не задан или равен 0 не учитывать в расчете среднего.
      def rating(films)
        selected_films = films.map do |film|
          film['rating_kinopoisk'].to_f if film['country'].to_s.split(',').size >= 2 && film['rating_kinopoisk'].to_f.positive?
        end

        selected_films.compact.reduce(0, :+) / selected_films.compact.size
      end



      # Посчитать количесвто букв 'и' в названиях всех фильмов с рейтингом кинопоиска больше или равным заданному значению
      def chars_count(films, threshold)
        selected_chars = films.map do |film|
         film['rating_kinopoisk'].to_f >= threshold ? film['name'].count('и') : 0 
        end
        selected_chars.compact.reduce(0, :+)
      end

    end
  end
end