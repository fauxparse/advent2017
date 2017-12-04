def valid?(passphrase)
  words = passphrase.strip.split(/\s+/)
  words.uniq.size == words.size
end

def valid2?(passphrase)
  words = passphrase.strip.split(/\s+/)
  words.map { |w| w.chars.sort }.uniq.size == words.size
end

passphrases = STDIN.readlines.map(&:chomp).reject(&:empty?)
puts passphrases.count { |s| valid?(s) }
puts passphrases.count { |s| valid2?(s) }
