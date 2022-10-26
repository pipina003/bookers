class BooksController < ApplicationController

  def index
   @book = Book.new
   @books = Book.all
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
   @book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
   if @book.save
   # フラッシュメッセージを定義し詳細画面へリダイレクト
    flash[:notice] ="Book was successfully created."
    # 投稿してそのまま詳細画面へリダイレクト
    redirect_to book_path(@book.id)
   else
    @books=Book.all
    render:index
   end
  end

  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   # 投稿一覧へリダイレクト
   redirect_to '/books'
  end

  def show
   @book = Book.find(params[:id])
  # 詳細ページ、一件だけ詳細をみたいので変数はbookの単数形にする
  # findメソッドは引数を受け取り、idカラムを引数と比べてレコードを取得するメソッド
  end

  def edit
   # 編集機能
   @book = Book.find(params[:id])
  end

  def update
   # 更新、保存
   @book = Book.find(params[:id])
   if @book.update(book_params)
   # フラッシュメッセージ
   flash[:notice] ="Book was successfully updated."
   redirect_to book_path(@book.id)
   else
   render:edit
   end
  end

  private
  def book_params
  # ストロングパラメータ
  params.require(:book).permit(:title,:body)
  end
end
