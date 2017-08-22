require 'rails_helper'

describe MessagesController, type: :controller do
  let!(:user)    { create(:user) }
  let!(:group)   { create(:group)}
  let!(:message) { create(:message)}

  describe 'GET #index' do
    context "when user loged in" do
      before do
        login_user user
      end
        it "assigns the requested group to @group" do
          get :index, group_id: group.id
          expect(assigns(:group)).to eq group
        end
    end

    context "when user don't loged in" do
      it "redirect_to sign in screen" do
        get :index, group_id: group.id
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    context "when user loged in" do
      before do
        login_user user
      end
      it "assigns the requested message to @message" do
        expect{
    post :create, params: { message: attributes_for(:message, { body: 'hello' }), group_id: group.id }
  }.to change(Message, :count).by(1)
      end
    end
  end
end

# describe 'GET #index' do
#     it "populates an array of tweets ordered by created_at DESC" do
#       tweets = create_list(:tweet, 3)
#       get :index
#       expect(assigns(:tweets)).to match(tweets.sort{|a, b| b.created_at <=> a.created_at })
#     end
#
#     it "renders the :index template" do
#       get :index
#       expect(response).to render_template :index
#     end
#   end
