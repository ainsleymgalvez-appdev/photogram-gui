class PhotosController < ApplicationController 

  def index

    find_photo = Photo.all

    @list_of_photos = find_photo.order({ :created_at => :desc})
    

    render({:template => "photo_templates/index.html.erb"})

  end

  def show

    get_id = params.fetch("photo_id")

    @match_photo = Photo.where({:id => get_id }).at(0)

    # @match_comment = Comment.where({ :photo_id => get_id })

    render({:template => "photo_templates/show_photo.html.erb"})

  end

  def delete
    photo_id = params.fetch("photo_id")

    pick_photo = Photo.where({:id => photo_id}).at(0)
    
    pick_photo.destroy

    #render({:template => "photo_templates/goodbye.html.erb"})

    redirect_to("/photos")

  end


end
