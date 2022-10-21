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

  def edit_photo

    photo_id = params.fetch("photo_id")
    photo_link = params.fetch("input_image")
    caption_text = params.fetch("input_caption")

    match_photo = Photo.where({:id => photo_id}).first
    match_photo.image = photo_link

    match_photo.caption = caption_text

    match_photo.save

    redirect_to("/photos/" + photo_id)


  end

  def add_photo

    pic = params.fetch("input_image")
    caption_text = params.fetch("input_caption")
    id = params.fetch("input_owner_id")
    
    p = Photo.new
    p.image = pic
    p.caption = caption_text
    p.owner_id = id
    p.save


    redirect_to("/photos/" + p.id.to_s )
  end

  def add_comment
  
    photo_id = params.fetch("input_photo_id")
    author_id = params.fetch("input_author_id")
    comment = params.fetch("input_body")

    comment_h = Comment.new
    comment_h.photo_id = photo_id
    comment_h.body = comment
    comment_h.author_id = author_id
    comment_h.save

    redirect_to("/photos/" + photo_id.to_s)

  end

end
