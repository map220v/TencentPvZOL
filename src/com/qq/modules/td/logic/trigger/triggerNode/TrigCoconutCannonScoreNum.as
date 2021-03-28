package com.qq.modules.td.logic.trigger.triggerNode
{
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.model.TDMiniGameCoconutCannonData;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.data.PData;
   import org.as3commons.logging.api.getLogger;
   
   public class TrigCoconutCannonScoreNum extends TrigPvz
   {
       
      
      private var goalScore:PData;
      
      public function TrigCoconutCannonScoreNum()
      {
         super();
         this.goalScore = new PData();
      }
      
      override protected function init() : void
      {
         this.goalScore.set(triggerParams[0]);
         _triggerType = [TDTrigConst.TYPE_COCONUT_CANNON_GAME_SCORE];
         this.ui.txt.text = FontHKHB.DOING;
         getLogger("trigger").debug("TrigCoconutCannonScoreNum: " + this.goalScore);
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
         super.notify(param1,param2);
         var _loc3_:int = TDMiniGameCoconutCannonData.getInstance().totalScore;
         if(_loc3_ >= this.goalScore.get())
         {
            this.setResult(true);
         }
      }
      
      override public function execute() : Boolean
      {
         var _loc1_:int = TDMiniGameCoconutCannonData.getInstance().totalScore;
         if(_loc1_ >= this.goalScore.get())
         {
            this.setResult(true);
            return true;
         }
         this.setResult(false);
         return false;
      }
      
      override protected function setResult(param1:Boolean) : void
      {
         super.setResult(param1);
      }
   }
}
