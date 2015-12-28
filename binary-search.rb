def binary_search(array, value)
  steps   = 1
  min     = 0
  max     = array.length - 1
  guesses = []

  loop do
    middle  = (max - min) / 2
    guess   = array[min + middle]
    guesses << guess

    return [true, steps, guesses] if guess == value

    if value < guess
      max = max - middle - 1
    else
      min = min + middle + 1
    end

    steps += 1

    return [false, steps, guesses] if min > max
  end
end

#######################################################

puts
puts "#######################################################"
puts
puts "Press Ctrl+C when you are done binary searching"
puts
puts "#######################################################"
puts

print "Enter values: "
vs = STDIN.gets.chomp.split(' ').map(&:to_i)

puts
puts "#######################################################"
puts
puts vs.inspect
puts
puts "#######################################################"
puts

loop do
  print "Enter value to find using binary search: "
  v = STDIN.gets.chomp.to_i

  found, steps, guesses = binary_search(vs, v)

  outcome = (found ? "found" : "not found")
  plural  = (steps == 1 ? "step" : "steps")
  puts "Value #{v} was #{outcome} in #{steps} #{plural} (guesses were #{guesses.join(', ')})"
  puts
  puts "#######################################################"
  puts
end

