class BooksController < ApplicationController

  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.text
      format.json do
        render json: @books.map {|book|
          {title: book.title,
            author: book.author
          }
        }
      end
      format.csv do
        render plain: Book.generate_csv(@books)
      end
    end
  end
end
