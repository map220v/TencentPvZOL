package com.qq.modules.td.data.game.buff
{
   import com.qq.modules.basic.data.IStaticData;
   import com.qq.utils.data.PData;
   
   public class TDBuffStaticInfo implements IStaticData
   {
       
      
      public var id:int;
      
      public var catalog:int;
      
      public var name:String;
      
      public var effectValue:PData;
      
      public var duration:PData;
      
      private var _param:Array;
      
      public var removeBuffList:Array;
      
      public var invalidZombieCatalog:int;
      
      public var elementType:int;
      
      public function TDBuffStaticInfo()
      {
         super();
         this.effectValue = new PData();
         this.duration = new PData();
         this._param = new Array();
         this.removeBuffList = new Array();
      }
      
      public function load(param1:Object) : void
      {
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:Array = null;
         this.id = int(param1.id);
         this.catalog = int(param1.catalog);
         this.name = param1.name;
         this.effectValue.set(int(param1.effectValue));
         this.duration.set(int(param1.duration));
         var _loc2_:String = String(param1.param);
         if(_loc2_.length > 0)
         {
            _loc4_ = _loc2_.split("|");
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.split(":");
               this._param[int(_loc6_[0])] = _loc6_[1];
            }
         }
         var _loc3_:String = param1.removeBuffListStr;
         if(_loc3_.length > 0)
         {
            this.removeBuffList = _loc3_.split(":");
         }
         this.invalidZombieCatalog = param1.invalidZombieCatalog;
         this.elementType = int(param1.elementType);
      }
      
      public function getParam(param1:int) : *
      {
         return this._param[param1];
      }
      
      public function hasParam(param1:int) : Boolean
      {
         return this._param[param1] != null;
      }
   }
}
