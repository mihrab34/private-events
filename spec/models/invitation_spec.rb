Rspec.describe Invitation, type: :model do
  context 'associations' do
    it { should belong_to(:attendee).with_foreign_key(:attendee_id).class_name('User') }
    it { should belong_to(:attended_event).with_foreign_key(:attended_event_id).class_name('Event') }
  end
end
