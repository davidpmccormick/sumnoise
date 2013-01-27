<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcecomments extends Datasource{

		public $dsParamROOTELEMENT = 'comments';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$ds-blogview';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'38' => '{$ds-blogview}',
				'39' => 'yes',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'comment: formatted',
				'date'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-blogview');
		}

		public function about(){
			return array(
				'name' => 'comments',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://sumnoise.com/sumnoise',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-02-29T12:39:16+00:00'
			);
		}

		public function getSource(){
			return '10';
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
