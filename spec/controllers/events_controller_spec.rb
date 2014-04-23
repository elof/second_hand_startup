require 'spec_helper'

describe EventsController do

  let(:event_params) { FactoryGirl.build(:event_params) }
  let(:invalid_event_params) { FactoryGirl.build(:invalid_event_params) }
  let(:event) { FactoryGirl.create(:event) }

  describe '#new' do
    it 'should assign @event' do
      get :new
      assigns(:event).class.should eq(Event)
    end
  end

  describe '#create' do

    context 'with valid params' do
      it 'should create new event' do
        expect{
         post :create, event: event_params
        }.to change(Event, :count).by(1)
      end
    end

      it 'should redirect to event index' do
        post :create, event: event_params
        expect(response).to redirect_to(root_path)
      end

      context 'with invalid params' do
        it 'should not create event' do
          expect{
           post :create, event: invalid_event_params
          }.to change(Event, :count).by(0)
          flash[:error].should_not be_nil
        end

        it 'should render new' do
          post :create, event: invalid_event_params
          expect(response).to render_template(:new)
        end
      end
  end

  describe '#edit' do
    it 'should assign @event' do
      get :edit, id: event.id
      expect(assigns(:event)).to eq(event)
    end

    it 'should render edit' do
      get :edit, id: event.id
      expect(response).to render_template(:edit)
    end
  end

  describe '#update' do
    context 'with valid params' do
      it 'should update event object' do
        put :update, id: event.id, event: event_params
        event.reload
        event.name.should eq('Event Name')
        event.description.should eq('Event description')
      end

      it 'should redirect to events index' do
        put :update, id: event.id, event: event_params
        expect(response).to redirect_to root_path
      end
    end

  context 'with invalid params' do
      it 'should not save' do
        put :update, id: event.id, event: invalid_event_params
        event.reload
        event.name.should eq(' ')
        event.description.should eq(' ')
        flash[:error].should_not be_nil
      end

      it 'should render edit' do
        put :update, id: event.id, event: invalid_event_params
        expect(response).to render_template :edit
      end
    end
  end

  describe "destroy" do
    it "should delete event" do
      event
      expect{ delete :destroy, id: event.id }.to change(Event, :count).by(-1)
    end

    it "should redirect to event index" do 
      delete :destroy, id: event.id
      expect(response).to redirect_to root_path
    end
  end

end
