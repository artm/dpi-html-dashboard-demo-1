class CreateHospitalConditions < ActiveRecord::Migration
  def change
    create_table :hospital_conditions do |t|
      t.integer :hospital_id
      t.integer :condition_id
      t.integer :eligible_discharges
      t.integer :hospital_acquired_conditions

      t.timestamps
    end
  end
end
