# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                      root GET    /                                                                                        static_pages#home
#                     about GET    /about(.:format)                                                                         static_pages#about
#                     terms GET    /terms(.:format)                                                                         static_pages#terms
#                    policy GET    /policy(.:format)                                                                        static_pages#policy
#          new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  users/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 users/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    users/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         users/registrations#update
#                           PUT    /users(.:format)                                                                         users/registrations#update
#                           DELETE /users(.:format)                                                                         users/registrations#destroy
#                           POST   /users(.:format)                                                                         users/registrations#create
#                      user GET    /users/:id(.:format)                                                                     users#show
#                     posts POST   /posts(.:format)                                                                         posts#create
#                      post GET    /posts/:id(.:format)                                                                     posts#show
#                           DELETE /posts/:id(.:format)                                                                     posts#destroy
#             password_edit GET    /users/:id/password_edit(.:format)                                                       users#password_edit
#           password_update PATCH  /users/:id/password_update(.:format)                                                     users#password_update
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  root 'static_pages#home'
  post '/', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/terms', to: 'static_pages#terms'
  get '/policy', to: 'static_pages#policy'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  resources :users, only: [:show] do
    get :likes, on: :member
  end
  get "users/:id/password_edit", to: "users#password_edit", as: 'password_edit'
  patch "users/:id/password_update", to: "users#password_update", as: 'password_update'

  resources :posts, only: [:create, :destroy, :show, :edit, :update] do
    resources :comments, only: [:create, :destroy]
  end

  resources :likes, only: [:create, :destroy]
end
