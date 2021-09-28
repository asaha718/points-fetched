Rails.application.routes.draw do

  resources :transactions, only: [:create, :index] do
    collection do 
      post :spend
    end    
  end

end
