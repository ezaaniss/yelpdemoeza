
class Restaurant < ActiveRecord::Base
  mount_uploader :image, ImageUploader
 
 searchkick

  has_many :reviews

  validates :name, :address, :phone, :website, :image, presence: true
  validates :phone, format: { with: /\A\(\d{3}\) \d{4}-\d{4}\z/,
    message: "must be in the format (123) 456-7890" }
  validates :website, format: { with: /\Ahttps?:\/\/.*\z/,
    message: "must start with http:// or https://" }
  validates :address, format: { with: /\A\d+, [^,]+, \d{5} [^,]+, [^,]+[A-Z]{2}\z/,
    message: "must be in the format 30, Jalan PJU Damansara Perdana, 47820 Petaling Jaya, Selangor MY" }
end