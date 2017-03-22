<?php

namespace app\service;

use app\common\InstanceFactory;
use app\models\SysNav;
use app\service\CommonService;
use Yii;
use yii\db\Exception;
class NavService extends CommonService{
    
    public function __construct (){
        $this->serviceList['Rbac']=InstanceFactory::getInstance("app\common\Rbac");//用户服务 
    }


    //更新菜单
    public function updateNav($params){
        
        $sysNav= SysNav::find()
                ->where(['and',"name='{$params["name"]}'",['or',"type='view'","type='module'"]])
                ->one();        
        if(!empty($sysNav)){
            $this->result['status']=500;
            $this->result['info']="菜单名称重复！";    
            return $this->result;
        }

         //添加菜单操作
        $tr = Yii::$app->db->beginTransaction();//事务开始
        try {
            if(empty($params['id'])){
                $sysNav=new SysNav();
                
                //权限管理
                if(!empty($params['name'])){
                    $permissionArray['name']=$params['name'];
                    $permissionArray['description']=$params['remark'];
                    $this->serviceList['Rbac']->createPermission($permissionArray);//创建访问许可
                }
                
            }else{
                $sysNav= SysNav::findOne($params['id']);
                
                //权限管理
                if(!empty($params['name'])){
                    $permissionArray['name']=$params['name'];
                    $permissionArray['description']=$params['remark'];
                    $this->serviceList['Rbac']->updateRolePermission($sysNav->name,$permissionArray);//编辑访问许可
                }
            }
            $sysNav->pid=$params['pid'];
            $sysNav->name=$params['name'];
            $sysNav->icon=$params['icon'];
            $sysNav->path=$params['path'];
            $sysNav->status=$params['status'];
            if(!empty($params['type'])){
                $sysNav->type= $params['type'];
            }else{
                $sysNav->type=  $params['pid']?"view":"module"; 
            }

            $sysNav->sort=$params['sort'];
            $sysNav->remark=$params['remark'];
            if($sysNav->save()){
                $this->result['status']=200;
                $this->result['info']="修改成功！";
            }else{
                $this->result['status']=500;
                $this->result['info']="修改失败！";
            }
            $tr->commit();//事务提交
        } catch (Exception $e) {
            $tr->rollBack();//事务回滚
        }
        return $this->result;
    }
    
    //删除菜单
    public function deleteNav($params){
        //删除菜单操作
        $tr = Yii::$app->db->beginTransaction();//事务开始
        try {
            
            $sysList = SysNav::find()
                ->where(["in",'id',$params['id']])
                ->all();        
            
            foreach ($sysList as $key=>$val){
                if($val->type=="action"){
                    $this->serviceList['Rbac']->delRolePermission($val->path);//删除许可
                }else{
                    $this->serviceList['Rbac']->delRolePermission($val->name);//删除许可
                }
            }

            $retInfo=SysNav::deleteAll(["in",'id',$params['id']]); 
            if($retInfo){
                $this->result['status']=200;
                $this->result['info']="删除成功！";
            }else{
                $this->result['status']=500;
                $this->result['info']="删除失败！";
            }
           
            $tr->commit();//事务提交
        } catch (Exception $e) {
            $tr->rollBack();//事务回滚
        }
        
        return $this->result;
    }
    
    //获取菜单列表
    public function getNavList(){
        $navList=SysNav::find()
                ->where(['and','status=1',['or',"type='view'","type='module'"]])
                ->orderBy('sort asc')
                ->all();
       
        $this->result['data']=$navList;
        return $this->result;
    }
    
    //获取模块列表
    public function getModuleList(){
        $moduleList=SysNav::find()
                 ->where(['and','status=1',"type='module'"])
                 ->orderBy('sort asc')           
                 ->all(); 
        
        $this->result['data']=$moduleList;
        return $this->result;
         
    }
    

    
}
