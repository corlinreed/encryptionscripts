#!/usr/bin/ruby
puts "Numeric Encrytpion/Decryption"
print "Encrypt (e) / decrypt (d)? "
choice = gets
if choice.chomp == "e"
        print "Enter text to encrypt: "
        plaintext = gets
        ciphertext = plaintext.chomp!.chars
        ciphertext.each do |letter|
                letter = letter.ord
                if (64..90).include? letter #check if it's a capital letter
                        letter = letter - 64
                        letter = 27 - letter
                elsif (97..122).include? letter #check if it's a lowercase letter
                        letter = letter - 97
                        letter = 27 - letter
                elsif letter == 59 #check if it's a space
                        letter = ' '
                end
                print letter.to_s + ' '
        end
        print "\n"
        exit
elsif choice.chomp == 'd'
        print "Enter text to decrypt (numbers separated by spaces): "
else
        puts "Invalid choice."
        exit
end
