Rails.application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'

  devise_for :users

  mount Postablr::Engine => "/postablr"
end
