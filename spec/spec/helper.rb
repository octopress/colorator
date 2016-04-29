require "colorator"
require "luna/rspec/formatters/checks"
RSpec.configure { |config| config.order = "random" }
Dir[File.expand_path("../../support/**/*.rb", __FILE__)].each do |f|
  require f
end
