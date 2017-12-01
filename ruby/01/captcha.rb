def captcha(d, n = 1)
  d.zip(d[n..-1] + d[0...n]).map { |a, b| a == b ? a : 0 }.inject(&:+)
end

digits = gets.chomp.split(//).map(&:to_i)

puts captcha(digits)
puts captcha(digits, digits.size / 2)
