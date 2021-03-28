package com.qq.modules.td.logic.unit.zombie
{
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.TDProxyCmd;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import net.sakri.flash.math.MathUtil;
   
   public class YetiZombie extends BasicZombie
   {
       
      
      public var isRunningAway:Boolean = false;
      
      public var runAwayTile:int;
      
      public var _killInfoed:Boolean;
      
      public function YetiZombie()
      {
         super();
         this.runAwayTile = MathUtil.getRandomUintInRange(2,4);
      }
      
      override public function lootItem() : void
      {
         super.lootItem();
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Yeti)
         {
            TDGameObjectCmd.addNormalGameObjectByPos(TDObjTypeID.Obj_YetiKey,this.x,this.y);
         }
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Yeti)
         {
            TDProxyCmd.killSnowMan();
         }
         else if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Normal)
         {
            TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Kill_Yeti_Num);
         }
      }
   }
}
