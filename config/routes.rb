Rails.application.routes.draw do
  root 'api/v1/animals#index'
  namespace 'api' do
    namespace 'v1' do
      mount_devise_token_auth_for 'User', at: 'auth',
        controllers: { sessions: 'api/v1/sessions' }
      resources :animals
      resources :people
      resources :type_animals
    end
  end
end
