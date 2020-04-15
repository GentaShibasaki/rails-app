Rails.application.routes.draw do
  root "user#top"
  get "article/index"
  get "/" => "user#initial"
  get "login" => "user#top"
  get "signup" => "user#new"
  
  post "signup" => "user#create"
  post "login" => "user#login"
  post "logout" => "user#logout"

  get "article/index" => "article#index"
  get "article/create" => "article#new"
  get "article/:article_id" => "article#content"
  get "article/:article_id/edit" => "article#edit"
  get "comment/:comment_id/edit" => "article#edit"

  post "article/create" => "article#create"
  post "article/:article_id/edit" => "article#modify"
  post "article/:article_id" => "article#comment"
  post "comment/:comment_id/edit" => "article#comment_modify"
  post "comment/:comment_id/destroy" => "article#comment_destroy"

end
