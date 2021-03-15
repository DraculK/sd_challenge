Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  scope 'books' do
    get '/new', to: 'books#new', as: :new_book
    post '/new', to: 'books#create'
  end
end
