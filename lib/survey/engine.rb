require 'rails'

module Survey
  class Engine < Rails::Engine
  end
  
  class << self
    mattr_accessor :localizable
    self.localizable = false
    
    def localizable?
      self.localizable
    end
  end

  def self.setup
    yield self
  end

end
