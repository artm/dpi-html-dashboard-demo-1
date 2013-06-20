class ApiController < ApplicationController
  def hospitals
    list_model Hospital
  end

  def conditions
    list_model Condition
  end

  def hospital_conditions
    list_model HospitalCondition
  end

  private

  def list_model model
    render json: model.all.to_json
  end
end
