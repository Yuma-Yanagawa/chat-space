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

        it "renders the :index template" do
          get :index, group_id: group.id
          expect(response).to render_template :index
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
        expect{ post :create, params: { message: attributes_for(:message, { body: 'hello' }), group_id: group.id } }.to change(Message, :count).by(1)
      end

      it "redirect_to group_messages_path" do
        post :create, params: { message: attributes_for(:message, { body: 'hello' }), group_id: group.id }
        expect(response).to redirect_to group_messages_path
      end
    end

    context "when user loged in but also message isn't saved" do
      it "assigns a newly created but unsaved message as @message" do
        expect{ post :create, params: { message: attributes_for(:message, { body: 'hello' }), group_id: group.id } }.not_to change(Message, :count)
      end

      it 'renders the :index template' do
         post :create, params: { message: attributes_for(:message, { body: 'hello' }), group_id: group.id }
         expect(response).to redirect_to new_user_session_path
       end
    end

    context "when user don't loged in" do
      it "redirect_to index screen" do
        post :create, params: { message: attributes_for(:message, { body: 'hello' }), group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
