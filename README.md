# BOT-O-MAT by Estifanos Beyene

## Technologies

- Frontend: Pico CSS (CDN)
- Backend: Ruby on Rails
- Database: SQLite

## How to use

### Prerequisites

- Ruby
- Rails
- Git

### Setting up application

- Note: since this is a private repository, cloning is limited to those with
  access

```bash
git clone https://github.com/justEstif/bot-o-mat-justEstif.git
cd bot-o-mat-justEstif
bundle install  # install dependencies
bin/rails db:migrate:reset # (optional) reset dev database
bin/rails db:migrate # run migrations
bin/rails db:seed # seed database with sample data
bin/rails server # start rails server
```

Go to http://localhost:3000

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

## Screenshots

## Features

- Multiple Robot Creation: Users can create multiple robots simultaneously using
  curl and an API route.
- Leaderboard: A leaderboard displays tasks completed by each robot.
- Robot-Specific Tasks: Robots must match the required type to receive credit
  for completing tasks.
- Entity Management: Users can edit and/or delete tasks and robots.
- Data Persistence: Tasks, robots, and leaderboard statistics are stored using
  SQLite.

## Note

- The duration required to complete task has been lowered for quicker response;
  please refer to complete_tasks method in tasks_controller

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

## Future Enhancements

- Archiving: Explore options for archiving or soft-deleting robots.
- UI Improvements: Enhance user interface design, utilize Rails flash for alert
  messages.
  - For example, showing which task a robot is currently working on. I found
    this [blog](https://www.hotrails.dev/turbo-rails/flash-messages-hotwire)
    that explain how to go about it
- More API routes for CLI
