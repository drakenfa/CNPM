<?php
    class DB{
        public $con;
        protected $servername = "localhost";
        protected $username = "root";
        protected $password = "Abc12345";
        protected $dbname = "newschema";
        // protected $dbname = "do_an_electronic_supermarket_test";

        function __construct(){
            $this->con = mysqli_connect($this->servername, $this->username, $this->password);
            mysqli_select_db($this->con, $this->dbname);
            mysqli_query($this->con, "SET NAMES 'utf8'");// set Tiếng Việt
        }

        // public function create($table, $object) {
        //     $data = $object->toArray();// chuyển đối tượng thành mảng key-value
        //     $data = array_filter($data, function ($value) {// Loại bỏ các cột có giá trị null
        //         return $value !== null;
        //     });
        //     $fields = implode(',', array_keys($data)); // lấy ra các tên cột và nối với các dấu ,
        //     $values = "'" . implode("','", array_map([$this->con, 'real_escape_string'], $data)) . "'"; // lấy ra các giá trị của cột và làm sạch chúng để tránh SQL Injection sau đó nối với nhau bằng dấu ,
        //     $sql = "INSERT INTO $table ($fields) VALUES ($values)";
        //     return mysqli_query($this->con, $sql);
        // }

        public function create($table, $object, $idName) {
            $data = $object->toArray(); // chuyển đối tượng thành mảng key-value
            $data = array_filter($data, function ($value) { // Loại bỏ các cột có giá trị null
                return $value !== null;
            });
            $fields = implode(',', array_keys($data)); // lấy ra các tên cột và nối với các dấu ,
            $values = "'" . implode("','", array_map([$this->con, 'real_escape_string'], $data)) . "'"; // lấy ra các giá trị của cột và làm sạch chúng để tránh SQL Injection sau đó nối với nhau bằng dấu ,
            $sql = "INSERT INTO $table ($fields) VALUES ($values)";
            if(mysqli_query($this->con, $sql)) {
                $id = mysqli_insert_id($this->con); // lấy ID của bản ghi mới được thêm vào
                $result = mysqli_query($this->con, "SELECT * FROM $table WHERE $idName"." = "."$id"); // truy vấn lại bản ghi vừa được thêm vào
                return mysqli_fetch_assoc($result); // trả về mảng kết hợp của bản ghi
            } else {
                return false; // trả về false nếu có lỗi xảy ra
            }
        }
        public function create1($table, $object, $idName) {
            $data = $object->toArray(); // Convert object to array
            $data = array_filter($data, function ($value) { // Remove columns with null values
                return $value !== null;
            });
            
            // Escape string values to prevent SQL injection
            $escapedData = array_map(function ($value) {
                return is_string($value) ? $this->con->real_escape_string($value) : $value;
            }, $data);
        
            $fields = implode(',', array_keys($escapedData)); // Get column names
            $values = "'" . implode("','", $escapedData) . "'"; // Get escaped values
            $sql = "INSERT INTO $table ($fields) VALUES ($values)";
        
            if(mysqli_query($this->con, $sql)) {
                $id = mysqli_insert_id($this->con); // Get the ID of the newly inserted record
                $result = mysqli_query($this->con, "SELECT * FROM $table WHERE $idName = $id"); // Query the newly inserted record
                return mysqli_fetch_assoc($result); // Return the inserted record as an associative array
            } else {
                return false; // Return false if an error occurs
            }
        }
        
        // public function update($table, $object, $where) {
        //     $data = $object->toArray();// chuyển đối tượng thành mảng key-value
        //     $set = '';
        //     foreach ($data as $field => $value) { // $data sẽ là 1 mảng có key và value
        //         $set .= "$field = '".$this->con->real_escape_string($value)."',";// gán tương ứng key và value được làm sạch giống trong các bảng cho nhau ngăn cách bằng dấu ,   
        //     }
        //     $set = rtrim($set, ',');// loại bỏ đi dấu , cuối cùng
        //     $sql = "UPDATE $table SET $set WHERE $where";
        //     return mysqli_query($this->con, $sql);
        // }

        public function update($table, $object, $where, $idName) {
            $data = $object->toArray();// chuyển đối tượng thành mảng key-value
            $set = '';
            foreach ($data as $field => $value) { // $data sẽ là 1 mảng có key và value
                $set .= "$field = '".$this->con->real_escape_string($value)."',";// gán tương ứng key và value được làm sạch giống trong các bảng cho nhau ngăn cách bằng dấu ,   
            }
            $set = rtrim($set, ',');// loại bỏ đi dấu , cuối cùng
            $sql = "UPDATE $table SET $set WHERE $where";
            if(mysqli_query($this->con, $sql)) {
                $id = mysqli_insert_id($this->con); // lấy ID của bản ghi mới được thêm vào
                $result = mysqli_query($this->con, "SELECT * FROM $table WHERE $idName"." = "."$id"); // truy vấn lại bản ghi vừa được thêm vào
                return mysqli_fetch_assoc($result); // trả về mảng kết hợp của bản ghi
            } else {
                return false; // trả về false nếu có lỗi xảy ra
            }
        }
        public function delete($table, $where) {// chỉ thay đổi trạng thái active
            $is_active = "is_active";
            $sql = "UPDATE $table SET $is_active = '0' WHERE $where";
            return mysqli_query($this->con, $sql);
        }

        // tạo thêm 1 hàm delete thật
        public function realDelete($table, $where) {// chỉ thay đổi trạng thái active
            $sql = "DELETE FROM $table WHERE $where";
            return mysqli_query($this->con, $sql);
        }
        //
        public function read($table){// đọc hết dữ liệu trong bảng $table ra(chi lay ra is_active = 1)
            $is_active = "is_active";
            $sql = "SELECT * FROM $table WHERE $is_active = '1' ";
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()) { // lấy từng trường trong bảng ra gán vào mảng
                $rows[] = $row;
            }
            return $rows;
        }
        public function read4($account_id) {
            // Kết nối CSDL và thực thi truy vấn
            $sql = "SELECT order_details.order_detail_id, order_details.order_id, order_details.sku_id, 
                           order_details.price, order_details.number_of_products, order_details.color_of_product,
                           products.product_name, products.thumbnail, skus.sku_code
                    FROM orders 
                    INNER JOIN order_details ON orders.order_id = order_details.order_id
                    INNER JOIN skus ON order_details.sku_id = skus.sku_id
                    INNER JOIN products ON skus.product_id = products.product_id
                    WHERE orders.account_id = $account_id AND orders.is_active = 1";
            $result = mysqli_query($this->con, $sql);
            
            // Tạo mảng để lưu kết quả truy vấn
            $rows = array();
            while ($row = $result->fetch_assoc()) {
                $rows[] = $row;
            }
            
            // Trả về mảng chứa thông tin của các chi tiết đơn hàng tương ứng
            return $rows;
        }
        public function read5() {
            // Kết nối CSDL và thực thi truy vấn
            $sql = "SELECT products.product_id, products.product_name, products.brand_id, products.category_id, 
                           products.price, products.guarantee, products.thumbnail, products.description, 
                           products.created_at, products.updated_at, products.average_rating, products.total_reviews, 
                           products.is_active, skus.sku_id, skus.sku_name, skus.sku_code,
                           (SELECT SUM(remain) FROM shipments WHERE shipments.sku_id = skus.sku_id) AS total_remain
                    FROM products
                    INNER JOIN skus ON products.product_id = skus.product_id
                    WHERE products.is_active = 1";
            $result = mysqli_query($this->con, $sql);
            
            // Tạo mảng để lưu kết quả truy vấn
            $rows = array();
            while ($row = $result->fetch_assoc()) {
                $rows[] = $row;
            }
            
            // Trả về mảng chứa thông tin sản phẩm và sku tương ứng, cùng với total_remain
            return $rows;
        }
        
        
        
        
        
        public function read2(){// đọc hết dữ liệu trong bảng $table ra(chi lay ra is_active = 1)
            $sql = "SELECT 
            p.product_id,
            s.sku_id,
            sku_remain.total_remain AS total_remain,
            pr.price,
            pr.product_name,
            pr.thumbnail,
            sk.sku_name,
            sk.sku_code
        FROM 
            products pr
        JOIN 
            skus sk ON pr.product_id = sk.product_id
        JOIN 
            skus s ON pr.product_id = s.product_id
        JOIN 
            (SELECT 
                sh.sku_id,
                SUM(sh.remain) AS total_remain
            FROM 
                shipments sh
            GROUP BY 
                sh.sku_id) AS sku_remain ON sku_remain.sku_id = s.sku_id
        JOIN
            products p ON s.product_id = p.product_id
        GROUP BY 
            p.product_id, s.sku_id;
        ";
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()) { // lấy từng trường trong bảng ra gán vào mảng
                $rows[] = $row;
            }
            return $rows;
        }
        public function readDontHaveIsActive($table){// đọc hết dữ liệu trong bảng $table ra(không cần phải có cột is_active)
            $sql = "SELECT * FROM $table";
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()) { // lấy từng trường trong bảng ra gán vào mảng
                $rows[] = $row;
            }
            return $rows;
        }

        public function joinTables($table1, $table2, $commonField, $where){
            if($where == ""){
                $sql = "SELECT * FROM $table1 JOIN $table2 ON $table1.$commonField = $table2.$commonField";
            }else{
                $sql = "SELECT * FROM $table1 JOIN $table2 ON $table1.$commonField = $table2.$commonField WHERE $where";
            }
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }
        public function joinTablesNotwhere($table1, $table2, $commonField){
            $sql = "SELECT * FROM $table1 JOIN $table2 ON $table1.$commonField = $table2.$commonField ";
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }

        public function join3Tables($table1, $table2, $table3, $on1, $on2, $where){
            $sql = "SELECT * 
            FROM $table1 
            JOIN $table2 ON $on1 
            JOIN $table3 ON $on2
            WHERE $where";
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }
        public function join3TablesNotWhere($table1, $table2, $table3, $on1, $on2){
            $sql = "SELECT * 
            FROM $table1 
            JOIN $table2 ON $on1 
            JOIN $table3 ON $on2 ";
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }


        public function getAllByWhere($table, $where) {// lấy ra các bản ghi thỏa điều kiện đầy đủ thuộc tính (chi lay ra is_active = 1)
            $is_active = "is_active";
            $sql = "SELECT * FROM $table WHERE $where AND $is_active = '1'";// ở đây ghi rõ tên cột id
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }
        public function getAllByWhere2($table, $where) {
            $sql = "SELECT * FROM $table WHERE $where";
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()) {
                $rows[] = $row;
            }
            return $rows;
        }
        public function getAllByWhere1($table, $where) {// lấy ra các bản ghi thỏa điều kiện đầy đủ thuộc tính (chi lay ra is_active = 1)
            $sql = "SELECT * FROM $table WHERE $where ";// ở đây ghi rõ tên cột id
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }

        public function getAllByWhereNonIsActive($table, $where) {// lấy ra các bản ghi thỏa điều kiện đầy đủ thuộc tính (chi lay ra is_active = 1)
            $sql = "SELECT * FROM $table WHERE $where";// ở đây ghi rõ tên cột id
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }


        public function getAllByWhereOrderBy($table, $where, $order_by) {// lấy ra các bản ghi thỏa điều kiện đầy đủ thuộc tính (chi lay ra is_active = 1)
            $is_active = "is_active";
            $sql = "SELECT * FROM $table WHERE $where AND $is_active = '1' ORDER BY $order_by";// ở đây ghi rõ tên cột id
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }

        public function set($sql){
            return mysqli_query($this->con, $sql);
        }

        public function get($sql) {// lấy ra các bản ghi thỏa điều kiện đầy đủ thuộc tính (chi lay ra is_active = 1)
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }

        public function getAllDontHaveIsActive($table, $where){// lấy ra các bản ghi thỏa điều kiện không có cột is_active
            $sql = "SELECT * FROM $table WHERE $where";// ở đây ghi rõ tên cột id
            $result = mysqli_query($this->con, $sql);
            if ($result->num_rows > 0) {
                $data = $result->fetch_assoc(); // Trả về bản ghi đầu tiên nếu tìm thấy
                return $data;
            } else {
                return null; // Trả về null nếu không tìm thấy bản ghi nào
            }
        }

        public function getAllByDistinct($table, $column, $where){
            if($where != ""){
                $sql = "SELECT DISTINCT $column FROM $table WHERE $where";
            }else{
                $sql = "SELECT DISTINCT $column FROM $table";
            }
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }

        public function joinTableDistinct($table1, $table2, $distinctField, $commonField, $where){
            $sql = "SELECT DISTINCT $distinctField FROM $table1 JOIN $table2 ON $table1.$commonField = $table2.$commonField WHERE $where";
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }
        public function joinTableDistinctToGetAll($table1, $table2, $commonField, $distinctField){
            $sql = "SELECT DISTINCT $distinctField FROM $table1 JOIN $table2 ON $table1.$commonField = $table2.$commonField";
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }

        public function unionTables($table1, $table2, $column, $where1, $where2){
            $sql = "SELECT $column FROM $table1 WHERE $where1 
                    UNION SELECT $column FROM $table2 WHERE $where2";
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }   

        public function toString($string){
            return "'".$string."'";
        }

        public function getCountColumn($table, $column, $where){
            $is_active = "is_active";
            if($where != ""){
                $sql = "SELECT COUNT($column) FROM $table WHERE $where AND $is_active = '1'";
            }else{
                $sql = "SELECT COUNT($column) FROM $table WHERE $is_active = '1'";
            }
            $result = mysqli_query($this->con, $sql);
            $row = mysqli_fetch_assoc($result);
            return $row["COUNT($column)"];            
        }

        public function getCountColumnUnactive($table, $column, $where){
            $is_active = "is_active";
            if($where != ""){
                $sql = "SELECT COUNT($column) FROM $table WHERE $where AND $is_active = '0'";
            }else{
                $sql = "SELECT COUNT($column) FROM $table WHERE $is_active = '0'";
            }
            $result = mysqli_query($this->con, $sql);
            $row = mysqli_fetch_assoc($result);
            return $row["COUNT($column)"];            
        }

        public function getCountColumnIsActive($table, $column, $where){
            if($where != ""){
                $sql = "SELECT COUNT($column) FROM $table WHERE $where";
            }else{
                $sql = "SELECT COUNT($column) FROM $table";
            }
            $result = mysqli_query($this->con, $sql);
            $row = mysqli_fetch_assoc($result);
            return $row["COUNT($column)"];            
        }

        public function getCountColumnJoin2Tables($table1, $table2, $commonField, $where, $column){
            if($where == ""){
                $sql = "SELECT COUNT($column) FROM $table1 JOIN $table2 ON $table1.$commonField = $table2.$commonField";
            }else{
                $sql = "SELECT COUNT($column) FROM $table1 JOIN $table2 ON $table1.$commonField = $table2.$commonField WHERE $where";
            }
            $result = mysqli_query($this->con, $sql);
            $row = mysqli_fetch_assoc($result);
            return $row["COUNT($column)"];    
        }
        
        
        public function getOneColumnTable($table, $column, $where){
            $is_active = "is_active";
            if($where != ""){
                $sql = "SELECT $column FROM $table WHERE $where AND $is_active = '1'";
            }else{
                $sql = "SELECT $column FROM $table WHERE $is_active = '1'";
            }
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }

        //
        public function getAccountStaffCustomer(){
            $sql = "SELECT accounts.account_id, accounts.phone_number, accounts.email, staffs.staff_fullname as name, staffs.staff_id as id, staffs.role_id, roles.role_name, accounts.created_at, accounts.updated_at, accounts.is_active
                    FROM accounts
                    JOIN staffs ON accounts.account_id = staffs.account_id
                    JOIN roles ON roles.role_id = staffs.role_id
                    WHERE staffs.is_active = '1'
                    UNION
                    SELECT accounts.account_id, accounts.phone_number, accounts.email, customers.customer_fullname, customers.customer_id, customers.role_id, roles.role_name, accounts.created_at, accounts.updated_at, accounts.is_active
                    FROM accounts
                    JOIN customers ON accounts.account_id = customers.account_id
                    JOIN roles ON roles.role_id = customers.role_id
                    WHERE customers.is_active = '1' 
                    ORDER BY account_id ASC";
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }
        //

        public function selectManyColumn($table, $columns, $where){
            $is_active = "is_active";
            if($where != ""){
                $sql = "SELECT $columns FROM $table WHERE $where AND $is_active = '1'";
            }else{
                $sql = "SELECT $columns FROM $table WHERE $is_active = '1'";
            }
            $result = mysqli_query($this->con, $sql);
            $rows = array();
            while ($row = $result->fetch_assoc()){
                $rows[] = $row;
            }
            return $rows;
        }
    }

?>