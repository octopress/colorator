require "spec/helper"

describe String do
  subject do
    "I am a test string, y'know?"
  end

  Colorator::CORE_METHODS.each do |method|
    it "should respond_to #{method}" do
      expect(subject).to respond_to(
        method
      )
    end
  end
end
