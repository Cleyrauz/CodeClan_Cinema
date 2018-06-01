class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price']
  end 

end
