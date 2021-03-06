ActiveRecord::Schema.define(version: 20_210_512_212_740) do
  create_table 'hashtag_questions', force: :cascade do |t|
    t.integer 'question_id', null: false
    t.integer 'hashtag_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['hashtag_id'], name: 'index_hashtag_questions_on_hashtag_id'
    t.index ['question_id'], name: 'index_hashtag_questions_on_question_id'
  end

  create_table 'hashtags', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['name'], name: 'index_hashtags_on_name', unique: true
  end

  create_table 'questions', force: :cascade do |t|
    t.string 'text'
    t.string 'answer'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'user_id', null: false
    t.integer 'author_id'
    t.index ['author_id'], name: 'index_questions_on_author_id'
    t.index ['user_id'], name: 'index_questions_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'username'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'email'
    t.string 'password_hash'
    t.string 'password_salt'
    t.string 'avatar_url'
    t.string 'background', default: '#005a55'
    t.index ['username'], name: 'index_users_on_username', unique: true
  end

  add_foreign_key 'hashtag_questions', 'hashtags'
  add_foreign_key 'hashtag_questions', 'questions'
  add_foreign_key 'questions', 'users'
end
