class User < ApplicationRecord
  has_many :projects, foreign_key: 'author_id', dependent: :destroy
  has_many :groups, through: :projects

  def grouped
    projects.includes(:groups)
  end

  def all_projects
    grouped.select {|s|s.groups.any?}
  end

  def all_projects_total
  end

  def external_projects
    grouped.reject {|s|s.groups.any?}
  end

  def external_projects_total
    external_projects.sum(:amount)
  end 
end
