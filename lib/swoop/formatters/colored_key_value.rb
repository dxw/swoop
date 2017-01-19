module Swoop
  module Formatters
    class ColoredKeyValue

      def call(data)
        fields = fields_to_display(data)
        event = fields.map { |key| format(key, data[key]) }
        event.join(' ')
      end

      def fields_to_display(data)
        data.keys
      end

      def format(key, value)
        if key == :error
          value = "'#{value}'"
        else
          value = Kernel.format('%.2f', value) if value.is_a? Float
        end
        return Swoop.colorize? ? "#{ key.to_s.yellow }=#{ colorize(value) }" : "#{ key }=#{ value }"
      end

      def colorize(value)
        if value.is_a?(Numeric) || value.to_s.match(/\A[\d\.]+\z/)
          value = "#{ value }".magenta.bold
        elsif value.is_a?(String)
          value = "#{ value }".green.bold
        elsif value.is_a?(Symbol)
          value = "#{ value }".blue.bold
        elsif value.is_a?(Hash)
          value = value.to_json
        end
      end

    end
  end
end
