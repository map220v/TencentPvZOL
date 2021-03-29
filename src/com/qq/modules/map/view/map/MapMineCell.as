package com.qq.modules.map.view.map
{
   import PVZ.Cmd.E_MineHoldState;
   import asgui.utils.DisplayUtil;
   import com.qq.modules.map.model.vo.MapBasicCellVO;
   import com.qq.modules.map.model.vo.MapMineCartVO;
   import com.qq.modules.map.model.vo.MapMineCellVO;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class MapMineCell extends MapBasicCell
   {
      
      private static const FLAG_0:String = "flag_0";
      
      private static const FLAG_STANDBY:String = "flag_standby";
       
      
      private var workingCart:Vector.<MovieClip>;
      
      private var workingCenter:MovieClip;
      
      private var playingMcIndex:int;
      
      private var playingMc:MovieClip;
      
      public function MapMineCell()
      {
         this.workingCart = new Vector.<MovieClip>();
         super();
         this.hasAllianceFlag = true;
      }
      
      override public function Dispose() : void
      {
         this.workingCart = null;
         this.workingCenter = null;
         super.Dispose();
      }
      
      override public function loadVO(param1:MapBasicCellVO) : void
      {
         var _loc3_:int = 0;
         var _loc4_:MovieClip = null;
         var _loc5_:MovieClip = null;
         var _loc6_:MovieClip = null;
         var _loc7_:MovieClip = null;
         var _loc8_:MapMineCartVO = null;
         var _loc9_:TextField = null;
         super.loadVO(param1);
         var _loc2_:MapMineCellVO = param1 as MapMineCellVO;
         if(mc)
         {
            this.workingCart.length = 0;
            this.workingCenter = mc["cart_center"] as MovieClip;
            _loc3_ = 1;
            while(_loc3_ <= 4)
            {
               _loc4_ = mc["cart_" + _loc3_] as MovieClip;
               _loc5_ = mc["gold_" + _loc3_] as MovieClip;
               _loc6_ = mc["txt_" + _loc3_] as MovieClip;
               _loc7_ = mc["zombie"] as MovieClip;
               if(_loc8_ = _loc2_.getCart(_loc3_))
               {
                  this.workingCart.push(_loc4_);
                  _loc4_.gotoAndStop(FLAG_STANDBY);
                  _loc6_.gotoAndStop(FLAG_STANDBY);
                  _loc5_.gotoAndStop(_loc8_.getGoldFlag());
                  (_loc9_ = _loc6_["txt"]).text = _loc8_.roleName;
               }
               else
               {
                  _loc4_.gotoAndStop(FLAG_0);
                  _loc5_.gotoAndStop(FLAG_0);
                  _loc6_.gotoAndStop(FLAG_0);
               }
               _loc7_.visible = _loc2_.mineState == E_MineHoldState.E_MineHoldState_NPC;
               _loc3_++;
            }
            this.workingCenter.gotoAndStop(FLAG_0);
            this.reRunWorkingCart();
         }
      }
      
      private function reRunWorkingCart() : void
      {
         this.playingMcIndex = 0;
         this.playNextWorkingCart();
      }
      
      private function playNextWorkingCart() : void
      {
         if(this.playingMc)
         {
            this.playingMc.gotoAndStop(FLAG_STANDBY);
            this.playingMc = null;
         }
         if(this.workingCart && this.workingCart.length > 0)
         {
            ++this.playingMcIndex;
            if(this.playingMcIndex >= this.workingCart.length)
            {
               this.playingMcIndex = 0;
            }
            this.playingMc = this.workingCart[this.playingMcIndex];
            this.playingMc.gotoAndPlay(FLAG_STANDBY);
            this.workingCenter.gotoAndPlay(FLAG_STANDBY);
            DisplayUtil.AddPlayCompleteCallBack(this.playingMc,this.playNextWorkingCart);
         }
      }
   }
}
