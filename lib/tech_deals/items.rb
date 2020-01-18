class TechDeals::Items

  attr_accessor :name, :fullPrice, :salePrice, :promo, :url

#Returns variables as a string
  def toString
    output = "#{@name} | Price:#{@fullPrice} | Discounted Price:#{@salePrice} "
    if @promo != ""
      output += "#{@promo}"
    end
    output
  end
end
