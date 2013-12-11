<?php Class menu extends TagLibrary{
		
	function show_menu($name,$data,$pars){
	foreach ($data as $key => $value){
		$content.="<li><a href=".$value['link'].">".$value['nome']."</a></li>";
	}
  return $content;
	}
}

?>