class Hospital < ActiveRecord::Base
  attr_accessible :address, :city, :name, :owner, :state, :hospital_type, :zip

  has_many :stats, class_name: 'HospitalCondition'

  def stats_hash
    Hash[
      stats.map do |stat|
        [ stat.condition.title, stat ]
      end
    ]
  end

  HashedFields = [:eligible_discharges,:hospital_acquired_conditions, :condition_id]

end
