package com.qq.modules.basic.event
{
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   
   public class CommonEvent extends Event
   {
       
      
      public var param:Object;
      
      public var nextCommandID:int;
      
      public function CommonEvent(param1:String, param2:Object = null)
      {
         super(param1);
         this.param = param2;
      }
      
      private static function isExistParam(param1:Object, param2:String, param3:Boolean = true) : Boolean
      {
         if(param1 == null || !param1.hasOwnProperty(param2))
         {
            if(param3)
            {
               getLogger().debug("读取的传递参数[" + param2 + "]不存在");
            }
            return false;
         }
         return true;
      }
      
      public function setCustomParam(param1:String, param2:*) : void
      {
         if(this.param == null)
         {
            this.param = new Object();
         }
         if(this.param.hasOwnProperty(param1))
         {
            getLogger().debug("传递参数[" + param1 + "]被覆盖");
         }
         this.param[param1] = param2;
      }
      
      public function readCustomParam_Number(param1:String) : Number
      {
         if(isExistParam(this.param,param1))
         {
            return Number(this.param[param1]);
         }
         return 0;
      }
      
      public function readCustomParam_String(param1:String) : String
      {
         if(isExistParam(this.param,param1))
         {
            return String(this.param[param1]);
         }
         return "";
      }
      
      public function readCustomParam(param1:String) : *
      {
         if(isExistParam(this.param,param1))
         {
            return this.param[param1];
         }
         return "";
      }
      
      public function hasCustmeParam(param1:String) : Boolean
      {
         return isExistParam(this.param,param1,false);
      }
      
      override public function clone() : Event
      {
         var _loc1_:CommonEvent = new CommonEvent(type,this.param);
         _loc1_.nextCommandID = this.nextCommandID;
         return _loc1_;
      }
   }
}
