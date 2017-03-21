<?php

namespace app\service;

use app\models\SysUser;
use app\service\CommonService;
use Yii;
use yii\db\Exception;
class UserService extends CommonService{
    
    //更新用户
    public function updateUser($params){
        //添加菜单操作
        $tr = Yii::$app->db->beginTransaction();//事务开始
        try {
            if(empty($params['id'])){
                $sysUser=new SysUser();
            }else{
                $sysUser= SysUser::findOne($params['id']);
            }
            
            if(!empty($params['password'])) $sysUser->password   =$params['password'];
            if(!empty($params['nickname'])) $sysUser->nickname   =$params['nickname'];
            if(!empty($params['sex']))      $sysUser->sex        =$params['sex'];
            if(!empty($params['mobile']))   $sysUser->mobile     =$params['mobile'];
            if(!empty($params['email']))    $sysUser->email      =$params['email'];
            if(!empty($params['role']))     $sysUser->role       =$params['role'];
            if(!empty($params['status']))   $sysUser->status     =$params['status'];
            if(!empty($params['remark']))   $sysUser->remark     =$params['remark'];
  
            if($sysUser->save()){
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
    public function deleteUser($params){
        //删除菜单操作
        $tr = Yii::$app->db->beginTransaction();//事务开始
        try {

            $retInfo=SysUser::deleteAll(["in",'id',$params['id']]); 
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
    public function getUserList($params){
        $this->sqlFrom=" sys_user ";        
        $this->sqlField=" * ";       
        $this->sqlWhere=" (1=1) ";
        $this->bindValues=array();
        
        if(!empty($params['page'])) $this->page = $params['page'];
        if(!empty($params['pageLimit'])) $this->pageLimit = $params['pageLimit'];
       
        //搜索信息筛选
        if(!empty($params['searchInfo'])){
            $this->sqlWhere.=" and (nickname like '%:nickname%' or mobile like '%:mobile%' or email like '%:email%')  ";
            $this->bindValues[':nickname'] = $params['searchInfo'];
            $this->bindValues[':mobile']   = $params['searchInfo'];
            $this->bindValues[':email']    = $params['searchInfo'];
        }
        
        //创建时间筛选
        if(!empty($params['starTime'])&&!empty($params['endTime'])){
            $this->sqlWhere.=" and (createtime BETWEEN :starTime AND :endTime) ";
            $this->bindValues[':starTime'] = $params['starTime'];
            $this->bindValues[':endTime']  = $params['endTime'];
        }
        return $this->getPageList();
    }
    

    
}
