require "fileutils"
class ManualController < ApplicationController
    def index
        @manuals = Manual.all
        #@manuals.gsub(/\\u([\da-fA-F]{4})/) { [$1].pack('H*').unpack('n*').pack('U*') }
        #render json: @manuals.to_s.gsub(/\\u([\da-fA-F]{4})/) { [$1].pack('H*').unpack('n*').pack('U*') } 
        
        old_images_dir = 'old'
        if Dir.exists? old_images_dir
          #noop
        else
          Dir.mkdir old_images_dir
        end
        images_copy(old_images_dir)#元画像のコピー        

        images_dir = 'images'
        @manuals.each do |manual|
            html_name = '../html/'#path + file名
            html_name = html_name + manual.file_name + '.html'
            f = File.open(html_name, 'w')
            f.puts manual.contents
            f.close

            #旧ファイル名と合致するファイルの名前を変更する
            Dir.glob(manual.base_file_name + '*.*').each do |old_name_file|
              #01_login_common_first_login_image0.png(old_name_fileの中身)の
              #01_login_common_first_loginと_image0.pngをsplitして
              #01_login_common_first_loginをlogout_1に置換した後結合
              #logout_1_image0.pngにする
              file_under_name = old_name_file.split(manual.base_file_name)
              new_file_name = manual.file_name + file_under_name[1]
              #FileUtils.mv(old_name_file,new_file_name)
              FileUtils.cp(old_name_file,new_file_name)
            end
        end
    end
    # ファイルのコピー
    def images_copy old_path
      FileUtils.cp(Dir.glob('*.*'), old_path)
    end
end