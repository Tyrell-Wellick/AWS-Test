class InstrumentsController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_action :verify_authenticity_token 
	def hola
    	render json: {'Hello': 'init'}, status: 200
  	end

  	def not_found
    	render json: {'Error': 'Bad URL'}, status: 400
  	end

	def new
      @entry = Instrument.new
    end

    def create
      new_hash = {}
      if (params.key?("instrument_id") && params.key?("instrument_name"))
      	#p 'Tiene los parámetros correctos'
      	new_hash["instrument_id"] = params["instrument_id"].to_i
      	new_hash["instrument_name"] = params["instrument_name"].to_s
      	#p new_hash
      	if new_hash["instrument_id"] == 0
      		#p 'Tiene un string como id'
      		render json: {'Error': 'Parametros incorrectos'}, status: 400
      	else
      		#p 'Pareciera estar bien'
      		@previous_instrument = Instrument.find_by(instrument_id: new_hash["instrument_id"])
      		if @previous_instrument.nil?
	      		@instrument = Instrument.new(new_hash)
		      	if @instrument.save
		        	render json: {'Success': 'Instrumento agregado'}, status: 200
		      	else
		        	render json: {'Error': 'No se ha podido crear el instrumento'}, status: 400
		      	end
		    else
		    	render json: {'Error': 'El instrumento ya ha sido creado'}, status: 400 
		    end
      	end
      else
      	#p 'No tiene los paramatros correctos'
      	render json: {'Error': 'Parametros en mal formato'}, status: 400
      end
    end


    def update
      new_hash = {}
      new_hash["instrument_id"] = params["instrument_id"].to_i
      new_hash["instrument_name"] = params["instrument_name"].to_s
      id = params[:instrument_id].to_i
	  @instrument = Instrument.find_by(instrument_id: id)
	  p @instrument
      if @instrument.update_attributes(new_hash)
        render json: {'Success': 'Instrumento actualizado'}, status: 200
      else
        render json: {'Error': 'No se ha podido actualizar el instrumento'}, status: 400
      end
    end


    #def destroy
    #  id = params[:instrument_id].to_i
    #  @instrument = Instrument.find_by(instrument_id: id)
    #  if @instrument.nil?
    #    render json: {'Error': 'No se ha podido borrar el instrumento'}, status: 400
    #  else
    #  	@instrument.destroy
    #    render json: {'Success': 'Instrumento borrado'}, status: 200
    #  end
    #end

    def show
    	if params.key?("instrument_id")
	    	id = params[:instrument_id].to_i
	    	@instrument = Instrument.find_by(instrument_id: id)
	    	if @instrument
	    		render json: {'instrument_id': @instrument.instrument_id, 'instrument_name': @instrument.instrument_name}, status: 200
	    	else
	    		render json: {'Error': 'Instrument Not found'}, status: 400
	    	end
	    else
	    	render json: {'Error': 'Instrument_id param needed'}, status: 400
	    end
    end

    #private
    #  def instrument_params
    #    params.require(:instrument).permit(:instrument_id, :instrument_name)
    #end
end
