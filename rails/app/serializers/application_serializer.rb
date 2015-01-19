class ApplicationSerializer < ActiveModel::Serializer

  class << self

    def lowercase_attribute( *attrs )
      Array(*attrs).each do |attr|
        attributes  attr.to_s.downcase
        define_method attr.to_s.downcase do
          object && object.read_attribute_for_serialization(attr)
        end
      end
    end

  end
end