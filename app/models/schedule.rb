class Schedule < ApplicationRecord
  def self.import(file)
    sheet = Roo::Spreadsheet.open(file.path)
    header = sheet.row(2)
    imported_at = Time.now
    Schedule.destroy_all
    sheet.each do |row|
      person = row[0].to_s.downcase.strip
      unless person.blank?
        header.each_with_index do |title, i|
          Schedule.create!({
            imported_at: imported_at,
            person: person,
            day: title.to_s,
            allocation: row[i].to_s
          })
        end
      end
    end
  end
end
