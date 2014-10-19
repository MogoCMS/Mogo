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

	public function fetchmenuitem($task){
		include("templates/main/header.tpl");
		//$collection = static::db()->menu;
		//$task = $collection->findOne(array("name"=>$task));
		//self::page_or_blog();
		include("templates/main/frontpage.tpl");
		include("templates/main/footer.tpl");
	}

}
?>
