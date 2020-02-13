class InvitationsController < ApplicationController
  def new; end

  def create
    # params[:invitation]
    redirect_to root_path
  end
end
