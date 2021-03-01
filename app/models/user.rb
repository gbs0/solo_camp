class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :laudos
  has_many :properties, dependent: :destroy
  has_many :analises, dependent: :destroy
  has_many :amostras, dependent: :destroy
  has_many :ownerships, dependent: :destroy
end
