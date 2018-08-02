module ApplicationHelper
  
  def avatar_url(user)
    if user.image
      user.image
    else
      if user.avatar.present?
      user.avatar.url
    
      else
      'https://res.cloudinary.com/hslctd8so/image/upload/v1533217885/default_image.jpg'
    end
    
  end
  
  end

end