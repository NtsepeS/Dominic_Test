class ExcelExporter

  def initialize( scope )
    @scope = scope
  end

  def to_stream

    create_workbook
    add_worksheet
    determine_columns
    add_data

    @package.to_stream.read

  end

  private

  def create_workbook
    @package  = Axlsx::Package.new
    @workbook = @package.workbook
  end

  def add_worksheet
    @name  = @scope.table_name
    @sheet = @workbook.add_worksheet(name: @name)
  end

  def determine_columns
    sample = @scope.first
    @column_names = sample.attribute_names
    @sheet.add_row @column_names.map(&:humanize)
  end

  def add_data
    @scope.find_each do |record|
      row = []
      @column_names.each do |attr|
        row << record[attr]
      end
      @sheet.add_row( row )
    end
  end
end
