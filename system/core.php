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
		$cursor = $collection->find(array("status"=>"publish","contenttype"=>"post"))->sort(array('_id'=>1))->limit(10);
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

		}


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
	
	public function fetchmenuitem($task){
		global $menu;
		global $title,$meta,$content;
		if(!empty($_REQUEST['uri']))
		{
		$check = ltrim ($_REQUEST['uri'], '/');
		$popost =  self::page_or_post($check);
		}
		$menu = self::fetch_menus();
		if(!empty($popost))
		{
			switch ($popost['contenttype']) {
				case 'page':
					$title = $popost['title']." :: Russell Harrower";
					$meta['keywords'] = $popost['keywords'];
					$meta['desc'] = $popost['description'];
				break;
				case 'post':
					$title = $popost['title']." :: Russell Harrower";
					$meta['keywords'] = $popost['keywords'];
					$meta['desc'] = $popost['description'];
				break;
				default:
					
				break;
			}
		}
		else
		{
			
		}
		
		
		include("templates/main/header.tpl");
		if(!empty($popost))
		{
			$content['title'] = $popost['title'];
			$content['date'] = $popost['date']->sec;
			$content['author'] = $popost['author'];
			$content['content'] = htmlspecialchars_decode($popost['content']);
			//$content['image'] = $popost['title'];

			switch ($popost['contenttype']) {
				case 'page':
					include("templates/main/page.tpl");
				break;
				
				default:
							include("templates/main/blog.tpl");
				break;
			}
		}
		else {
			include("templates/main/frontpage.tpl");
		}
		include("templates/main/footer.tpl");
	}

}
?>
