package asgui.blit.bone.rules
{
   import asgui.core.IDisposable;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class BlitBoneRule extends EventDispatcher implements IDisposable
   {
       
      
      protected var _hasSettedRule:Boolean;
      
      private var _hasDisposed:Boolean;
      
      public function BlitBoneRule(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public function get hasSettedRule() : Boolean
      {
         return this._hasSettedRule;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function Dispose() : void
      {
         this._hasDisposed = true;
      }
      
      public function getRuleCurrentString() : String
      {
         return "";
      }
   }
}
