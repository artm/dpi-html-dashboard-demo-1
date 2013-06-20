require 'csv'
require 'benchmark'

module DemoCsvLoader

  def load_csv_files
    Benchmark.bm( LabelLength ) do |timer|
      timer.report(label "Clearing the tables") { clear_tables }
      condition_csv_files.each do |path|
        timer.report(label "Importing #{File.basename path}") do
          condition = Condition.create(title: condition_title_from_csv_path(path))
          CSV.foreach(path,CsvOptions) do |row|
            hospital = hospital_from_csv(row)
            hospital_condition_from_csv( hospital, condition, row )
          end
        end
      end
    end
  end

  def hospital_from_csv row
    @@hospital_cache ||= {}
    name = row['Hospital name']
    @@hospital_cache[ name ] ||= Hospital.create(
      name: name,
      address: row['Address'],
      city: row['City'],
      state: row['State'],
      zip: row['ZIP'],
      owner: row['Hospital Owner'],
      hospital_type: row['Hospital Type'])
  end

  def hospital_condition_from_csv hospital, condition, row
    hospital.stats.create(
      condition: condition,
      eligible_discharges: row['# eligible discharges'],
      hospital_acquired_conditions: row['# HACs'])
  end

  def condition_csv_files
    Dir[ File.join( File.dirname(Rails.root), '*.csv' ) ]
  end

  def clear_tables
    Hospital.delete_all
    Condition.delete_all
    HospitalCondition.delete_all
  end

  def condition_title_from_csv_path path
    File.basename(path,'.csv').sub('_Rates','').humanize
  end

  def label string
    string.truncate LabelLength
  end

  CsvOptions = { headers: true, header_converters: proc{|header| header.strip } }
  LabelLength = 30
end

extend DemoCsvLoader
load_csv_files
