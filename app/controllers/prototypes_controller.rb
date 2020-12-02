class PrototypesController < ApplicationController
  # ログインしていないユーザーをログインページへ
  before_action :authenticate_user!, only: %i[create edit update destroy]

  def index
    @prototype = Prototype.all
  end

  def new
    # prototypeの新しいインスタンスを作成
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(proto_params) # params の値をチェック

    # saveに成功した場合 root_path へ
    if @prototype.save
      redirect_to root_path

    # 失敗した場合は :new を再描画
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    redirect_to root_path unless user_signed_in? && current_user.id == @prototype.user.id
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(proto_params)
      redirect_to prototype_path(prototype.id)
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    redirect_to root_path if prototype.destroy
  end

  private

  def proto_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
