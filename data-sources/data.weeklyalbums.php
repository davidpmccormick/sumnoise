<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceweeklyalbums extends DynamicXMLDatasource{

		public $dsParamROOTELEMENT = 'weeklyalbums';
		public $dsParamURL = 'http://ws.audioscrobbler.com/2.0/?method=user.getweeklyalbumchart&user=davidmccormick&api_key=12866380c7cdef08baa21d360d6c9b1c';
		public $dsParamXPATH = '//album[position() = 1]';
		public $dsParamCACHE = '90';
		public $dsParamTIMEOUT = '20';
		

		

		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'weeklyalbums',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://sumnoise.com',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2012-08-08T16:11:00+00:00'
			);
		}

		public function getSource(){
			return 'dynamic_xml';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
