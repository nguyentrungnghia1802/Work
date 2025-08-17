
### Yoga/Gym Center – プロジェクトドキュメント

このウェブサイトはヨガ・ジムセンター向けのインターフェースであり、JSP/Servlet、HTML/CSS、純粋なJavaScriptで構築されています。ユーザー体験、滑らかなアニメーション、再利用可能なコンポーネント構造に重点を置いています。

### デモ
- デモ: `https://www.youtube.com/watch?v=lTqY_-PNv5o`


### 使用技術
- **JSP/JSTL**: 動的な画面構築、コンポーネントのインクルード (`header.jspf`, `footer.jspf`, `nav.jspf`, `alert.jspf`, `pagination.jspf` など)
- **Jakarta Servlet (Jakarta EE 10, web.xml 6.0)**: サーブレットのルーティング (`WEB-INF/web.xml`で定義)
- **HTML5/CSS3**: モダンでレスポンシブなUI、グラデーション・シャドウ・アニメーション効果
- **純粋なJavaScript**: UIインタラクション (スムーズスクロール、ナビのアクティブ判定、リアルタイム検索、アニメーション、リストのトグル、トップへ戻る)
- **アプリケーションサーバー**: Apache Tomcat 10.1+ (Jakarta EE 10推奨)

※Bootstrapは使用していません。全てCSSのみでUIを構築しています。

### ディレクトリ構成
```
web/
├─ index.jsp                  # ホーム
├─ components/                # 再利用可能なJSPコンポーネント (.jspf)
│  ├─ header.jspf, footer.jspf, nav.jspf, nav_new.jspf
│  ├─ alert.jspf, pagination.jspf
│  ├─ button.jspf, submitButton.jspf, deleteButton.jspf
│  └─ zoomModal.jspf
├─ pages/                     # メイン画面
│  ├─ register.jsp, classes.jsp, members.jsp, contact.jsp, team.jsp
├─ admin/                     # 管理者エリア (UIデモ)
│  ├─ login.jsp, dashboard.jsp
├─ assets/
│  ├─ css/                    # style.css (グローバル) + 各画面用CSS
│  │  ├─ style.css, team.css, classes.css, contact.css, login.css, dashboard.css
│  └─ js/                     # main.js (グローバル) + 各画面用JS
│     ├─ main.js, team.js, members.js, contact.js, search.js, register.js
│     └─ admin.js, dashboard.js
├─ WEB-INF/
│  ├─ web.xml                 # web-app設定 (servlet-mapping)
│  ├─ users.txt, registrations.txt (デモ用ストレージ)
└─ META-INF/
   └─ context.xml            # コンテキストパス: /Yoga_Website
```

### 各画面の機能
- **ホーム (`index.jsp`)**
  - ナビゲーションバー、ヒーローセクション、特徴ブロック、CTA「今すぐ登録」
  - 滑らかなアニメーション、アクティブなナビ判定、トップへ戻るボタン

- **クラス登録 (`pages/register.jsp`)**
  - 登録フォーム (氏名、メール、電話番号、クラス、プラン、備考)、クライアント側バリデーション
  - 成功通知 (alert)、送信後フォームリセット、「クラス一覧」へのリンク
  - JS: `assets/js/register.js` (handleSubmit, メール/電話バリデーション)

- **クラス一覧 (`pages/classes.jsp`)**
  - クラスカードグリッド (クラス名、説明、時間、料金、定員)、登録ボタン
  - タイトル/説明/時間でリアルタイム検索
  - プラン料金表
  - JS: `assets/js/search.js` (リアルタイム検索 + 「結果なし」通知)

- **メンバー一覧 (`pages/members.jsp`)**
  - アコーディオン形式のクラス一覧; 各クラスにスケジュール、講師、部屋、統計、サンプル生徒リスト
  - 「👥 生徒一覧を見る」ボタンで開閉; 他クラスは自動で閉じる
  - JS: `assets/js/members.js` (toggleMembers, 順次アニメーション)

- **お問い合わせ (`pages/contact.jsp`)**
  - 連絡先情報 (住所、電話、メール、ウェブサイト)、営業時間表
  - メッセージ送信フォーム (クライアント側バリデーション)、地図プレースホルダー、SNSリンク
  - JS: `assets/js/contact.js` (handleContactSubmit, contact項目のスライドイン)

- **開発チーム (`pages/team.jsp`)**
  - メンバーカード (アイコン、名前、役割、情報、SNSリンク)、プロジェクト紹介
  - JS: `assets/js/team.js` (アイコンクリック + IntersectionObserver)

