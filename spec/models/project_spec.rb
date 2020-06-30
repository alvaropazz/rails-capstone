require 'rails_helper'

RSpec.describe Project, type: :model do
  let!(:user) { User.create(name: 'Harry') }
  let!(:group) { Group.create(name: 'Group', user_id: User.where(name: 'Harry').first.id) }
  let!(:project_1) do
    Project.create(name: 'Project',
                   group_id: Group.where(name: 'Group').first.id, author_id: User.where(name: 'Harry').first.id)
  end

  it 'returns false if not valid' do
    u = Project.new
    expect(u.save).to eql(false)
  end

  it 'returns true if valid entry' do
    u = Project.create(name: 'Studying')
    expect(u.name).to eql('Studying')
  end

  it 'should belong to user' do
    t = Project.reflect_on_association(:author).macro
    expect(t).to eq(:belongs_to)
  end

  it 'should have a group' do
    t = Project.has_group.name
    expect(t).to eq('Project')
  end
end
