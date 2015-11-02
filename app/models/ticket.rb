class Ticket < ActiveRecord::Base
  validates :title, presence: {message: "Subject can't be blank!"}
  validates :created_by_email, presence: {message: "Email can't be blank!"}
  validates :created_by, presence: {message: "You must enter your name!"}
  validates :body, presence: {message: "You must enter a ticket!"}
end
