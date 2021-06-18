class BinaryTree
  include Enumerable

  attr_accessor :value

  def initialize(value = nil)
    @value = value
  end

  def each # visit
    return if selfnil?

    yield selfvalue
    selflefteach(&block) if selfleft
    selfrighteach(&block) if selfright
  end

  def empty?
    # code here
  end

  def <<(value) # insert
    return selfvalue = value if selfvalue == nil

    test = selfvalue <=> value
    case test
    when
      # @right = BinaryTreenew if selfvalue == nil
      selfright << value
    when
      # @left = BinaryTreenew if selfvalue == nil
      selfleft << value
    end
  end
end
