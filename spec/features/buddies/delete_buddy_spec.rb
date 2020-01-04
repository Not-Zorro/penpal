require 'rails_helper'

describe 'As a registered user' do
  it 'it can edit a support buddy' do
    user = create(:user)
    stub_user(user)
    buddy_1 = user.buddies.create(first_name: 'Greg', last_name: 'Mitchell', email: 'george_michael@mail.com', phone_number: '303-555-2424' )
    visit profile_path

    click_link 'Buddies'

    within "#buddy-#{buddy_1.id}" do
      click_link 'Delete Buddy'
    end

    expect(current_path).to eq("/buddies")
    expect(page).to have_content('Buddy Deleted')
    user.reload
    visit '/buddies'
    expect(page).to_not have_css("#buddy-#{buddy_1.id}")
  end
end
