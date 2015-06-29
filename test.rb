
class Game
  COLORS = ["W", "O", "B", "G", "R", "Y"]
  attr_accessor :win_seq

  def get_seq
    while true do
      print "Your sequence: "
      guess = gets.chomp.upcase.split("")
      if guess.size != 4
        puts "The sequence must be 4 colors long"
      else
        inv_chars = guess - COLORS
        if !inv_chars.empty?
          if inv_chars.size > 1
            puts "#{inv_chars.join(", ")} are invalid colors"
          else
            puts "#{inv_chars.first} is an invalid color"
          end
        else
          return guess
        end
      end
    end
  end
end

the_game = Game.new

puts "Please enter the winning sequence"
the_game.win_seq = the_game.get_seq
while true do
  my_seq = the_game.get_seq
  puts "#{my_seq}"
end
