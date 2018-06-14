require 'json'

class MenuGenerator
    def initialize
        ask_options
    end

    def ask_options
        print 'How sophisticated would you like your meal (how many indregients are you prepared to use)? '
        complexity = check_input_num gets.chomp
        if complexity
            puts "Why not try #{generate_dish(complexity).join(' ')}?"
        end
    end

    def check_input_num input
        input = input.to_i
        if input == 0 then
            puts "Please enter a number greater than 0"
            return ask_options
        end
        input
    end

    def generate_dish complexity
        json = File.read './foods.json'
        foods = JSON.parse json
        if complexity > foods.size
            complexity = foods.size
        end
        foods.shuffle.pop complexity 
    end
end

MenuGenerator.new
