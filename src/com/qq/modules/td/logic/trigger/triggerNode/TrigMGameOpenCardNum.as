package com.qq.modules.td.logic.trigger.triggerNode
{
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import org.as3commons.logging.api.getLogger;
   
   public class TrigMGameOpenCardNum extends TrigPvz
   {
       
      
      private var maxNum:int;
      
      private var curNum:int;
      
      public function TrigMGameOpenCardNum()
      {
         super();
      }
      
      override protected function init() : void
      {
         this.maxNum = triggerParams[0];
         this.curNum = 0;
         _triggerType = [TDTrigConst.TYPE_MGAME_OPEN_CARD];
         getLogger("trigger").debug("TrigMGameOpenCardNum: " + this.maxNum);
         this.ui.txt.text = this.maxNum.toString();
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
         ++this.curNum;
         this.ui.txt.text = (this.maxNum - this.curNum).toString();
         if(this.curNum > this.maxNum)
         {
            setResult(false);
         }
      }
      
      override public function execute() : Boolean
      {
         if(this.curNum > this.maxNum)
         {
            setResult(false);
            return false;
         }
         setResult(true);
         return true;
      }
   }
}
