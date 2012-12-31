# -*- encoding : utf-8 -*-
Rails.application.routes.draw do


  mount Postablr::Engine => "/"

  devise_for :users

  root to: "postablr/blog#show"

  mount RedactorRails::Engine => '/redactor_rails'

end
