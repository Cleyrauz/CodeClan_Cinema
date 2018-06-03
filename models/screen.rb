require_relative("../db/sql_runner")
require_relative('film')
require_relative('ticket')

class Screen

  attr_accessor :film_id, :time_film
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @film_id = options['film_id']
    @time_film =  options['time_film']
  end

  def save()
    sql = "INSERT INTO screenings (film_id, time_film) VALUES ($1, $2) RETURNING id"
    values = [@film_id, @time_film]
    screen = SqlRunner.run(sql, values).first
    @id = screen['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

end
