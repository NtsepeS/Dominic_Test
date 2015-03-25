module Containable
  extend ActiveSupport::Concern

  included do
    has_one :container, as: :containable

    class_attribute :parent_container_type
  end

  def requires_container?
    self.class.parent_container_type.present?
  end

  def parent_container_class
    requires_container? ? self.class.parent_container_type.to_s.classify.constantize : nil
  end

  class_methods do

    def contained_in( relation )
      self.parent_container_type = relation

      delegate :parent, to: :container
      delegate relation, to: :parent
    end

    def contains( relations )
      delegate :children, to: :container

      Array( relations ).each do |relation|
        define_method( relation ) do           # def units
          mapping = relation.to_s.singularize  #
          children.map(&mapping.to_sym)        #   children.map(&:unit)
        end                                    # end
      end
    end

  end
end
