<?php

require "include/dbms.inc.php";
require "include/template2.inc.php";
include "include/skin.php";

$skin = new Template("dtml/skin.html");
$body = new Template("dtml/home.html");

$skin->setContent("header",$header->get());
$skin->setContent("body",$body->get());
$skin->setContent("footer",$footer->get());

$skin->close();


?>