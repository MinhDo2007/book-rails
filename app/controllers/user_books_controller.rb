class UserBooksController < ApplicationController
  def create
    user_book = UserBook.new(user_book_params)
    if user_book.save
      ActionCable.server.broadcast "notification_channel",
        notification: "123456"
      head :ok
    else
      render json: {status: :false}
    end
  end

  def index
  end

  private
  def user_book_params
    params.require(:user_book).permit(:user_id, :book_id)
  end
end
