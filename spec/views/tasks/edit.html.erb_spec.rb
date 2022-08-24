# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tasks/edit', type: :view do
  let!(:user) { create(:user) }

  before(:each) do
    @task = assign(:task, Task.create!(
                            name: 'MyString',
                            priority: 1,
                            status: 1,
                            explanation: 'MyText',
                            user_id: user.id
                          ))
  end

  it 'renders the edit task form' do
    render

    assert_select 'form[action=?][method=?]', task_path(@task), 'post' do
      assert_select 'input[name=?]', 'task[name]'
      assert_select 'input[name=?]', 'task[priority]'
      assert_select 'input[name=?]', 'task[status]'
      assert_select 'textarea[name=?]', 'task[explanation]'
    end
  end
end
