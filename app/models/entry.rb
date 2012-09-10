class Entry < ActiveRecord::Base
  attr_accessible :correct_comment, :incorrect_comment, :photo_id, :title, :url
end
