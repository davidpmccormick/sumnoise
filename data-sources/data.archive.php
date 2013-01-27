<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcearchive extends SectionDatasource{

		public $dsParamROOTELEMENT = 'archive';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$year';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'50' => '{$year}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'excerpt: formatted'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'archive',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://localhost:8888/sumnoise',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2012-08-03T08:25:21+00:00'
			);
		}

		public function getSource(){
			return '5';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
