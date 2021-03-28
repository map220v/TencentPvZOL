function getSig(method,apiUrl,paramUrl,appKey){
	var resultStr;
	var apiUrlStr=encodeURIComponent(apiUrl);
	var paramsArr=encodeURIComponent(sortParamsUrl(paramUrl));
	resultStr=method+"&"+apiUrlStr+"&"+paramsArr;
	appKey=appKey+"&";
	resultStr=CryptoJS.HmacSHA1(resultStr, appKey);
	resultStr=CryptoJS.enc.Base64.stringify(resultStr);
	resultStr=encodeURIComponent(resultStr);
	return resultStr;
}

function sortParamsUrl(url){
	var result=new Array();
	var tempArr=new Array();
	var index=new Array();
	var arr = new Array();
	arr = url.split('&'); 
	for(var i=0;i<arr.length;i++)
	{
		var index1 = arr[i].indexOf('=');
		//判断最后一个参数是否有值
		if(index1 == -1)
		{
			tempArr[arr[i]]='';
			index.push(arr[i]);
			continue;
		}
		var key = arr[i].substr(0,index1);
		var val = arr[i].substr(index1+1);
		tempArr[key]=val;
		index.push(key);
	}
	index.sort();
	for(i=0;i<index.length;i++){
		result[index[i]]=tempArr[index[i]];
	}
	var str='';
	for(var value in result){
		str+=value+"="+result[value]+"&";
	}
	if(str.length>0){
		str=str.substr(0,str.length-1);
	}
	return str;
}