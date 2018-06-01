require_relative('../models/ticket')
require_relative('../models/customer')
require_relative('../models/film')

require('pry-byebug')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({
  'name' => 'Cleyra',
  'funds' => 150
})

customer1.save()

customer2 = Customer.new({
  'name' => 'Jose',
  'funds' => 50
  })

customer2.save()

film1 = Film.new({
  'title' => 'Pulp Ficton',
  'price' => 10
  })

film1.save()

film2 = Film.new({
 'title' => 'Inception',
 'price' => 5
  })

film2.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

  ticket1.save()

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id
  })

  ticket2.save()


  customer1.name = "Janet"
  customer1.update()

  film2.title = "La la land"
  film2.update()

  customer1.find_films_by_customer()
  film2.find_customers_by_films()

  customer2.buy_ticket(film1)

  ticket1.find_tickets_bought_by_customer()
  ticket2.number_customers_per_film()

  binding.pry

  film1.delete()
  customer1.delete()
  ticket1.delete()
