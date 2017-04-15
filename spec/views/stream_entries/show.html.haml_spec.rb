require 'rails_helper'

describe "accounts/show.html.haml" do

  it "has an h-feed with correct number of h-entry objects in it" do
    alice   =  Fabricate(:account, username: 'alice', display_name: 'Alice')
    status  =  Fabricate(:status, account: alice, text: 'Hello World')
    status2 =  Fabricate(:status, account: alice, text: 'Hello World Again')
    status3 =  Fabricate(:status, account: alice, text: 'Are You Still There World?')

    assign(:account, alice)
    assign(:statuses, alice.statuses)

    render(:template => 'accounts/show.html.haml')

    expect(Nokogiri::HTML(rendered).search('.h-feed .h-entry').size).to eq 3

  end

end


