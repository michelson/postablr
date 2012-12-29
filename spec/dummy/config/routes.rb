Rails.application.routes.draw do

  devise_for :users

  mount Postablr::Engine => "/postablr"
end
