#!/usr/bin/ruby

source = File::open(ARGV[0])
dest = File::open(ARGV[1],"w")

plaintext = source.read
char_array = plaintext.chars
ciphertext = ""
	char_array.each do |letter|
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
	ciphertext += " #{letter} "
end	
dest.write(ciphertext)

puts "Numeric Encryption/Decryption"
puts "Source file #{source.path}\n\n"
puts plaintext + "\n\n"
puts "Destination file #{dest.path}\n\n"
puts ciphertext
