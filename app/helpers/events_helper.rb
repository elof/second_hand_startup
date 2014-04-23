module EventsHelper

 def image_selector(user)
    if(user.image_url)
      user.image_url
    else
      user.image.url(:thumb)
    end
  end
  
end
