<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceyear extends Datasource{

	    function about(){
	        return array('name' => 'year');   
	    }

	    function __construct(&$parent, $env=NULL, $process_params=true){
	        parent::__construct($parent, $env, $process_params);
	        $this->_dependencies = array();
	    }

		public function allowEditorToParse(){
			return false;
		}

		public function grab(&$param_pool){
			$year = '';
			$param_pool['year'] = $year;
		}

	}
