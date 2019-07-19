# README


## Usersテーブル

| Column  | Type  |  Option |
|---|---|---|
| nickname  |  string | null: false, index: true  |
| email  | string  | null: false  |
| name  | string  | null: false, index: true  |
| birthday  | integer  | null: false  |
| icon  | string  |
| intro_text  | string  |
| rating  | integer  |


### Association
- has_many :products
- has_one :card
- has_many :comments

## Productsテーブル

| Columun  | type  | option  |
|---|---|---|
| name  | string  | null: false, index: true  |
| price  | integer  | null: false  |
| condition  | integer  | null: false  |
| charge  | integer  | null: false  |
| buyday  | date  |
| status  | integer  | null: false  |
| category  | integer  | 
| user_id  | integer  | null: false, foreign_key: true  |
| text  | string  | null: false  |
| place  | integer  | null: false  |
| limit  | integer  | null: false  |


### Association
- has_many :images
- has_many :comments
- belongs_to :user


## Commentsテーブル

| Column  | Type  | Option  |
|---|---|---|
| text  | string  |   |
| user_id  | integer  | null: false, foreign_key: true  |
| product_id  | integer  | null: false, foreign_key: true  |

### Association
- belongs_to :product
- belongs_to :user


## Cardsテーブル

| Column  | Type  | Option  |
|---|---|---|
| number  | integer  | null: false  |
| cvc  | integer  | null: false  |
| exp_month  | integer  | null: false  |
| exp_year  | integer  | null: false  |
| user_id  | integer  | null: false, foreign_key: true  |

### Association
- belongs_to :user


## Imagesテーブル

| Column  | Type  | Option  |
|---|---|---|
| url  | string  | null: false  |
| product_id | integer | null: false, foreign_key: true  |

### Association
- belongs_to :product


## Addressテーブル

| Column  | Type  | Option  |
|---|---|---|
| post_code  | integer  | null: false  |
| city  | string  | null: false  |
| town  | string  | null: false  |
| block  | integer  | null: false  |
| building_name  | string  | null: false  |
| user_id  | integer  | null: false, foreign_key: true  |

### Assosiation
- belongs_to :user

