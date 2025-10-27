 	function checkValue(obj, msg){
 		var val = obj.value;
 		var result = false;
 		if(val === "") {
 			alert(msg);
 			obj.focus();
 			result = true;
 		}
 		return result;

 	}
	function checkLength1(obj, min, max, msg_1, msg_2) {
			var result = false;
			var obj_length = obj.value.length;
		
			if(obj_length < min ) {
				alert(msg_1);
				obj.focus();
				result = true;
			} else if (obj_length > max) {
				alert(msg_2);
				obj.focus();
				result = true;
			}
			return result;
		}
	function checkLength(obj, min, max, msg) {
		var result = false;
		var obj_length = obj.value.length;
	
		if(obj_length < min || obj_length > max) {
			alert(msg);
			obj.focus();
			result = true;
		}
		return result;
	}
