module Containable
  extend ActiveSupport::Concern

  included do
    has_one :container, as: :containable
  end

  class_methods do

    def contained_in( relation )
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
