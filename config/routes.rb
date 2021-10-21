Rails.application.routes.draw do
   
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get('/',{to: "welcome#home", as: :root})
    get('/about',{to: "welcome#about"})
    get('/contact',{to: "welcome#contact"})
    post("/contact_submit",{to:"welcome#thankyou",as: :contact_submit})

    get('/phpinfo',{to: "welcome#phpinfo"})

    get("/new_bill",{to:"bills#new_bill"})
    get("/bill", {to: 'bills#result', as: :bill})

    get('/reviews/:id',{to: 'reviews#show', as: :reviews })
    get('/reviews/:id/edit',{to: 'reviews#edit', as: :edit_review })

    patch('/reviews/:id',{to: 'reviews#update', as: :review })

    resources :products do
        #resources :reviews, only:[:create, :destroy ]
        resources :reviews do
            resources :likes, shallow: true, only: [:create, :destroy]
            resources :votes, shallow: true, only: [:create, :destroy]
        end
        resources :favourites, shallow: true, only: [:create, :destroy]
    end     

   

    resources :users, only:[:new, :create]
    resource :session, only: [:new, :create, :destroy]

    resources :tags,only: [:index]
    resources :news_articles
end
