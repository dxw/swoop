class Swoop::Formatter

  def call(severity, datetime, progname, msg)
    if Swoop.colorize?
      "#{ severity[0].bold.send(severity_color(severity)) } #{ datetime.iso8601.blue } #{ (progname || "app").bold }: #{ msg.strip }\n"
    else
      "#{ severity[0] } #{ datetime.iso8601 } #{ progname || "rails" }: #{ msg.strip }\n"
    end
  end

  def severity_color(severity)
    case severity
    when "DEBUG" then :blue
    when "INFO" then :blue
    when "WARN" then :yellow
    when "ERROR" then :red
    when "FATAL" then :red
    else :black
    end
  end

end
