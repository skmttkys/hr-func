class UserController < ApplicationController
  # DBにデータを追加する
  def user_create
    @post = Post.create(:uuid => params[:uuid], :content => params[:content])
    # 登録に成功/失敗の結果を表示する
    if @post.uuid.match(/\A[ｧ-ﾝﾞﾟ]+\z/) && @post.content.match(/\A[ｧ-ﾝﾞﾟ]+\z/)
      flash[:success] = "ユーザー登録に成功しました！"
      redirect_to("/posts")
    else
      flash[:alert] = "ユーザー登録に失敗しました…"
      redirect_to("/posts")
    end
  end
  # DBからデータを削除する
  def user_destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to("/posts")
  end
end