class Customer
  attr_reader :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]

    if @@customers.none? { |el| el.name == @name }
      add_to_customers
    else
      raise DuplicateCustomerError, "'#{@name}' already exists."
    end
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name_to_find)
    @@customers.find { |el| el.name == name_to_find}
  end

  def purchase(product)
    if product.in_stock?
      Transaction.new(self, product)
    else
      raise OutOfStockError, "'#{product.title}' is out of stock."
    end
  end

  private

  def add_to_customers
    @@customers << self
  end
end
