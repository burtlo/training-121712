require 'event_manager'

describe EventManager do

  describe "#clean_phone_number" do

    let(:unknown_number) { EventManager::PhoneNumber.unknown_number }
    
    context "when given an integer" do
      it "cleans the number" do
        result = subject.clean_phone_number(12345678901)
        expect(result).to eq "2345678901"
      end
    end

    
    context "when given 11 numbers" do
      context "when the first number is a 1" do
        it "cleans the number" do
          result = subject.clean_phone_number("12345678901")
          expect(result).to eq "2345678901"
        end
      end

      context "when the first number is not a 1" do
        it "cleans the number" do
          result = subject.clean_phone_number("24018685000")
          expect(result).to eq unknown_number
        end
      end
    end

    context "when given more than 11 numbers" do
      it "cleans the number" do
        result = subject.clean_phone_number("123456789012")
        expect(result).to eq unknown_number
      end
    end


    context "when given nil" do
      it "cleans the number" do
        result = subject.clean_phone_number(nil)
        expect(result).to eq unknown_number
      end
    end

    context "when given (941)979-2000" do
      it "cleans the number" do
        result = subject.clean_phone_number("(941)979-2000")
        expect(result).to eq "9419792000"
      end
    end
    context "when given 778.232.7000" do
      it "cleans the number" do
        result = subject.clean_phone_number("778.232.7000")
        expect(result).to eq "7782327000"
      end
    end
    context "when given (202) 328 1000" do
      it "cleans the number" do
        result = subject.clean_phone_number("(202) 328 1000")
        expect(result).to eq "2023281000"
      end
    end

  end



  let(:csv_file) { "event_attendees.csv" }

  describe "#parse" do
    before do
      subject.stub(:read_file_contents) { [ headers, expected_data ] }
    end

    let(:headers) { [" ", "RegDate", "first_Name", "last_Name", "Email_Address", "HomePhone", "Street", "City", "State", "Zipcode"]  }

    let(:expected_data) do
      ["1", "11/12/08 10:47", "Allison", "Nguyen", "arannon@jumpstartlab.com", "6154385000", "3155 19th St NW", "Washington", "DC", "20010"]
    end

    it "the expected first data row" do
      result = subject.parse csv_file
      first_row = result[1]
      expect(first_row).to eq expected_data
    end

  end

  describe "#read_file_contents" do
    it "reads the file contents from the file system" do
      contents = subject.read_file_contents(csv_file)
      expect(contents).to be_kind_of Array
    end
  end
end