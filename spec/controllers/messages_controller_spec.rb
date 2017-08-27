require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user)    { create(:user) }
  let(:group)   { create(:group)}
  let(:message) { create(:message)}

  describe 'GET #index' do
    context "when user loged in" do
      before do
        login_user user
      end
        it "assigns the requested group to @group" do
          get :index, group_id: group
          expect(assigns(:group)).to eq group
        end

        it "is assings pl @groups has current_user.groups" do
          groups = create_list(:group, 3)
          get :index, params: { group_id: groups.first.id }
          groups = user.groups
          expect(assigns(:groups)).to eq groups
        end

        it "is assigns sg @message" do
          blank_message = Message.new
          get :index, params: { group_id: group }
          expect(assigns(:message).attributes).to eq(blank_message.attributes)
        end

        it "is assigns pl @messages has current_group.users" do
          messages = create_list(:message, 3, user_id: user.id, group_id: group.id)
          get :index, params: { group_id: group }
          expect(assigns(:messages)).to match(messages)
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
      context "message is valid" do
        before do
          login_user user
        end
        subject {Proc.new { post :create, params: { message: attributes_for(:message), group_id: group } }}
        it "assigns the requested message to @message" do
          expect{ post :create, params: { message: attributes_for(:message, { body: 'hello' }), group_id: group.id } }.to change(Message, :count).by(1)
        end

        it "redirect_to group_messages_path" do
          subject.call
          expect(response).to redirect_to group_messages_path
        end
        it 'sets flash[:notice]' do
          post :create, params: { group_id: group, message: attributes_for(:message) }
          expect(flash[:notice]).to be_present
        end
      end

      context "message is invalid" do
        subject {Proc.new { post :create, params: { message: attributes_for(:message), group_id: group } }}
        it "assigns a newly created but unsaved message as @message" do
          expect{subject.call}.not_to change(Message, :count)
        end

        it 'renders the :index template' do
           subject.call
           expect(response).to redirect_to new_user_session_path
        end
      end
    end

    context "when user don't loged in" do
      it "redirect_to index screen" do
        post :create, params: { message: attributes_for(:message), group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
