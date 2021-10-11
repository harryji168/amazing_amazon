Rails.application.routes.draw do
   
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get('/',{to: "welcome#home", as: :home})
    get('/about',{to: "welcome#about"})
    get('/contact',{to: "welcome#contact"})
    post("/contact_submit",{to:"welcome#thankyou",as: :contact_submit})
    get("/new_bill",{to:"bills#new_bill"})
    get("/bill", {to: 'bills#result', as: :bill})

    resources :products do
        resources :reviews, only:[:create, :destroy ]
    end     

    get('/reviews/:id',{to: 'reviews#show', as: :reviews })
    get('/reviews/:id/edit',{to: 'reviews#edit', as: :edit_review })

    patch('/reviews/:id',{to: 'reviews#update', as: :review })

end
