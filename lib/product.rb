class Product
  attr_reader :title

  @@products = []

  def initialize(options={})
    @title = options[:title]
    if @@products.none? { |el| el.title == @title }
      add_to_products
    else
      raise DuplicateProductError, "'#{self.title}' already exists."
    end
  end

  def self.all
    @@products
  end

  private

  def add_to_products
    @@products << self
    #puts self.inspect
  end
end
