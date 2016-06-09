class users::admins {

	users::managed_user { 'jose': 
		group => 'admin',
	}
	
	users::managed_user { 'alice':    
		group => 'developer',
	}

	users::managed_user { 'chen':   
		# group defaults to $title 
	}

}
