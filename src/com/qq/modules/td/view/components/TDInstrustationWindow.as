package com.qq.modules.td.view.components
{
   import com.qq.display.avater.QBasicTDAvater;
   
   public class TDInstrustationWindow extends TDInstrustationWindowCE
   {
       
      
      public var reviewer:QBasicTDAvater;
      
      public function TDInstrustationWindow()
      {
         super(TDInstrustationWindowMediator);
      }
      
      override public function Dispose() : void
      {
         if(this.reviewer != null)
         {
            this.reviewer.Dispose();
            this.reviewer = null;
         }
         super.Dispose();
      }
   }
}
