class Group < ApplicationRecord
  validates_presence_of :name
  belongs_to :user
  has_many :groupings, foreign_key: :group_id
  has_many :projects, through: :groupings

  has_attached_file :icon, styles: { medium: "300x300>", thumb: "200x200>" }, default_url: "../images/missing.png"
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\z/

  scope :all_projects, -> (group) { Project.where('group_id = ?', group.id) }
end
