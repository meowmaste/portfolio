class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true 

  def approve!
  	self.approved = true
  	save!
  end

end
