class DataImport < ApplicationRecord
  has_one_attached :xlsx_file

  def import_data
    xlsx = Roo::Spreadsheet.open(xlsx_file)
    xlsx.each_row do |row|
      # Process each row of data
    end
  end
end
