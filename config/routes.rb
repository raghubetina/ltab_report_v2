Rails.application.routes.draw do
  # Routes for the Penalty resource:
  # CREATE
  get "/penalties/new", :controller => "penalties", :action => "new"
  post "/create_penalty", :controller => "penalties", :action => "create"

  # READ
  get "/penalties", :controller => "penalties", :action => "index"
  get "/penalties/:id", :controller => "penalties", :action => "show"

  # UPDATE
  get "/penalties/:id/edit", :controller => "penalties", :action => "edit"
  post "/update_penalty/:id", :controller => "penalties", :action => "update"

  # DELETE
  get "/delete_penalty/:id", :controller => "penalties", :action => "destroy"
  #------------------------------

  # Routes for the Poem resource:
  # CREATE
  get "/poems/new", :controller => "poems", :action => "new"
  post "/create_poem", :controller => "poems", :action => "create"

  # READ
  get "/poems", :controller => "poems", :action => "index"
  get "/poems/:id", :controller => "poems", :action => "show"

  # UPDATE
  get "/poems/:id/edit", :controller => "poems", :action => "edit"
  post "/update_poem/:id", :controller => "poems", :action => "update"

  # DELETE
  get "/delete_poem/:id", :controller => "poems", :action => "destroy"
  #------------------------------

  # Routes for the Availability resource:
  # CREATE
  get "/availabilities/new", :controller => "availabilities", :action => "new"
  post "/create_availability", :controller => "availabilities", :action => "create"

  # READ
  get "/availabilities", :controller => "availabilities", :action => "index"
  get "/availabilities/:id", :controller => "availabilities", :action => "show"

  # UPDATE
  get "/availabilities/:id/edit", :controller => "availabilities", :action => "edit"
  post "/update_availability/:id", :controller => "availabilities", :action => "update"

  # DELETE
  get "/delete_availability/:id", :controller => "availabilities", :action => "destroy"
  #------------------------------

  # Routes for the Enrollment resource:
  # CREATE
  get "/enrollments/new", :controller => "enrollments", :action => "new"
  post "/create_enrollment", :controller => "enrollments", :action => "create"

  # READ
  get "/enrollments", :controller => "enrollments", :action => "index"
  get "/enrollments/:id", :controller => "enrollments", :action => "show"

  # UPDATE
  get "/enrollments/:id/edit", :controller => "enrollments", :action => "edit"
  post "/update_enrollment/:id", :controller => "enrollments", :action => "update"

  # DELETE
  get "/delete_enrollment/:id", :controller => "enrollments", :action => "destroy"
  #------------------------------

  # Routes for the Participation resource:
  # CREATE
  get "/participations/new", :controller => "participations", :action => "new"
  post "/create_participation", :controller => "participations", :action => "create"

  # READ
  get "/participations", :controller => "participations", :action => "index"
  get "/participations/:id", :controller => "participations", :action => "show"

  # UPDATE
  get "/participations/:id/edit", :controller => "participations", :action => "edit"
  post "/update_participation/:id", :controller => "participations", :action => "update"

  # DELETE
  get "/delete_participation/:id", :controller => "participations", :action => "destroy"
  #------------------------------

  # Routes for the Round resource:
  # CREATE
  get "/rounds/new", :controller => "rounds", :action => "new"
  post "/create_round", :controller => "rounds", :action => "create"

  # READ
  get "/rounds", :controller => "rounds", :action => "index"
  get "/rounds/:id", :controller => "rounds", :action => "show"

  # UPDATE
  get "/rounds/:id/edit", :controller => "rounds", :action => "edit"
  post "/update_round/:id", :controller => "rounds", :action => "update"

  # DELETE
  get "/delete_round/:id", :controller => "rounds", :action => "destroy"
  #------------------------------

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
