class Seller::StoreController < ApplicationController
  before_action :authenticate_user!
  before_action :autherize_user

  protected

    def autherize_user
      unless current_user.seller?
        redirect_to root_url, notice: 'You are not autherize to access this page'
      end
    end
end