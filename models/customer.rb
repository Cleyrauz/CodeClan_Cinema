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

end
