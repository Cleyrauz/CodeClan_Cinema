require_relative('../models/ticket')
require_relative('../models/customer')
require_relative('../models/film')

require('pry-byebug')

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

  binding.pry
  nil 
