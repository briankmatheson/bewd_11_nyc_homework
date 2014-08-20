# == Schema Information
#
# Table name: stories
#
#  id         :integer          not null, primary key
#  title      :text
#  link       :text
#  upvotes    :integer
#  category   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Story < ActiveRecord::Base

  def self.search_for(query)
    Story.where('title LIKE :query OR category LIKE :query', query: "%#{query}%")
  end

end
