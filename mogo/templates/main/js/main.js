function deletemenu(id)
{
	alert(id);
	document.getElementById(id).style.display = "none";
}

$(document).on('change', 'select[name=menutask]', function(){
	if($(this).val() == "page"){
		document.getElementById("load-plugin").style.display = "none";
		document.getElementById("load-url").style.display = "none";
		document.getElementById("urlfield").disabled = true;
		document.getElementById("load-pages").style.display = "block";
	}
	else if($(this).val() == "post")
	{
		document.getElementById("load-pages").style.display = "none";
		document.getElementById("load-url").style.display = "none";
		document.getElementById("urlfield").disabled = false;
		document.getElementById("pagetask").disabled = true;
		document.getElementById("load-plugin").style.display = "block";
	}
	else
	{
		document.getElementById("load-pages").style.display = "none";
		document.getElementById("load-url").style.display = "block";
		document.getElementById("urlfield").disabled = false;
		document.getElementById("load-plugin").style.display = "none";
	}
})

$(document).on('change', 'select[name=status]', function(){
	if($(this).val() == "wait"){
		document.getElementById("future_date").style.display = "block";
	}

})

function permalink(e){
	var title = document.getElementById("titlecreate").value;
	document.getElementById('url').value =  title.toLowerCase().replace(/ /g,"-").replace("'","");
}

function permalinkblog(e){
	var title = document.getElementById("titlecreate").value;
	var category = $("#category  option:selected").text();
	document.getElementById('url').value =  category.toLowerCase().replace(/ /g,"-").replace("'","")+"/"+title.toLowerCase().replace(/ /g,"-").replace("'","");
}
