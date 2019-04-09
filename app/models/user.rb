class User < ApplicationRecord
  # lo distinto con Current es q quiero q sea mayor a 2018
  # para q tome en cuenta los users de antes para adelante
  default_scope { where("created_at > 2018") }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :stats
  has_many :serie_stats
  belongs_to :mvp, class_name: "Player", foreign_key: "mvp_id"
  belongs_to :team

  after_create :send_welcome_email

  def send_welcome_email
    ApplicationMailer.welcome_email(self).deliver_now
  end

  def points
    total = serie_points + mvp_points
    total.round(2)
  end

  def serie_points
    serie_stats.map(&:points).sum
  end

  def mvp_points
    the_finals = Serie.the_finals
    if mvp && the_finals &&  mvp == the_finals.mvp
      25
    else
      0
    end
  end
end
