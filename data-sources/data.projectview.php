<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceprojectview extends Datasource{

		public $dsParamROOTELEMENT = 'projectview';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamREQUIREDPARAM = '$url-title';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'8' => '{$url-title}',
				'45' => 'yes',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'body: formatted',
				'image',
				'cms',
				'discipline'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'projectview',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://sumnoise.com',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-05-05T14:02:35+00:00'
			);
		}

		public function getSource(){
			return '4';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
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
