require 'rails_helper'

RSpec.describe Mutations::CreateSlotMutation do
  let!(:start_time) { Time.now.utc.strftime('%Y-%m-%dT%H:%M:%SZ') }
  let!(:mutation) do
    <<-GRAPHQL
      mutation CreateSlot($input: CreateSlotMutationInput!) {
        createSlot(input: $input) {
          slot {
            id
          }
          error
        }
      }
    GRAPHQL
  end

  context 'if coach exists' do
    let!(:coach) { create(:user, :coach) }

    subject(:result) do
      StepfulApiSchema.execute(
        mutation,
        variables:
        {
          "input": {
            "coachId": coach.id,
            "startTime": start_time
          }
        }
      )
    end

    it 'creates the slot' do
      expect { subject }.to change(Slot, :count).by(1)
    end
  end

  context 'if coach does not exist' do
    subject(:result) do
      StepfulApiSchema.execute(
        mutation,
        variables:
        {
          "input": {
            "coachId": -1,
            "startTime": start_time
          }
        }
      )
    end

    it 'does not create the slot' do
      expect { subject }.to change(Slot, :count).by(0)
    end

    it 'returns the error' do
      error = result['data']['createSlot']['error']
      expect(error).not_to be_nil
    end
  end
end
