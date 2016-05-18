Rails.application.routes.draw do
  get 'documents/index'

  get 'documents/new'

  get 'documents/create'

  get 'documents/destroy'
  get '/allnotices'=> 'home#allnotices'
  get '/download/:id' => 'documents#download'
  devise_for :members, :controllers =>{registrations: 'members/registrations'}
  root :to=> 'home#homepage'
delete 'members/sign_out' => "devise/sessions#destroy"
get '/homepage'=> 'home#homepage'
#get '/tutorials'=> 'temp#tutorials'
get '/tutorials'=> 'documents#index'
get '/allfacultydetails'=> 'home#allfacultydetails'
post '/contactdetails'=> 'home#contactdetails'
get '/contactadmin'=>'home#contactadmin'
post '/noticeupdate'=> 'home#noticeupdate'
get '/notice'=>'home#notice'
get '/updatefaculty'=>'home#updatefaculty'
post '/updatefacultydetails'=> 'home#updatefacultydetails'
get '/facultycontact/:id'=> 'home#facultycontact'
post '/facultycontactdetails'=> 'home#facultycontactdetails'
resources :documents, only: [:index, :new, :create, :destroy]
end
