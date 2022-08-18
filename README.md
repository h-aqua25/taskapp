# タスク管理アプリ
## ローカル環境
- Ruby: 3.1.2
- Rails: 7.0.3
- mysql2: 0.5.4
- docker: 3

## テーブル
### users(deviseを使用)
- has_many: tasks

|  物理名  |  論理名  |  型  |  オプション  |
| ---- | ---- | ---- | ---- |
|  name  |  名前  |  string  |  default: "", null: false  |
|  email  |  Eメール  |  string  |  default: "", null: false  |
|  encrypted_password  |  暗号化されたパスワード  |  string  |  default: "", null: false  |
|  reset_password_token  |  リセットパスワードトークン  |  string  |      |
|  reset_password_sent_at  |  リセットパスワードトークンを送った日時  |  datetime  |      |
|  remember_created_at  |  ログイン状態を維持する日時  |  datetime  |      |


### tasks
- belongs_to: user
- has_many: task_labels
- has_many: labels, througth: task_labels

|  物理名  |  論理名  |  型  |  オプション  |
| ---- | ---- | ---- | ---- |
|  name  |  タスク名  |  string  |  default: "", null: false  |
|  end_date  |  終了期限  |  datetime  |      |
|  priority  |  優先順位  |  integer  |  default: 0, (0: low, 1: normal, 2: high)  |
|  status  |  ステータス  |  integer  |  default: 0, (0: untouched, 1: touched, 2: completed)  |
|  explanation  |  説明文  |  text  |      |
|  user_id  |  ユーザID  |  integer  |  foreign_key  |

### task_labels
- belongs_to: task
- belongs_to: label

|  物理名  |  論理名  |  型  |  オプション  |
| ---- | ---- | ---- | ---- |
|  task_id  |  タスクID  |  integer  |  foreign_key  |
|  label_id  |  ラベルID  |  integer  |  foreign_key  |

### labels
- has_many: task_labels
- has_many: tasks, througth: task_labels

|  物理名  |  論理名  |  型  |  オプション  |
| ---- | ---- | ---- | ---- |
|  name  |  ラベル名  |  string  |  default: "", null: false  |
