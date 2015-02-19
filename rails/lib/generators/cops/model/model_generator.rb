class Cops::ModelGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :attributes, type: :array, default: [], banner: "field[:type][:index] field[:type][:index]"

  def create_controller_files
    template 'controller.rb', File.join('app/controllers/api/v1', class_path, "#{plural_name}_controller.rb")
    template 'controller_spec.rb', File.join('spec/controllers/api/v1', class_path, "#{plural_name}_controller_spec.rb")
    route generate_routing_code
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

  # This method creates nested route entry for namespaced resources.
  def generate_routing_code()
    regular_class_path = ['api', 'v1']
    depth = regular_class_path.length

    namespace_ladder = regular_class_path.each_with_index.map do |ns, i|
      indent("namespace :#{ns} do\n", (i+1) * 2)
    end.join

    route = indent(%{resources :#{plural_name}\n}, (depth+1) * 2)

    end_ladder = (1..depth).reverse_each.map do |i|
      indent("end\n", i * 2)
    end.join

    namespace_ladder + route + end_ladder
  end

end
