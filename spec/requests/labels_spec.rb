# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/labels', type: :request do
  let!(:user) { create(:user) }

  before { sign_in user }

  describe 'GET /index' do
    let!(:labels) { create_list(:label, 11) }

    it 'renders a successful response' do
      get labels_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let!(:label) { create(:label) }

    it 'renders a successful response' do
      get label_url(label)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_label_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    let!(:label) { create(:label) }

    it 'renders a successful response' do
      get edit_label_url(label)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:params) do
        { label: { name: 'new_label!' } }
      end

      it 'creates a new Label' do
        expect do
          post labels_url, params:
        end.to change(Label, :count).by(1)
      end

      it 'redirects to the created label' do
        post labels_url, params: params
        expect(response).to redirect_to(label_url(Label.last))
      end
    end

    context 'with invalid parameters' do
      let(:params) do
        { label: { name: 'new_label!' * 31 } }
      end

      it 'does not create a new Label' do
        expect do
          post labels_url, params:
        end.to change(Label, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post labels_url, params: params
        expect(response.status).to eq 422
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let!(:label) { create(:label) }

      let(:new_attributes) do
        { name: 'UpdatedLabel!' }
      end

      it 'updates the requested label' do
        patch label_url(label), params: { label: new_attributes }
        expect(label.reload).to have_attributes new_attributes
      end

      it 'redirects to the label' do
        patch label_url(label), params: { label: new_attributes }
        label.reload
        expect(response).to redirect_to(label_url(label))
      end
    end

    context 'with invalid parameters' do
      let!(:label) { create(:label) }

      let(:invalid_attributes) do
        { name: 'UpdatedLabel!' * 31 }
      end

      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch label_url(label), params: { label: invalid_attributes }
        expect(response.status).to eq 422
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:label) { create(:label) }

    it 'destroys the requested label' do
      expect do
        delete label_url(label)
      end.to change(Label, :count).by(-1)
    end

    it 'redirects to the labels list' do
      delete label_url(label)
      expect(response).to redirect_to(labels_url)
    end
  end
end
