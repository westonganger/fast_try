Object.class_eval do
  ::FastTry.method_names.each do |method_name|
    define_method method_name do |a, *b, &c|
      self&.public_send(a, *b, &c)
    end
  end
end
