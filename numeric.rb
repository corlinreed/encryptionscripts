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
                        letter = 26 - letter
                elsif (97..122).include? letter #check if it's a lowercase letter
                        letter = letter - 97
                        letter = 26 - letter
                elsif letter == 59 #check if it's a space
                        letter = ' '
                end
                print letter.to_s + ' '
        end
        print "\n"
        exit
elsif choice.chomp == 'd'
        print "Enter text to decrypt (numbers separated by spaces): "
        ciphertext = gets
        number_array = ciphertext.split(/ /).map {|x| x.to_i}
        letter_array = []
        number_array.each do |number|
          if (1..26).include? number #check it's a number within the range of the output of the encryption part of the script
            letter_array.push (91 - number).chr
          end
        end
        plaintext = ""
        letter_array.each do |letter|
          plaintext += letter
        end
        puts plaintext
else
        puts "Invalid choice."
        exit
end
