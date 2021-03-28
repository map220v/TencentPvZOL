package com.qq.modules.td.logic.action.object.barrel
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class BarrelActionDie extends BasicAction
   {
       
      
      public function BarrelActionDie()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
         _gameObject.animation.gotoAndPlay(TDConstant.ZombieAnmi_Death);
         _gameObject.isVaild = false;
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(_gameObject.x,_gameObject.y);
         var _loc3_:int = 1;
         var _loc4_:int = TDGameInfo.getInstance().maxCol - 2;
         if(_loc2_)
         {
            _loc3_ = Math.min(_loc2_.roadCol + 1,_loc3_);
            _loc4_ = Math.max(_loc2_.roadCol + 1,TDGameInfo.getInstance().maxCol - 2);
         }
         TDGameObjectCmd.popZombieInArea([TDConstant.ZombieType_ImpPirate,TDConstant.ZombieType_ImpPirate],_gameObject.x,_gameObject.y,_loc3_,_loc4_);
      }
      
      private function onFinishAction(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _gameObject.setRunningProp(TDConstant.Gameobject_Prop_Die_Popup_Zombie,false);
         _gameObject.Dispose();
      }
   }
}
