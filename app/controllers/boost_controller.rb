class BoostController < ApplicationController
  before_action :logged_in?, :survey_not_completed?

  def show
    if params["completed"]
      @completed = true
    else
      if params['journal']
        @journal_complete = true
      end
      if current_user.spotify_token == nil && current_user.resource_preference[:music] == true
        flash[:error] = 'Please sign-in to a spotify premium account to get a song suggestion'
        redirect_to '/landing'
      else
        facade = ResourceFacade.new(current_user)
        facade.get_resource
        session[:suggestion] = facade.suggestion
          if session[:suggestion] == 'buddy' && current_user.buddies.empty?
            flash[:error] = 'Pleaese add a buddy to get a buddy suggestion'
            redirect_to '/buddies/new'
          else
            render locals: { resource_facade: facade }
        end
      end 
    end
  end
end
