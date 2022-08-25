# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tasks/index', type: :view do
  let!(:tasks) { create_list(:task, 11) }

  before(:each) do
    assign(:tasks, tasks)
  end

  it 'renders a list of tasks' do
    render

    assert_select 'form[action=?][method=?]', tasks_path, 'get' do
      assert_select 'input[name=?]', 'keyword'
      assert_select 'select[name=?]', 'status'
      assert_select 'select[name=?]', 'sort'
    end

    tasks.each do |task|
      expect(rendered).to match(/#{task.name}/)
      expect(rendered).to match(/#{time_zone(task.end_date)}/)
      expect(rendered).to match(/#{task.priority}/)
      expect(rendered).to match(/#{task.status}/)
      expect(rendered).to match(/#{task.explanation}/)
    end
  end
end
