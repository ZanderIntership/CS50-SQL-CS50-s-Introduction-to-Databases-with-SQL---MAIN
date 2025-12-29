# CS50 Intro to Databases (SQL)

This repository contains my work for **CS50’s Introduction to Databases with SQL**. It includes my answers for each problem set, as well as my final project for the course.

## What’s in this repo

- **Problem Set Solutions**
  - My solutions are stored directly in this repository (not separated into per-problem-set folders).
  - Each problem set has its corresponding SQL file(s) containing my answers.

- **Final Project**
  - A complete SQLite database schema (DDL) and a set of representative queries demonstrating how the database is intended to be used.

## Final Project: Overview

My final project models a lightweight professional networking platform, including profiles, authentication, skills, education, experience, connections, and messaging.

### Core Entities

- **Profiles**
  - `profiles` stores user identity and profile information (name, headline, about).

- **Authentication**
  - `profile_creds` stores a unique username and password hash (1:1 with `profiles`).

- **Skills**
  - `skills` stores the master list of unique skills.
  - `profile_skills` links profiles to skills and tracks proficiency level and years of experience.

- **Experience & Education**
  - `experience` stores employment history entries per profile.
  - `education` stores education history entries per profile.
  - `certifications` stores certifications per profile.

- **Connections**
  - `connections` stores connection requests between profiles with a strict status lifecycle:
    `pending`, `accepted`, `declined`, `blocked`.
  - Includes timestamps for when a request is made/responded to and prevents self-connections.

- **Messaging**
  - `conversations` represents message threads.
  - `conversation_members` links profiles to conversations (supports group chat).
  - `messages` stores the message content, sender, and sent timestamp.

### Integrity & Performance

- Built for **SQLite** with foreign key enforcement enabled:
  - `PRAGMA foreign_keys = ON;`
- Uses `ON DELETE CASCADE` so removing a profile also removes dependent records.
- Adds indexes for common lookup patterns:
  - experience/education by profile
  - messages by conversation and timestamp
  - connections by addressee and status

## Example Queries Included

The final project includes examples of typical application queries such as:

- Searching for a profile by first and last name
- Retrieving experience history for a given profile (ordered by recency)
- Listing a profile’s skills with level and years
- Finding the top profiles by accepted connection count


