def caesar_cipher(phrase, shift_factor)
  arr = phrase.split("")
  count = 0
  arr.each do |letter|
    if letter == letter[/[a-zA-Z]+/]
      shift_calc = letter.ord + shift_factor
      if (letter.ord > 96 && letter.ord < 123 && shift_calc > 122) ||  (letter.ord > 64 && letter.ord < 91 && shift_calc > 90)
        letter = (shift_calc-26).chr
      else
        letter = shift_calc.chr
      end
    end
    arr[count] = letter
    count += 1
  end
  arr.join
end

#puts caesar_cipher("What a string!", 5)

describe "#caesar_cipher" do
  context "When testing the ceasar_cipher method" do
    it "the method should return 'Bmfy f xywnsl!'" do
      message = caesar_cipher("What a string!", 5)
      expect(message).to eql "Bmfy f xywnsl!"
    end

    it "the method should return 'Aaa'" do
      message = caesar_cipher("Zzz", 1)
      expect(message).to eql "Aaa"
    end
  end

  context "when the factor is zero" do
    it "returns the same input" do
      expect(caesar_cipher("What a string!", 0)).to eql("What a string!")
    end
  end
end
