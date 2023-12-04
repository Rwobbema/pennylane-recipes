# README

# Pennylane recipe app launch instructions

## Introduction

This app helps users find the most relevant recipes that they can prepare with the ingredients that they have at home.

## Prerequisites

Before you start, make sure you have the following installed on your system:

- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html#installing-rails)
- [Bundler](https://bundler.io/)

## Getting Started

Follow the steps below to set up and run the application on your local machine.

### Step 1: Bundle Install

Run the following command to install all the required gems and dependencies:

```bash
bundle install
```

### Step 2: Database Migration

Run the following command to create the database tables based on the application's data models:

```bash
rails db:migrate
```

### Step 3: Seed Database

Run the following command to populate the database with initial data:

```bash
rails db:seed
```

Note: This step may take around 2 minutes to complete. The seed task fills the database with predefined data, making it easier to test and explore the application. Please be patient during this process.

### Step 4: Start the Server

Finally, start the Rails server with the following command:

```bash
rails s
```

This command launches the application, and you can access it by navigating to http://localhost:3000 in your web browser.


