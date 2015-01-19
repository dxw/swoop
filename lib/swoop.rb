require "swoop/version"

module Swoop

  require "swoop/rails"
  require "swoop/formatter"
  require "swoop/railtie" if defined?(::Rails::Railtie)

  def self.colorize?
    self.load_dependencies
    return false unless defined?(::Colored)
    defined?(::Rails) ? ::Rails.configuration.colorize_logging : true
  end

  def self.load_dependencies
    require "colored"
  rescue LoadError
    return nil
  end

end