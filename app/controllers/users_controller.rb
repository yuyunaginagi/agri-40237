class UsersController < ApplicationController
  def index
    @users = User.all
    @subjects = Subject.all
  end
end
