class CartesianProduct
  include Enumerable


  def initialize(a,b)
    @cartesian =[]
    unless a.length ==0||b.length==0
      a.each do |element_of_a|
        b.each {|element_of_b| @cartesian << [element_of_a,element_of_b]}
      end
    end
  end

  def each
    @cartesian.each{|element| yield element}
  end
end

