class DataController < ApplicationController
  # DBにデータを追加
  def regist
    Post.create(:uuid => params[:uuid], :content => params[:content])
    redirect_to("/posts")
  end

  # DBからデータを削除
  def destroy
    Post.find(params[:id]).delete
    redirect_to("/posts")
  end
end
