class Condition < ActiveRecord::Base
  attr_accessible :title

  has_many :stats, class_name: 'HospitalCondition'
end
