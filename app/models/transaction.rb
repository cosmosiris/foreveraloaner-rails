class Transaction < ApplicationRecord
  belongs_to :borrower, class_name: "User"
  belongs_to :post
end