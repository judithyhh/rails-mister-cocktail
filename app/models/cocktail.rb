class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy, inverse_of: :cocktail
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: { case_sensitive: true }
end
