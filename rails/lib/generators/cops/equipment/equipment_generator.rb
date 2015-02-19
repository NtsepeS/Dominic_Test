require File.expand_path(File.join(File.dirname(__FILE__), %w[.. model model_generator]))

class Cops::EquipmentGenerator < Cops::ModelGenerator
  source_root File.expand_path('../templates', __FILE__)

  
end
