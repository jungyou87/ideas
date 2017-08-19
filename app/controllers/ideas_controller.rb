class IdeasController < ApplicationController
    
        before_action :require_login
        before_action :auth, only: [:edit, :update, :destroy]
    
    
        def index
            @user = current_user
            @ideas = Idea.joins(:user)
        end
    
        def create
            @idea = Idea.new(idea_params)
            @idea.user = current_user
      
            if @idea.save
                flash[:notice] = ["Registered successfully"]
                session[:idea_id] = @idea.id
                return redirect_to ideas_path
            end
    
            flash[:errors] = @idea.errors.full_messages
            return redirect_to :back
            
        end
    
        def show
            @idea = Idea.find(params[:id])
            return render 'ideas/show.html.erb'
        end
    
        private
    
            def idea_params
                params.require(:idea).permit(:idea)
            end
    
            def auth
                idea = Idea.find(params[:id])
                    return redirect_to ideas_path unless current_user == idea.user
            end
    end
    