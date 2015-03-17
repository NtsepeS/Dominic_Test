class Container < ActiveRecord::Base
  acts_as_nested_set

  belongs_to :containable, polymorphic: true

  def method_missing(method, *args, &block)
    if self.containerizable_type.underscore == method.to_s
      self.containerizable( *args, &block )
    else
      super
    end
  end
end
