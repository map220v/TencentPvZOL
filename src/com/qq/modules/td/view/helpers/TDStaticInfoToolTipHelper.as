package com.qq.modules.td.view.helpers
{
   import asgui.managers.ToolTipManager;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.TDCropUtil;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TDStaticInfoToolTipHelper
   {
       
      
      private var view;
      
      private var _text:String;
      
      private var _info;
      
      private var checkNeeds:Boolean;
      
      public function TDStaticInfoToolTipHelper(param1:Boolean = true)
      {
         super();
         this.checkNeeds = param1;
      }
      
      private function updateText() : void
      {
         var _loc1_:TDCardData = null;
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         this._text = "";
         if(this._info is TDCardData)
         {
            _loc1_ = this._info as TDCardData;
            this._text = "<b>" + _loc1_.plantStaticInfo.baseInfo.name + "</b>\n" + _loc1_.plantStaticInfo.baseInfo.desc;
            if(_loc1_.cardSourceType == TDCardData.CARD_SOURCE_VIP && !_loc1_.isCanUse)
            {
               this._text += "\nVIP3专属植物，激活VIP3后可使用";
            }
            if(!_loc1_.roleId.compare(GameGloble.actorModel.roleId) && _loc1_.friendInfoData.type != TDConstant.FriendType_Random)
            {
               this._text += "\n\n来自好友：" + _loc1_.friendInfoData.name;
            }
            if(this.checkNeeds && TDGameInfo.getInstance().isRunningGame)
            {
               if(_loc1_.isCoolDown)
               {
                  this._text += "\n<font color=\'#ff0000\'>冷却中</font>";
               }
               else
               {
                  _loc2_ = TDCropUtil.isPlantUsable(_loc1_.plantStaticInfo.type);
                  if(_loc2_ != 0)
                  {
                     switch(_loc2_)
                     {
                        case TDConstant.Reason_NeedPreplant:
                           this._text += "\n<font color=\'#ff0000\'>需要先种植" + _loc1_.plantStaticInfo.baseInfo.prePlant.name + "</font>";
                           break;
                        case TDConstant.Reason_NotEnoughSun:
                           this._text += "\n<font color=\'#ff0000\'>阳光不足</font>";
                     }
                  }
               }
            }
            else if(_loc1_.plantStaticInfo.baseInfo.prePlantType != 0)
            {
               _loc3_ = TDGameInfo.getInstance().hasPlantCardByType(_loc1_.plantStaticInfo.baseInfo.prePlantType);
               if(!_loc3_)
               {
                  this._text += "\n<font color=\'#ff0000\'>需要选择" + _loc1_.plantStaticInfo.baseInfo.prePlant.name + "</font>";
               }
            }
         }
         else if(this._info is String)
         {
            this._text = this._info as String;
         }
      }
      
      public function addListen(param1:*, param2:*) : void
      {
         this._info = param2;
         this.view = param1;
         param1.addEventListener(MouseEvent.ROLL_OVER,this.overHandler);
         param1.addEventListener(MouseEvent.CLICK,this.clickHandler);
         param1.addEventListener(MouseEvent.ROLL_OUT,this.outHandler);
      }
      
      public function removeListen() : void
      {
         if(!this.view)
         {
            return;
         }
         this.view.removeEventListener(MouseEvent.ROLL_OVER,this.overHandler);
         this.view.removeEventListener(MouseEvent.CLICK,this.clickHandler);
         this.view.removeEventListener(MouseEvent.ROLL_OUT,this.outHandler);
         this.view = null;
         ToolTipManager.DestroyToolTip();
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         this.callOut();
      }
      
      protected function outHandler(param1:MouseEvent) : void
      {
         this.callOut();
      }
      
      protected function overHandler(param1:MouseEvent) : void
      {
         this.callOver();
      }
      
      public function callOver() : void
      {
         this.updateText();
         var _loc1_:Point = this.view.localToGlobal(new Point());
         var _loc2_:Number = 2 * int((_loc1_.x + this.view.width / 2) / 2);
         var _loc3_:Number = 2 * int((_loc1_.y + this.view.height) / 2);
         ToolTipManager.CreateToolTip(this._text,_loc2_,_loc3_,null);
      }
      
      public function callOut() : void
      {
         ToolTipManager.DestroyToolTip();
      }
   }
}
