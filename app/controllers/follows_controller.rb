class FollowsController < ApplicationController
  before_action :logged_in_user

  def index
    @title = t "#{params[:title]}"
    @user = User.find_by id: params[:id]
    @users = @user.send(params[:title]).page(params[:page]).per Settings.user.per_page
    render "users/show_follow"
  end
end
