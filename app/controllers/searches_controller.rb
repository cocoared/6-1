class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range] #検索モデルの情報を受け取っている
    if @range == "User"
      @users = User.looks(params[:search], params[:word])  #検索方法の情報を受け取っている
    else
      @books = Book.looks(params[:search], params[:word])  #検索ワードの情報を受け取っている
    end
  end
end
