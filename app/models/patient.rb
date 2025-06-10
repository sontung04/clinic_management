class Patient < ApplicationRecord
  belongs_to :user
  has_many :scedule

  enum gender: {
    male: 0,
    female: 1
  }

  validates :name, presence: true
  validates :gemder, presence: true
end
