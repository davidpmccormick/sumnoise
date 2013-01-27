<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcehomeblog extends SectionDatasource{

		public $dsParamROOTELEMENT = 'homeblog';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '4';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'46' => 'yes',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'excerpt: formatted',
				'image',
				'date'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'homeblog',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://sumnoise.com',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2012-08-06T09:04:34+00:00'
			);
		}

		public function getSource(){
			return '5';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
