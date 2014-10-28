module UsersHelper



	def shipping_address(user)
		if user.default_shipping_id
			Address.find(user.default_shipping_id)
		else
			"N/A"
		end
	end

	def last_order(user)
		if user.orders.last
			user.orders.last.created_at.strftime("%m-%d-%Y")
		else
			"N/A"
		end
	end

	

end
