class RemoveConditionColumnsFromHospitals < ActiveRecord::Migration
  def up
    remove_column :hospitals, :hospital_acquired_conditions_count
    remove_column :hospitals, :eligible_discharges_count
  end

  def down
    add_column :hospitals, :hospital_acquired_conditions_count,
      :integer
    add_column :hospitals, :eligible_discharges_count,
      :integer
  end
end
