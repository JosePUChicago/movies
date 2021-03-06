class FriendRequest < ApplicationRecord
  # Direct associations

  belongs_to :recipient,
             :class_name => "User", :foreign_key=> "recipient_id",
             :counter_cache => :friend_requests_recieved_count

  belongs_to :sender,
             :class_name => "User", :foreign_key=> "sender_id",
             :counter_cache => :friend_requests_sent_count

  # Indirect associations

  # Validations

end
