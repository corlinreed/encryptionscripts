#!/usr/bin/ruby

class Character
  #attr_accessor :letter, :number
  
  def initialize(letter)
    @letter = letter
    @number = self.number
  end

  def number
    if (65..90).include? @letter.ord #check if it's a capital letter
      @number = @letter.ord - 64
    elsif (97..122).include? @letter.ord #check if it's a lowercase letter
      @number = @letter.ord - 96
    end
  end

  def letter
    if (1..26).include? @number
      @letter = (@number + 96).chr
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
  encrypted_characters.push character.shift((key_characters[counter % key_characters.length].number)-1)
  counter += 1
end

puts "Ciphertext:"
encrypted_characters.each {|x| print x}
puts
