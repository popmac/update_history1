user = User.create!(username: "hoge1",
                    email: "hoge1@hoge.com",
                    password:              "aaaa1111",
                    password_confirmation: "aaaa1111")

5.times do |n|
  username  = "hoge#{n+2}"
  email = "hoge#{n+2}@hoge.com"
  user = User.create!(username: username,
                      email: email,
                      password:              "aaaa1111",
                      password_confirmation: "aaaa1111")
end

Review.create!(name: "Atom",
               content: "最高です",
               user_id: 1,
               likes_count: 0)
Review.create!(name: "Sublime Text",
               content: "きれい",
               user_id: 1,
               likes_count: 0)
Review.create!(name: "Kobito",
               content: "書きやすい",
               user_id: 2,
               likes_count: 0)

Comment.create!(content: "僕も使っています！",
                user_id: 2,
                review_id: 1)
Comment.create!(content: "拡張期のがたくさんあって使いやすいですよね！",
                user_id: 3,
                review_id: 1)

Like.create!(user_id: 2,
             review_id: 1)
Like.create!(user_id: 3,
             review_id: 1)
Like.create!(user_id: 1,
             review_id: 2)
