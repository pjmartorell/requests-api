require 'rails_helper'

RSpec.describe Request, :type => :model do

  describe "with valid params" do
    let(:valid_attributes) {
      {
        "amount"=>50,
        "days"=>10,
        "email"=>"email@domain.es",
        "dni"=>"92795349D",
        "cellphone"=>"11111-111-1111"
      }
    }

    subject { Request.new valid_attributes }

    it { should be_valid }
  end

  describe :validations do
    let(:valid_attributes) {
      {
        "amount"=>50,
        "days"=>10
      }
    }

    subject { Request.new invalid_attributes }

    describe "without days" do
      let(:invalid_attributes) { valid_attributes.merge("days"=>nil) }
      it { should_not be_valid }
    end

    describe "without an amount" do
      let(:invalid_attributes) { valid_attributes.merge("amount"=>nil) }
      it { should_not be_valid }
    end

    describe "with an amount over 600" do
      let(:invalid_attributes) { valid_attributes.merge("amount"=>601) }
      it { should_not be_valid }
    end

    describe "with a number of days over 50" do
      let(:invalid_attributes) { valid_attributes.merge("days"=>51) }
      it { should_not be_valid }
    end

    describe "with an invalid dni format" do
      let(:invalid_attributes) { valid_attributes.merge("dni"=>"12345678X") }
      it { should_not be_valid }
    end

    describe "with an invalid email" do
      let(:invalid_attributes) { valid_attributes.merge("email"=>"@johndoe") }
      it { should_not be_valid }
    end

    describe "with an invalid cellphone" do
      let(:invalid_attributes) { valid_attributes.merge("cellphone"=>"#666#") }
      it { should_not be_valid }
    end

  end
end
