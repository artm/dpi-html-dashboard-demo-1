class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :owner
      t.string :type
      t.integer :hospital_acquired_conditions_count
      t.integer :eligible_discharges_count

      t.timestamps
    end
  end
end
