class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @profile_image = @user.profile_image
    # @books = Book.find_by(id: @user.book_id)
    @books = Book.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    @users = User.all
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def create

    @books = Book.all
    #データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    #データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    #詳細画面へリダイレクト
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
      #一覧画面を表示、エラーメッセージを出したい
    else
      render template: 'books/index'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
