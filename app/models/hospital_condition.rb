class HospitalCondition < ActiveRecord::Base
  attr_accessible :condition_id, :eligible_discharges, :hospital_acquired_conditions, :hospital_id

  belongs_to :hospital
  belongs_to :condition
end
