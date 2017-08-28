require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user)    { create(:user) }
  let(:group)   { create(:group)}
  let(:message) { create(:message)}

  describe 'GET #index' do
    context "when user loged in" do
      before do
        login_user user
        get :index, group_id: group
      end
        it "assigns the requested group to @group" do
          expect(assigns(:group)).to eq group
        end

        it "is assings pl @groups has current_user.groups" do
          groups = user.groups
          get :index, params: { group_id: groups.first.id }
          expect(assigns(:groups)).to eq groups
        end

        it "is assigns sg @message" do
          blank_message = Message.new
          get :index, params: { group_id: group }
          expect(assigns(:message).attributes).to eq(blank_message.attributes)
        end

        it "is assigns pl @messages has current_group.users" do
          messages = group.messages
          get :index, params: { group_id: group }
          expect(assigns(:messages)).to match(messages)
        end

        it "renders the :index template" do
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
        subject {
          Proc.new { post :create, params: { message: attributes_for(:message), group_id: group } }
        }

        it "assigns the requested group to @group" do
          subject.call
          expect(assigns(:group)).to eq group
        end

        it "assigns the requested groups to @groups" do
          subject.call
          groups = user.groups
          expect(assigns(:groups)).to eq groups
        end

        it "assigns the requested message to @message" do
          expect{ subject.call }.to change(Message, :count).by(1)
        end

        it "redirect_to group_messages_path" do
          subject.call
          expect(response).to redirect_to group_messages_path
        end
        it 'sets flash[:notice]' do
          subject.call
          expect(flash[:notice]).to eq 'メッセージを送信しました'
        end
      end

      context "message is invalid" do
        subject {
          Proc.new { post :create, params: { message: attributes_for(:message, body:nil, image:nil), group_id: group } }
        }
        it "assigns a newly created but unsaved message as @message" do
          expect{subject.call}.not_to change(Message, :count)
        end

        it 'renders the :index template' do
           subject.call
           expect(response).to redirect_to new_user_session_path
        end

        it 'sets flash[:notice]' do
          subject.call
          expect(flash[:alert]).to eq 'ログインまたは登録が必要です'
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
