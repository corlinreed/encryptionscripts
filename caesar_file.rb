#!/usr/bin/ruby

source = File::open(ARGV[0])
dest = File::open(ARGV[1],"w")
key = ARGV[2].to_i

plaintext = source.read
ciphertext = ""

unless (1..26).include? key
	puts "Invalid key."
	exit
end

plaintext.each_char do |letter|
    letter = letter.ord
    if (64..90).include? letter #check if it's a capital letter
        letter = letter + key
        if letter > 90
            letter = letter - 26
        end
    elsif (97..122).include? letter #check if it's a lowercase letter
        letter = letter + key
        if letter > 122
            letter = letter - 26
        end
    end
    ciphertext = ciphertext + letter.chr
end

dest.write(ciphertext)

puts "Caesar Cipher Encyrption"
puts "Source file #{source.path}\n\n"
puts plaintext + "\n\n"
puts "Destination file #{dest.path}\n\n"
puts ciphertext

