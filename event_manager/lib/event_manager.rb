require 'csv'

class EventManager
  def parse(file_name)
    read_file_contents(file_name)
  end

  def clean_phone_number(dirty)
    PhoneNumber.new(dirty).clean!
  end
  
  class PhoneNumber
    def initialize(number)
      @number = number
    end
    
    def clean!
      parsed_number = @number.to_s.gsub /\D/, ''

      if valid_dialer_number?(parsed_number)
        parsed_number
      elsif long_distance_number?(parsed_number)
        parsed_number[1..-1]
      else
        self.class.unknown_number
        PhoneNumber.unknown_number
      end
    end
    
    def valid_dialer_number?(number)
      number.length == 10
    end
  
    def long_distance_number?(number)
      number.length == 11 && number[0] == "1"
    end

    def self.unknown_number
      "0000000000"
    end
    
  end

  def read_file_contents(file_name)
    CSV.read(file_name)
  end
end