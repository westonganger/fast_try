module FastTry
  DEFAULT_METHODS = ['try']

  def self.method_names
    @method_names ||= DEFAULT_METHODS
  end

  def self.method_names=(val)
    if val.is_a?(Array) && !val.empty?
      @method_names = val
    else
      raise ArgumentError.new('incorrect argument provided. Should be an Array of Strings or Symbols')
    end
  end
end
