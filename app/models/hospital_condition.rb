class HospitalCondition < ActiveRecord::Base
  attr_accessible :condition_id, :eligible_discharges, :hospital_acquired_conditions, :hospital_id,
    :condition

  belongs_to :hospital
  belongs_to :condition

  def rate_per_1000
    if eligible_discharges == 0
      0
    else
      1000.0 * hospital_acquired_conditions / eligible_discharges rescue nil
    end
  end

  rails_admin do
    configure :rate_per_1000, :float
    exclude_fields :created_at, :updated_at
  end
end
