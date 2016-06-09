class Number

  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def check_error
    if self.value.class != Fixnum
      begin
        raise NumberError
      rescue NumberError => error
        error.message
      end
    else
      puts "number"
    end

  end

end

class NumberError < StandardError

  def message
    puts 'this is a fucking error'
  end

end

test1 = Number.new("5").check_error
