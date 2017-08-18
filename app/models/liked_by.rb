class LikedBy < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :idea, required: true


  def self.existsOrCreate(user, idea)
    likedby = LikedBy.find_or_create_by(user: user, idea: idea)

    unless @likedby == [] 
        return
    end

    likedby = LikedBy.create(user: user, idea: idea)
    return
  end
end
