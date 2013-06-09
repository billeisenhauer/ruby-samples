require 'spec_helper'

describe DateUtility do

  dm = DateUtility

  describe "add_minutes" do

    describe "validate arguments" do

      it "should raise ArgumentError with no arguments" do
        expect {
          dm.add_minutes
        }.to raise_error(ArgumentError)
      end

      it "should raise ArgumentError with invalid format for date_format_str arg" do
        expect {
          dm.add_minutes('blah', 10)
        }.to raise_error(ArgumentError)
      end

      it "should raise ArgumentError with non-integer minutes arg" do
        expect {
          dm.add_minutes('blah', 'blah')
        }.to raise_error(ArgumentError)
      end

    end

    describe "normal usage" do

      it "should handle normal minutes add" do
        dm.add_minutes('9:13 AM', 10).should eql('9:23 AM')
      end

      it "should handle minutes add which increments the hour" do
        dm.add_minutes('9:53 AM', 10).should eql('10:03 AM')
      end

      it "should handle minutes add which swaps the meridian" do
        dm.add_minutes('11:53 AM', 10).should eql('12:03 PM')
      end

      it "should handle normal minutes add" do
        dm.add_minutes('9:13 AM', 70).should eql('10:23 AM')
      end

      it "should handle minutes add which increments the hour" do
        dm.add_minutes('9:53 AM', 70).should eql('11:03 AM')
      end

      it "should handle minutes add which swaps the meridian" do
        dm.add_minutes('11:53 AM', 70).should eql('1:03 PM')
      end

      it "should handle normal minutes subtract" do
        dm.add_minutes('9:13 AM', -10).should eql('9:03 AM')
      end

      it "should handle minutes subtract which decrements the hour" do
        dm.add_minutes('9:03 AM', -10).should eql('8:53 AM')
      end

      it "should handle minutes subtract which swaps the meridian" do
        dm.add_minutes('12:03 AM', -10).should eql('11:53 PM')
      end

      it "should handle normal minutes subtract" do
        dm.add_minutes('9:13 AM', -70).should eql('8:03 AM')
      end

      it "should handle minutes subtract which decrements the hour" do
        dm.add_minutes('9:03 AM', -70).should eql('7:53 AM')
      end

      it "should handle minutes subtract which swaps the meridian" do
        dm.add_minutes('12:03 AM', -70).should eql('10:53 PM')
      end

    end


  end

end