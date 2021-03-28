package com.qq.modules.td.logic.trigger.triggerNode
{
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.utils.data.PData;
   import org.as3commons.logging.api.getLogger;
   
   public class TrigMGameScoreNum extends TrigPvz
   {
       
      
      private var goalScore:PData;
      
      private var cacheScore:PData;
      
      public function TrigMGameScoreNum()
      {
         super();
         this.goalScore = new PData();
         this.cacheScore = new PData();
      }
      
      override protected function init() : void
      {
         this.goalScore.set(triggerParams[0]);
         this.cacheScore.set(0);
         _triggerType = [TDTrigConst.TYPE_MGAME_SCORE];
         getLogger("trigger").debug("TrigMGameScoreNum: " + this.goalScore);
         this.ui.txt.text = "0";
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
         this.cacheScore.set(param2[0]);
         this.ui.txt.text = this.cacheScore.get().toString();
         if(this.cacheScore.get() >= this.goalScore.get())
         {
            this.setResult(true);
         }
      }
      
      override public function execute() : Boolean
      {
         if(this.cacheScore.get() >= this.goalScore.get())
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
