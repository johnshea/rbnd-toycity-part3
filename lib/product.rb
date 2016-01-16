class Product
  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]

    if @@products.none? { |el| el.title == @title }
      add_to_products
    else
      raise DuplicateProductError, "'#{self.title}' already exists."
    end
  end

  def in_stock?
    @stock > 0
  end

  def self.all
    @@products
  end

  def self.find_by_title(title_to_find)
    @@products.find { |el| el.title == title_to_find }
  end

  private

  def add_to_products
    @@products << self
    #puts self.inspect
  end
end
