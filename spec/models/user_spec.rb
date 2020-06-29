require 'rails_helper'

RSpec.describe User, type: :model do
  it 'returns false if not valid' do
    u = User.new
    expect(u.save).to eql(false)
  end

  it 'returns true if valid entry' do
    u = User.create(name: 'Harry')
    expect(u.name).to eql('Harry')
  end

  it 'should have many projects' do
    t = User.reflect_on_association(:projects).macro
    expect(t).to eq(:has_many)
  end
end
