class RelationshipFavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favo(micropost)
    flash[:success] = '投稿をお気に入りに登録しました。'
    redirect_to root_url
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavo(micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path) 
  end
end
