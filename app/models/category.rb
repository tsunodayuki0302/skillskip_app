class Category < ApplicationRecord
  has_ancestry
  has_many :recruitments

  def set_items
    # 親カテゴリーの場合
    if self.root?
      start_id = self.indirects.first.id
      end_id = self.indirects.last.id
      recruitments = Recruitment.where(category_id: start_id..end_id)
      return recruitments

      # 子カテゴリーの場合
    elsif self.has_children?
      start_id = self.children.first.id
      end_id = self.children.last.id
      recruitments = Recruitment.where(category_id: start_id..end_id)
      return recruitments

      # 孫カテゴリーの場合
    else
      return self.recruitments
    end
  end
end