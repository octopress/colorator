require "spec/helper"
describe Colorator do
  Colorator::ANSI_COLORS.each do |color, code|
    it "colors the text #{color} properly" do
      expect(Colorator.send(color, "string")).to include code.to_s
      expect(Colorator.send(color, "string")).to eq(
        "\x1b[#{code}mstring\x1b[0m"
      )
    end
  end

  #

  describe "#clear_line" do
    it "gives ansi to clear the line" do
      expect(subject.has_ansi?(subject.clear_line)).to(
        be_truthy
      )
    end

    it "supports passing strings" do
      expect(subject.has_ansi?(subject.clear_line("hello"))).to(
        be_truthy
      )
    end
  end

  #

  describe "#clear_screen" do
    it "gives ansi to clear the line" do
      expect(subject.has_ansi?(subject.clear_screen)).to(
        be_truthy
      )
    end

    it "supports passing strings" do
      expect(subject.has_ansi?(subject.clear_screen("hello"))).to(
        be_truthy
      )
    end
  end

  #

  describe "#has_ansi?" do
    it "should detect ansi" do
      expect(subject.has_ansi?(subject.blue("hello"))).to(
        be_truthy
      )
    end
  end

  #

  describe "#strip_ansi" do
    it "should strip ansi" do
      expect(subject.strip_ansi(subject.red("hello"))).to eq(
        "hello"
      )
    end

    #

    context "with reset" do
      it "should strip the reset too" do
        expect(subject.strip_ansi(subject.red(subject.reset_ansi("hello")))).to eq(
          "hello"
        )
      end
    end

    #

    context "with multiple colors" do
      it "should strip it all" do
        expect(subject.strip_ansi(subject.red(subject.yellow("hello")))).to eq(
          "hello"
        )
      end
    end
  end

  #

  describe "#ansi_jump" do
    it "should give ansi to jump up and down" do
      expect(subject.ansi_jump("hello", 1024)).to match(
        %r!\[1024A|\[1024B\Z!
      )
    end
  end
end
