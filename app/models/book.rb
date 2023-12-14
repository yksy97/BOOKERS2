class Book < ApplicationRecord
  belongs_to :user
  
  
  validates :title, presence: true
  validates :body, presence: true
  
  # 画像が存在しない場合に表示する画像をActiveStorageに格納する
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  
end
