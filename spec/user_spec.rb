require 'rails_helper'

describe User, type: :model do
  it "orders by name" do
    varun = User.create!(name: "Varun", password: "something")
    joe = User.create!(name: "Ram", password: "something")

    expect(User.order(:name)).to eq([joe, varun])
  end
end
