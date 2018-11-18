class ListController < ApplicationController
  
  # destroyアクションを追加する
  before_action :set_list, only: %i(edit update destroy)
  
  def new
    # ここに追加する
    @list = List.new
  end

  # ==========ここから編集する==========
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
      @list.valid?
      render action: :new
    end
  end
  
    # ==========このから追加する==========
  # @listインスタンス変数の定義は削除する
  def edit
  end
  # ==========このまで追加する==========
  
    # ==========ここから追加する==========
  # @listインスタンス変数の定義は削除する
  def update
    if @list.update_attributes(list_params)
      redirect_to :root
    else
      @list.valid?
      render action: :edit
    end
  end
  # ==========ここまで追加する==========
  
    # ==========このから追加する==========
  def destroy
    @list.destroy
    redirect_to :root
  end
  # ==========このまで追加する==========

  private
    def list_params
      params.require(:list).permit(:title).merge(user: current_user)
    end
  # ==========ここまで編集する==========
      # ここにメソッドを追加する
    def set_list
      @list = List.find_by(id: params[:id])
    end
  
end
