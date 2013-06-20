class ApiController < ApplicationController
  def hospitals
    list_model Hospital.includes(:stats), include: { stats: { except: TimeStamps } }
  end

  def conditions
    list_model Condition
  end

  def hospital_conditions
    list_model HospitalCondition
  end

  private

  def list_model data_set, options = {}
    options = options.deep_merge(except: TimeStamps)
    data_set = data_set.limit(params[:limit]).offset(params[:offset])
    render json: data_set.to_json( options )
  end

  TimeStamps = %w(created_at updated_at)
end
