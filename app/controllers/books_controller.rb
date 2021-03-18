class BooksController < ApplicationController
before_action :find_book, only: [:show, :edit, :update, :destroy]

    def index 
        @books = Book.all.order("created_at DESC")
    end

    def show
    end

    def new
        @book = Book.new
        @categories = Category.all.map{ |c| [c.name, c.id]}
        redirect_to root_path, warning: "Sem autorização!" unless admin?
    end

    def edit
        @categories = Category.all.map{ |c| [c.name, c.id]}
        redirect_to root_path, warning: "Sem autorização!" unless admin?
    end

    def update
        book = Book.find(params[:id])
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
        redirect_to root_path, warning: "Sem autorização!" unless admin?
    end

    def create 
        @book = Book.new(book_params)
        @book.category_id = params[:category_id]
        begin
            @book.save!
            flash[:succes] = "Livro adicionado ao catálogo."
            redirect_to root_path
        rescue StandardError => e 
            flash[:error] = "Azedou."
            redirect_to root_path
        end
    end

    private
    def book_params
        params.require(:book).permit(:title, :author, :year, :description, :image, :category_id)
    end

    def find_book
        @book = Book.find(params[:id])
    end
end
