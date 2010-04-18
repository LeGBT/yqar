class FilmsDuRepController < ApplicationController
	def liste
		res = []
		#Dir.entries('/home/invite/Téléchargements').each{ |a|
		#	res.push(a.grep(/((mkv)|(avi)|(mpg)|(mp4))\Z/i)[0])
		#}
	  
		@path = "/"
		require 'digest/sha1'
		Dir.chdir("/Users/albanavenant/Movies")
		Dir.glob("**/*{.mkv,.avi,.mpg,.mp4}").each{|x|
			#	puts "Got #{x}" 
			file = File.new(x,'r')
			num = file.read(2**16)
			sha1 = Digest::SHA1.hexdigest(num)
		#	puts sha1
			res.push(x)
			res.push(sha1)
		}

		@liste=res.compact
		render 
	end

	def list_video(chemin)
		res = []
		Dir.entries('/home/invite/Téléchargements').each{ |a|
			res.push(a.grep(/((mkv)|(avi)|(mpg)|(mp4))\Z/i)[0])
		}
		@liste=res.compact
		render "liste"
	end

end
