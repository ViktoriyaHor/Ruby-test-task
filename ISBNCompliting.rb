# frozen_string_literal: true

# to calculate the check digit of an ISBN13 barcode
class ISBNCompliting
  attr_accessor :isbn

  def initialize(isbn)
    @isbn = isbn
  end

  def to_array
    @isbn.to_s.scan(/\d/).map(&:to_i)
  end

  def mod10sum
    (to_array.select.each_with_index { |_, i| i.even? }.map{|i| i*1}+to_array.select.each_with_index { |_, i| i.odd? }.map{|i| i*3}).inject(&:+)%10
  end

  def complete
    mod10sum == 10 ? mod10sum.push(0).join.to_i : to_array.push(10-mod10sum).join.to_i
  end
end



