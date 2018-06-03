require_relative("../db/sql_runner")

require_relative ('customer')
require_relative ('film')
require_relative ('screen')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id, :screen_id

  def initialize( options )
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    @screen_id = options['screen_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id, screen_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@customer_id, @film_id, @screen_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id, screen_id) = ($1, $2, $3) WHERE id = $4"
    values = [@customer_id, @film_id, @screen_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tickets where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def find_tickets_bought_by_customer
    sql = "SELECT * FROM tickets WHERE customer_id = $1"
    values = [@customer_id]
    tickets = SqlRunner.run(sql, values)
    return tickets.map { |ticket| Ticket.new(ticket) }.length
  end

  def number_customers_per_film
  sql = "SELECT * FROM tickets WHERE film_id = $1"
  values = [@film_id]
  customers = SqlRunner.run(sql, values)
  return customers.map { |customer| Customer.new(customer) }.length
  end

  def most_popular_time_by_film
    # SELECT  SCREEN_ID  FROM TICKETS WHERE FILM_ID = 27 GROUP BY FILM_ID, SCREEN_ID LIMIT 1;
    sql = "SELECT * FROM screenings WHERE id = (SELECT  SCREEN_ID  FROM
                TICKETS WHERE FILM_ID = $1 GROUP BY FILM_ID, SCREEN_ID LIMIT 1)"
    values = [@film_id]
    popular_time = SqlRunner.run(sql, values)
    return popular_time.map { |screen| Screen.new(screen)}
  end

  def self.all()
    sql = "SELECT * FROM tickets"
  ticket = SqlRunner.run(sql)
    return Ticket.map_items(ticket)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end
