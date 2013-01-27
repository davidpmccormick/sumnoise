<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcelatitude extends DynamicXMLDatasource{

		public $dsParamROOTELEMENT = 'latitude';
		public $dsParamURL = 'https://www.google.com/latitude/apps/badge/api?user=2965632088853402547&type=atom';
		public $dsParamXPATH = '//atom:entry';
		public $dsParamCACHE = '5';
		public $dsParamTIMEOUT = '20';
		

		public $dsParamFILTERS = array(
				'atom' => 'http://www.w3.org/2005/Atom',
		);
		

		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'latitude',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://sumnoise.com',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2012-08-09T08:32:34+00:00'
			);
		}

		public function getSource(){
			return 'dynamic_xml';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
