class Container < ActiveRecord::Base
  acts_as_nested_set

  belongs_to :containable, polymorphic: true

  def method_missing(method, *args, &block)
    if self.containable_type.underscore == method.to_s
      self.containable( *args, &block )
    else
      super
    end
  end
end
