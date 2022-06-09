class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    if @book_comment.save
      flash.now[:notice] = 'コメントを投稿しました'
      render 'book_comments/comments'  #render先にjsファイルを指定
    else
      @user = User.find_by(id: @book.user_id) #books/showページで表示するユーザーのid
      # render template: "books/show"
      render :error #render先にjsファイルを指定
    end
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    BookComment.find(params[:id]).destroy
    flash.now[:alert] = '投稿を削除しました'
    render 'book_comments/comments'  #render先にjsファイルを指定
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
