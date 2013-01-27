<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcegithub extends DynamicXMLDatasource{

		public $dsParamROOTELEMENT = 'github';
		public $dsParamURL = 'http://github.com/davidpmccormick.atom';
		public $dsParamXPATH = '//atom:entry[not(contains(atom:title, \'(deleted)\'))]';
		public $dsParamCACHE = '90';
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
				'name' => 'github',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://sumnoise.com',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2012-08-08T11:13:24+00:00'
			);
		}

		public function getSource(){
			return 'dynamic_xml';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
