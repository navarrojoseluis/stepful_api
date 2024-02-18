# STEPFUL API

## Getting started

### Prerequisites

```
Ruby 3.2.2
Rails 7.1.3
```

Install Postgres or use the provided `docker-compose.yml` file to run the database:

```sh
docker-compose up -d
```

Install dependencies

```sh
bundle install
```

Create the database, run migrations, and seed data.
Ensure that database credentials are correct in the `database.yml` file.

```sh
bundle exec rails db:setup
```

## Running the Application

The application will run on port 3000.

```sh
bundle exec rails s
```

## Linting
Run RuboCop for linting:

```sh
bundle exec rubocop
```

## Testing
Execute RSpec tests:

```sh
bundle exec rspec --format documentation
```

## GraphQL API

The GraphQL API endpoint is located at:
```
POST http://localhost:3000/graphql
```
You can use tools like [Postman](https://www.postman.com/) to easily explore and test the API.

### Get User Query 

This query retrieves detailed user information, including schedules and related data. It supports both Coach and Student types, allowing you to fetch information such as names, schedules, and associated students or coaches based on the user's role.

```
POST http://localhost:3000/graphql

query UserQuery($id: ID!) {
  user(id: $id) {
    ... on Coach {
        __typename
        id
        name
        schedule {
          id
          startTime
          endTime
          rate
          note
          student {
            id
            name
          }
        }
    }
   ... on Student {
        __typename
        id
        name
        schedule {
          id
          startTime
          endTime
          coach {
            id
            name
          }
        }
        availableTimes {
          id
          startTime
          endTime
          coach {
            id
            name
          }
        }
    }
  }
}

Variables:
{
    "id": {USER_ID: ID}
}

```

### Create Slot Mutation

This mutation creates a new time slot for a coach. Provide the coach's ID and the desired start time in the specified format (YYYY-MM-DDThh:mm:ssZ).

```
POST http://localhost:3000/graphql

mutation CreateSlot($input: CreateSlotMutationInput!) {
  createSlot(input: $input) {
    slot {
      id
    }
    error
  }
}

Variables:
{
  "input": {
    "coachId": {USER_ID: ID},
    "startTime": "YYYY-MM-DDThh:mm:ssZ"
  }
}
```

### Update Slot Mutation

This mutation updates an existing time slot, linking it to a student and providing a satisfaction rating and notes. Specify the slot ID, and optionally, the student ID, satisfaction rating, and notes.

```
POST http://localhost:3000/graphql

mutation UpdateSlot($input: UpdateSlotMutationInput!) {
  updateSlot(input: $input) {
    slot {
      id
    }
    error
  }
}

Variables:
{
  "input": {
      "id": {SLOT_ID:ID},
      "studentId": {USER_ID: ID},
      "rate": {USER_SATISFACTION: NUMBER},
      "note": {NOTE: STRING}
  } 
}
```
