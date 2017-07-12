# DB設計
---
## users_table
---
|column                 |type     |options                                |
|:---------------------:|:-------:|:-------------------------------------:|
|id                     |integer  |null: false                            |
|name                   |string   |index: true, null: false, unique: true |
|e-mail                 |stirng   |null false                             |

## Association

- has_many :groups, through: groups_users

- has_many :messages

- has_many :groups_users

## groups_table
---
|column     |type     |options                   |
|:---------:|:-------:|:------------------------:|
|id         |integer  |null: false               |
|name       |string   |null: false, unique: true |
|updated_at |datetime |null: false               |

## Association

- has_many :users, through: groups_users

- has_many :messages

- has_many :groups_users
