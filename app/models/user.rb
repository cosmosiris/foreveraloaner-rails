class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :username

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

  has_many :transactions, foreign_key: :borrower_id
  has_many :posts, foreign_key: :loaner_id

  validates :first_name, :last_name, presence: true

  acts_as_messageable

  def name
    "#{user_name}"
  end

  def mailboxer_email(object)
    nil
  end
end
