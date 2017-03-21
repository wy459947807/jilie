<?php
//导航管理
namespace app\controllers;

use app\models\SysUser;
use app\common\InstanceFactory;
use Yii;
use yii\db;
use yii\db\Exception;
class UserController extends CommonController implements CommonInterface{

    public function init(){
        parent::init();
        //注册服务
        $this->serviceList['UserService']=InstanceFactory::getInstance("app\service\UserService");//菜单服务
    }
    
    //列表信息
    public function actionIndex(){
        $params = $this->getParams();  //获取页面参数
        $resultInfo=$this->serviceList['UserService']->getUserList($params);
        return $this->render('index.tpl',$resultInfo);
    }
    
    //添加导航
    public function actionAdd(){
        //页面操作
        if(Yii::$app->request->isPost){
            $params=$this->getValidateParams('add');
            if($params['status']!=200){
                return $this->asJson($params);
            }
            $this->result = $this->serviceList['UserService']->updateUser($params['data']);
            return $this->asJson($this->result);
        }
        
        $resultInfo=array();
        return $this->render('add.tpl',$resultInfo);
    }

    //编辑导航
    public function actionEdit(){
        
        $resultInfo=array();
        return $this->render('edit.tpl',$resultInfo);
    }

    //删除导航
    public function actionDelete(){
        $params=$this->getValidateParams('delete');
        if($params['status']!=200){
            return $this->asJson($params);
        }
        
        $this->result = $this->serviceList['UserService']->deleteUser($params['data']);
        return $this->asJson($this->result);
    }
    
    //更新状态
    public function actionUpdatestatus(){
        if(Yii::$app->request->isPost){
            $params=$this->getValidateParams('updatestatus');
            if($params['status']!=200){
                return $this->asJson($params);
            }
            $this->result = $this->serviceList['UserService']->updateUser($params['data']);
            return $this->asJson($this->result);
        }
    }

    //获取参数规则
    public function getRulesArray($ruleIndex){
        $result['add']=array(  
            array('status', 'in', 'range'=>array(1,2),'message'=>'状态码错误.'),  
        ); 
        
        $result['delete']=array(
            array('id','required','message'=>'id必须！'), 
        );
        
        $result['updatestatus']=array(  
            array('status', 'in', 'range'=>array(1,2),'message'=>'状态码错误.'),  
        ); 
        
        return $result[$ruleIndex];
    }
   
}
