class TechDeals::Deals

  attr_accessor :name, :fullPrice, :salePrice, :promo, :url

#Returns variables as a string
  def to_String
    output = "#{@name} | Price:#{@fullPrice} | Discounted Price:#{@salePrice} "
    if @promo != ""
      output += "| #{@promo}"
    end
    output
  end
end
