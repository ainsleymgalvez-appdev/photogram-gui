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
 
 # INSERT USER
 get("/insert_user_record", {:controller => "users", :action => "insert_user"})

 # EDIT PHOTO 
 get("/update_photo/:photo_id", {:controller => "photos", :action => "edit_photo"})

 #ADD PHOTO
 get("/insert_photo_record", {:controller => "photos", :action => "add_photo"})

 #EDIT USER
 get("/update_user/:user_id", {:controller => "users", :action => "edit_user"})

 #ADD COMMENT
 get("/insert_comment_record", {:controller => "photos", :action => "add_comment"})
end
