class User < ApplicationRecord
  # Direct associations

  has_many   :interests,
             :class_name => "MovieWatchlist",
             :dependent => :destroy

  has_many   :friend_requests_recieved,
             :class_name => "FriendRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :friend_requests_sent,
             :class_name => "FriendRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :followers,
             :through => :friend_requests_recieved,
             :source => :sender

  has_many   :following,
             :through => :friend_requests_sent,
             :source => :recipient

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
