<?php
//导航管理
namespace app\controllers;

use app\common\InstanceFactory;
use Yii;
use yii\db;
use yii\db\Exception;
class RbacController extends CommonController implements CommonInterface{

    public function init(){
        parent::init();
        //注册服务
        $this->serviceList['RbacService']=InstanceFactory::getInstance("app\service\RbacService");//权限服务
        $this->serviceList['NavService']=InstanceFactory::getInstance("app\service\NavService");//菜单服务
    }
    
    //列表信息
    public function actionIndex(){
        $params = $this->getParams();  //获取页面参数
        $moduleList=$this->serviceList['NavService']->getList(array("type"=>"module"));
        $viewList=$this->serviceList['NavService']->getList(array("pid"=>$moduleList['data'][0]['id']));
        if(!empty($params['module'])){
            $viewList=$this->serviceList['NavService']->getList(array("pid"=>$params['module'])); 
        }
        $params['pid']=$viewList['data'][0]['id']; 
        if(!empty($params['view'])){
            $params['pid']=$params['view'];
        }
        $resultInfo=$this->serviceList['RbacService']->getRbacList($params);
        $resultInfo['data']['params']=$params;
        $resultInfo['data']['moduleList']=$moduleList['data'];
        $resultInfo['data']['viewList']=$viewList['data'];
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
            $this->result = $this->serviceList['RbacService']->updateRbac($params['data']);
            return $this->asJson($this->result);
        }

        $params = $this->getParams();  //获取页面参数
        if(empty($params['pid'])){
            $this->redirect('/site/error');
        }
        $resultInfo["params"]=$params;
        return $this->render('add.tpl',$resultInfo);
    }

    //编辑导航
    public function actionEdit(){
        
        //页面操作
        if(Yii::$app->request->isPost){
            $params=$this->getValidateParams('add');
            if($params['status']!=200){
                return $this->asJson($params);
            }
            $this->result = $this->serviceList['RbacService']->updateRbac($params['data']);
            return $this->asJson($this->result);
        }
        
        $params = $this->getParams();  //获取页面参数
        if(empty($params['id'])){
            $this->redirect('/site/error');
        }
        if(empty($params['pid'])){
            $this->redirect('/site/error');
        }
        $rbacInfo = $this->serviceList['RbacService']->getRbacInfo($params);
        $resultInfo["params"]=$params;
        $resultInfo["rbacInfo"]=$rbacInfo['data'];
        return $this->render('edit.tpl',$resultInfo);
    }

    //删除导航
    public function actionDelete(){
        
        $params=$this->getValidateParams('delete');
        if($params['status']!=200){
            return $this->asJson($params);
        }
        
        $this->result = $this->serviceList['RbacService']->deleteRbac($params['data']);
        return $this->asJson($this->result);

    }

    //获取参数规则
    public function getRulesArray($ruleIndex){
        $result['add']=array(  
            array('pid','required','message'=>'pid必须！'), 
        ); 
        
        $result['delete']=array(
            array('id','required','message'=>'id必须！'), 
        );
        
        return $result[$ruleIndex];
    }
    
   
}
