# == Schema Information
#
# Table name: chats
#
#  id         :bigint           not null, primary key
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chat < ApplicationRecord
end
