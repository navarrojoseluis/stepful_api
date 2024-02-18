# frozen_string_literal: true

module SlotManagement
  class SlotService < ApplicationService
    def create_slot(coach_id, start_time)
      raise StandardError, 'Invalid Start Time' unless start_time.present?

      begin
        coach = Coach.find(coach_id)
      rescue ActiveRecord::RecordNotFound
        raise StandardError, 'Coach not found'
      end

      end_time = start_time + 2.hours

      # TODO: Check for collisions
      # raise StandardError.new "Invalid slot" if !slot_valid?

      Slot.create!(start_time:, end_time:, coach:)
    end

    def update_slot(id, student_id = nil, rate = nil, note = nil)
      begin
        slot = Slot.find(id)
      rescue ActiveRecord::RecordNotFound
        raise StandardError, 'Slot not found'
      end

      if student_id.present?
        begin
          student = Student.find(student_id)
          slot.student = student
        rescue ActiveRecord::RecordNotFound
          raise StandardError, 'Student not found'
        end
      end

      slot.rate = rate if rate.present?
      slot.note = note if note.present?

      slot.save!

      slot
    end
  end
end
