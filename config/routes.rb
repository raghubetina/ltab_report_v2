Rails.application.routes.draw do
  # Routes for the Bout resource:
  # CREATE
  get "/bouts/new", :controller => "bouts", :action => "new"
  post "/create_bout", :controller => "bouts", :action => "create"

  # READ
  get "/bouts", :controller => "bouts", :action => "index"
  get "/bouts/:id", :controller => "bouts", :action => "show"

  # UPDATE
  get "/bouts/:id/edit", :controller => "bouts", :action => "edit"
  post "/update_bout/:id", :controller => "bouts", :action => "update"

  # DELETE
  get "/delete_bout/:id", :controller => "bouts", :action => "destroy"
  #------------------------------

  # Routes for the Team resource:
  # CREATE
  get "/teams/new", :controller => "teams", :action => "new"
  post "/create_team", :controller => "teams", :action => "create"

  # READ
  get "/teams", :controller => "teams", :action => "index"
  get "/teams/:id", :controller => "teams", :action => "show"

  # UPDATE
  get "/teams/:id/edit", :controller => "teams", :action => "edit"
  post "/update_team/:id", :controller => "teams", :action => "update"

  # DELETE
  get "/delete_team/:id", :controller => "teams", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
