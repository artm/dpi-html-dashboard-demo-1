class Condition < ActiveRecord::Base
  attr_accessible :title

  has_many :stats, class_name: 'HospitalCondition'

  rails_admin do
    exclude_fields :stats
  end
end
