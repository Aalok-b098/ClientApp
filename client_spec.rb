require 'json'
require_relative 'client'

RSpec.describe ClientApp do
  let(:valid_dataset_path) { 'dataset.json' }
  let(:invalid_dataset_path) { 'invalid_dataset.json' }

  describe '#initialize' do
    it 'creates a new instance of ClientApp' do
      app = ClientApp.new(valid_dataset_path)
      expect(app).to be_an_instance_of(ClientApp)
    end

    it 'loads the dataset successfully' do
      app = ClientApp.new(valid_dataset_path)
      expect(app.instance_variable_get(:@clients)).to be_an(Array)
      expect(app.instance_variable_get(:@clients)).not_to be_empty
    end

    it 'handles errors when loading an invalid dataset' do
      app = ClientApp.new(invalid_dataset_path)
      expect(app.instance_variable_get(:@clients)).to eq([])
    end
  end

  describe '#search_clients' do
    let(:app) { ClientApp.new(valid_dataset_path) }

    it 'returns matching clients' do
      expect { app.search_clients('John Doe') }.to output("Matching clients:\nJohn Doe - john.doe@gmail.com\n").to_stdout
    end

    it 'handles no matching clients' do
      expect { app.search_clients('Nonexistent Name') }.to output(/No matching clients found/).to_stdout
    end
  end

  describe '#find_duplicate_emails' do
    let(:app) { ClientApp.new(valid_dataset_path) }

    it 'returns duplicate emails' do
      expect { app.find_duplicate_emails }.to output("Clients with duplicate emails:\njane.smith@yahoo.com\n").to_stdout
    end
  end

  describe '#display_clients' do
    let(:app) { ClientApp.new(valid_dataset_path) }

    it 'displays matching clients' do
      matching_clients = [{ 'full_name' => 'John Doe', 'email' => 'john@example.com' }]
      expect { app.display_clients(matching_clients) }.to output("Matching clients:\nJohn Doe - john@example.com\n").to_stdout
    end

    it 'handles no matching clients' do
      expect { app.display_clients([]) }.to output(/No matching clients found/).to_stdout
    end
  end

  describe '#display_duplicate_emails' do
    let(:app) { ClientApp.new(valid_dataset_path) }

    it 'displays duplicate emails' do
      duplicate_emails = ['duplicate@example.com']
      expect { app.display_duplicate_emails(duplicate_emails) }.to output("Clients with duplicate emails:\nduplicate@example.com\n").to_stdout
    end

    it 'handles no duplicate emails' do
      expect { app.display_duplicate_emails([]) }.to output(/No duplicate emails found/).to_stdout
    end
  end
end
