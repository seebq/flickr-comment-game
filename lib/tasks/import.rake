namespace :import do
  
  desc "imports data"
  task :data => :environment do
    # go get panda photos with comments
    photos = FlickrPhoto.get_photos_with_comments
    puts "Found: #{photos.size}"
    
    photos.each do |photo|
      url = "http://flickr.com/photos/#{photo.owner}/#{photo.id}"
      puts "Photo: #{photo.title} owner #{photo.owner} id: #{photo.id}"
      
      # get the comments for a photo
      correct_comments = FlickrPhoto.get_comments_photo(photo.id)
      p "Correct Comments:"
      p correct_comments.inspect
      
      # choose one of the comments
      correct_comment = correct_comments.to_a.sample._content
      p "Correct comment:"
      p correct_comment
      
      # get some incorrect comments by choosing a random photo
      # that doesn't include the photo we're looking at
      incorrect_photo = photos.reject {|p| p.id == photo.id}.sample
      p "Incorrect Photo:"
      puts "Photo: #{incorrect_photo.title} owner #{incorrect_photo.owner} id: #{incorrect_photo.id}"
      
      # choose one of the incorrect comments
      incorrect_comments = FlickrPhoto.get_comments_photo(incorrect_photo.id)
      puts "Incorrect Comments:"
      p incorrect_comments
      
      incorrect_comment = incorrect_comments.to_a.sample._content
      
      # create the entry:
      entry = Entry.create(:title => photo.title,
                           :photo_id => photo.id, 
                           :url => url,
                           :correct_comment => correct_comment,
                           :incorrect_comment => incorrect_comment)
      puts entry.inspect
    end
  end
  
end