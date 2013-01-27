<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcemainnav extends Datasource{

		public $dsParamROOTELEMENT = 'mainnav';
		public $dsParamORDER = 'desc';
		public $dsParamREDIRECTONEMPTY = 'no';

		

		

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'mainnav',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://localhost:8888/sumnoise',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-02-14T22:02:01+00:00'
			);
		}

		public function getSource(){
			return 'navigation';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.navigation.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
