# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tasks/new', type: :view do
  let!(:user) { create(:user) }

  before(:each) do
    assign(:task, Task.new(
                    name: 'MyString',
                    priority: 1,
                    status: 1,
                    explanation: 'MyText',
                    user_id: user.id
                  ))
  end

  it 'renders new task form' do
    render

    assert_select 'form[action=?][method=?]', tasks_path, 'post' do
      assert_select 'input[name=?]', 'task[name]'
      assert_select 'input[name=?]', 'task[priority]'
      assert_select 'input[name=?]', 'task[status]'
      assert_select 'textarea[name=?]', 'task[explanation]'
      assert_select 'input[name=?]', 'task[user_id]'
    end
  end
end
