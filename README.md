# Client App
This is a simple Ruby console application that allows users to search clients or find duplicate emails in a dataset.

# Setup
Make sure you have Ruby installed on your system.

# Clone this repository:

- git clone https://github.com/Aalok-b098/ClientApp.git
- cd client_app/
- gem install rspec

# Run the application:

ruby test.rb

# Usage
Upon running the application, you'll be presented with a menu:

Choose an option:
1. Search clients
2. Find duplicate emails
To search clients, enter 1 and provide a search query.
To find duplicate emails, enter 2.
To exit the application, enter 3.

Example
Choose an option:
1. Search clients
2. Find duplicate emails
3. Exit
Enter your choice (1, 2 or 3): 1
Enter a search query: John
Output of the search will be displayed here

Choose an option:
1. Search clients
2. Find duplicate emails
3. Exit
Enter your choice (1, 2 or 3): 2
Output of finding duplicate emails will be displayed here

Choose an option:
1. Search clients
2. Find duplicate emails
3. Exit
Enter your choice (1, 2 or 3): 3
You will be exited

# Run Test Cases (Unit Test)
- rspec client_spec.rb
