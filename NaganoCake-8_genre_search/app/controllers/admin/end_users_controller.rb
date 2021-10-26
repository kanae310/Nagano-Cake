class Admin::EndUsersController < ApplicationController
  def index
    @users = EndUser.all
  end
end
