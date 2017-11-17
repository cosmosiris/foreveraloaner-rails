class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewee, class_name: "User"

  validate :valid_transaction

  def valid_transaction
    if self.role == "borrower"
      self.errors.add :base, "Cannot review someone you have not borrowed from" unless self.reviewer.users_loaned_from.include?(self.reviewee)
    else
      self.errors.add :base, "Cannot review someone you have not lent to" unless self.reviewer.users_loaned_to.include?(self.reviewee)
    end
  end
end