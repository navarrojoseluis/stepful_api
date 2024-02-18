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
  end
end
