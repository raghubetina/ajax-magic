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
  after_create :update_subject

  has_many :messages, dependent: :destroy

  def update_subject
    if subject.blank?
      update(subject: "Chat ##{id}")
    end
  end
end
