require 'spec_helper'

describe Article do

  def valid_attributes
    { title: "Great Working Title",
      body: "Body That Quits!" }
  end

  let(:valid_subject) do
    described_class.new valid_attributes
  end


  describe "#title" do
    it "sets without error" do
      expect { subject.title = "New Title" }.to_not raise_error
    end

    context "when saving" do
      context "empty string" do
        it "raises an error" do

          expect do
            valid_subject.title = ""
            valid_subject.save!
          end.to raise_error ActiveRecord::RecordInvalid

        end
      end
    end

  end

  describe "#body" do
    context "when saving" do
      context "empty string" do
        it "raises an error" do

          expect do
            valid_subject.body = ""
            valid_subject.save!
          end.to raise_error ActiveRecord::RecordInvalid
          
            

        end
      end
    end

    it "sets without error" do
      expect { subject.body = "New Body" }.to_not raise_error
    end


  end
end