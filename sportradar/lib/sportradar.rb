require 'pathname'

# Sportradar API clients
module Sportradar
  def self.root
    binding.pry
    Pathname.new('~/dev/one_hundred_programs/sportradar/lib')
  end
end
