package com.qq.modules.td.logic.action.object.effect
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapWaveEnemyData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Point;
   
   public class TDSkillPortalZombieAction extends BasicAction
   {
       
      
      private var _summonZombie:BasicZombie;
      
      public function TDSkillPortalZombieAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         var _loc2_:TDMapWaveEnemyData = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_InitUnitParam);
         this._summonZombie = TDFactory.createBT_Zombie(_loc2_.type,null,_loc2_);
         var _loc3_:Point = TDGameInfo.getInstance().getZomebiePosByTile(_loc2_.startCol,_loc2_.roadIndex);
         TDGameObjectCmd.addZombieToStageByPos(this._summonZombie,_loc3_);
         this._summonZombie.setAction(TDConstant.ZAction_Idle);
         this._summonZombie.animation.stop();
         this._summonZombie.setShadeVisible(false);
         this._summonZombie.setFrozenAI(true);
         this._summonZombie.objectModel.addBuff(TDConstant.TDBuffID_God,null);
         this.onPortalComplete();
      }
      
      private function onPortalComplete() : void
      {
         this._summonZombie.setFrozenAI(false);
         this._summonZombie.setShadeVisible(true);
         this._summonZombie.objectModel.removeBuff(TDConstant.TDBuffID_God);
         _gameObject.Dispose();
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
   }
}
