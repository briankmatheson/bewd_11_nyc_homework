class DataFile < ActiveRecord::Base
  has_attached_file :file
  validates_attachment :file, content_type: { content_type: /audio/ }, size: { less_than: 25.megabytes }
end
