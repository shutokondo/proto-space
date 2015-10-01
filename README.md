# protospace
#database design
##usersテーブル
* name
* email
* password
* avatar
* works
* profile
* member

has_many :prototypes

has_many :like_logs

has_many :comments

##prototypesテーブル
* title
* catchcopy
* concept
* user_id

has_many :comments

has_many :like_logs

has_many :tags, through :tagging

belongs_to :user

##tagsテーブル
* name

has_many :prototypes, through :tagging

##commentsテーブル
* comment
* user_id
* prototype_id

belongs_to :user

belongs_to :prototype

##likesテーブル
* user_id
* prototype_id

belongs_to :user

belongs_to :prototype
