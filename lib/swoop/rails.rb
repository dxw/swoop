class Swoop::Rails

  def self.set_logger(config)
    ::Rails.logger = config.logger = swoop_logger(config)
  end

  def self.swoop_logger(config)
    logger = if ENV["LOG_FILE"]
      ::ActiveSupport::Logger.new ::Rails.root.join(ENV["LOG_FILE"])
    else
      ::STDOUT.sync = true
      ::ActiveSupport::Logger.new(::STDOUT)
    end

    logger.level = Logger.const_get(log_level)
    logger.progname = config.log_progname
    logger.formatter = Swoop::Formatter.new
    return logger
  end

  def self.log_level
    ([(ENV["LOG_LEVEL"] || ::Rails.application.config.log_level).to_s.upcase, "INFO"] & %w[DEBUG INFO WARN ERROR FATAL UNKNOWN]).compact.first
  end

end
