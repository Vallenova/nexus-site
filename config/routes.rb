Rails.application.routes.draw do
  #namespace :admin do
  #get 'areas/new'
  #end

  #get 'estructura_paginas/inicio'
  root 'estructura_paginas#inicio'
  #match '/acerca',    to: 'estructura_paginas#acerca',    via: 'get'
  get 'acerca'        => 'estructura_paginas#acerca'
  
  namespace :admin do
    #resources :admin_paginas
    resources :areas
    resources :diplomados
    resources :modulos
    resources :cursos
    root 'admin_paginas#index'
    #match desaparecera en rails 5
    #match '/nueva_area',  to: 'areas#new',            via: 'get'
    #match '/nuevo_diplomado', to: 'diplomados#new',   via: 'get'
    #match '/nuevo_modulo', to: 'modulos#new',         via: 'get'
    #match '/nuevo_curso', to: 'cursos#new',           via: 'get'

    get 'nueva_area'        => 'areas#new'
    get 'nuevo_diplomado'   => 'diplomados#new'
    get 'nuevo_modulo'      => 'modulos#new'
    get 'nuevo_curso'       => 'cursos#new'

    #get 'areas/new'

  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
