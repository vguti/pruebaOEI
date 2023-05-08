Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'courses/select', to: 'courses#select'
  #GET /api/courses/schools_and_topics
end
