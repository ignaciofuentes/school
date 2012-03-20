TuColegionline::Application.routes.draw do

  resources :school_years

  resources :emails

  resources :report_templates

  resources :users do
    get "login", :on=> :collection
    get "logout", :on=> :collection
    get "data_table", :on=> :collection
    end 
  resources :competences

  resources :evaluation_structures do
    resources :periods
  end

  resources :schedules do
    resources :class_timings
  end

  resources :students do
    get "assign_cualitative_grade", :on=> :member
    put "save_cualitative_grade", :on=> :member
    get "final_grades", :on => :member
    get "previous_batches", :on => :member
    get "historical_grades", :on => :member
    get "academic_status", :on => :member
    get "schedule", :on => :member
    resources :relationships do
    get "add_relationship", :on => :collection
    end
    resources :batch_students
  end
  
  resources :guardians

  resources :employees do
    get "assign_subjects", :on => :member
    put "save_subjects", :on => :member
  end
  
  resources :courses do
    resources :subjects
    resources :batches 			
  end

  resources :batch_subjects do
    resources :competences
    resources :students do
      get "assign_cualitative_grades", :on=> :member
      put "save_cualitative_grades", :on=> :member
    end
    resources :evaluations do
      get "grades", :on => :collection
      get "assign_grades", :on => :member
      put "save_grades", :on => :member
    end
  end

  resources :batches do
    get "batch_transfer", :on=> :member
    post "assign_batch_transfer", :on=> :member
    resources :batch_subjects
    resources :evaluations
    resources :timetable_entries do
      get "assign_employee", :on => :member
      put "save_employee", :on => :member
    end
  end


  root :to => 'home#index'

  match ':controller(/:action(/:id(.:format)))'
end
