#!/usr/bin/ruby
puts "Caesar Cipher Encyrption"
print "enter text to encrypt: "
plaintext = gets
ciphertext = ""
print "enter key value (1-26): "
key = gets.to_i
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
puts ciphertext
