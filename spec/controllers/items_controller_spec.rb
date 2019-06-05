require 'rails_helper'

describe ItemsController, type: :controller do
    let(:user) { create(:user)}
    let(:item) { create(:item,user_id:user.id)}

  describe 'GET #index' do
    it "インスタンス変数の値が正常" do
      items = create_list(:item, 3,user_id: user.id)
      get :index
      expect(assigns(:items)).to match(items)
    end

    it "ビューに正しく遷移できる" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it 'リクエストが成功すること' do
      get :new
      expect(response.status).to eq 200
    end

    it 'newテンプレートで表示されること' do
      get :new
      expect(response).to render_template :new
    end

    it '@itemがnewされていること' do
      get :new
      expect(assigns :item).to_not be_nil
    end
  end

end
