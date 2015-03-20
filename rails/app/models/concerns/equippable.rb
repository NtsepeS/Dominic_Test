module Equippable
  extend ActiveSupport::Concern

  included do
    class_attribute :equippables
    self.equippables = []
  end

  def equipment
    self.equippables.flat_map { |r| self.public_send(r) }
  end

  module ClassMethods
    def equipped_with( relation, options = {} )
      self.equippables += [relation]

      options.reverse_merge! dependent: :destroy
      has_one relation, options
    end
  end
end
