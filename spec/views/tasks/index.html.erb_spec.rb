# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tasks/index', type: :view do
  let!(:user) { create(:user) }
  let!(:tasks) { 11.times.map { create(:task, user_id: user.id) } }

  before(:each) do
    assign(:tasks, tasks)
  end

  it 'renders a list of tasks' do
    render

    tasks.each do |task|
      expect(rendered).to match(/#{task.name}/)
      expect(rendered).to match(/#{task.end_date}/)
      expect(rendered).to match(/#{task.priority}/)
      expect(rendered).to match(/#{task.status}/)
      expect(rendered).to match(/#{task.explanation}/)
      expect(rendered).to match(/#{task.user_id}/)
    end
  end
end
