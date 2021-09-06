class Shift < ApplicationRecord
    enum day: { sunday: 0, monday: 1,  tuesday:2, wednesday:3, thursday: 4, friday:5, saturday:6  }
    belongs_to :member
    validates_uniqueness_of :day, scope: :member
    after_create :send_email

    def send_email
        members_of_team = self.member.team.members
        shifts_added = members_of_team.all?{|member| member.shifts.count==7}
        return unless shifts_added
        ShiftMailer.with(team: self.member.team).shift_email.deliver_now
    end

    validate :timing_requirements_are_met
    def timing_requirements_are_met
          errors.add(:start_time, "Start Time Must Be Less Than End Time" ) if !start_time.present? || !end_time.present? || start_time >= end_time
    end
end
