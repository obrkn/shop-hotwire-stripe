# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :validatable
  has_many :cart_items, dependent: :destroy
end
