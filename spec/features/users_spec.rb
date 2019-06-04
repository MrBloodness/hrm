require 'rails_helper'

RSpec.describe UsersController do
  include FeatureHelper
  let(:user) { create :user }

  describe 'user_is_current_user' do
    it 'displays list of users and edit button only for current user' do
      login_as user
      visit users_path
      expect(page).to have_content(user.model_name.human.pluralize)
      expect(edit_link[:href]).to eq(edit_user_registration_path)
    end
  end

  describe '#create' do
    it 'creates new user' do
      login_as user
      visit new_user_path
      fill_in 'user_email', :with => 'test@example.com'
      fill_in 'user_first_name', :with => 'name'
      fill_in 'user_last_name', :with => 'surname'
      click_on 'Register'
      expect(page).to have_content create_notice(:user)
    end
  end

  describe '#update' do
    it 'updates user' do
      new_email = 'new_email@example.com'
      login_as user
      visit edit_user_path(user)
      expect(page).to have_field('user_email', with: user.email)
      fill_in 'user_email', :with => new_email
      click_on 'Register'
      expect(page).to have_content update_notice(:user)
      expect(page).to have_content(new_email)
    end
  end

  describe '#destroy' do
    it 'destroys user' do
      login_as user
      visit users_path
      destroy_link.click
      expect(page).to have_content destroy_notice(:user)
    end
  end
end
