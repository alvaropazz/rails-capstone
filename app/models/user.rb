class User < ApplicationRecord
  has_many :projects, foreign_key: 'author_id', dependent: :destroy
  has_many :groups, through: :projects

  def all_projects
    projects.includes(:groups).select {|s|s.groups.any?}
  end

  def external_projects
    projects.includes(:groups).reject {|s|s.groups.any?}
  end
end
