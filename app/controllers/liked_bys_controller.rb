class LikedBysController < ApplicationController
    before_action :require_login
    def create
        @idea = Idea.find(params[:id])
        @user = current_user
        LikedBy.existsOrCreate(@user, @idea)
        
        return redirect_to ideas_path
    end

 
end
