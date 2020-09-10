require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:all) do
    @user_one = build(:user)
  end

  subject {
    described_class.new(title: "My awesome article",
                        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        date: Date.new(2020, 7, 24),
                        user: @user_one)
  }

  before { subject.save }

  it 'should be valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'should not be valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'should not be valid without a content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end
  it 'should not be valid without a date' do
    subject.date = nil
    expect(subject).to_not be_valid
  end
  it 'should not be valid without a user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end
end
