class Hospital < ActiveRecord::Base
  attr_accessible :address, :city, :eligible_discharges_count, :hospital_acquired_conditions_count, :name, :owner, :state, :type, :zip

  has_many :stats, class_name: 'HospitalCondition'
end
