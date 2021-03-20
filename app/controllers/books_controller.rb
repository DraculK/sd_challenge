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
            redirect_to show_book_path, notice: 'Alterações feitas com sucesso!'
        rescue StandardError => e
            redirect_to edit_book_path, warning: "Não foi possível editar o livro"
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
            redirect_to root_path, notice: "Livro adicionado ao catálogo."
        rescue StandardError => e 
            redirect_to new_book_path, alert: "O livro não foi criado"
        end
    end

    private
    def book_params
        params.require(:book).permit(:title, :author, :year, :description, :image, :file, :category_id)
    end

    def find_book
        @book = Book.find(params[:id])
    end
end
