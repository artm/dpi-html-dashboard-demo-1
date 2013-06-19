require 'csv'

module DemoCsvLoader
  CsvOptions = { headers: true, converters: :numeric }

  def condition_csv_files
    Dir[ File.join File.dirname(Rails.root), '*.csv' ]
  end

  def clear_tables
    Hospital.delete_all
    Condition.delete_all
    HospitalCondition.delete_all
  end

  def load_csv_files
    clear_tables
    condition_csv_files.each do |path|
      condition_title = File.basename(path,'.csv').sub('_Rates','').humanize
      condition = Condition.create(title: condition_title)
      CSV.foreach(path,CsvOptions) do |row|
        hospital = hospital_from_csv(row)
        hospital.stats.create(
          condition: condition,
          eligible_discharges: row['# eligible discharges'],
          hospital_acquired_conditions: row['# HACs'])
      end
    end
  end

  def hospital_from_csv row
    Hospital.find_by_name(row['Hospital name']) ||
      Hospital.create(
        name: row['Hospital name'],
        address: row['Address'],
        city: row['City'],
        state: row['State'],
        zip: row['ZIP'],
        owner: row['Hospital Owner'],
        type: row['Hospital Type'])
  end
end

extend DemoCsvLoader
load_csv_files
