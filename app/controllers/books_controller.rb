class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = @book.user
    @comment = Comment.new
    @comments = @book.comments
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      render "index"
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
    else
    redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to books_path
  end

   # フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end


  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  # フォローしているか判定する処理
  def follows?(user)
    follows.include?(user)
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
