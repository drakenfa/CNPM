<?php
    class Import extends Controller{
        public $importService;
        public $shipmentService;
        public function __construct(){
            $this->importService = $this->service("ImportService");
            $this->shipmentService = $this->service("ShipmentService");
        }
        // public function CreateShipment(){
        //     $this->shipmentService->createShipment();
        // }
        public function createShipment() {
            $currentURL = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        
            $urlParts = parse_url($currentURL);
            
            // Extract the number of shipmentData parameters from the URL
            $urlSegments = explode('/', $urlParts['path']);
            $numShipments = intval(end($urlSegments));
            
            // Check if query parameters exist
            if (isset($urlParts['query'])) {
                // Parse the query string into variables
                parse_str($urlParts['query'], $queryParameters);
            
                // Check if importData parameter is set in the query parameters
                if (isset($queryParameters['importData'])) {
                    // Decode the importData JSON
                    $importData = json_decode($queryParameters['importData'], true);
                    
                    // Get the staff_id
                    $staffId = $importData['staff_id'];
                    
                    // Initialize an array to store shipment data
                    $shipmentDataList = [];
                    
                    // Loop through each shipmentData parameter and decode it
                    for ($i = 1; $i <= $numShipments; $i++) {
                        $paramName = 'shipmentData' . $i;
                        if (isset($queryParameters[$paramName])) {
                            $shipmentDataList[] = json_decode($queryParameters[$paramName], true);
                        }
                    }
                    echo $numShipments;
                    // Call the createShipment function in the service layer
                    $this->shipmentService->createShipment($staffId, $shipmentDataList);
                }
            }
        }
        
        
        
        public function UpdateImport(){
            $this->importService->updateImport();
        }
        public function DeleteImport(){
            $this->importService->deleteImport();
        }
        public function GetAllImport(){
            $this->importService->getAllImport();
        }
        public function GetImportById(){
            $this->importService->GetImportById();
        }
        public function getInfoImport(){
            $this->importService->getInfoImport();
        }

        public function GetQuantityImportByMonth($year){
            $this->importService->getQuantityImportByMonth($year);
        }

        public function GetQuantityImportByQuarter($year){
            $this->importService->getQuantityImportByQuarter($year);
        }

        public function GetDistinctYear(){
            $this->importService->getDistinctYear();
        }
    }
?>
