class Picture < ApplicationRecord
  has_one_attached:picture_image
  belongs_to :customer
  has_many :collects,dependent: :destroy
  has_many :tagconnects, dependent: :destroy
  has_many :tags, through: :tagconnects

  validates :price, presence: true, numericality: {only_integer: true}, length: { maximum: 7 }
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 140 }
  validates :picture_image, presence: true

  def save_tags(tags)
    tags.each do |new_tags|
      # selfは明示的に記載していてこの場合だとコントローラーの@postになる
      # tag_relationshipsがthroughしているのでtagsでアソシエーションを指定すると中間テーブルを通過した際に保存される。
      self.tags.find_or_create_by(name: new_tags)
    end
  end

  # タグ付けの更新用メソッド
  def update_tags(latest_tags)
    if self.tags.empty?
      # 既存のタグがなかったら追加だけ行う
      latest_tags.each do |latest_tag|
        self.tags.find_or_create_by(name: latest_tag)
      end
    elsif latest_tags.empty?
      # 更新対象のタグがなかったら既存のタグをすべて削除
      # 既に保存がされていたら既に登録されているタグの内容を削除
      self.tags.each do |tag|
        self.tags.delete(tag)
      end
    else
      # 既存のタグも更新対象のタグもある場合は差分更新
      current_tags = self.tags.pluck(:name)
      #左を起点に引き算をする
      #　　　　　　 b             a b c
      old_tags = current_tags - latest_tags
      #一致したものを取り出す
      # a c       a b c            b
      new_tags = latest_tags - current_tags

      # a  c
      old_tags.each do |old_tag|
        tag = self.tags.find_by(name: old_tag)
        self.tags.delete(tag) if tag.present?
      end


      new_tags.each do |new_tag|
        # b
        self.tags.find_or_create_by(name: new_tag)
        # self.tags << new_tags
      end
    end
  end

end
