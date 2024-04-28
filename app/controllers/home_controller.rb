# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @users = User.all
    @blocked_count = @users.where(blocked: true).count
  end

  def manage_blocking
    user_ids = params.require(:ids)
    if params[:commit] == 'Block'
      block user_ids
    else
      unblock user_ids
    end
  end

  private

  def block(blockinglist)
    User.where(id: blockinglist).update_all(blocked: true)
    redirect_to root_path
  end

  def unblock(unblockinglist)
    User.where(id: unblockinglist).update_all(blocked: false)
    redirect_to root_path
  end
end
