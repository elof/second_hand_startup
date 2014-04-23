# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer          default(0)
#  commentable_type :string(255)      default("")
#  title            :string(255)      default("")
#  body             :text             default("")
#  subject          :string(255)      default("")
#  user_id          :integer          default(0), not null
#  parent_id        :integer
#  lft              :integer
#  rgt              :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'spec_helper'

describe Comment do 

  subject { FactoryGirl.create(:comment) }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq subject.user }

  it { should be_valid }

  describe "comment associations" do

    let!(:older_comment) do
      FactoryGirl.create(:comment, user: subject.user, created_at: 1.day.ago)
    end
    let!(:newer_comment) do
      FactoryGirl.create(:comment, user: subject.user, created_at: 1.hour.ago)
    end


    it "should have the right comments in the right order" do
        expect(subject.user.comments).to eq [subject, newer_comment, older_comment]
      end
    end

    it "should destroy associated comments" do
      comments = subject.user.comments.to_a
      subject.user.destroy
      expect(comments).not_to be_empty
      comments.each do |comment|
        expect(Comment.where(id: comment.id)).to be_empty
      end
    end

  describe "when user_id is not present" do
    before { subject.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { subject.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { subject.content = "a" * 141 }
    it { should_not be_valid }
  end




end
