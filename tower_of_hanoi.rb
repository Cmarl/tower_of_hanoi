#towers of hanoi game
puts "||__________Towers of Hanoi___________||"
puts "||                                    ||"

amnt_disks = 0
column_a = []
column_b = []
column_c = []
count = 0

while amnt_disks <= 0 #prompt for non zero positive integer for number of disks
  puts "||    Enter Q at any time to quit.    ||"
  puts "||                                    ||"
  puts "-Enter Number of Disks: "
  amnt_disks = gets.chomp.downcase
  if amnt_disks == "q"
    abort("Quitting..")
  else
    amnt_disks = amnt_disks.to_i
  end
end

set_column = []
height = amnt_disks
best_possible = 0
best_possible = (2 ** amnt_disks) - 1

(amnt_disks).times do |disk|
  disk = ("|#{height}|" + ("#" * height) +" ")
  disk = disk + (" " * (amnt_disks - height))
  set_column << disk
  height -= 1
end

column_a = set_column

def show_board(amnt_disks, column_a, column_b, column_c) # make method for each column?
  row = (amnt_disks - 1)
  while row >= 0 # for each row from top down
    if column_a[row] != nil # print row'th row of column or print empty if no disk
      print column_a[row].ljust(15)
    else
      print ("|*|" + (" " * amnt_disks)).ljust(15)
    end

    if column_b[row] != nil
      print column_b[row] #.center
    else
      print "|*|" + (" " * amnt_disks) #.center
    end

    if column_c[row] != nil
      print column_c[row].rjust(15)
      puts " "
    else
      print ("|*|" + (" " * amnt_disks)).rjust(15)
      unless row == 0
        puts " "
      end
    end
    row -= 1 #move one row lower
  end
end

user_from = ""
user_to = ""
moving_disk = ""

until column_b == set_column || column_c == set_column # until user wins or quits, print board and prompt for next move
  puts show_board(amnt_disks, column_a, column_b, column_c)

  user_from = ""
  user_to = ""

  until user_from == "a" || user_from == "b" || user_from == "c"
    puts "Move from column A, B, or C?"
    user_from = gets.chomp.downcase
    if user_from == "q"
      abort("Quitting..")
    elsif user_from == "a"
      moving_disk = column_a.pop
    elsif user_from == "b"
      moving_disk = column_b.pop
    elsif user_from == "c"
      moving_disk = column_c.pop
    end
  end

  until user_to == "a" || user_to == "b" || user_to == "c"
    puts "Move to A, B, or C? "
    user_to = gets.chomp.downcase
    if user_to == "q"
      abort("Quitting..")
    elsif user_to == "a"
      if column_a.last == nil || (moving_disk[1].to_i) < (column_a.last[1].to_i)
        column_a << moving_disk
        count += 1
      else
        puts "Invalid move. Disks can only be placed on an empty column, or larger disk.."
        user_to = ""
      end
    elsif user_to == "b"
      if column_b.last == nil || (moving_disk[1].to_i) < (column_b.last[1].to_i)
        column_b << moving_disk
        count += 1
      else
        puts "Invalid move. Disks can only be placed on an empty column, or larger disk.."
        user_to = ""
      end
    elsif user_to == "c"
      if column_c.last == nil || (moving_disk[1].to_i) < (column_c.last[1].to_i)
        column_c << moving_disk
        count += 1
      else
        puts "Invalid move. Disks can only be placed on an empty column, or larger disk.."
        user_to = ""
      end
    end
  end
end

puts show_board(amnt_disks, column_a, column_b, column_c)
puts "_____________________________________"
puts "||      Congratulations!!!!!       ||"
puts "||          You Win!!!!            ||"
puts "||_________________________________||"
puts " ** You solved this in #{count} moves."
puts " ** Playing with #{amnt_disks} disks, #{best_possible} moves is the best possible score."
