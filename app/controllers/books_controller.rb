class BooksController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all
  end
  
  def show
    @book = Book.find(params[:id])
    @user = User.find_by(id: @book.user_id) #books/showページで表示するユーザーのid
    @book_comment = BookComment.new
  end
  
  def edit
    @book = Book.find(params[:id])
    @books = Book.all
    unless @book.user == current_user
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    
    if @book.save
    #詳細画面へリダイレクト
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
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
    else
      #一覧画面を表示、エラーメッセージを出したい
      render :index
    end
  end
  
  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    
    if @book.destroy  # データ（レコード）を削除
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path  # 投稿一覧画面へリダイレクト
    end
  end
  
  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end