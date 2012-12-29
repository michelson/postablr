Postablr::Engine.routes.draw do

  resources :entries

  match 'entries/new/:type' => 'entries#new', :as=>:new_entries_for, :via => [:get]
  match 'entries/new/:type' => 'entries#create', :as=>:new_entries_for, :via => [:post]
  match 'entries/:type/:id/edit' => 'entries#edit', :as=>:edit_entry_for, :via => [:get]
  match 'entries/fast_upload' => 'entries#create', :as => :new_fast_upload, :via=>[:post]
  match 'entries/fast_upload' => 'entries#update', :as => :edit_fast_upload, :via=>[:put]
  match 'blog/:filter' => 'blog#filter', :as=>:filter_blog, :via => [:get]

  resource :blog, :controller=>"blog" do
    #resources :entries, :controller=> "blog/entries" do
      #resources :comments, :controller => "blog/comments"
    #end
    #resources :tags, :controller=>"blog/tags"
    #resources :authors
  end

end
