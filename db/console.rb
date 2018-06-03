require_relative('../models/ticket')
require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/screen')

require('pry-byebug')

Screen.delete_all()
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

customer3 = Customer.new({
  'name' => 'Rosa',
  'funds' => 10
  })

customer3.save()

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


  # customer1.name = "Janet"
  # customer1.update()
  #
  # film2.title = "La la land"
  # film2.update()

  screen1 = Screen.new({
    'film_id' => film1.id,
    'time_film' => "December 31, 20:15"
    })
  screen1.save()

  screen2 = Screen.new({
    'film_id' => film1.id,
    'time_film' => "December 31, 18:10"
    })
    screen2.save()

  screen3 = Screen.new({
  'film_id' => film1.id,
  'time_film' => "December 31, 14:30"
  })
  screen3.save()

  # screen4 = Screen.new({
  #   'film_id' => film2.id,
  #   'time_film' => "December 31, 11:15"
  #   })
  #   screen4.save()

    ticket1 = Ticket.new({
      'customer_id' => customer1.id,
      'film_id' => film1.id,
      'screen_id' => screen1.id
      })

   ticket1.save()

    ticket2 = Ticket.new({
      'customer_id' => customer2.id,
      'film_id' => film1.id,
      'screen_id' => screen2.id
      })

    ticket2.save()

    ticket3 = Ticket.new({
    'customer_id' => customer3.id,
    'film_id' => film1.id,
    'screen_id' => screen1.id
    })

    ticket3.save()


    ticket3.most_popular_time_by_film

  customer1.find_films_by_customer()
  film2.find_customers_by_films()

  customer2.buy_ticket(film1)

  ticket1.find_tickets_bought_by_customer()
  ticket2.number_customers_per_film()

  binding.pry

  film1.delete()
  customer1.delete()
  ticket1.delete()
