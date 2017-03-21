<?php
namespace app\common;
use Yii;
class Rbac {

    //创建许可
    public function createPermission($item){
        $auth = Yii::$app->authManager;
        $createPost = $auth->createPermission($items['name']);
        $createPost->description = $items['description'];
        $auth->add($createPost);
    }
    
    //创建角色
    public function createRole($item){
        $auth = Yii::$app->authManager;
        $role = $auth->createRole($items['name']);
        $role->description = $items['description'];
        $auth->add($role);
    }
    
    //给角色分配许可
    public function createEmpowerment($items){
        $auth = Yii::$app->authManager;
        $parent = $auth->createRole($items['name']);
        $child = $auth->createPermission($items['description']);
        $auth->addChild($parent, $child);
    }
    
    //给角色分配用户
    public function assign($item){
        $auth = Yii::$app->authManager;
        $reader = $auth->createRole($item['name']);
        $auth->assign($reader, $item['description']);
    }
    
   
    
}
