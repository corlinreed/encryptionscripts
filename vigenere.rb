#!/usr/bin/ruby

class Character

  def initialize(letter)
    @letter = letter
    @number = self.number
  end

  def number
    if (65..90).include? @letter.ord #check if it's a capital letter
      @number = @letter.ord - 64
    elsif (97..122).include? @letter.ord #check if it's a lowercase letter
      @number = @letter.ord - 96
    elsif 32 == @letter.ord #check if it's a space
      @number = -1
    end
  end

  def letter
    if (1..26).include? @number
        @letter = (@number + 96).chr
    elsif 0 == @number 
        @letter = "z"
    elsif -1 == @number
      @letter = " "
    end
  end

  def shift(amount)
    @number = (@number + amount) % 26
    @letter = self.letter
  end
end

puts "Vigenere Cipher Encryption"
print "Enter key: "
key = gets.strip
print "Enter message: "
plaintext = gets.strip

ciphertext = ""
characters = []
key_characters = []
encrypted_characters = []

plaintext.each_char {|letter| characters.push Character.new(letter)} 
key.each_char {|letter| key_characters.push Character.new(letter)}

characters = characters.select {|x| x.number != nil}
key_characters = key_characters.select {|x| x.number != nil}

puts "Plaintext:"
characters.each {|x| print x.letter}
puts
puts "Key:"
key_characters.each {|x| print x.letter}
puts

counter = 0
characters.each do |character|
  if (1..26).include? character.number
    encrypted_characters.push character.shift((key_characters[counter % key_characters.length].number)-1)
    counter += 1
  elsif 0 == character.number
    encrypted_characters.push " "
  end
end

puts "Ciphertext:"
encrypted_characters.each {|x| print x}
puts
