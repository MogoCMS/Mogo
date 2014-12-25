function trim_words(theString, numWords) {
	 var entities = [
        ['apos', '\''],
        ['amp', '&'],
        ['lt', '<'],
        ['gt', '>']
    ];

    for (var i = 0, max = entities.length; i < max; ++i)
        theString = theString.replace(new RegExp('&'+entities[i][0]+';', 'g'), entities[i][1]);


	expString = theString.split(/\s+/,numWords);
    theNewString=expString.join(" ");
	var rex = /(<([^>]+)>)/ig;
    return theNewString.replace(rex , "");
}

function loadmore()
{
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
  	  }
		else
	  {// code for IE6, IE5
  		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
      }

	  xmlhttp.onreadystatechange=function()
      {
      if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
       	var count = 0;
       	var content;
       	//alert(xmlhttp.responseText);

        var x=JSON.parse(xmlhttp.responseText);
        for (i=0;i<x.length;i++)
  		{

   	 content='<div class="col-lg-4 col-md-4 col-sm-4">';
     content+='<div class="thumbnail">';
	 content+='<img src="'+ x[i].main_image +'" alt="'+x[i].title+'" style="width:300px !important; height:150px; overflow:none;">';
     content+='<div class="caption">';
     content+='<h3>'+ x[i].title +'</h3>';
     content+='<p>'+ trim_words(x[i].content,30)+'</p>';
     content+='<p><a href="/'+ x[i].url +'" class="btn btn-default" role="button">Read More</a></p>';
     content+='</div>';
     content+='</div>';
     content+='</div>';


  		window.id = x[i]._id.$id;
  		document.getElementById("content").innerHTML+=content;
        count++;
        if(count==3){
        	document.getElementById("content").innerHTML+='<div class="clearfix visible-md-block" style="width:100% !important; float:left; display:block !important; height:2px !important;"></div>';
        	count=0;
        }
  		}
  		if(xmlhttp.responseText === 'null' || last_id === id){
       		document.getElementById('loadmore').style.display = "none";
       	}
       }
      }


//xmlhttp.responseText
xmlhttp.open("GET","search/json&qid="+id+"&category="+cat,true);
xmlhttp.send();

}
