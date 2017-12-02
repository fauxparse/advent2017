rows = STDIN.readlines.map do |row|
  row.strip.split.map(&:to_i)
end

def divisible(row)
  pair = row.combination(2).to_a.detect { |a, b| a % b == 0 || b % a == 0 }
  pair.max / pair.min
end

puts rows.map { |row| row.max - row.min }.sum
puts rows.map { |row| divisible(row) }.sum
