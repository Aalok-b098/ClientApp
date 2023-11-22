require_relative 'client'

dataset_path = 'dataset.json'
app = ClientApp.new(dataset_path)

def display_menu
  puts "Choose an option:\n1. Search clients\n2. Find duplicate emails\n3. Exit"
end

loop do
  display_menu
  print "Enter your choice (1, 2 or 3): "
  choice = gets.chomp.downcase

  case choice
  when '1'
    print "Enter a search query: "
    search_query = gets.chomp
    app.search_clients(search_query)
  when '2'
    app.find_duplicate_emails
  when '3'
    break
  else
    puts "Invalid choice. Please enter 1, 2, or 'exit'."
  end
end
