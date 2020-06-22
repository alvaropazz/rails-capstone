class Project < ApplicationRecord
  belongs_to :user, optional: true
  has_many :groupings, dependent: :destroy
  has_many :groups, through: :groupings

  def self.creator(event)
    User.where(id: project.author_id).first
  end
end
