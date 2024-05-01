# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @users = User.order(last_sign_in_at: :asc)
    @blocked_count = @users.where(blocked: true).count
  end

  def manage_users
    user_ids = params.require(:ids)
    if params[:commit] == 'Block'
      block user_ids
    elsif params[:commit] == "Unblock"
      unblock user_ids
    else
      delete user_ids
    end
  end

  private

  def block(blocking_list)
    User.where(id: blocking_list).update_all(blocked: true)
    redirect_to root_path
  end

  def delete(delete_list)
    User.where(id: delete_list).destroy_all
    redirect_to root_path
  end

  def unblock(unblocking_list)
    User.where(id: unblocking_list).update_all(blocked: false)
    redirect_to root_path
  end
end
