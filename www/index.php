<?php
	include 'dbConnect.php';
	include 'jsonLoad.php';
	include 'sqlInsert.php';
echo ("<html>
	<head></head>
	<body>
		<h1>Suche</h1>
		<form action=\"/index.php\">
			Name :<br>
			<input type=\"text\" name=\"name\">
			<br><br>
			<input type=\"submit\" value=\"Export as XML\">
		</form> ");

include 'sqlGet.php';
echo("	</body>
</html>");

?>
