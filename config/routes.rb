Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  scope 'books' do
    get '/new', to: 'books#new', as: :new_book
    post '/new', to: 'books#create'
    get '/:id', to: 'books#show', as: :show_book
    get '/:id/edit', to: 'books#edit', as: :edit_book
    patch '/:id/edit', to: 'books#update'
    delete '/:id', to: 'books#destroy', as: :delete_book
  end
end
