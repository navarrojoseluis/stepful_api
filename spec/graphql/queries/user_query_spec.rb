require 'rails_helper'

RSpec.describe Resolvers::UserResolver do
  let!(:student) { create(:user, :student) }
  let!(:coach) { create(:user, :coach) }
  let!(:query) do
    <<-GRAPHQL
        query($id: ID!) {
          user(id: $id){
            ... on Student {
                __typename
                id
            }
            ... on Coach {
                __typename
                id
            }
          }
        }
    GRAPHQL
  end

  context 'If student is requested' do
    subject(:result) do
      StepfulApiSchema.execute(
        query,
        variables: {
          "id": student.id
        }
      )
    end

    it 'returns the student' do
      user = result['data']['user']
      expect(user.to_h).to match(
        '__typename' => 'Student',
        'id' => student.id.to_s
      )
    end
  end

  context 'If coach is requested' do
    subject(:result) do
      StepfulApiSchema.execute(
        query,
        variables: {
          "id": coach.id
        }
      )
    end

    it 'returns the coach' do
      user = result['data']['user']
      expect(user.to_h).to match(
        '__typename' => 'Coach',
        'id' => coach.id.to_s
      )
    end
  end

  context 'If user does not exist' do
    subject(:result) do
      StepfulApiSchema.execute(
        query,
        variables: {
          "id": -1
        }
      )
    end

    it 'returns error' do
      expect(result['errors']).to be_present
    end
  end
end
