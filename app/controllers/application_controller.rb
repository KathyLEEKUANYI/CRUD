class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with:
	:nofound

		def nofound
			render file: "#{Rails.root}/public/404.html",
			#Rails.root >>> 找路徑,找根目錄(以這裡來說就是ccc) 固定用法
      #redirect_to "/books"
		  layout: false,
			#layout裡原本就有預設的html檔案,但因為我們又再套上404然後又多了一個ｈｔｍｌ,所以要把預設的關掉
			status: 404
			#因為我們是透過渲染方式叫出404畫面,以瀏覽器的角度來說是正常的,所以要再設定狀態為錯誤的４０４
	end
end
