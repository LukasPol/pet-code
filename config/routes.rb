Rails.application.routes.draw do
  root 'animals#index'
  namespace 'api' do
    namespace 'v1' do
      resources :animals
      resources :people
      resources :type_animals
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
