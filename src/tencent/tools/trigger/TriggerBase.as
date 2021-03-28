package tencent.tools.trigger
{
   public class TriggerBase implements ITrigger
   {
       
      
      protected var _triggerID:int;
      
      protected var triggerParams:Array;
      
      protected var _triggerType:Array;
      
      public function TriggerBase()
      {
         super();
      }
      
      public function setData(param1:int, param2:Array) : void
      {
         this._triggerID = param1;
         this.triggerParams = param2;
         this.init();
      }
      
      public function initialize() : void
      {
      }
      
      public function get triggerID() : int
      {
         return this._triggerID;
      }
      
      public function get triggerType() : Array
      {
         return this._triggerType;
      }
      
      public function notify(param1:String, param2:Array) : void
      {
      }
      
      public function execute() : Boolean
      {
         return false;
      }
      
      public function dispose() : void
      {
      }
      
      protected function init() : void
      {
      }
   }
}
