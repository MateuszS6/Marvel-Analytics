# Marvel Analytics

Welcome to the Marvel Analytics, a comprehensive MySQL database crafted for the IN1013 Databases coursework. This repository contains structured data about Marvel _projects_, _timelines_, and _characters_, designed to facilitate the exploration and sorting of information related to Marvel movies, their release sequences, timeline orders, and the appearances of various characters in these projects.

> [!NOTE]
> _The codebase and structure has now been improved and cleaned up, and updated to utilise Docker. Please feel free to try it for yourself. I will be developing a new project which will be a visual platform for editing and viewing your own database of Marvel timelines. Stay tuned!_

## Coursework Details

- **Course**: IN1013 Databases
- **Institution**: City, University of London
- **Term**: Winter 2022

## Features

- **Project Listings**: Access detailed records of Marvel movies and series, including titles, release years, and box office earnings.
- **Character Insights**: Explore which characters appear in each project and track their status across the Marvel universe.
- **Timeline Ordering**: View projects organized by their timeline within the Marvel Cinematic Universe, providing a chronological understanding of the storyline.
- **Advanced Search Capabilities**: Utilize complex SQL queries to filter, sort, and retrieve specific data points across multiple tables.

## Tech Stack

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Docker](https://img.shields.io/badge/DOcker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![phpMyAdmin](https://img.shields.io/badge/phpMyAdmin-6C78AF?style=for-the-badge&logo=phpmyadmin&logoColor=white)
![Visual Paradigm](https://img.shields.io/badge/Visual_Paradigm-CC3333?style=for-the-badge&logo=visualparadigm&logoColor=white)

## Screenshots

### Projects Table

![projects-table](readme-images/projects-table.PNG)

This screenshot displays the 'Projects' table from the Marvel Database, showcasing a detailed view of various Marvel projects such as movies and series. The table includes critical information such as the title, release year, box office earnings, and timeline order. This view helps users quickly understand the scope and details of each project within the Marvel Cinematic Universe, illustrating the database's capability to organize and present complex data efficiently.

### ER Diagram

![er-diagram](readme-images/er-diagram.jpg)

This image presents the Entity-Relationship (ER) diagram of the Marvel Database, highlighting the structured relationships between different entities such as Studios, Projects, Characters, and Crew Members. The diagram provides a clear overview of how the tables are interconnected, making it easier for developers and database administrators to understand the data model and relationships underlying the database architecture. It serves as an essential visual aid for those looking to extend, modify, or query the database.

## Learning Outcomes

Through the development of the Marvel Database, I have achieved the following learning outcomes:

- **Expanded SQL Knowledge**: Enhanced proficiency in SQL, including queries for data manipulation and retrieval.
- **Advanced Database Concepts**: Gained insights into advanced database structures and relationships. Learned how to create robust Entity-Relationship (ER) diagrams using Visual Paradigm, which improved my ability to visually represent and design complex database schemas.
- **Data Manipulation**: Mastered the skills to create, insert, update, and delete tables, as well as how to manage views within a MySQL environment.
- **Complex Queries**: Developed the ability to construct and execute complex SQL queries that integrate multiple aspects of database interaction.


## How to Use

### Prerequisites

Make sure you have [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running.

### Setup

1. Clone the repository:

    ```bash
    git clone <repository-url>
    cd <repository-folder>
    ```

2. Create a .env file in the project root and add the required MySQL passwords:

    ```env
    MYSQL_ROOT_PASSWORD=your_root_password
    MYSQL_PASSWORD=your_password
    ```

3. Build and start the database:

    ```bash
    docker compose up -d
    ```

Docker will create the MySQL database and automatically run the schema, seed and view SQL files in the correct order.

### Accessing the Database

phpMyAdmin is available at:

`http://localhost:8080`

Log in using:

- Server: `mysql`
- Username: `marvel_user`
- Password: the value of `MYSQL_PASSWORD` in your `.env` file

The MySQL database is also available directly on port 3306.

### Rebuilding the Database

During development, the database can be rebuilt from the SQL files with:

```bash
docker compose down -v
docker compose up -d
```

This removes the existing database data and recreates it from the current schema and seed files.

To simply stop the containers without resetting the database:

```bash
docker compose down
```