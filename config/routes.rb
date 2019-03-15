Rails.application.routes.draw do
	root 'welcome#index'
	post 'add_member/:id' => 'projects#add_member'
	delete 'delete_member/:projectid/:userid' => 'projects#delete_member', as: :delete_member
   		resources :projects do
   		resources :bugs , shallow: true
   	end
  	devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end