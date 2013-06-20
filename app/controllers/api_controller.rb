class ApiController < ApplicationController
  def hospitals
    render json: Hospital.all.to_json
  end

  def conditions
    render json: Condition.all.to_json
  end
end
