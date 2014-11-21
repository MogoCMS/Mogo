<?php
global $SITETEMP;
global $M;


class syscore {
	static public $_db;
	public static function db()
	{
   	 if (!static::$_db) {
        static::$_db = new MongoClient("mongodb://".SITEDBUSERNAME.":".SITEDBPASS."@".SITEDBURL.":27017/".SITEDB);
   	 }
	  $siteDB = SITEDB;
   	 return static::$_db->$siteDB;
	}


	public function settings()
	{
		$collection = static::db()->settings;
		// find everything in the collection
		//print $PASSWORD;

		$cursor = $collection->find();
		if ($cursor->count() > 0)
		{
			// iterate through the results
			while( $cursor->hasNext() ) {
			foreach($cursor->getNext() as $key => $value)
				{
					$key = ucwords($key);
					define($key, $value);
				}
			}
		}

		//print siteName;

	}


	/*MAIN FETCHING CODE*/
	function load_blog($r = null){
		$blog = array();
		$collection = static::db()->posts;
		if($r == null)
		{
		$cursor = $collection->find(array("status"=>"publish","contenttype"=>"post"))->sort(array('_id'=>-1))->limit(10);
		}
		else
		{
		$cursor = $collection->find(array("_id"=> array('$gt'=>new MongoId($r)),"status"=>"publish", "contenttype"=>"post"))->limit(10);
		}

		if ($cursor->count() > 0)
		{
			// iterate through the results
			while( $cursor->hasNext() ) {
					$blog[] = ($cursor->getNext());
			}
			return $blog;
		}
		else
		{
			return null;
		}


	}
	
	function limit_words($string, $word_limit)
	{
		$words = explode(" ",$string);
		return implode(" ",array_splice($words,0,$word_limit));
	}

	function fetch_link($e){
		$collection = static::db()->posts;
		return $collection->findOne(array("_id"=>new MongoId($e)),array("url"));
	}

	function fetch_menus(){
		$menus = array();
		$collection = static::db()->menu;
		$cursor = $collection->find()->sort(array('order'=>1));
		if ($cursor->count() > 0)
		{
			// iterate through the results
			while( $cursor->hasNext() ) {
					$menus[] = ($cursor->getNext());
			}
		}
		else
		{
		//var_dump($this->db->lastError());
		}
		return $menus;
	}
	/*END*/
	
	/*LETS GET THE CONTENT*/
	function page_or_post($url){
		$collection = static::db()->posts;
		$result = $collection->findOne(array('url'=>$url));
		return $result;
	}
	/* END */
	
	/*Searches to see if it falls under a category*/
	function is_cat($url){
		$collection = static::db()->categories;
		$result = $collection->findOne(array('category'=> new MongoRegex("/^$url/i")));
		return $result;
	}
	
	public function fetchmenuitem($task){
		global $menu;
		global $title,$meta,$content;
		if(!empty($_REQUEST['uri']))
		{
		$check = ltrim($_REQUEST['uri'], '/');
		$popost =  self::page_or_post($check);
		$cat =  self::is_cat($check);
		}
		$menu = self::fetch_menus();
		
		
		if(!empty($popost) OR !empty($cat))
		{
			switch ($popost['contenttype']) {
				case 'page':
					$title = $popost['title']." :: Russell Harrower";
					$meta['keywords'] = $popost['keywords'];
					$meta['desc'] = $popost['description'];
					$meta['image'] = $popost['main_image'];
				break;
				case 'post':
					$title = $popost['title']." :: Russell Harrower";
					$meta['keywords'] = $popost['keywords'];
					$meta['desc'] = $popost['description'];
					if(!empty($popost['main_image'])){$meta['image'] = $popost['main_image'];}
				break;
				default:
					$title = "Official Site :: Russell Harrower";
					$meta['keywords'] = "Russell Harrower, Official Website Russell Harrower, Russell Harrower blog, Russell Harrower Radio Presenter, Radio Personal Russell (Rusty) Harrower";
					$meta['desc'] = "Entrepreneur, Radio Host/Presenter, Pet Lover, Fostercare Survivor, Child Advocate for Kids in Care - These are just some of the things that Russell Harrower talks about from his life as a foster childer to what he has made of himself. Told he would go to hell for being gay, HIV in 2009 and going though many fosterhomes where he was bashed,raped etc Russell is still able to keep his head high found out how.";
				break;
			}
			if(!empty($cat)){
				print_r($cat);
			}
		}
		else
		{
			$title = "Official Site :: Russell Harrower";
			$meta['keywords'] = "Russell Harrower, Official Website Russell Harrower, Russell Harrower blog, Russell Harrower Radio Presenter, Radio Personal Russell (Rusty) Harrower";
			$meta['desc'] = "Entrepreneur, Radio Host/Presenter, Pet Lover, Fostercare Survivor, Child Advocate for Kids in Care - These are just some of the things that Russell Harrower talks about from his life as a foster childer to what he has made of himself. Told he would go to hell for being gay, HIV in 2009 and going though many fosterhomes where he was bashed,raped etc Russell is still able to keep his head high found out how.";
			
			if(!empty($check) != null)
			{
				$error = true;
				$title = "404 :: Russell Harrower";
				$meta['keywords'] = "Russell Harrower, Official Website Russell Harrower, Russell Harrower blog, Russell Harrower Radio Presenter, Radio Personal Russell (Rusty) Harrower";
				$meta['desc'] = "nothing here - 404 page.";
			
			}
			
		}
		
		
		include("templates/main/header.tpl");
		if(!empty($popost) || !empty($error))
		{
			if(!empty($popost) )
			{
				$content['title'] = $popost['title'];
				$content['date'] = $popost['date']->sec;
				$content['author'] = $popost['author'];
				if(!empty($popost['main_image'])){$content['main_image'] = $popost['main_image'];}
				$content['content'] = htmlspecialchars_decode($popost['content']);
				//$content['mainimage'] = $popost['title'];
			
			switch ($popost['contenttype']) {
				case 'page':
					include("templates/main/page.tpl");
				break;
				case 'past':
					include("templates/main/blog.tpl");
				break;
				default:
							include("templates/main/blog.tpl");
				break;
				}
			}
			if(isset($error) == true)
			{
				echo '<div style="margin:0 auto; width:980px !important;"><img src="http://russellharrower.com/redi-upload/404-error-page.jpg" alt="404" align="center"></div>'; 
				die;
			}
		}
		else {
			include("templates/main/frontpage.tpl");
		}
		include("templates/main/footer.tpl");
	}

}
?>
