module BillsHelper

	def final_settlement
		puts "========final_settlement========="
		users = User.all.map{|user| {name: user.name, balance: user.balance.to_i}}
		users = users.sort_by{|user| user[:balance]}.reverse
		output = ""
		# [{:name=>"Akbar", :balance=>13}, {:name=>"Amar", :balance=>3}, {:name=>"Anthony", :balance=>-16}]
		arr=(0..users.length-1).to_a
		j = users.length-1
		k = 0
		index = 1
		while k < users.length-1			
			puts k
			puts users
			if users[k][:balance] > 0 and users[j][:balance] < 0
				if (users[k][:balance] + users[j][:balance]) > 0 then
					output += "<p>#{index}. #{users[k][:name]} => #{users[j][:name]} <b>$#{-users[j][:balance]}</b></p>"
					users[k][:balance] = users[k][:balance] + users[j][:balance]
					users[j][:balance] = 0
					j-=1
					index += 1
				elsif ((users[k][:balance] + users[j][:balance]) < 0 )
					output += "<p>#{index}. #{users[k][:name]} => #{users[j][:name]} <b>$#{users[k][:balance]}</b></p>"
					users[k][:balance] = 0
					users[j][:balance] = users[k][:balance] + users[j][:balance]
					k+=1
					index += 1
				else
					users[k][:balance] = 0
					users[j][:balance] = 0
					k+=1
					j-=1
				end
			elsif users[j][:balance] < 0
			  	j-=1
			else
				k+=1
			end
		end
		output
	end
end
