class TestdbsController < ApplicationController
    def index
        # @testdbs = Testdb.find(1)だと1行目のデータのみ取得
        @testdbs = Testdb.all
    end
end
