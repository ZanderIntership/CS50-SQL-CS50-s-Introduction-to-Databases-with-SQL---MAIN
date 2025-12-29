# CS50 Intro to Databases (SQL) 🗄️✨

This repository contains my work for **CS50’s Introduction to Databases with SQL**. It includes my answers for each problem set, as well as my **final project** for the course. 📚✅

---

## What’s in this repo 📦

- **Problem Set Solutions 🧩**
  - My solutions are stored directly in this repository (**no per-problem-set folders**).
  - Each problem set has its corresponding SQL file(s) with my answers.

- **Final Project 🚀**
  - A complete **SQLite** database schema (DDL) plus a set of example queries that show how the database is meant to be used.

---

## Final Project: Overview 🌐

My final project models a lightweight **professional networking platform** (think profiles, skills, connections, and messaging). 🧑‍💼🤝💬

### Core Entities 🧱

- **Profiles 👤**
  - `profiles` stores user details like name, headline, and about section.

- **Authentication 🔐**
  - `profile_creds` stores a unique username + password hash (1:1 with `profiles`).

- **Skills 🛠️**
  - `skills` is the master list of unique skills.
  - `profile_skills` links users to skills and tracks things like **level** and **years** of experience.

- **Experience & Education 🎓💼**
  - `experience` stores work history entries per profile.
  - `education` stores education records per profile.
  - `certifications` stores certifications per profile.

- **Connections 🔗**
  - `connections` manages connection requests between users with a clear status flow:
    `pending` ➝ `accepted` / `declined` / `blocked`
  - Includes timestamps for request/response and prevents self-connections 🙅‍♂️

- **Messaging 💬**
  - `conversations` represents conversation threads.
  - `conversation_members` connects users to conversations (supports group chats 👥).
  - `messages` stores the message content, sender, and timestamp.

---


