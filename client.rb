require 'json'

class ClientApp
  def initialize(dataset_path)
    @clients = load_dataset(dataset_path)
  end

  def load_dataset(dataset_path)
    file = File.read(dataset_path)
    JSON.parse(file)
  rescue StandardError => e
    puts "Error loading dataset: #{e.message}"
    []
  end

  def search_clients(query)
    matching_clients = @clients.select { |client| client['full_name'].downcase.include?(query.downcase) }
    display_clients(matching_clients)
  end

  def find_duplicate_emails
    email_counts = Hash.new(0)

    @clients.each do |client|
      email = client['email']
      email_counts[email] += 1
    end

    duplicate_emails = email_counts.select { |_email, count| count > 1 }.keys
    display_duplicate_emails(duplicate_emails)
  end

  def display_clients(clients)
    if clients.empty?
      puts 'No matching clients found.'
    else
      puts 'Matching clients:'
      clients.each { |client| puts "#{client['full_name']} - #{client['email']}" }
    end
  end

  def display_duplicate_emails(duplicate_emails)
    if duplicate_emails.empty?
      puts 'No duplicate emails found.'
    else
      puts "Clients with duplicate emails:"
      duplicate_emails.each { |email| puts email }
    end
  end
end
