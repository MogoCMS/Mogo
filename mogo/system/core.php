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

	public function createuser($type){

		$data = $_POST;
		$salt = self::gen_salt();
		$collection = static::db()->salts;
		$collection->insert(array("salt"=>$salt));
		$new_salt = $collection->findOne(array("salt"=>$salt));
		$password =  hash('sha512', $salt.$data['password'].$salt, FALSE);
		$collection = static::db()->members;
		$collection->insert(array(
			"signuptime"=>new MongoDate(),
			"username"=>$data['username'],
			"password"=>$password,
			"salt"=>new MongoId($new_salt['_id']),
			"type"=>$type,
			"settings"=>array("email"=>array("confirmed"=>false),"notifications"=>array("comments"=>1,"members"=>1,"follows"=>1)),
			"mydetails" => array(
			"name" =>array("first"=>$data['firstname'],"last"=>$data['lastname']),"email"=>$data['email'])
			)
		);
	}

	function gen_salt()
	{
		$a = substr(str_shuffle(str_repeat("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@!#$%^&*()_+=-", 20)), 0, 20);
		$b = substr(str_shuffle(str_repeat("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@!#$%^&*()_+=-", 20)), 0, 20);
		$c = substr(str_shuffle(str_repeat("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@!#$%^&*()_+=-", 20)), 0, 20);
		return $b.rand(1781,187156715671567156715761576157614652456246).$a.substr(md5(microtime()),rand(0,26),40).$c;
	}



	function loginproccess(){
		$collection = static::db()->members;
		$user = $collection->findOne(array("username"=>$_POST['username']));
		$collection = static::db()->salts;
		$salt = $collection->findOne(array("_id"=>new MongoId($user['salt'])));
		$password =  hash('sha512', $salt['salt'].$_POST['password'].$salt['salt'], FALSE);

		if($user['password'] == $password)
		{
			$collection = static::db()->members;
			$cursor = $collection->find(array("_id"=>new MongoId($user['_id'])),
			array("_id","profile.picture","mydetails.name.first","mydetails.name.last"));
			if ($cursor->count() == 1)
			{
    			$test = array();
				// iterate through the results
				while( $cursor->hasNext() ) {
					$test[] = ($cursor->getNext());
				}
			}
			//Print Results
			foreach($test as $d) {
    			$_SESSION["user"] = rand(178116717717,187156715671567156715761576157614652456246);
			}
				$_SESSION["user_information"] = $test;
		 	header("Location: index.php");
		}
		else
		{
			header("Location: index.php?error=wrongpassword");
		}

	}

	/* Start Of Menus */
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

	function create_menu(){
		$collection = static::db()->menu;
		if($_POST['submenu'] == 0)
		{
			$collection->insert(array("title"=>$_POST['title']));
		}
		else {
			$collection->update(array("title"=>$_POST['menulevel']));
		}
	}
	/* End of Menus*/

	/*Tips*/
	function loadtip($area){
		$tips = array();
		$collection = static::db()->MogoProjectcore;
		$cursor = $collection->find(array ('$or'=> array ( 0 => array ('type' => $area,),1 =>array ('type' => 'any', ),),))->limit(-1)->skip(mt_rand(0, $collection->count()));
		if ($cursor->count() > 0)
		{
			// iterate through the results
			while( $cursor->hasNext() ) {
					$tips[] = ($cursor->getNext());
			}
		}
		else
		{
			var_dump(static::db()->lastError());
		}

		return $tips;
	}
	/*end tips*/
	/* Start of Categories */
	function fetch_categories(){
		$category = array();
		$collection = static::db()->categories;
		$cursor = $collection->find();
		if ($cursor->count() > 0)
		{
			// iterate through the results
			while( $cursor->hasNext() ) {
					$category[] = ($cursor->getNext());
			}
		}
		else
		{
			var_dump($this->db->lastError());
		}
		return $category;
	}

	function create_category(){
		$collection = static::db()->categories;
		$cursor = $collection->find(array("category"=>ucwords($_POST['category'])));
		if ($cursor->count() == 1)
		{
			return 1;
		}
		else {

		$collection->insert(array("category"=>ucwords($_POST['category'])));
		return 0;
		}
	}

	/* End of Categories */
	/*Creating and Editing Pages/Post*/
	function savepost(){
		if($_POST['status'] == 'wait'){
			$publish = new MongoDate(strtotime($_POST['publishdate']." 00:00:00"));
		}
		else
		{
			$publish = new MongoDate();
		}
		$collection = static::db()->posts;
		$collection->insert(array("main_image"=>$_POST['main_image'],"title"=>htmlentities($_POST['title']),"url"=>$_POST['url'],"content"=>htmlentities($_POST['content']),"status"=>$_POST['status'],"date"=>$publish,"authorID"=>new MongoId($_POST['authorID']),"author"=>$_POST['author'],"category"=>$_POST['category'],"description"=>htmlentities($_POST['description']),"keywords"=>htmlentities($_POST['keywords']),"contenttype"=>$_POST["contenttype"]));
	}

	function update_savepost(){
		if($_POST['status'] == 'wait'){
			$publish = new MongoDate(strtotime($_POST['publishdate']." 00:00:00"));
		}
		else
		{
			$publish = new MongoDate();
		}
		$collection = static::db()->posts;
		$collection->update(array('_id'=>new MongoId($_POST['_id'])),
							array("main_image"=>$_POST['main_image'],
									"title"=>htmlentities($_POST['title']),
									"url"=>$_POST['url'],
									"content"=>htmlentities($_POST['content']),
									"status"=>$_POST['status'],
									"date"=>$publish,
									"authorID"=>new MongoId($_POST['authorID']),
									"author"=>$_POST['author'],
									"category"=>$_POST['category'],
									"description"=>htmlentities($_POST['description']),
									"keywords"=>htmlentities($_POST['keywords']),
									"contenttype"=>$_POST["contenttype"]),
							array('upsert'=>true));
							
	}

	function fetchdata($type){
		$items = array();
		$collection = static::db()->posts;
		$search = array("contenttype"=>$type);
		$cursor = $collection->find($search)->sort(array("_id"=>-1));
		if ($cursor->count() > 0)
		{
			// iterate through the results
			while( $cursor->hasNext() ) {
					$items[] = ($cursor->getNext());
			}
		}
		else
		{
			var_dump($this->db->lastError());
		}
		return $items;
	}
	/*End of Page/Post*/
	/*Start of menu creating*/
	function savemenu(){
		$collection = static::db()->menu;
		if($_POST['submenu']== 0)
		{
			$query = array("title"=>$_POST['title'],"menutask"=>$_POST['menutask'],"task"=>$_POST['task'],"menulevel"=>$_POST['menulevel']);
			$collection->insert($query);
		}
		elseif($_POST['submenu']== 1){
			$query = array("_id"=>new MongoId($_POST['menulevel']));
			$data = array('$push' => array("submenu"=>array("title"=>$_POST['title'],"menutask"=>$_POST['menutask'],"task"=>$_POST['task'])));
			$options = array("upsert" => true);
			$collection->update( $query, $data, $options );
		//$query = array("title"=>$_POST['title'],"menutask"=>$_POST['menutask'],"task"=>new MongoId($_POST['task']),"menulevel"=>$_POST['menulevel']);
	 }
	}

	function reordermenu(){
		foreach($_POST['menu'] as $menu){
			$collection = static::db()->menu;
			$query = array("_id"=>new MongoId($menu['id']));
			$data = array('$set' => array("order"=>$menu['order']));
			$options = array("upsert" => true);
			$collection->update( $query, $data, $options );

		}
	}
	/*End of menu creating*/

	/*LETS GET THE CONTENT*/
	function fetch_post($uid){
		$collection = static::db()->posts;
		$result = $collection->findOne(array('_id'=>new MongoId($uid)));
		return $result;
	}






	public function fetchmenuitem($task){
		global $t;
		include("templates/main/header.tpl");

		if(empty($_SESSION['user'])){
			include("templates/main/login.tpl");
		}
		else
		{
			
			switch ($task) {
				case 'create':
					$categories = self::fetch_categories();
					$t = $_GET['t'];
					if($t=="pages" || $t=="posts" AND !empty($_POST)){
						self::savepost();
					}

					if($t == "pages"){
					include("templates/main/create-pages.tpl");
					}
					else
					{
					include("templates/main/create-posts.tpl");
					}
				break;
				case 'edit_post':
					if(!empty($_POST)){
						self::update_savepost();
					}
					$categories = self::fetch_categories();
					global $post;
					$post = self::fetch_post($_REQUEST['uid']);
					include("templates/main/edit_post.tpl");
				break;
				case 'media':
					include("templates/main/media.tpl");

				break;
				case 'menu':
				if($_POST){
					self::reordermenu();
				}
					$menus = self::fetch_menus();
					include("templates/main/menu.tpl");
					$tip = self::loadtip("menuarea");
					if(!empty($tip[0])){
					$msg = $tip[0]['msg'];
					$alert_color = $tip[0]['style'];
					}
					else
					{
						$msg = "<b>FACT:</b> MogoProject is powered by your coffee buys - Shout us a coffee and we will thank you on the coffee shout page - <a href='http://MogoProject.xyz/coffee' taregt='_blank' title='MogoProject'>Coffee Shout</a>";
						$alert_color = "alert-info";
					}
					//$alert_color = "alert-warning";
					include("templates/main/msg.tpl");
				break;
				case 'menu/new':
					if($_POST){
						self::savemenu();

					$msg ="Your menu item has been added to the menu - please check out the menu section or continue adding another menu item below.";

					}
					else
					{
					$msg ="Please choice the title of your menu item clearfully. As we use the SEO-Friendly URL that was created when your made the page you are now creating the menu link for. It is recommended that you choose the same name as the page for the menu title.";

					}

					$alert_color = "alert-warning";
					include("templates/main/msg.tpl");

					$menus = self::fetch_menus();
					$items = self::fetchdata('page');
					include("templates/main/menunew.tpl");
				break;
				case 'categories':
					if($_POST){
						global $alert_color;
						$report = self::create_category();
						if($report == 0)
						{
						$alert_color = "alert-success";
						$msg ="You have successfully added ".$_POST['category'];
						include("templates/main/msg.tpl");
						}
						elseif($report == 1)
						{
						$alert_color = "alert-danger";
						$msg ="You already have ".$_POST['category']." in your categories";
						include("templates/main/msg.tpl");
						}
					}

					$categories = self::fetch_categories();

					include("templates/main/categories.tpl");
				break;
				case 'manage':
					if(!empty($_GET['t']) && $_GET['t']  == "pages")
					{
						$link = "create?t=pages";
						$items = self::fetchdata('page');
						include("templates/main/mpp.tpl");
					}
					elseif(!empty($_GET['t']) && $_GET['t']=="posts"){
						$link = "create?t=posts";
						$items = self::fetchdata('post');
						include("templates/main/mpp.tpl");

					}
					break;
				default:
				 include("templates/main/home.tpl");
				break;
			}
		}


		include("templates/main/footer.tpl");
	}

}
?>
