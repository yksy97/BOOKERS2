class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable
       
        has_many :books, dependent: :destroy
        has_one_attached :profile_image
        
        
        validates :name, uniqueness: true, length: { in: 2..20 }
        validates :introduction, length: { maximum: 50 }, on: :update
              


def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
end
end


# validatesの範囲を指定→　on: :action

# ActiveStorage File Not Found Errorが起きた理由
# ActiveStorageのエラーだったからActiveStorageに関連する記述ばかり見直していた
# 結果的に、間違っていたのはvalidatesの設定だった。
# validatesの設定で、ユーザー情報の編集においてintroductionとimageが空欄の場合にエラー文を表示する設定にしていた
# しかし、そもそもintroductionとimageは空欄でOKだし、Sign Upの段階でintroductionとimageを設定する項目を設けていない
# なので、Sign Up自体がバリデーションで弾かれてActiveStorage File Not Found Errorになっていた