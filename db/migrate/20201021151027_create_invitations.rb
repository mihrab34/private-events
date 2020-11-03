class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.integer :attended_event_id
      t.integer :attendee_id

      t.timestamps
    end
  end
end
