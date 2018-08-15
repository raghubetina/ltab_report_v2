Rails.application.routes.draw do
  # Routes for the Poet resource:
  # CREATE
  get "/poets/new", :controller => "poets", :action => "new"
  post "/create_poet", :controller => "poets", :action => "create"

  # READ
  get "/poets", :controller => "poets", :action => "index"
  get "/poets/:id", :controller => "poets", :action => "show"

  # UPDATE
  get "/poets/:id/edit", :controller => "poets", :action => "edit"
  post "/update_poet/:id", :controller => "poets", :action => "update"

  # DELETE
  get "/delete_poet/:id", :controller => "poets", :action => "destroy"
  #------------------------------

  # Routes for the Competition resource:
  # CREATE
  get "/competitions/new", :controller => "competitions", :action => "new"
  post "/create_competition", :controller => "competitions", :action => "create"

  # READ
  get "/competitions", :controller => "competitions", :action => "index"
  get "/competitions/:id", :controller => "competitions", :action => "show"

  # UPDATE
  get "/competitions/:id/edit", :controller => "competitions", :action => "edit"
  post "/update_competition/:id", :controller => "competitions", :action => "update"

  # DELETE
  get "/delete_competition/:id", :controller => "competitions", :action => "destroy"
  #------------------------------

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
