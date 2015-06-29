
class Game
  attr_accessor :win_seq

  def init(win_seq = "WWWW")
    @win_seq = win_seq
  end

  def get_seq
    colors = ["W", "O", "B", "G", "R", "Y"]
    def each_element(a, b) #a is big set, b is subset
      ret_array = []
      b.each do |letter|
        if !a.include?(letter)
          ret_array.push(letter)
        end
      end
      return ret_array
    end

    while true do
      print "Your sequence: "
      guess = gets.chomp.upcase
      if guess.size != 4
        puts "The sequence must be 4 colors long"
      else
        inv_chars = each_element(colors, guess.split(""))
        if inv_chars.size > 0
          inv_chars.each do |l|
            print "#{l}  "
          end
          puts "is an/are invalid color(s)"
        else
          return guess
        end
      end
    end
  end
end

the_game = Game.new
while true do
  my_seq = the_game.get_seq
  puts "#{my_seq}"
end
