require 'rails/generators'

module FastTry
  class CreateInitializerGenerator < Rails::Generators::Base

    def add_initializer
      create_file "config/initializers/fast_try.rb", <<eos
FastTry.method_names = #{FastTry::DEFAULT_METHODS}

require 'fast_try/apply'
eos
    end

  end
end
