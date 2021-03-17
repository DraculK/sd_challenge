class BooksController < ApplicationController
before_action :find_book, only: [:show, :edit, :update, :destroy]

    def index 
        @books = Book.all.order("created_at DESC")
    end

    def show
    end

    def new
        @book = Book.new
    end

    def edit
    end

    def update
        begin
            @book.update!(book_params)
            flash[:success] = 'Alterações feitas com sucesso!'
            redirect_to show_book_path
        rescue StandardError => e
            flash[:error] = e.message
            redirect_to edit_book_path
        end
    end

    def destroy
        @book.destroy
        redirect_to root_path
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

    def find_book
        @book = Book.find(params[:id])
    end
end
