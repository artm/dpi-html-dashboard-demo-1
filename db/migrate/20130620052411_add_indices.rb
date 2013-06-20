class AddIndices < ActiveRecord::Migration
  Indices = [
    [:hospitals, :name],
    [:hospital_conditions, :hospital_id],
    [:hospital_conditions, :condition_id],
    [:hospital_conditions, :eligible_discharges],
    [:hospital_conditions, :hospital_acquired_conditions],
  ]

  def up
    Indices.each do |table,index|
      add_index table, index
    end
  end

  def down
    Indices.each do |table,index|
      remove_index table, index
    end
  end
end
