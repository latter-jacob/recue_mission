require 'rails_helper'

feature 'user answers a question', %(
  As a user
  be able to answer a question

  Acceptance Criteria
  [ ] I must be on the question detail page
  [ ] I must provide a description that is at least 50 characters long
  [ ] I must be presented with errors if I fill out the form incorrectly
) do

  scenario 'answer a question' do

    visit root_path
    click_link "submit new question"

    expect(page).to have_content("Add new question below")

    fill_in 'question[title]', with: "so many charactors, question is why so many?so many charactors, question is why so many?so many charactors, question is why so many?"
    fill_in 'question[description]', with: "these are very important detailsthese are very important detailsthese are very important detailsthese are very important detailsthese are very important detailsthese are very important detailsthese are very important detailsthese are very important detailsthese are very important detailsthese are very important detailsthese are very important details"

    click_button "Save Question"

    expect(page).to have_content("so many charactors, question is why so many?so many charactors, question is why so many?so many charactors, question is why so many?")

    fill_in 'answer[description]', with: "this is the answer to everythung that you need to know pviudsbvpiudsbvpidsbvipdbvpidsbavpidbviudsavipunaiuvndsopavndsoufanv"

    expect(page).to have_content("this is the answer to everythung that you need to know pviudsbvpiudsbvpidsbvipdbvpidsbavpidbviudsavipunaiuvndsopavndsoufanv")
    expect(page).to have_content("false")
  end
end
