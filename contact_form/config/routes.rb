Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/contact', to: 'contacts#new'
  post '/contact', to: 'contact#create'
  get '404', :to => 'application#page_not_found'
end
