require_relative("../db/sql_runner")
require_relative('customer')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values =[@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
   sql = "DELETE FROM films where id = $1"
   values = [@id]
   SqlRunner.run(sql, values)
 end

 def find_customers_by_films
   sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE film_id = $1"
   values = [@id]
   customers = SqlRunner.run(sql, values)
   return customers.map { |customer| Customer.new(customer) }
 end

 def self.all()
  sql = "SELECT * FROM films"
  movies = SqlRunner.run(sql)
  return Movie.map_items(movie_data)
end

def self.delete_all()
  sql = "DELETE FROM films"
  SqlRunner.run(sql)
end

end
