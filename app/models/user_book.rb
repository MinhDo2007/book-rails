class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_one :notification
  after_create :create_notification

  def create_notification
    Notification.create! user_book_id: self.id
  end
end
