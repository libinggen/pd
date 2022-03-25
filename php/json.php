<?php
file_put_contents('./log/json-log.txt', 'request start time:' . time() . "\n");
#header('Content-Type:application/json; charset=utf-8');
$arr = array('jsona'=>1,'jsonb'=>2);
sleep(3);
file_put_contents('./log/json-log.txt', 'request end time:' . time(), FILE_APPEND);
exit(json_encode($data));
