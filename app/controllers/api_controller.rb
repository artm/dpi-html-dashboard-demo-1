class ApiController < ApplicationController
  def hospitals
    list_model Hospital, include: { stats: { except: TimeStamps } }
  end

  def conditions
    list_model Condition
  end

  def hospital_conditions
    list_model HospitalCondition
  end

  private

  def list_model model, options = {}
    options = options.deep_merge(except: TimeStamps)
    data_set = model.limit(params[:limit]).offset(params[:offset])
    render json: data_set.to_json( options )
  end

  TimeStamps = %w(created_at updated_at)
end
