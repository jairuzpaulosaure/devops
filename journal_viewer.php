<!DOCTYPE html>
<html>
<head>
<title>Journal Viewer</title>
<style>
  body { font-family: Arial; padding: 20px; background: #f9f9f9; }
  h1 { color: #333; }
  pre { background: #eee; padding: 10px; }
</style>
</head>
<body>
<h1>My DevOps Journal</h1>
<p>All entries:</p>
<ul>
<?php
$files = glob("journals/*.txt");
rsort($files);
foreach($files as $file){
    echo "<li><a href='$file'>" . basename($file) . "</a></li>";
}
?>
</ul>
</body>
</html>
