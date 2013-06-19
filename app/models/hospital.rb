class Hospital < ActiveRecord::Base
  attr_accessible :address, :city, :name, :owner, :state, :type, :zip

  has_many :stats, class_name: 'HospitalCondition'
end
