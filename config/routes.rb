Rails.application.routes.draw do
  resources :infos
  resources :chapters
  resources :articles
  resources :case_study_articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
