class Attendance < ApplicationRecord
  belongs_to :user
  validates :worked_on, presence: true
  validate :finished_at_cannot_be_in_the_past_started_at,
    :finished_at_cannot_config_none_started_at
  
  def finished_at_cannot_be_in_the_past_started_at
    if started_at.present? && finished_at.present? && finished_at < started_at
      errors.add(:finished_at, "退勤時間を出勤時間よりも前に設定できません。")
    end
  end
  
  def finished_at_cannot_config_none_started_at
    if started_at.blank? && finished_at.present?
      errors.add(:finished_at, "退勤時間だけを登録することはできません。")
    end
  end
end
