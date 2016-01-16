class Transaction
  attr_reader :id, :customer, :product

  @@id = 1
  @@transactions = []

  def initialize(customer, product)
    @id = @@id
    @@id += 1

    @customer = customer
    @product = product
    product.decrement_stock_by(1)

    @@transactions << self
  end

  def self.all
    @@transactions
  end
end
