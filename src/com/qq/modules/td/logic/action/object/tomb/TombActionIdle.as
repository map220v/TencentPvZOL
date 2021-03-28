package com.qq.modules.td.logic.action.object.tomb
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   
   public class TombActionIdle extends BasicAction
   {
       
      
      public var MaxDamageState:int = 5;
      
      private var lastState:int = -1;
      
      private var _raisePosY:int;
      
      private var _lastTime:int;
      
      public var tombW:int = 63;
      
      public var tombH:int = 79;
      
      public function TombActionIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.stop();
         this.updateDamageState();
         TDEffectCmd.playBlitAnimation(3400,_gameObject.x,_gameObject.y);
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(_gameObject.objectModel.tileIndex);
         if(_loc2_ != null)
         {
            _loc2_.setState(TDConstant.RoadTileState_Has_Tomb);
         }
      }
      
      override public function runningState() : void
      {
         this.updateDamageState();
         super.runningState();
      }
      
      private function updateDamageState() : void
      {
         var _loc1_:int = 1 + (1 - _gameObject.objectModel.curHp.get() / _gameObject.objectModel.maxHp.get()) * this.MaxDamageState;
         if(_loc1_ == this.lastState)
         {
            return;
         }
         if(_loc1_ <= this.MaxDamageState)
         {
            _gameObject.animation.gotoAndStop("state" + _loc1_);
         }
         this.lastState = _loc1_;
         var _loc2_:int = _gameObject.x;
         var _loc3_:int = _gameObject.y;
         switch(_loc1_)
         {
            case 3:
               TDEffectCmd.playBlitAnimation(3500,_loc2_,_loc3_,new TDEffectPlayInfo("animation"));
               break;
            case 4:
               TDEffectCmd.playBlitAnimation(3500,_loc2_,_loc3_,new TDEffectPlayInfo("animation2"));
               break;
            case 5:
               TDEffectCmd.playBlitAnimation(3500,_loc2_,_loc3_,new TDEffectPlayInfo("animation3"));
               break;
            case 6:
               TDEffectCmd.playBlitAnimation(3500,_loc2_,_loc3_,new TDEffectPlayInfo("animation4"));
               _gameObject.dispose();
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(_gameObject.objectModel.tileIndex);
         if(_loc1_ != null)
         {
            _loc1_.cleanState(TDConstant.RoadTileState_Has_Tomb);
         }
         super.dispose();
      }
   }
}
