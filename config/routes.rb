Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :fields

  resources :fulls, only: [ 'update' ]

  root :to => "home#index"

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  resources :search
  resources :coordinates
end
