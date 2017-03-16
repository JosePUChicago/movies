class AddFriendRequestsRecievedCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :friend_requests_recieved_count, :integer
  end
end
