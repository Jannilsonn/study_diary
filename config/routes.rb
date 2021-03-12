Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: 'home#index'
    # study_items GET /study_items(.:format) study_items#index
    # study_item GET /study_items/:id(.:format) study_items#show

    # new_study_item GET /study_items/new(.:format) study_items#new
    # POST /study_items(.:format) study_items#create

    # edit_study_item GET /study_items/:id/edit(.:format) study_items#edit
    # PATCH  /study_items/:id(.:format) study_items#update

    # DELETE /study_items/:id(.:format)  study_items#destroy
    resources :study_items, only: [:show, :new, :create, :edit, :update, :destroy] do
        put 'update_done', on: :member
    end
end
