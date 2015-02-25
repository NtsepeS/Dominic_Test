class AntennaParameterSerializer < ActiveModel::Serializer
  attributes :id, :polarization

  has_one :operating_parameter
end
