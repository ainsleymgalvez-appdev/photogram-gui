class PhotosController < ApplicationController 

  def index

    find_photo = Photo.all

    @list_of_photos = find_photo.order({ :created_at => :desc})
    

    render({:template => "photo_templates/index.html.erb"})

  end



end
