Rails.application.routes.draw do

 # HOMEPAGE

 get("/", { :controller => "users", :action => "index" })

 #USERS

  get("/users", { :controller => "users", :action => "index" })

 get("/users/:username", {:controller => "users", :action => "show"})

 # PHOTOS

 get("/photos", {:controller => "photos", :action => "index"})
 get("/photos/:photo_id", {:controller => "photos", :action => "show"})

 # DELETE PHOTO
 get("/delete_photo/:photo_id", {:controller => "photos", :action => "delete"})

end
