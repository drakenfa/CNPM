<?php
    class Role extends Controller{
        public $roleService;
        public function __construct(){
            $this->roleService = $this->service("RoleService");
        }
        public function CreateRole(){
            $roleName = $_POST["role_name_add_form"];
            $this->roleService->createRole($roleName);
            header("location: ../InternalManager/DecentralizationManager");
        }
        public function UpdateRole(){
            $this->roleService->updateRole();
        }
        public function DeleteRole($id){
            $this->roleService->deleteRole($id);
            header("location: ../../InternalManager/DecentralizationManager");
        }
        public function GetAllRole(){
            $this->roleService->getAllRole();
        }
        public function GetRoleById(){
            $this->roleService->GetRoleById();
        }
        public function GetRoleByName(){
            $roleName = $_POST["role_name"];
            if($this->roleService->getRoleByName($roleName) != null){
                echo "Tên chức vụ đã tồn tại";
            }
        }
    }
?>