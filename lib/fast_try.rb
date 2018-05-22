module FastTry
  DEFAULT_METHODS = ['try']

  def self.the_methods
    @the_methods ||= DEFAULT_METHODS
  end

  def self.the_methods=(val)
    if val.is_a?(Array) && !val.empty?
      @the_methods = val
    else
      raise ArgumentError.new('incorrect argument provided. Should be an Array of Strings or Symbols')
    end
  end
end
