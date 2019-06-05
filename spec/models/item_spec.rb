require 'rails_helper'

describe Item, type: :model do
  describe '#create' do

    before do
      @user = create(:user)
    end

    context 'can save' do
      it "すべてのデータがあり正常に登録できる" do
        item = build(:item, user_id: @user.id)
        expect(item).to be_valid
      end

      it "imageが無くても正常に登録できる" do
        item = build(:item, image: nil,user_id: @user.id)
        expect(item).to be_valid
      end

      it "contentsが999文字で登録できる" do
        item = build(:item, contents:  "#{'a' * 999}",user_id: @user.id)
        expect(item).to be_valid
      end

      it "contentsが1000文字で登録できる" do
        item = build(:item, contents:  "#{'a' * 1000}",user_id: @user.id)
        expect(item).to be_valid
      end

    end

    context 'can not save' do
      it "contentsが無いためエラーになる" do
        item = build(:item, contents: nil,user_id: @user.id)
        item.valid?
        expect(item.errors[:contents]).to include("can't be blank")
      end

      it "説明文が100文字より多いためエラーになる" do
        item = build(:item, contents:  "#{'a' * 1001}",user_id: @user.id)
        item.valid?
        expect(item.errors[:contents][0]).to include("is too long")
      end

    end

  end
end
