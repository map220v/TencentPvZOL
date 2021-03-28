package tencent.tools.trigger
{
   import flash.utils.Dictionary;
   
   public class TriggerCenter
   {
       
      
      private var triggerDic:Dictionary;
      
      public function TriggerCenter()
      {
         super();
         this.triggerDic = new Dictionary();
      }
      
      public function addTrigger(param1:ITrigger) : void
      {
         var _loc2_:Array = param1.triggerType;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(this.triggerDic[param1.triggerType[_loc3_]] == null)
            {
               this.triggerDic[param1.triggerType[_loc3_]] = new Vector.<ITrigger>();
            }
            (this.triggerDic[param1.triggerType[_loc3_]] as Vector.<ITrigger>).push(param1);
            _loc3_++;
         }
      }
      
      public function notifyTrigger(param1:String, param2:Array, param3:Boolean) : void
      {
         var _loc4_:Vector.<ITrigger>;
         if((_loc4_ = this.triggerDic[param1] as Vector.<ITrigger>) == null)
         {
            return;
         }
         var _loc5_:int;
         var _loc6_:int = (_loc5_ = _loc4_.length) - 1;
         while(_loc6_ >= 0)
         {
            if(param3)
            {
               _loc4_[_loc6_].execute();
            }
            else
            {
               _loc4_[_loc6_].notify(param1,param2);
            }
            _loc6_--;
         }
      }
      
      public function notifyTriggerAll(param1:Boolean) : void
      {
         var _loc2_:Vector.<ITrigger> = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         for each(_loc2_ in this.triggerDic)
         {
            _loc3_ = _loc2_.length;
            _loc4_ = _loc3_ - 1;
            while(_loc4_ >= 0)
            {
               _loc2_[_loc4_].execute();
               _loc4_--;
            }
         }
      }
      
      public function removeTrigger(param1:ITrigger) : Boolean
      {
         var _loc4_:Vector.<ITrigger> = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:Array = param1.triggerType;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(this.triggerDic[param1.triggerType[_loc3_]])
            {
               _loc5_ = (_loc4_ = this.triggerDic[param1.triggerType[_loc3_]] as Vector.<ITrigger>).length;
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  if(_loc4_[_loc6_] === param1)
                  {
                     _loc4_.splice(_loc6_,1);
                     return true;
                  }
                  _loc6_++;
               }
            }
            _loc3_++;
         }
         return false;
      }
      
      public function removeAll() : void
      {
         this.triggerDic = new Dictionary();
      }
   }
}
