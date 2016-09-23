User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

due_date = Date.today + 1.year

Profile.create!([
{ first_name: "Carly",   last_name: "Fiorina", birth_year: 1954, gender: "female" },
{ first_name: "Donald",  last_name: "Trump",   birth_year: 1946, gender: "male" },
{ first_name: "Ben",     last_name: "Carson",  birth_year: 1951, gender: "male" },
{ first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female" }])

profiles = Profile.all

profiles.each do |profile|
  profile.create_user( username: profile.last_name, password_digest: profile.birth_year )
  profile.user.todo_lists.create!(list_name: profile.first_name, list_due_date: due_date )
end

todolists = TodoList.all

todolists.each do |list|
  5.times do
  list.todo_items.create!(due_date: due_date, title: "Title", description: "Description")
  end
end




