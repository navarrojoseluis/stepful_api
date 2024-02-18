module Types
  class UserType < Types::BaseUnion
    possible_types CoachType, StudentType

    def self.resolve_type(object, _context)
      case object.type
      when 'Coach'
        Types::CoachType
      when 'Student'
        Types::StudentType
      end
    end
  end
end
