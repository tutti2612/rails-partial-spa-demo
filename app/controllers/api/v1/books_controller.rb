module Api
  module V1
    class BooksController < ApplicationController
      before_action :set_book, only: %i[ show update destroy ]

      def index
        render json: Book.all
      end

      def show
        render json: @book
      end

      def update
        if @book.update(book_params)
          render json: @book
        else
          render json: @book.errors
        end
      end

      private

      def set_book
        @book = Book.find(params[:id])
      end

      def book_params
        params.require(:book).permit(:title)
      end
    end
  end
end