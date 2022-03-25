<?php
file_put_contents('./log/log.txt', 'request start time:' . time() . "\n");
sleep(3);
file_put_contents('./log/log.txt', 'request end time:' . time(), FILE_APPEND);
#echo 'hello world';
echo json_encode(array('a'=>'bbbb','c'=>'ddddd','t'=>time()));
