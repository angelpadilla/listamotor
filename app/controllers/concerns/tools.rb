module Tools
	def its_mine?(product)
		if current_user.id == product.user.id
			true
		end
	end

	def check_property(product)
		unless current_user.id == product.user.id
			redirect_to root_path, notice: "error 9001"
		end
	end
	def check_super
		unless current_user.is?(:super) or current_user.is?(:editor)
			redirect_to root_path
		end
	end
end