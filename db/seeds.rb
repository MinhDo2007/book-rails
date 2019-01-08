p "Migrate data"
Rake::Task["db:drop"].invoke
Rake::Task["db:create"].invoke
Rake::Task["db:migrate"].invoke

p "Create User"
User.create! name: "admin", password: "123456789", password_confirmation: "123456789", admin: true
User.create! name: "normal", password: "123456789", password_confirmation: "123456789", admin: false

p "Create Book"

Book.transaction do
  (1..30).each do |i|
    Book.create! name: "Book-#{i}", author: "Author-#{i}", description: "Description-#{i}", price: i
  end
end

p "Create User Book"
books = Book.all
users = User.all
UserBook.transaction do |i|
  (1..20).each do |i|
    UserBook.create! user: users.sample, book: books.sample
  end
end

p "Create Notification"
user_books = UserBook.all
Notification.transaction do |i|
  (1..3).each do |i|
    Notification.transaction do
      Notification.create! user_book: user_books.sample, status: [true, false].sample
    end
  end
end
