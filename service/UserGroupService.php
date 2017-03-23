<?php

namespace app\service;

use app\models\SysUserGroup;
use app\service\CommonService;
use Yii;
use yii\db\Exception;
class UserGroupService extends CommonService{
    
    //更新用户
    public function updateUserGroup($params){
        //添加菜单操作
        $tr = Yii::$app->db->beginTransaction();//事务开始
        try {
            if(empty($params['id'])){
                $sysUserGroup=new SysUserGroup();
            }else{
                $sysUserGroup= SysUserGroup::findOne($params['id']);
            }
            
            if(!empty($params['pid']))      $sysUserGroup->pid      =(int)$params['pid'];
            if(!empty($params['name']))     $sysUserGroup->name     =(string)$params['name'];
            if(!empty($params['sort']))     $sysUserGroup->sort     =(int)$params['sort'];
            if(!empty($params['remark']))   $sysUserGroup->remark   =(string)$params['remark'];

            if($sysUserGroup->save()){
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
    
    //删除用户
    public function deleteUserGroup($params){
        //删除菜单操作
        $tr = Yii::$app->db->beginTransaction();//事务开始
        try {

            $retInfo=SysUserGroup::deleteAll(["in",'id',$params['id']]); 
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
    
    //获取用户列表
    public function getUserGroupList($params){
        $this->sqlFrom=" sys_user_group ";        
        $this->sqlField=" * ";       
        $this->sqlWhere=" (1=1) ";
        $this->bindValues=array();
        
        if(!empty($params['page'])) $this->page = $params['page'];
        if(!empty($params['pageLimit'])) $this->pageLimit = $params['pageLimit'];

        return $this->getPageList();
    }
    
    //获取分组
    public function getUserGroupInfo($params){
        $this->sqlFrom=" sys_user_group ";        
        $this->sqlField=" * ";       
        $this->sqlWhere=" (1=1) ";
        $this->bindValues=array();
        
        
        //条件筛选
        if(!empty($params['id'])){
            $this->sqlWhere.=" and id=:id ";
            $this->bindValues[':id'] = $params['id'];
        }
        
        return $this->getOne();
        
    }
    

    
}
