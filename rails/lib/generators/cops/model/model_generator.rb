class Cops::ModelGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :attributes, type: :array, default: [], banner: "field[:type][:index] field[:type][:index]"

  def create_controller_files
    template 'controller.rb', File.join('app/controllers/api/v1', class_path, "#{plural_name}_controller.rb")
    template 'controller_spec.rb', File.join('spec/controllers/api/v1', class_path, "#{plural_name}_controller_spec.rb")

    insert_into_file "config/routes.rb", "      resources :#{plural_name}\n", :after => "namespace :v1 do\n"
  end

  def create_model
    template "model.rb", "app/models/#{singular_name}.rb"
  end

  def create_model_spec
    template "model_spec.rb", "spec/models/#{singular_name}_spec.rb"
  end

  def create_model_factory
    template "factory.rb", "spec/factories/#{plural_name}.rb"
  end

  def create_migration_files
    migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
    template "migration.rb", "db/migrate/#{migration_nr}_create_#{plural_name}.rb"
  end

  def create_serializer_files
    template "serializer.rb", "app/serializers/#{singular_name}_serializer.rb"
  end

  protected

  def pluralized_class_name
    class_name.pluralize
  end

  def factory_type(type)
    case type
    when :string
      "MyString"
    when :text
      "MyText"
    when :integer
      1
    when :float
      1.5
    when :decimal
      "9.99"
    when :datetime
      "2015-02-18 11:37:36"
    when :date
      "2015-02-18"
    when :time
       "2015-02-18 11:37:36"
    when :timestamp
      "2015-02-18 11:37:36"
    when :boolean
      false
    when :binary
      ""
    end
  end

  def remove_references_attribute
    attrs = attributes.clone
    attrs.each do |attr|
      attrs.delete attr if attr.type == :references
    end
    attrs
  end
end
