<?php $quotes = file("/srv/httpd/htdocs/hosted/projects.emrl.com/cit/public/php/quotes.txt");
                                  srand((double)microtime() * 1000000);
                                  $ranNum = rand(0, count($quotes)-1); 
                                  echo $quotes[$ranNum]; ?>