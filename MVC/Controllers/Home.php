<?php
    class Home extends Controller{// Có thể hiểu class Controller thông qua bridge.php 
        public $productService;

        public function __construct(){
            $this->productService = $this->service("ProductService");
        }
        
        public function SayHi(){
            //join featured_products_rows on featured_products_rows.row_id = featured_products.featured_row

            $sql = "SELECT row_id, row_name, row_description, row_url, featured_products_rows.index
            from featured_products_rows
            WHERE featured_products_rows.is_active = 1
            ORDER BY featured_products_rows.index ASC
            ";
            $featuredProductRows = $this->productService->productRepo->get($sql);
            unset($sql);

            $sql = "SELECT products.product_id, products.product_name, products.thumbnail, categories.category_id, categories.category_name, brands.brand_id, brands.brand_name, products.price, products.average_rating, products.total_reviews,featured_products.featured_row
            FROM products join categories on products.category_id = categories.category_id join brands on products.brand_id = brands.brand_id join featured_products on products.product_id = featured_products.product_id
            WHERE products.is_active = 1
            ORDER BY featured_products.featured_row ASC, products.updated_at DESC
            ";
            $featuredProductList = $this->productService->productRepo->get($sql);
            unset($sql);



            $displayRows = [];
            foreach($featuredProductRows as $row){
                $pros = [];
                foreach($featuredProductList as $pro){
                    if($row["row_id"]==$pro["featured_row"]){
                        array_push($pros,$pro);
                    }
                }
                array_push($displayRows,["rows"=>$row,"products"=>$pros]);
            }
            // $ProductLists = [
            //     "Laptop" => $this->productService->getProductByType('Laptop'),
            //     "SmartPhone" => $this->productService->getProductByType('Điện thoại'),
            //     "SmartPhone" => $this->productService->getProductByType('Smartwatch')
            // ];

            
            $sql = "SELECT * FROM banners 
            join banner_locations on banners.location_id = banner_locations.location_id 
            where banners.is_active=1 and banner_locations.location_name = 'home-header'  and banners.is_active = 1
            ";
            $headerBannerList = $this->productService->productRepo->get($sql);
            unset($sql);

            
            $sql = "SELECT * FROM brands
            WHERE not brands.brand_logo = ''  and brands.is_active = 1
            ";
            $brandDisplayList = $this->productService->productRepo->get($sql);
            unset($sql);

            $this->view("master",[
                "Page" => "Home/Home",
                "HeaderBannerList"=>$headerBannerList,
                "DisplayRows"=>$displayRows,
                "BrandDisplayList"=> $brandDisplayList
            ]);
        }
    }
?>