# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/task_labels', type: :request do
  describe 'GET /index' do
    let!(:task_labels) { create_list(:task_label, 11) }

    it 'renders a successful response' do
      get task_labels_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let!(:task_label) { create(:task_label) }

    it 'renders a successful response' do
      get task_label_url(task_label)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_task_label_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    let!(:task_label) { create(:task_label) }

    it 'renders a successful response' do
      get edit_task_label_url(task_label)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:task) { create(:task) }
      let!(:label) { create(:label) }
      let!(:valid_attributes) do
        { task_id: task.id, label_id: label.id }
      end

      it 'creates a new TaskLabel' do
        expect do
          post task_labels_url, params: valid_attributes
        end.to change(TaskLabel, :count).by(1)
      end

      it 'redirects to the created task_label' do
        post task_labels_url, params: valid_attributes
        expect(response).to redirect_to(task_label_url(TaskLabel.last))
      end
    end

    context 'with invalid parameters' do
      let!(:invalid_attributes) do
        { task_id: nil, label_id: nil }
      end

      it 'does not create a new TaskLabel' do
        expect do
          post task_labels_url, params: invalid_attributes
        end.to change(TaskLabel, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post task_labels_url, params: invalid_attributes
        expect(response.status).to eq 422
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let!(:task) { create(:task) }
      let!(:label) { create(:label) }
      let!(:task_label) { create(:task_label) }

      let!(:new_attributes) do
        { task_id: task.id, label_id: label.id }
      end

      it 'updates the requested task_label' do
        patch task_label_url(task_label), params: new_attributes
        expect(task_label.reload).to have_attributes new_attributes
      end

      it 'redirects to the task_label' do
        patch task_label_url(task_label), params: { task_label: new_attributes }
        task_label.reload
        expect(response).to redirect_to(task_label_url(task_label))
      end
    end

    context 'with invalid parameters' do
      let!(:task_label) { create(:task_label) }
      let!(:invalid_attributes) do
        { task_id: nil, label_id: nil }
      end

      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch task_label_url(task_label), params: invalid_attributes
        expect(response.status).to eq 422
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:task_label) { create(:task_label) }

    it 'destroys the requested task_label' do
      expect do
        delete task_label_url(task_label)
      end.to change(TaskLabel, :count).by(-1)
    end

    it 'redirects to the task_labels list' do
      delete task_label_url(task_label)
      expect(response).to redirect_to(task_labels_url)
    end
  end
end
