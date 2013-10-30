class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  Colorator::ANSI_COLORS.each do |color, code|
    define_method(color) { colorize(code) }
  end
end