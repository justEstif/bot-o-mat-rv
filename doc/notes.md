# BOT-O-MAT

## Technologies

- Frontend: Pico CSS (CDN)
- Backend: Ruby on Rails
- Database: SQLite

## Features

- Multiple Robot Creation: Users can create multiple robots simultaneously using
  curl and an API route.
- Leaderboard: A leaderboard displays tasks completed by each robot.
- Robot-Specific Tasks: Robots must match the required type to receive credit
  for completing tasks.
- Entity Management: Users can edit and/or delete tasks and robots.
- Data Persistence: Tasks, robots, and leaderboard statistics are stored using
  SQLite.

## Why Ruby on Rails

- Web GUI
- CLI Interface: Supports a command-line interface.
- Data Persistence: Provides data storage with SQLite.
- Built-in supports for all features required for this app

## Initial Thought Process

Models

1. Robot

- Manages robot creation and task completion.
- Supports leaderboard functionality.

2. Task

- Describes tasks with specific durations and completion states.

## How to use

### API Example (Robot Creation)

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

- Archiving: Explore options for archiving or soft-deleting robots.
- UI Improvements: Enhance user interface design, utilize Rails flash for alert
  messages.
  - For example, showing which task a robot is currently working on. I found
    this (blog)[https://www.hotrails.dev/turbo-rails/flash-messages-hotwire]
    that explain how to go about it

## Note

- The duration required to complete task has been lowered for quicker response;
  please refer to complete_tasks method in tasks_controller
