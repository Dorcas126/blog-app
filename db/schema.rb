

ActiveRecord::Schema[7.0].define(version: 2023_09_26_105601) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id_id", null: false
    t.bigint "post_id_id", null: false
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id_id"], name: "index_comments_on_post_id_id"
    t.index ["user_id_id"], name: "index_comments_on_user_id_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id_id", null: false
    t.bigint "post_id_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id_id"], name: "index_likes_on_post_id_id"
    t.index ["user_id_id"], name: "index_likes_on_user_id_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "author_id_id", null: false
    t.string "title"
    t.string "text"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "bio"
    t.string "postsCounter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "posts", column: "post_id_id"
  add_foreign_key "comments", "users", column: "user_id_id"
  add_foreign_key "likes", "posts", column: "post_id_id"
  add_foreign_key "likes", "users", column: "user_id_id"
  add_foreign_key "posts", "users", column: "author_id_id"
end
