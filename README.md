# Pennylane recipe app launch instructions

## Introduction

This app helps users find the most relevant recipes that they can prepare with the ingredients that they have at home.

## User Stories

### Seed Database with Scraped Recipe Data

As a developer working on the recipe application,
I want to populate the database with relevant recipe data from the scraped sources,
So that users have a substantial set of recipes to search from when using the application.

Acceptance Criteria:

- The application should have a script or task that pulls data from the scraped datasets (English-language recipes from www.allrecipes.com).
- The script or task should be capable of parsing the scraped data and extracting essential information such as recipe name, ingredients, preparation time, cooking time, and a preview image.
- The extracted data should be used to seed the database tables dedicated to storing recipes, ingredients, authors and categories.
- The seeding process should be efficient and should be possible to run within 2 minutes.

### Search for Recipes by Ingredients

As a user,
I want to search for recipes based on the ingredients I have at home,
So that I can find relevant recipes that I can prepare without needing to buy additional ingredients.

Acceptance Criteria:

- The application should have a search bar where users can input the ingredients they have.
- The search results should display a list of recipes that can be prepared with the provided ingredients.
- Each recipe in the search results should include a brief description and an option to navigate to a detail page.

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


