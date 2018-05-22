require 'rails/generators'

module FastTry
  class InitializerGenerator < Rails::Generators::Base

    def add_initializer
      create_file "config/initializers/fast_try.rb", <<eos
FastTry.methods = [:try, :try!]

require 'fast_try/apply_patches'
eos
    end

  end
end
