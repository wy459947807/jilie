<?php

namespace app\service;

use app\models\SysNav;
use app\service\CommonService;
use Yii;
use yii\db\Exception;
class NavService extends CommonService{
    //更新菜单
    public function updateNav($params){
         //添加菜单操作
        $tr = Yii::$app->db->beginTransaction();//事务开始
        try {
            if(empty($params['id'])){
                $sysNav=new SysNav();
            }else{
                $sysNav= SysNav::findOne($params['id']);
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
