package com.qq.modules.td.view.game.layer.shadow
{
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.core.IDisposable;
   import com.qq.modules.td.data.map.TDMapRoadData;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.blit.QBlitUI;
   import flash.utils.Dictionary;
   
   public class TDShadowManager
   {
      
      private static var _instance:TDShadowManager;
       
      
      private var layer:IBlitDisplayContainer;
      
      private var shadows:Dictionary;
      
      public function TDShadowManager()
      {
         super();
      }
      
      public static function get instance() : TDShadowManager
      {
         if(_instance == null)
         {
            _instance = new TDShadowManager();
         }
         return _instance;
      }
      
      public function Dispose() : void
      {
         var _loc1_:* = undefined;
         this.layer = null;
         _instance = null;
         if(this.shadows)
         {
            for(_loc1_ in this.shadows)
            {
               (this.shadows[_loc1_] as IDisposable).Dispose();
               delete this.shadows[_loc1_];
            }
            this.shadows = null;
         }
      }
      
      public function Init(param1:IBlitDisplayContainer) : void
      {
         this.layer = param1;
         this.shadows = new Dictionary();
      }
      
      public function addShadowByTDGameObject(param1:IGameObject, param2:Number = 1, param3:Number = 1) : void
      {
         var _loc4_:IBlitClip;
         (_loc4_ = QBlitUI.createClipFromClassName("TD_GameRes_Shade")).scaleX = param2;
         _loc4_.scaleY = param3;
         this.layer.AddChild(_loc4_);
         this.shadows[param1] = _loc4_;
         this.updateShadowByTDGameObject(param1);
      }
      
      public function updateShadowByTDGameObject(param1:IGameObject, param2:Boolean = true, param3:Boolean = false, param4:int = 0, param5:int = 0) : void
      {
         var _loc7_:int = 0;
         var _loc8_:TDMapRoadData = null;
         var _loc6_:IBlitClip;
         if(!(_loc6_ = this.shadows[param1]))
         {
            return;
         }
         if(param3)
         {
            _loc7_ = !!(_loc8_ = TDGameInfo.getInstance().getRoadInfo(param1.objectModel.roadIndex)) ? int(_loc8_.endY + param5 - _loc6_.height * 0.5) : int(param1.y + param5 - _loc6_.height * 0.5);
         }
         else
         {
            _loc7_ = param1.y + param5 - _loc6_.height * 0.5;
         }
         _loc6_.x = param1.x - _loc6_.width * 0.5;
         _loc6_.y = _loc7_;
         _loc6_.visible = param2;
      }
      
      public function disposeShadowByTDGameObject(param1:IGameObject) : void
      {
         if(this.shadows == null)
         {
            return;
         }
         var _loc2_:IBlitClip = this.shadows[param1];
         if(_loc2_)
         {
            if(this.layer.Contains(_loc2_))
            {
               this.layer.RemoveChild(_loc2_);
            }
            _loc2_.Dispose();
            delete this.shadows[param1];
         }
      }
   }
}
