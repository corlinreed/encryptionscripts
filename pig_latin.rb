puts 'Pig Latinator!'
print 'Enter text: '
given_string = gets

#make sure there are only lowercase letters in the string
given_string.downcase!
given_string.strip!

#split the string into an array of words
words = given_string.split(/ /)

#define sets of vowels and consonants
$vowels = ['a','e','i','o','u']
$consonants = ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z']

def pig_latinate word
  #split the string into groups of consonants and vowels
  split_string = []
  word.each_char do |letter|
    if $consonants.include? split_string.last.to_s.split(//).last and $consonants.include? letter
      cluster = split_string.pop
      split_string.push cluster + letter
    elsif $vowels.include? split_string.last.to_s.split(//).last and $vowels.include? letter
      cluster = split_string.pop
      split_string.push cluster + letter
    else
      split_string.push letter
    end
  end

  #join the groups into a pig latinated word
  if $consonants.include? split_string[0].split(//).first
    consonant_cluster = split_string.shift
    split_string.push consonant_cluster
  end

  joined_string = ""
  split_string.each { |cluster| joined_string = joined_string + cluster }
  return joined_string + 'ay'
    
end

words = words.map {|word| pig_latinate(word)}
final_result = ""
words.each {|word| final_result = final_result + word + " "}
puts final_result
