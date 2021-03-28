package com.qq.modules.td.model.vo
{
   import com.qq.constant.td.TDConstant;
   import flash.utils.Dictionary;
   
   public class TDUnitInitVO
   {
       
      
      public var posX:int;
      
      public var posY:int;
      
      public var row:int;
      
      public var column:int;
      
      public var type:int;
      
      public var catalog:int;
      
      public var delay:int;
      
      public var extraParam:Array;
      
      public var pathID:int;
      
      public var path:Vector.<TDPathPointVO>;
      
      public function TDUnitInitVO(param1:XML = null)
      {
         super();
         this.row = 0;
         this.column = 0;
         this.posX = 0;
         this.posY = 0;
         if(param1 != null)
         {
            this.loadXML(param1);
         }
      }
      
      public function init(param1:int, param2:int) : void
      {
         this.catalog = param1;
         this.type = param2;
      }
      
      public function setPosByColRow(param1:int, param2:int) : void
      {
         this.column = param1;
         this.row = param2;
      }
      
      public function setPosByCoord(param1:int, param2:int) : void
      {
         this.posX = param1;
         this.posY = param2;
      }
      
      public function loadXML(param1:XML) : void
      {
         this.row = param1.@row;
         this.column = param1.@column;
         this.posX = param1.@posX;
         this.posY = param1.@posY;
         this.type = param1.@type;
         this.catalog = param1.@catalog;
         this.delay = param1.@delay;
         if(param1.param[0] != null)
         {
            this.setExtraParam(TDConstant.Gameobject_Prop_InitParamXml,param1.param[0]);
         }
         if(param1.unitParams[0] != null)
         {
            this.setUnitParam(TDConstant.Gameobject_Prop_InitUnitParam,param1.unitParams[0]);
         }
      }
      
      public function setExtraParam(param1:int, param2:Object) : void
      {
         if(this.extraParam == null)
         {
            this.extraParam = new Array();
         }
         this.extraParam[param1] = param2;
      }
      
      public function setUnitParam(param1:int, param2:XML) : void
      {
         var _loc4_:XML = null;
         var _loc3_:Dictionary = new Dictionary();
         for each(_loc4_ in param2.param)
         {
            _loc3_[String(_loc4_.@key)] = String(_loc4_.@value);
         }
         if(this.extraParam == null)
         {
            this.extraParam = new Array();
         }
         this.extraParam[param1] = _loc3_;
      }
   }
}
