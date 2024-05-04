class UsersController < ApplicationController
  def index
    @users = User.all
    @subjects = Subject.includes(:user).all
  end
end
