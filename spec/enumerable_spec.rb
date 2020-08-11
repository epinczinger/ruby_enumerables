require_relative('../enumerable')

describe ::Enumerable do
  describe "#my_each" do
    it "Loops An Enumerable" do
      array = []
      %w[a b c].my_each { |item| array << item }
      expect(array).to(eq(%w[a b c]))
    end

    it "Loops An Range" do
      array = []
      (1...4).my_each { |item| array << item }
      expect(array).to(eq([1, 2, 3]))
    end

    it "Loops An Hash" do
      array = []
      { "Jane Doe" => 10, "Jim Doe" => 6 }.my_each { |item| array << item[0] }
      expect(array).to(eq(["Jane Doe", "Jim Doe"]))
    end
  end

  describe "#my_each_with_index" do
    it "Loops An Hash With Index" do
      hash = {}
      [9, 8, 7, 6, 5, 4, 3, 2, 1].my_each_with_index do |item, index|
        hash[index] = item
      end

      expect(hash).to(eq({ 0 => 9, 1 => 8, 2 => 7, 3 => 6, 4 => 5, 5 => 4, 6 => 3, 7 => 2, 8 => 1 }))
    end
  end

  describe "#my_select" do
    it "Accepts A Proc As Parameter" do
      expect(
        [1, 2, 3, 4, 5].my_select(&:even?)
      ).to(eq([2, 4]))
    end

    it "Accepts A Proc As Parameter Looping A Range" do
      expect(
        (0..10).my_select(&:even?)
      ).to(eq([0, 2, 4, 6, 8, 10]))
    end
  end

  describe "#my_all?" do
    it "Accepts A Block " do
      expect(
        %w[ant bear cat].my_all? { |word| word.length >= 3 }
      ).to(eq(true))
    end

    it "Loops A Range" do
      expect(
        (0..10).my_all? { |number| number < 100 }
      ).to(eq(true))
    end

    it "Accepts A Regex Pattern" do
      expect(
        %w[ant bear cat].my_all?(/t/)
      ).to(eq(false))
    end

    it "Accepts A Class As Input" do
      expect(
        [1, 2i, 3.14].my_all?(::Numeric)
      ).to(eq(true))
    end

    it "All Items Are Truthy" do
      expect(
        [nil, true, 99].my_all?
      ).to(eq(false))
    end

    it "Returns True If Array Empty" do
      expect(
        [].my_all?
      ).to(eq(true))
    end
  end

  describe "#my_any?" do
    it "Accepts A Block " do
      expect(
        %w[ant bear cat].my_any? { |word| word.length >= 4 }
      ).to(eq(true))
    end

    it "Accepts A Regex Pattern" do
      expect(
        %w[ant bear cat].my_any?(/d/)
      ).to(eq(false))
    end

    it "Accepts A Class As Input" do
      expect(
        [1, 2i, 3.14].my_any?(::Numeric)
      ).to(eq(true))
    end

    it "Any Items Are Truthy" do
      expect(
        [nil, true, 99].my_any?
      ).to(eq(true))
    end

    it "Returns False If Array Empty" do
      expect(
        [].my_any?
      ).to(eq(false))
    end
  end

  describe "#my_none?" do
    it "Accepts A Block " do
      expect(
        %w[ant bear cat].my_none? { |word| word.length == 5 }
      ).to(eq(true))
    end

    it "Accepts A Regex Pattern" do
      expect(
        %w[ant bear cat].my_none?(/d/)
      ).to(eq(true))
    end

    it "Accepts A Class As Input" do
      expect(
        [1, 2i, 3.14].my_none?(::Float)
      ).to(eq(false))
    end

    it "Any Items Are Truthy" do
      expect(
        [nil, true, 99].my_none?
      ).to(eq(true))
    end

    it "Returns False If One Truthy Value" do
      expect(
        [nil, false, true].none?
      ).to(eq(false))
    end

    it "Returns True If Array Empty" do
      expect(
        [].my_none?
      ).to(eq(true))
    end
  end
end
