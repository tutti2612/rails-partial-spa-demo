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

      private

      def set_book
        @book = Book.find(params[:id])
      end
    end
  end
end