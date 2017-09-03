Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/question/new' => 'question#new', as: 'new_question'
  post 'question/create' => 'question#create', as: 'create_question'
  put '/question/edit' => 'question#edit', as: 'edit_question'
  post 'variant/new' => 'variant#new', as: 'new_variant'
  post '/variant/create' => 'variant#create', as: 'create_variant'
  get '/question/:id' => 'question#show', as: 'get_question'
  post '/question/:id' => 'question#check'
  get '/quiz/new' => 'quiz#new', as: 'new_quiz'
  put '/quiz/edit' => 'quiz#edit', as:'edit_quiz'
end
