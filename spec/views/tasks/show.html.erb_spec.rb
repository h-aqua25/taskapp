# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tasks/show', type: :view do
  let!(:user) { create(:user) }
  let!(:task) { create(:task, user_id: user.id) }

  before(:each) do
    @task = assign(:task, task)
  end

  it 'renders attributes in <p>' do
    render

    expect(rendered).to match(/#{task.name}/)
    expect(rendered).to match(/#{task.end_date}/)
    expect(rendered).to match(/#{task.priority}/)
    expect(rendered).to match(/#{task.status}/)
    expect(rendered).to match(/#{task.explanation}/)
    expect(rendered).to match(/#{user.id}/)
  end
end
