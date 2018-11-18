class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
           # ここに追加する
  has_many :lists, dependent: :destroy
  # presence: true でnameカラムが空白かどうか検証する
  validates :name, presence: true
end
