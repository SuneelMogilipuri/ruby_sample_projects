Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    get '/contact', to: 'contacts#new'
    post '/contact', to: 'contacts#create'
    match '/404', :to => 'application#content_not_found', via: :all
  end
end
