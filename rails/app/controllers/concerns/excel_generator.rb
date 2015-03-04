module ExcelGenerator
  extend ActiveSupport::Concern

  def generate( excel )
    send_data excel.to_stream, type: "application/xlsx", filename: excel.filename
  end


end
