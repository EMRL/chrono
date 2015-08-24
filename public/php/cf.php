<?php
/**
 * Culture Failure wrapper
 */
class CF {

	protected static $_server = 'cf.emrl.com';

	protected static $_port = 8000;

	protected static $_pass = 'fatima';
	
	public static function now_playing()
	{
		$uri = CF::_api_url().'&mode=viewxml';
		
		$fp = fsockopen(CF::$_server, CF::$_port, $errno, $errstr, 1);
		
		if ( ! $fp)
			return 'Server is offline.';
		
		fputs($fp, "GET /currentsong?sid=1 HTTP/1.0\r\nUser-Agent: Mozilla\r\n\r\n");
		
		while ( ! feof($fp))
		{
			$data = fgets($fp);
		}
		
		fclose($fp);
		
		$title = trim(array_pop(explode(',', strip_tags($data))));
		
		return empty($title) ? 'Current song is not available' : $title;
	}

	protected static function _api_url()
	{
		return 'http://'.CF::$_server.':'.CF::$_port.'/admin.cgi?pass='.CF::$_pass;
	}

} 
?>

<?php echo str_replace(' - ', ' <br /> ', CF::now_playing()) ?>