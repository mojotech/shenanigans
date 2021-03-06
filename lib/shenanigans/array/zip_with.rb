class Array

  # Zip <tt>self</tt> with <tt>other</tt>, combining the elements
  # with the provided block or symbol.
  # The resulting array will be as long as the shorter of
  # the two arrays.
  #   [1,2,3].zip_with([6,5,4], :+)
  #   #=> [7, 7, 7]
  #   %w(a b).zip_with(%w(c d), :+)
  #   #=> ["ac", "bd"]
  #
  # For more complex combinations, a block can be provided:
  #
  #   [1,2,3].zip_with([6,5,4]) { |a,b| 3*a+2*b }
  #   #=> [15, 16, 17]
  def zip_with(other, op=nil)
    return [] if self.empty? || other.empty?
    clipped = self[0..other.length-1]
    zipped = clipped.zip(other)

    if op
      zipped.map { |a, b| a.send(op, b) }
    else
      zipped.map { |a, b| yield(a, b) }
    end
  end
end
