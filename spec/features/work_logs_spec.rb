require 'rails_helper'

RSpec.describe WorkLogsController do
  include FeatureHelper
  let(:user) { create :user }
  let(:work_log) { create :work_log }

  describe '#index' do
    it 'displays list of work_logs' do
      work_log
      login_as user
      visit work_logs_path
      expect(page).to have_content('Worklogs')
      expect(edit_path).to eq(edit_work_log_path(work_log))
      expect(destroy_link[:href]).to eq(work_log_path(work_log))
    end
  end

  describe '#show' do
    it 'displays info about work_log' do
      work_log
      login_as user
      visit work_log_path(work_log)
      expect(page).to have_content(work_log.spent_time.to_i)
    end
  end
end
