#!/usr/bin/ruby
print "enter text to encrypt: "
plaintext = gets
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

puts ciphertext
