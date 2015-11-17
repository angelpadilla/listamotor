module ApplicationHelper
	def its_mine?(product)
		if current_user.id == product.user.id
			true
		end
	rescue NoMethodError
		false
	end

	def super?
		if current_user.is?(:super) or current_user.is?(:editor)
			true
		end
	rescue NoMethodError
		false
	end
end
