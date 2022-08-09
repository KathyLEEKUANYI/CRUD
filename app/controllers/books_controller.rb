class BooksController < ApplicationController

  before_action :findbook, only: [:show,:edit,:update,:destroy]
	#在每個ａｃｔｉｏｎ做事之前先做這個,常用於設定共通的方法

	def index
    @book = Book.all
	end

	def new
    @book = Book.new
	end

  def create
    @book = Book.new(clean)
		if @book.save
			redirect_to "/books"
		else
			render "books/new"
	  end
  end

	def show
	end

	def edit
	end

	def update

		if @book.update(clean)
			redirect_to "/books"
		else
			render :edit
		end
	end

	def destroy

		@book.delete
		redirect_to "/books"
	end

	private

	def clean
    params.require(:book).permit(:title, :content, :price)
	end

	def findbook
    @book = Book.find( params[:id])
	end

end
