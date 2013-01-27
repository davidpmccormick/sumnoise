<?php

	require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

	Class datasourceflickr extends RemoteDatasource {

		public $dsParamROOTELEMENT = 'flickr';
		public $dsParamURL = 'http://api.flickr.com/services/feeds/photos_public.gne?id=35170635@N07&lang=en-us&format=atom';
		public $dsParamFORMAT = 'xml';
		public $dsParamXPATH = '//atom:entry[position() &lt; 30]';
		public $dsParamCACHE = 90;
		public $dsParamTIMEOUT = 20;

		public $dsParamNAMESPACES = array(
			'dc' => 'http://purl.org/dc/elements/1.1/',
			'flickr' => 'urn:flickr:user',
			'media' => 'http://search.yahoo.com/mrss/',
			'atom' => 'http://www.w3.org/2005/Atom',
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'flickr',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://sumnoise.com',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2012-08-08T13:34:04+00:00'
			);
		}

		public function allowEditorToParse(){
			return true;
		}

	}
