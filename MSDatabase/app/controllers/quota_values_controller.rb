class QuotaValuesController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_action :verify_authenticity_token 
  def new
    @cuota_value = CuotaValue.new
  end

  def create
    @instrument = Instrument.find_by_id(params[:instrument_id])
    new_hash = {}
    new_hash[:price] = params[:cuota_value][:price]
    new_hash[:money_type] = params[:cuota_value][:money_type]
    new_hash[:date] = params[:cuota_value][:date]
    @new_instrument = @instrument.cuota_values.new(new_hash)
    if @new_instrument.save
      render json: {'Success': 'Cuota Value agregado'}, status: 200
    else
      render json: {'Error': 'No se ha podido crear el cuota value'}, status: 400
    end
  end

  private

  #def cuota_value_params
  #  params.require(:cuota_value).permit(:price, :money_type, :date, :instrument_id)
  #end
end
