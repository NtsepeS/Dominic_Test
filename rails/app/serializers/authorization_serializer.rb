class AuthorizationSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :invited_by
end
