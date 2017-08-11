Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/question/:id' => 'question#show', as: 'get_question'
  get '/question/1' => 'question#show', as: 'start_game' # do a random question later
  post '/question/:id' => 'question#check'
end
