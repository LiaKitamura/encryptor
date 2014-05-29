class Encryptor
  def cipher
    { 'A' =>'N', 'B' => 'O', 'C' => 'P', 'D' => 'Q', 'E' =>'R', 'F' => 'S',
      'G' =>'T', 'H' => 'U', 'I' => 'V', 'J' => 'W', 'K' => 'X', 'L' => 'Y',
      'M' =>'Z', 'N' => 'A', 'O' =>'B', 'P' => 'C', 'Q' => 'D', 'R' => 'E',
      'S' => 'F', 'T' => 'G', 'U' => 'H', 'V' => 'I', 'W' => 'J', 'X' => 'K',
      'Y' => 'L', 'Z '=> 'M' }
  end

  def encrypt(character)   #<--- encrypt needs an argument which is used below
    cipher[character.upcase]
  end

    def encrypt_word(string)
      results = []                      #making an empty array for encrypted letters to go into
      letters = string.split("")    #taking string input and splitting into letters array
        letters.each do |letter|   #each item in letters array and putting it down the letter shoot
          encrypt(letter)             #calling method encrypt with argument using letters array
          results << encrypt(letter)    #now the encrypted letter is being shoveled into the results array
      end
      results.join
    end

      def encrypt_file(filename)  #arguement that gets passed into the File.open
        input = File.open(filename, "r" )    #opens the file and saves the file to input
          contents = input.read    #takes input and reads it and puts that into contents
          encrypted_contents = encrypt_word(contents)  #taking contents, calling encrypt_word with argument of contents variable
          input.close                      #make sure to close the file
                                                #now we can use this method with a file!

          output = File.open(filename + ".encrypted", "w") #when file is encrypted it will be message.encrypted
          output.write(encrypted_contents)
          output.close
      end
      #puts results.join        # joing the results back into words from single letters
end

=begin
  e = Encryptor.new
  e.encrypt_word("hello")
=end


#running in irb
  #require_relative 'encryptor'
    #e = Encryptor.new
    #e.encrypt_word('hello')



    #to make call :
    #whatever.Encryptor.new
    #whatever.cipher['A']
