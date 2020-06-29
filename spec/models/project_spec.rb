require 'rails_helper'

RSpec.describe Project, type: :model do
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
end
