# Rails Project with Docker Compose

This is a Rails project template that utilizes Docker Compose for easy setup and deployment. It includes PostgreSQL as the database and Prometheus for monitoring.

## Dependencies

- Docker "25.0.2"

## Installation

1. Clone this repository:

`git clone <repository-url>`

2. Navigate to the project directory:

`cd /menu`

3. Build the Docker containers:

`docker-compose build`

## Running the Application

1. Start the Docker containers:

`docker compose up`

2. Run migrations

`docker exec -it <Name of rails container running> rails db:migrate`

If there is a new migration created, it is needed to update the schema with the next command.

`docker cp menu-web-1:/menu/app/db/schema.rb ./db/schema.rb`

3. Update schema locally

`docker cp <Name of rails container running>:/menu/app/db/schema.rb ./db/schema.rb`

4. Access the Rails application in your web browser at `http://localhost:3000`.

## Monitoring with Prometheus

1. Prometheus is configured to scrape metrics from the Rails application. You can access the Prometheus dashboard at `http://localhost:9090`.

2. You can configure alerts and graphs based on the collected metrics.

## Run tests

1. Ensure db test is up and updated.

2. Run command for testing.

`docker exec -it ${rails container name} rails test`

## Stopping the Application

To stop the application and shut down the Docker containers, press `Ctrl + C` in the terminal where *docker compose up* is running.
