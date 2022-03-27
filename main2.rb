def add(input = nil)
    #return 0 if input.nil?

    #return input.to_i if (input.class.eql? String and input.split(',').size.eql? 1)

    # if (input.class.eql? String and input.split(',').size.positive?)
    #     return input.split(',').map { |pos| pos.to_i }.sum
    # end if (input.include? "\n")

    # return  input.split(/[<=>"\s]+/)
    #              .map { |pos| pos.split(';') }
    #              .flatten.map { |pos| pos.to_i }
    #              .sum

    return input.split(/[<=>"\s]+/)
                .map { |pos| pos.split(';') }
                .flatten.map { |pos| pos.split(',') }
                .flatten.map { |pos| pos.to_i }.sum
end

p add("//;\n1;2,1")