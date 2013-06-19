class RenameTypeInHospitalToHospitalType < ActiveRecord::Migration
  def up
    rename_column :hospitals, :type, :hospital_type
  end

  def down
    rename_column :hospitals, :hospital_type, :type
  end
end
