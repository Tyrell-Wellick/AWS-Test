Rails.application.routes.draw do
  #root
  get '/', to: 'instruments#hola'
  #Instrument
  post '/new_instrument', to: 'instruments#create'
  patch '/instruments/:instrument_id', to: 'instruments#update'
  #delete '/instruments/:instrument_id', to: 'instrument#destroy'
  get 'instrument/:instrument_id', to: 'instruments#show'
  #Cuota Value
  post '/:instrument_id/cuota_values/new', to: 'quota_values#create'
  get "*path", to: 'instruments#not_found'
  put "*path", to: 'instruments#not_found'
  post "*path", to: 'instruments#not_found'
end