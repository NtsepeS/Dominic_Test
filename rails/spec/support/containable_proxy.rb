class ContainableProxy < BasicObject

  def initialize( containable_class, model_attributes )
    @parent = model_attributes.delete(:parent)
    @containable = containable_class.new( model_attributes )
  end

  def parent
    @parent
  end

  def inspect
    "(Wrapped: #{@containable.inspect})"
  end

  def method_missing( name, *args, &block )
    @containable.send( name, *args, &block )
  end

  def respond_to_missing?( name, include_private = true )
    @containable.respond_to_missing?( name, include_private )
  end

end
