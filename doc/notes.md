# BOT-O-MAT

Use any language to complete this challenge.

- I will be using Ruby(on Rails)

The implementation is up to you: it can be a command-line application or have a
graphical interface.

- It will be a web app(graphical interface) and, if time allows, REST API routes
  with support for CLI using curl

Your application should collect a name and robot type from the types we list
below.

1. The application should collect a new and robot type

- the robot types are predefined

2. For each, it should create a Robot of the type the user chooses, e.g. Larry,
   Bipedal.

- there will be a new robot page, with a name and robot type

3. Given the list of tasks below, your application should then assign the Robot
   a set of five tasks. All of which complete after a duration that we show in
   milliseconds.

4. The tasks are removed from the list when they are done

- Collect a name and robot type from user.
- Instantiate a Robot of the type provided by the user with the name provided by
  the user
  - for example: Bipedal, Larry
- Set up methods on Robot to complete tasks from the provided list

---

What do we need?

Two models:

1. Robot
   - name
   - type
2. Tasks

- description
- eta
- completed

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

## Features to add once the core functionality is complete

Be creative and have fun! Use this list or create your own features.

- Allow users to create multiple robots at one time
- Create a leaderboard for tasks completed by each Robot
- Create tasks specific for each robot type, this could work in conjunction with
  the leaderboard. For e.g. robots that are assigned tasks that their type can’t
  perform won’t get “credit” for finishing the task.
- Add persistance for tasks, bots and leaderboard stats

## Privacy Guidelines

Due to the creative nature of this project, please do not post the prompt or
your solution publicly. Feel free to privately fork it to your personal GitHub
or download it for future reference, as this workspace is cleared every few
months.

## Authors

- Scott Hoffman <https://github.com/scottshane>
- Olivia Osby <https://github.com/oosby>
