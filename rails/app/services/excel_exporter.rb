class ExcelExporter

  def initialize(scope)
    @scope = scope
  end

  def to_stream

    create_workbook
    add_worksheet
    add_headers
    add_data

    @package.to_stream.read

  end

  def worksheet_name
    @name ||= @scope.table_name.titleize
  end

  def filename
    "#{worksheet_name}.xlsx"
  end

  def worksheet_headers
    determine_columns.map(&:humanize)
  end

  def worksheet_data
    data = []

    @scope.find_each do |record|
      row = []
      determine_columns.each do |attr|
        row << fetch_attribute(record, attr)
      end
      data << row
    end

    data
  end

  private

  def create_workbook
    @package  = Axlsx::Package.new
    @workbook = @package.workbook
  end

  def add_worksheet
    @sheet = @workbook.add_worksheet(name: worksheet_name)
  end

  def determine_columns
    @column_names ||= @scope.first.attribute_names
  end

  def add_headers
    @sheet.add_row worksheet_headers, :style => header_style
    add_blank_row
  end

  def add_blank_row
    @sheet.add_row
  end

  def add_data
    worksheet_data.each do |row|
      @sheet.add_row(row)
    end
  end

  def fetch_attribute(record, attr)
    if association_name = belongs_to?(record, attr)
      associated_record = record.public_send(association_name)

      if associated_record.present?
        #  to_name - the field or combination of fields that we would like to use as a name,
        #  if we do not have a name attribute on the model
        associated_record.respond_to?(:to_name) ? associated_record.to_name : associated_record.name
      else
        nil
      end

    else
      record[attr]

    end
  end

  def belongs_to?(record, attr)
    @_belongs_to ||= record.class.reflect_on_all_associations(:belongs_to)
    reflection = @_belongs_to.detect { |a| a.foreign_key == attr }

    reflection.present? ? reflection.name : false
  end

  def header_style
    @sheet.styles.add_style(:b=> true)
  end

end
