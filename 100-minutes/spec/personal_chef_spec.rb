require 'personal_chef'

describe PersonalChef do
  # let(:subject) { PersonalChef.new }

  describe "#open_door" do
    context "when asked to open the front door" do
      it "opens the door" do
        subject.should_receive(:puts).with("Opening front door")
        result = subject.open_door(:front)
        # expect(result).to eq "Opening front door"
      end
    end

    context "when asked to open the back door" do
      it "opens the door" do
        result = subject.open_door(:back)
        expect(result).to eq "Opening back door"
      end
    end

    context "when asked to open the safe door" do
      it "does not open the door" do
        result = subject.open_door(:safe)
        expect(result).to eq "Cannot open the safe door"
      end
    end
  end
end