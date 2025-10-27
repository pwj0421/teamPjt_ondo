// 매개 변수로 넘어온 인풋 요소 값의 공백여부
function checkValue(obj, msg) {
	var val = obj.value;
	var result = false;
	if(val == "") {
		alert(msg);
		obj.focus();
		
		result = true;
	}
	
	return result;
}
	
function checkLength(obj, min, max, msg) {
	var result = false;
	var len = obj.value.length;
	if(len < min || len > max) {
		alert(msg);
		obj.focus();
		result = true;
	}
	
	return result;
}

