class AddAllowToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_column :invitations, :allow_id, :integer
  end
end
