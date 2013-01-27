<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcetfl extends Datasource{

	    function about(){
	        return array('name' => 'tfl');   
	    }

	    function __construct(&$parent, $env=NULL, $process_params=true){
	        parent::__construct($parent, $env, $process_params);
	        $this->_dependencies = array();
	    }

		public function allowEditorToParse(){
			return false;
		}

		public function grab(&$param_pool=NULL){
			$stop = Symphony::Engine()->Page()->_param['stop'];
			$route = Symphony::Engine()->Page()->_param['route'];
			
			if (isset($stop) && (isset($route))) {
				$bus_array = @file_get_contents('http://countdown.api.tfl.gov.uk/interfaces/ura/instant_V1?StopCode1=' . $stop . '&LineID=' .$route . '&ReturnList=EstimatedTime,LineID,DestinationName,StopPointName');
			} elseif (isset($stop)) {
				$bus_array = @file_get_contents('http://countdown.api.tfl.gov.uk/interfaces/ura/instant_V1?StopCode1=' . $stop . '&ReturnList=EstimatedTime,LineID,DestinationName,StopPointName');
			} else {
				$bus_array = '';
			}
			$buses = explode("\n", $bus_array);
			
			$buselement = new XMLElement('buses');
		
			if($bus_array != FALSE && count($buses) != 1){
			
				echo $array_length;
				$n = 0;
				foreach ($buses as $bus) {
					// miss off the first one (it's not a bus)
					if ($n > 0 && $n <= 13) {
						$busbits = explode(',', $bus);
						$fields = array('bus' => new XMLElement('bus', trim($busbits[2], '"')));
						foreach($fields as $f) {
							$theDate = date('H:i',($busbits[4]/1000));
							$theDestination = trim($busbits[3], '"');
							$theStop = trim($busbits[1], '"');
							$f->setAttribute('time', $theDate);
							$f->setAttribute('destination', $theDestination);
							$f->setAttribute('stop', $theStop);
							$buselement->appendChild($f);
						}
					}
					$n++;
				}
			} else {
				if (isset($route)) {
					$fields = array('bus' => new XMLElement('bus', $route));
				} else {
					$fields = array('bus' => new XMLElement('bus', 'BUS'));
				}
				
				foreach($fields as $f) {
					$theDate = 'the back of whenever';
					$theDestination = 'nowhere';
					$theStop = 'Wot No';
					$f->setAttribute('time', $theDate);
					$f->setAttribute('destination', $theDestination);
					$f->setAttribute('stop', $theStop);
					$buselement->appendChild($f);
				}
			}
			return $buselement;
		}
	}
