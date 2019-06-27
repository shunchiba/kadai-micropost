class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = "お気に入りに追加しました。"
    # redirect_to micropost は MicropostsControllerのshowに飛ぶ
    # だが、micropostsにはshowアクションは存在しない
    # したがってエラーが起きてしまう。
    redirect_back(fallback_location: root_url)
  end

  def destroy
    # micropost = Micropost.find(params[:micropost_id])
    # current_user.unlike(micropost)
    favorite = Favorite.find(params[:id])
    favorite.destroy
    flash[:success] = "お気に入りを解除しました。"
    redirect_back(fallback_location: root_url)
  end
end
