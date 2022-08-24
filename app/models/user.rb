# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable # :confirmable, :lockable, :trackable and :omniauthable

  has_many :tasks

  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
end
