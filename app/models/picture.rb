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


  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end


end
