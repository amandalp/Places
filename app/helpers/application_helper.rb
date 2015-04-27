module ApplicationHelper
	def bootstrap_class_for flash_type
	  case flash_type
	    when :success
	      "alert-success"
	    when :error
	      "alert-error"
	    when :alert
	      "alert-block"
	    when :notice
	      "alert-info"
	    else
	      flash_type.to_s
	  end
	end

	def search(location)
	  GooglePlacesApi.query(location)
	end

	def location_name(location)
	  search(location)["formatted_address"]
	end

	def exact_address(location)
	  search(location)["exact_address"]
	end

	def destination(location)
	  search(location)["formatted_address"]
	end

	def coordinates(location)
	  search(location)["geometry"]["location"]
	end

	def place_id(location)
	  search(location)["place_id"]
	end
end
