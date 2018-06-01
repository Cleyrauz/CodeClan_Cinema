require_relative("../db/sql_runner")

class Customer

attr_accessor :name, :funds
attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['fund'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
   sql = "DELETE FROM customers where id = $1"
   values = [@id]
   SqlRunner.run(sql, values)
 end

 def find_films_by_customer
   sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = $1"
   values = [@id]
   films = SqlRunner.run(sql, values)
   return films.map { |film| Film.new(film) }
 end

 #  def movies()
 #   sql = "SELECT movies.* FROM movies INNER JOIN castings ON movies.id = castings.movie_id WHERE star_id = $1"
 #   values = [@id]
 #   movie_data = SqlRunner.run(sql, values)
 #   return Movie.map_items(movie_data)
 # end

  def self.all()
    sql = "SELECT * FROM customers"
    customer = SqlRunner.run(sql)
    return Customer.map_items(customer)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
