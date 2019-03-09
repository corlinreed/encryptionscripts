#!/usr/bin/ruby

source = File::open(ARGV[0])
dest = File::open(ARGV[1],"w")

plaintext = source.read
ciphertext = ""
plaintext.each_char do |letter|
    letter = letter.ord
    if (64..90).include? letter #check if it's a capital letter
        letter = letter + 13
        if letter > 90
            letter = letter - 26
        end
    elsif (97..122).include? letter #check if it's a lowercase letter
        letter = letter + 13
        if letter > 122
            letter = letter - 26
        end
    end
    ciphertext = ciphertext + letter.chr
end

dest.write(ciphertext)

puts "Source file #{source.path}\n\n"
puts plaintext + "\n\n"
puts "Destination file #{dest.path}\n\n"
puts ciphertext
