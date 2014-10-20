require 'rails_helper'

feature "Manage Posts" do
  scenario "List no Albums" do
    visit albums_path
    expect(page.find('h1')).to have_content(/Albums/i)
    expect(page).to have_content(/No albums available/i)
  end

  scenario "List all Albums" do
    Album.create!(
      title: 'Astrolounge',
      artist: 'Smash Mouth',
      year: '1999'
    )

    visit albums_path
    expect(page.find('.album')).to have_content(/Astrolounge/)
    expect(page.find('.artist')).to have_content(/Smash Mouth/)
    expect(page.find('.year')).to have_content(/1999/)
    expect(page).not_to have_content(/No albums available/i)

    expect(page).to have_button('Add New Album')

  end

  scenario "Add new Album" do
    visit new_album_path

    fill_in 'album_title', with: 'Red'
    fill_in 'album_artist', with: 'Taylor Swift'
    fill_in 'album_year', with: '2012'
    click_on 'Create Album'

    expect(current_path).to eq(album_path(Album.last.id))
    expect(find('.notice')).to have_content(/success/i)


  end
