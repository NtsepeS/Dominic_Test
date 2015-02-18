class EquipmentGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  argument :attributes, type: :array, default: [], banner: "field[:type][:index] field[:type][:index]"

  def create_controller_files
    template 'controller.rb', File.join('app/controllers/api/v1', class_path, "#{plural_name}_controller.rb")
  end

  protected

  def pluralized_class_name
    class_name.pluralize
  end

end
