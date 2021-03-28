package com.qq.modules.td.view.game
{
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.game.unit.TDNormalObjectStaticInfo;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.object.TDSun;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.db.ClientDBTableName;
   
   public class TDTopEffectLayerMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDTopEffectLayer;
      
      private var _sunGuided:Boolean;
      
      private var _leafGuided:Boolean;
      
      public function TDTopEffectLayerMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_CollectSun,this.onCollectSun,CommonEvent);
         addContextListener(CommandName.TD_CollectLeaf,this.onCollectLeaf,CommonEvent);
         addContextListener(CommandName.TD_CollectCard,this.onCollectCard,CommonEvent);
      }
      
      private function onCollectLeaf(param1:CommonEvent) : void
      {
         var _loc2_:IGameObject = param1.readCustomParam("obj");
         if(_loc2_ != null && !_loc2_.isVaild)
         {
            return;
         }
         var _loc3_:int = TDGameInfo.getInstance().leafTargetX;
         var _loc4_:int = TDGameInfo.getInstance().leafTargetY;
         TweenMax.to(_loc2_,0.5,{
            "x":_loc3_,
            "y":_loc4_,
            "onComplete":this.onFinishLeafMove,
            "onCompleteParams":[_loc2_]
         });
      }
      
      private function onFinishLeafMove(param1:IGameObject) : void
      {
         if(param1 != null && !param1.isVaild)
         {
            return;
         }
         var _loc2_:TDNormalObjectStaticInfo = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_ObjectInfo,param1.objectModel.unitType,TDNormalObjectStaticInfo);
         TDGameCmd.changeFuel(_loc2_.getParam(TDConstant.NormalObj_Param_FuelNum));
         TweenMax.to(param1,1.2,{
            "scaleX":0.1,
            "scaleY":0.1,
            "alpha":0,
            "onComplete":this.onCollectFinish,
            "onCompleteParams":[param1]
         });
         if(!this._leafGuided)
         {
            this._leafGuided = true;
            GuideCmd.tryGuide("td_guide_use_leaf");
         }
      }
      
      private function onCollectSun(param1:CommonEvent) : void
      {
         TDSoundCmd.collectSun();
         var _loc2_:IGameObject = param1.readCustomParam("obj");
         if(_loc2_ != null && !_loc2_.isVaild)
         {
            return;
         }
         var _loc3_:int = TDGameInfo.getInstance().sunTargetX;
         var _loc4_:int = TDGameInfo.getInstance().sunTargetY;
         TweenMax.to(_loc2_,0.5,{
            "x":_loc3_,
            "y":_loc4_,
            "onComplete":this.onFinishSunMove,
            "onCompleteParams":[_loc2_]
         });
      }
      
      private function onFinishSunMove(param1:IGameObject) : void
      {
         if(param1 != null && !param1.isVaild)
         {
            return;
         }
         var _loc2_:TDNormalObjectStaticInfo = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_ObjectInfo,param1.objectModel.staticInfo.type,TDNormalObjectStaticInfo) as TDNormalObjectStaticInfo;
         var _loc3_:int = _loc2_.getParam(TDConstant.NormalObj_Param_SunNum);
         if(param1 is TDSun)
         {
            TDGameCmd.changeSun(_loc3_);
            if(!this._sunGuided)
            {
               this._sunGuided = true;
               GuideCmd.tryGuide("td_guide_crop_second_plant");
            }
         }
         TweenMax.to(param1,0.5,{
            "scaleX":0.4,
            "scaleY":0.4,
            "alpha":0,
            "onComplete":this.onCollectFinish,
            "onCompleteParams":[param1]
         });
      }
      
      private function onCollectCard(param1:CommonEvent) : void
      {
         var _loc2_:IGameObject = param1.readCustomParam("obj");
         if(_loc2_ != null && !_loc2_.isVaild)
         {
            return;
         }
         var _loc3_:int = TDGameInfo.getInstance().dropCardTargetX;
         var _loc4_:int = TDGameInfo.getInstance().dropCardTargetY;
         TweenMax.to(_loc2_,0.5,{
            "x":_loc3_,
            "y":_loc4_,
            "onComplete":this.onFinishCardMove,
            "onCompleteParams":[_loc2_]
         });
      }
      
      private function onFinishCardMove(param1:IGameObject) : void
      {
         if(param1 != null && !param1.isVaild)
         {
            return;
         }
         var _loc2_:int = param1.getRunningProp(TDConstant.GameObject_Prop_DropCardId);
         TDGameCmd.addTrackCard(_loc2_);
         TweenMax.to(param1,1.2,{
            "scaleX":0.1,
            "scaleY":0.1,
            "alpha":0,
            "onComplete":this.onCollectFinish,
            "onCompleteParams":[param1]
         });
      }
      
      private function onCollectFinish(param1:IGameObject) : void
      {
         if(param1 != null && !param1.isVaild)
         {
            return;
         }
         param1.setAction(TDConstant.ObjectAction_Disappear);
      }
   }
}
