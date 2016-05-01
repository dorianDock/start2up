Rails.application.routes.draw do



  get 'registrations/update_resource'
  get 'skill/update_user_skills'
  get 'skill/skills_for_user'
  # get 'data_source/category_list/:query', :controller => 'data_source', :action => 'category_list'
  get 'data_source/category_list'
  get 'data_source/skill_list'
  get 'data_source/useful_link_category_list'


  #concepts

  get 'concepts/add_concept_for_user'
  get 'concepts/remove_concept_for_user'
  get 'concepts/categories_for_concepts'
  post 'concepts/edit_user_concept'
  get 'concepts/ask_for_concept_review'
  get 'concepts/publish_concept'

  # useful_links and their comments

  resources :useful_links do
    collection do
      get 'index'
      get 'new'
      get 'link_list'
      get 'category_for_useful_link'
      post 'create'
    end

    member do
      patch 'update'
      post 'destroy'
    end

    resources :comments
  end

  resources :comments do
    resources :comments
  end



  devise_for :users, :path_prefix => 'session' ,controllers: {registrations: 'registrations'}
  # devise_for :users, :path_prefix => 'session', controllers: {registrations: 'registrations'}

  resources :users  do
    member do
      get :friends
      get :followers
      get :followed
      get :mentors
      get :mentorees
      post :update_profile_picture
    end
  end

  resources :friend_links
  resources :user_links, :only => [:new, :create,:index]

  get 'user_links/accept_or_refuse_request'

  get 'users/logout'

  get 'home/index'
  get 'home/contact'
  get 'home/about'
  get 'home/howto'
  get 'home/contact'
  get 'home/good_or_bad_idea'
  get 'home/find_your_soul'
  get 'home/law_is_law'
  get 'home/money_broke'
  get 'home/useful_information'
  get 'home/the_godfather'
  get 'home/find_your_roof'
  get 'home/low_cost_consulting'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
