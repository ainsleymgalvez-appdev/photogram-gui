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
end
