package com.qq.modules.td.logic.unit.object
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.utils.CommandDispatcher;
   import flash.events.MouseEvent;
   
   public class TDLeaf extends TDNormalObject
   {
       
      
      public function TDLeaf()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         addMouseEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
      }
      
      private function onRollOver() : void
      {
         removeMouseEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         setAction(TDConstant.LeafAction_Collect);
         CommandDispatcher.send(CommandName.TD_CollectLeaf,{"obj":this});
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         removeMouseEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         super.dispose();
      }
   }
}
