require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :controller do

  before :each do
    request.accept = 'application/json'
  end

  describe "GET index" do
    before(:each){get :index}
    it "has a 200 status code" do
      expect(response.status).to eq(200)
    end
  end

  describe 'POST create' do
    subject{post :create, article: {title: 'name', text: 'text'}}

    context "if status is ok" do
      before(:each){post :create, article: {title: 'name', text: 'text'}}
      it "has a 201 status code" do
      expect(response.status).to eq 201
      end
    end

    context "check if the article was created in DB" do
      it {expect{subject}.to change{Article.count}.by(1)}
        it 'status is ok' do
          subject
          expect(response.status).to eq 201
        end
    end

    # ?
    context 'invalid attributes' do
      let(:attributes){{ text: 'title'}}
      it {expect{subject}.not_to change{Article.count}}
      it 'status is 422' do
        subject
        expect(response.status).to eq 422
      end
    end


  end
end






 # check 422

