# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  author     :string
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chat_id    :bigint           not null
#
# Indexes
#
#  index_messages_on_chat_id  (chat_id)
#
# Foreign Keys
#
#  fk_rails_...  (chat_id => chats.id)
#
class Message < ApplicationRecord
  belongs_to :chat

  after_create_commit -> { broadcast_refresh_to chat }
  after_update_commit -> { broadcast_refresh_to chat }
  after_destroy_commit -> { broadcast_refresh_to chat }
end
