class BooksController < ApplicationController

    def index 
        @books = Book.all.order("created_at DESC")
    end

    def new
        @book = Book.new
    end

    def edit
    end

    def create 
        @book = Book.new(book_params)
        begin
            @book.save!
            flash[:succes] = "Livro adicionado ao catálogo."
            redirect_to root_path
        rescue StandardError => e 
            flash[:error] = "Azedou."
            redirect_to root_path
        end
    end

    def update
        
    end

    private
    def book_params
        params.require(:book).permit(:title, :author, :year, :description)
    end
end
