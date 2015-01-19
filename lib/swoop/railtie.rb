class Swoop::Railtie < ::Rails::Railtie

  config.log_progname ||= nil
  config.before_initialize { Swoop::Rails.set_logger(config) }

  if defined?(::Lograge)

    require "swoop/formatters/colored_key_value"

    config.lograge.enabled = true
    config.lograge.formatter = Swoop::Formatters::ColoredKeyValue.new
    config.lograge.custom_options = lambda do |event|
      params = event.payload[:params].reject { |k| ["controller", "action"].include? k }
      { "params" => params, "ip" => event.payload[:ip] }
    end

  end

end