class UsersController < ApplicationController
  params.require(:user).permit(:photo)
end
