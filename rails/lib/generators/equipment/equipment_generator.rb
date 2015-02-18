class EquipmentGenerator < Rails::Generators::NamedBase
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)

  argument :attributes, type: :array, default: [], banner: "field[:type][:index] field[:type][:index]"

  def create_controller_files
    template 'controller.rb', File.join('app/controllers/api/v1', class_path, "#{plural_name}_controller.rb")
    template 'controller_spec.rb', File.join('spec/controllers/api/v1', class_path, "#{plural_name}_controller_spec.rb")
  end

  def create_model_files
    template "model.rb", "app/models/#{singular_name}.rb"
    template "model_spec.rb", "spec/models/#{singular_name}_spec.rb"
    template "factory.rb", "spec/factories/#{plural_name}.rb"
  end

  def create_migration_files
    migration_template "migration.rb", "db/migrate", :migration_file_name => "create_#{plural_name}"
  end

  def create_serializer_files
  end

  protected

  def pluralized_class_name
    class_name.pluralize
  end

  # Source: http://dj-bri-t.net/2012/05/rails-3-generators-adding-migration-templates/
  def self.next_migration_number(path)
    unless @prev_migration_nr
      @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
    else
      @prev_migration_nr += 1
    end
    @prev_migration_nr.to_s
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

end
