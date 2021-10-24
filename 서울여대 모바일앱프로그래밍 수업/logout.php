<?php
	session_start(); // 현재 세션을 다시 시작함
	session_unset(); // 모든 세션의 변수를 해제함
 	session_destroy(); // 세션에 등록된 모든 변수 해제
?>
