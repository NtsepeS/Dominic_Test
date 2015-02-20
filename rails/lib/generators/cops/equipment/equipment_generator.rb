require_relative '../model/model_generator'

class Cops::EquipmentGenerator < Cops::ModelGenerator
  source_root File.expand_path('../templates', __FILE__)
end
