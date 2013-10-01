require 'spec_helper'

describe String do
  let(:string) { "i am a test string, y'know?" }

  it "contains all the methods from Colorator::ANSI_COLORS" do
    Colorator::ANSI_COLORS.keys.each do |color|
      expect(string.methods).to include(color)
    end
  end

  it "colors the text properly" do
    Colorator::ANSI_COLORS.each do |color, code|
      expect(string.send(color)).to include(code.to_s)
      expect(string.send(color)).to eq("\e[#{code}m#{string}\e[0m")
    end
  end
end