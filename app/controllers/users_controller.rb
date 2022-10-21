class UsersController < ApplicationController

  def index
  
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc})

    render({ :template => "user_templates/index.html.erb"})

  end

  def show

    username_id = params.fetch("username")

    user_info = User.where(:username => username_id)

    @the_user = user_info.at(0)

    # if the_user == nil
    #   redirect_to("/")
    # else
      render({ :template => "user_templates/show_details.html.erb"})

    # end
  end

  def insert_user

    user_input = params.fetch("input_username")

    u = User.new
    u.username = user_input 
    u.save
    
    @the_user = User.where(:username => u)

    redirect_to("/users/"+ user_input)

  end

  def edit_user

    edit_username = params.fetch("user_id")

    new_username = params.fetch("input_username")

    user = User.where({:id => edit_username}).at(0)
    user.username = new_username
    
    user.save

    redirect_to("/users/"+ new_username)


  end
end
