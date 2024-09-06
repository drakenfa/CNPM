<?php
    class ExportRepository extends DB{
        public function createExport($export){
            $this->create("exports", $export, "export_id");
        }

        public function updateExport($export, $id){// by id
            $this->update("exports", $export, "export_id = ".$id,"export_id" );
        }

        public function deleteExport($id){// by id
            $this->delete("exports", "export_id = ".$id);
        }

        public function getAllExport(){
            return $this->read("exports");
        }
        
        public function getExportById($id){
            return $this->getAllByWhere("exports", "export_id = ".$id);
        }

        public function getQuantityExportByMonth($year){
            return $this->get("SELECT MONTH(e.`export_date`) AS `month`, SUM(ed.`quantity_export`) AS `total_quantity`
                FROM `exports` e
                JOIN `export_details` ed ON e.`export_id` = ed.`export_id`
                WHERE YEAR(e.`export_date`) = $year
                GROUP BY MONTH(e.`export_date`);
            ");
        }

        public function getQuantityExportByQuarter($year){
            return $this->get("SELECT QUARTER(e.`export_date`) AS `quarter`, SUM(ed.`quantity_export`) AS `total_quantity`
                FROM `exports` e
                JOIN `export_details` ed ON e.`export_id` = ed.`export_id`
                WHERE YEAR(e.`export_date`) = $year
                GROUP BY QUARTER(e.`export_date`);
            ");
        }

        public function getProfitByMonth($year){
            return $this->get("SELECT MONTH(e.`export_date`) AS `month`, 
                SUM((ed.`unit_price_export` - s.`unit_price_import`) * ed.`quantity_export`) AS `profit`
                FROM `export_details` ed
                JOIN `shipments` s ON ed.`shipment_id` = s.`shipment_id`
                JOIN `exports` e ON ed.`export_id` = e.`export_id`
                WHERE YEAR(e.`export_date`) = $year
                GROUP BY MONTH(e.`export_date`);
            ");
        }

        public function getProfitByQuarter($year){
            return $this->get("SELECT QUARTER(e.`export_date`) AS `quarter`, 
                SUM((ed.`unit_price_export` - s.`unit_price_import`) * ed.`quantity_export`) AS `profit`
                FROM `export_details` ed
                JOIN `shipments` s ON ed.`shipment_id` = s.`shipment_id`
                JOIN `exports` e ON ed.`export_id` = e.`export_id`
                WHERE YEAR(e.`export_date`) = $year
                GROUP BY QUARTER(e.`export_date`);
            ");
        }

        public function getDistinctYear(){
            return $this->get("SELECT DISTINCT YEAR(`export_date`) AS `year`
                FROM `exports`
                ORDER BY `Year`;
            ");
        }
    }
?>