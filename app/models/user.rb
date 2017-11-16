class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :username

  has_many :reviews, foreign_key: :reviewee_id

  # reviews written as the loaner
  has_many :written_loaner_reviews, -> { where(role: "loaner") }, class_name: "Review", foreign_key: :reviewer_id
  has_many :reviewed_borrowers, through: :written_loaner_reviews, source: :reviewee

  # reviews written as the borrower
  has_many :written_borrower_reviews, -> { where(role: "borrower") }, class_name: "Review", foreign_key: :reviewer_id
  has_many :reviewed_loaners, through: :written_borrower_reviews, source: :reviewee

  #reviews received as the loaner
  has_many :received_loaner_reviews, -> { where(role: "borrower") }, class_name: "Review", foreign_key: :reviewee_id
  has_many :borrower_reviewers, through: :received_loaner_reviews, source: :reviewer

  # reviews received as the borrower
  has_many :received_borrower_reviews, -> { where(role: "loaner") }, class_name: :Review, foreign_key: :reviewee_id
  has_many :loaner_reviewers, through: :received_borrower_reviews, source: :reviewer

  # associations for borrowing an item
  has_many :borrower_transactions, class_name: "Transaction", foreign_key: :borrower_id
  has_many :borrowed_posts, through: :borrower_transactions, source: :post
  has_many :users_loaned_from, through: :borrowed_posts, source: :loaner

  # associations for loaning an item
  has_many :posts, foreign_key: :loaner_id
  has_many :loaner_transactions, through: :posts, source: :transactions
  has_many :users_loaned_to, through: :loaner_transactions, source: :borrower

  validates :first_name, :last_name, :user_name, :email, :password,presence: true

  acts_as_messageable

  # TODO: write two methods: borrower_rating and loaner_rating, which averages the overall ratings received by an user
  # Write tests for said methods
  def name
    "#{user_name}"
  end

  def mailboxer_email(object)
    nil
  end


  def average_rating
    total = 0
    self.reviews.each do |review|
      total += review.rating
    end
    if self.reviews.length == 0
      return total / 1
    else
      return total / self.reviews.length
    end
  end

end
