require 'securerandom'

class Product
  attr_accessor :name, :price, :description, :id

  def initialize(name:, price:, description:nil)
    @name = name
    @price = price
    @description = description
    @id = SecureRandom.hex(10)
  end

  def to_s
    title = "#{name}, cena #{price} zł"
    descript = "Opis: #{description}"
    if description
      [title, descr].join('')
    else
      title
    end
  end
end
