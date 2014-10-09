module ImmutableMethod
  def self.call_method_immutably(method, *args)
    copy = self.clone
    copy.send(method.to_s.concat('!').to_sym, *args)
    copy
  end
end