require 'rails_helper'

RSpec.describe UsersController do
  include FeatureHelper
  let(:user) { create :user }
  let(:document) { create :document }

  describe '#index' do
    it 'displays list of documents' do
      document
      login_as user
      visit documents_path
      expect(page).to have_content(document.model_name.human.pluralize)
      expect(edit_link[:href]).to eq(edit_document_path document)
      expect(destroy_link[:href]).to eq(document_path document)
    end
  end

  describe '#create' do
    it 'create document withoud state error' do
      login_as user
      visit new_document_path
      fill_in 'document_number', :with => '12'
      fill_in 'document_title', :with => 'Test document'
      fill_in 'document_deadline_date', :with => Date.tomorrow
      click_on('Create')
      expect { raise "Document state can't be blank"}.to raise_error("Document state can't be blank")
    end
  end
end
