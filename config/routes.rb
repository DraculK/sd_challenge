Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  scope 'book' do
    get '/new', to: 'books#new', as: :new_book
  end
end
