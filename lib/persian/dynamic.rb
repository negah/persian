# -*- coding: UTF-8 -*-

# Persian Dynamic methods
module Persian
  # Persian Text class :: Dynamic methods
  class Text
    def self.method_missing(method, *arg, &block)
      # remove methods
      if method.to_s =~ /^remove_\w*/
        # get method characters without remove_
        char = method.to_s.gsub(/^remove_(\w*)/, '\1').upcase

        # execute remove_character if char is a valid constant
        if constant? char
          text = Persian.rm_char(arg[0], get_constant(char))
          text
        else
          super
        end
      else
        # Run default no method error
        super
      end
    end

    def self.respond_to_missing?(method, include_private = false)
      method.to_s.start_with?('remove_') || super
    end

    def self.constant?(const_name)
      Persian.const_defined?(const_name)
    end

    def self.get_constant(const_name)
      Persian.const_get(const_name)
    end
  end
end
