Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do   
      get '/service/amazon_cloud_front/region/:codename' => 'product_prices#get_price'    
  end
end