- **管理者ログイン (`admin/login.jsp`)**
  - ログインフォーム。エラー通知 (`request.getAttribute("errorMsg")`)
  - デモ認証情報: `admin / 123456` (画面表示)

- **管理者ダッシュボード (`admin/dashboard.jsp`)**
  - 概要統計 (総生徒数、クラス数、本日登録数、充足率)
  - 登録一覧テーブル (デモ) + テーブル内検索、行削除 (クライアント側)
  - JS: `assets/js/dashboard.js` (searchTable, deleteRegistration)

### 再利用可能なコンポーネント (components)
- **`header.jspf`**: 標準ナビ (`nav.jspf`)をインクルード
- **`footer.jspf`**: 共通フッター、センター情報
- **`nav.jspf`/`nav_new.jspf`**: ナビゲーションバー (内部リンク、管理者リンク)
- **`alert.jspf`**: `errorMsg`/`successMsg`をリクエストスコープから表示
- **`pagination.jspf`**: 動的ページネーション (`pageCount`/`currentPage`)
- **`button.jspf`, `submitButton.jspf`, `deleteButton.jspf`**: 標準/送信/削除ボタン (JSフック `deleteRegistration`)
- **`zoomModal.jspf`**: 画像拡大モーダル

### 主なCSS/JSリソース
- グローバルCSS: `assets/css/style.css`
  - リセット、レイアウト、コンテナ、ナビ、ボタン、カード、テーブル、アラート、ページネーション、ヒーロー、特徴、レスポンシブ
- 画面別CSS: `team.css`, `classes.css`, `contact.css`, `login.css`, `dashboard.css`
- グローバルJS: `assets/js/main.js`
  - スムーズスクロール、ナビのアクティブ判定、カードのIntersectionObserver、通知、ローディングオーバーレイ、トップへ戻る
- 画面別JS: `register.js`, `search.js`, `members.js`, `contact.js`, `team.js`, `dashboard.js`, `admin.js` (`DeleteRegistrationServlet`へのfetchデモ)

### アプリケーション設定
- `WEB-INF/web.xml` (Jakarta EE 6.0 schema):
  - サーブレット宣言とマッピング: `RegisterServlet`, `LoginServlet`, `LogoutServlet`, `DeleteRegistrationServlet`, `AdminListServlet`
  - `welcome-file`: `index.jsp`
- `META-INF/context.xml`: `path="/Yoga_Website"` (デプロイ時のコンテキストパス)
- デモストレージ: `WEB-INF/users.txt`, `WEB-INF/registrations.txt`

### 実行方法
1) 必要環境
   - JDK 17+ (推奨)
   - Apache Tomcat 10.1+ または Jakarta EE 10対応サーバー

2) デプロイ
   - 方法A (IDE): Dynamic Web Projectとしてインポートし、`web/`をWebContentに設定。`web.xml`がIDEで認識されることを確認し、Tomcat 10.1+で実行。
   - 方法B (手動): `web/`をWARにパッケージし、コンテキスト`Yoga_Website`でデプロイ。または`web/`の内容を`TOMCAT/webapps/Yoga_Website/`にコピーしてTomcatを起動。

3) アクセス
   - デフォルト: `http://localhost:8080/Yoga_Website/`
   - 管理者エリア: `http://localhost:8080/Yoga_Website/admin/login.jsp` (デモ: `admin/123456`)
   (教員の指示によりポートを9999に変更)

### 注意点・現状の制限
- 多くのデータはデモ/ハードコード (JSP/JS) でUIを説明
- 登録/ログインフォームは現状クライアント側(alert)のみ処理、`RegisterServlet`や`LoginServlet`には未接続
- `admin.js`は`DeleteRegistrationServlet`へのfetch例あり、`dashboard.jsp`はクライアント側削除のみ
- `web/`内で実際のDBは未使用。バックエンド/DAOが外部にある場合はビルド・デプロイが必要

### 今後の開発案
- 登録/ログイン/削除フォームをServletに接続、サーバー側バリデーション・`alert.jspf`による通知追加
- レイアウト分離: header/nav/footerを共通化し全画面に適用
- データベース(MySQL/PostgreSQL)、ORM(JPA/Hibernate)またはJDBCの統合
- ダッシュボードのサーバー側ページネーション・検索、セッション認証・権限管理
- テスト追加 (UI e2e + コントローラ/サービスのユニットテスト)、CI/CD

---



