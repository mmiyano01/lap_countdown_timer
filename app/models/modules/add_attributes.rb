module AddAttributes
  def attributes=(attributes = {})
    attributes.each { |name, value| send "#{name}=", value } if attributes
    self
  end
end