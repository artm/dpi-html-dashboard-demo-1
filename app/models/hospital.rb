class Hospital < ActiveRecord::Base
  attr_accessible :address, :city, :name, :owner, :state, :hospital_type, :zip

  has_many :stats, class_name: 'HospitalCondition'
end
