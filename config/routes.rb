Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :charts, only: [:index] do
    get '/', to: 'charts#index'
  end

  resource :ec_charts, only: [:index] do
    get '/', to: 'ec_charts#index'
  end
end
