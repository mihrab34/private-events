require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:events).with_foreign_key('creator_id') }
    it { should have_many(:invitations).with_foreign_key('attendee_id') }
    it { should have_many(:attended_events).through(:invitations).source(:attended_event) }
  end

  describe 'validations' do
    subject { User.create(name: 'name') }

    it { should validate_presence_of(:name) }
  end
end
