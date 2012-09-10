require 'flickraw'
class FlickrPhoto
  FlickRaw.api_key        = "0b6f3d1ecb1fd692b9642c4d3d4c614b"
  FlickRaw.shared_secret  = "2a98e20e40746932"

  def self.get_photos
    flickr.panda.getPhotos(:panda_name => "ling ling")
  end
  
  def self.get_photos_with_comments
    photos = get_photos.reject {|p| get_comments_photo(p.id).empty? }
  end
  
  def self.get_comments_photo(photo_id)
    _comments = flickr.photos.comments.getList(:photo_id => photo_id)
    if _comments.is_a?(FlickRaw::ResponseList)
      return _comments.to_a
    else
      return []
    end
  end
  
  def self.get_large_image(photo_id)
    flickr.photos.getSizes(:photo_id => photo_id).to_a.last.source
  end
  
end