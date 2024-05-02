# BOT-O-MAT

## Features

## How to use

## Technologies

- Frontend: Pico CSS (CDN)
- Backend: Ruby on Rails
- Database: SQLite

## Why Ruby on Rails

I chose to use Ruby on Rails for my project, considering the various features I
wanted to implement:

- Web GUI: I needed a robust web application interface.
- CLI Interface: It was important to have a command-line interface to interact
  with the application.
- Data Persistence: I required data storage and management with a database.

Given these requirements, Ruby on Rails appeared to be the more effective choice
for several reasons:

- Unified Project Setup: With Rails, I could set up both the web app and API
  routes within the same project.
- Built-in ORM: Rails provides an integrated Object-Relational Mapping (ORM)
  system, saving time on setup and database interactions.
- Extensive Documentation: Rails has comprehensive documentation and is
  well-supported, making it easier to expand the app's features as needed.
- Reduced Dependency on Third-Party Libraries: Using JavaScript frameworks like
  React or Svelte would have necessitated integrating numerous third-party
  libraries. For instance, persisting data in JavaScript would typically require
  managing cookies. Additionally, creating API routes would involve using a
  meta-framework like Next.js or SvelteKit to handle both the API endpoints and
  the web application.

The implementation is up to you: it can be a command-line application or have a
graphical interface.

- It will be a web app(graphical interface) and command line interface using
  CURL

Your application should collect a name and robot type from the types we list
below.

1. The application collect a name and a predefined robot type

- the robot types are predefined

2. For each, it should create a Robot of the type the user chooses, e.g. Larry,
   Bipedal.

- there will be a new robot page, with a name and robot type

3. Given the list of tasks below, your application should then assign the Robot
   a set of five tasks. All of which complete after a duration that we show in
   milliseconds.

- For the sake of development, the wait time has been decreased.

4. The tasks are removed from the list when they are done

- Collect a name and robot type from user.
- Instantiate a Robot of the type provided by the user with the name provided by
  the user
  - for example: Bipedal, Larry
- Set up methods on Robot to complete tasks from the provided list

- The tasks are marked as completed

---

## Initial Thought process

What do we need?

Two models:

1. Robot
   - name
   - type
2. Tasks

- description
- eta
- completed

- Later, I introduced robot_type model, and added helper functions in the robot
  model for leaderboard, and if it can complete a task

## Robot

Robot completes tasks and removes them from the list when they are done (i.e.
enough time has passed since starting the task).

## Tasks

Tasks have a description and an estimated time to complete.

```json
[
  {
    "description": "do the dishes",
    "eta": 1000
  },
  {
    "description": "sweep the house",
    "eta": 3000
  },
  {
    "description": "do the laundry",
    "eta": 10000
  },
  {
    "description": "take out the recycling",
    "eta": 4000
  },
  {
    "description": "make a sammich",
    "eta": 7000
  },
  {
    "description": "mow the lawn",
    "eta": 20000
  },
  {
    "description": "rake the leaves",
    "eta": 18000
  },
  {
    "description": "give the dog a bath",
    "eta": 14500
  },
  {
    "description": "bake some cookies",
    "eta": 8000
  },
  {
    "description": "wash the car",
    "eta": 20000
  }
]
```

- [x] Allow users to create multiple robots at one time
  - user are able to create robots using curl and an api route
- [x] Create a leaderboard for tasks completed by each Robot
- [x] Create tasks specific for each robot type, this could work in conjunction
      with the leaderboard. For e.g. robots that are assigned tasks that their
      type can’t perform won’t get “credit” for finishing the task.
  - if a robot is assigned a task with out a robot type defined, it should be
    able to perform it
  - else if the task has a robot type, the robot is only able to perform it if
    it is the same robot type
  - [x] add an optional robot_type to tasks, and if the robots are assigned the
        task the won't be able to finish it
- allow editing/reassigning tasks
- allow deleting tasks/robots

- Add persistance for tasks, bots and leaderboard stats i'm using sqlite to
  persist the task, bots and leaderboard stats
  - [x] task
  - [x] bots
  - [x] leaderboard

## API Example (Robot Creation)

```bash
curl -X POST http://localhost:3000/api/robots \
-H 'Content-Type: application/json' -d '[
    {
        "name": "Robot A",
        "robot_type_id": 1
    },
    {
        "name": "Robot B",
        "robot_type_id": 2
    },
    {
        "name": "Robot C",
        "robot_type_id": 1
    }
]'
```

## Future Enhancements

- Explore options for archiving or soft-deleting robots instead of permanent
  removal.

- Improve user interface design, specifically the use of rails flash for alert
  messages

---

## Types

```
{
  UNIPEDAL: 'Unipedal',
  BIPEDAL: 'Bipedal',
  QUADRUPEDAL: 'Quadrupedal',
  ARACHNID: 'Arachnid',
  RADIAL: 'Radial',
  AERONAUTICAL: 'Aeronautical'
}
```
