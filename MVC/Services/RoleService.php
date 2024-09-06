<?php
    require_once "./MVC/Models/RoleModel.php";
    class RoleService extends Service{
        public $roleRepo;

        public function __construct(){
            $this->roleRepo = $this->repository("RoleRepository");
        }
        
        public function createRole($roleName){//$roleDTO
            $role = new RoleModel($roleName);
            $this->roleRepo->createRole($role);
        }

        public function updateRole(){// by id (truyền DTO)
            $roleData = $this->roleRepo->getRoleById("6");
            extract($roleData);// gán các giá trị cho các key tương ứng với các biến
            $role = new RoleModel(
                "Nhân viên cùi bắp", $role_id, $is_active
            );
            $this->roleRepo->updateRole($role, "6");
        }

        public function deleteRole($id){
            $this->roleRepo->deleteRole($id);
        }

        public function getAllRole(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            return $this->roleRepo->getAllRole();
        }

        public function getAllRoleStaff(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            return $this->roleRepo->getAllRoleStaff();
        }

        public function getRoleById(){
            $id = "2";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->roleRepo->getRoleById($id), JSON_UNESCAPED_UNICODE);
        }

        public function getRoleByName($roleName){
            return $this->roleRepo->getRoleByName($roleName);
        }
    }
?>