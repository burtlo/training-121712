require 'spec_helper'


describe "Create a new article" do
  context "when I am on the index page" do
    context "click on the new article" do

      let(:title) { 'Article Title' }
      let(:body) { 'Article Body' }

      def create_article(title,body)
        click_link "Create An Article"
        fill_in "Title", with: title
        fill_in "Body", with: body
        click_button "Create Article"
      end

      it "takes me to a magical place where I can make articles" do
        visit "/articles"
        create_article(title,body)
        title_text = page.find(:xpath, '//h1').text
        expect(title_text).to eq title
      end
    end
  end
end