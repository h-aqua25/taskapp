# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:tasks) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:encrypted_password) }
  end

  describe 'save user' do
    context 'when name, email, passwordとpassword_confirmation exist' do
      let!(:user) { create(:user) }

      it 'save is successful' do
        expect(user).to be_valid
      end
    end
  end
end
