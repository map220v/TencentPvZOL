package com.qq.modules.main.model.settings.battle.planSettings
{
   public class PlanNode
   {
       
      
      public var isDebug:int;
      
      public var planType:String;
      
      public var params:Array;
      
      public var delay:Number;
      
      public var des:String;
      
      public var planNodeList:Vector.<PlanNode>;
      
      public function PlanNode()
      {
         super();
      }
      
      public function createByXML(param1:XML) : void
      {
         var _loc4_:PlanNode = null;
         this.isDebug = param1.@debug;
         this.planType = param1.@planType;
         this.params = String(param1.@params).split("|");
         this.des = param1.@des;
         if(param1.@delay != null)
         {
            this.delay = param1.@delay;
         }
         else
         {
            this.delay = 0;
         }
         this.planNodeList = new Vector.<PlanNode>();
         var _loc2_:int = param1.children().length();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            (_loc4_ = new PlanNode()).createByXML(param1.children()[_loc3_]);
            this.planNodeList.push(_loc4_);
            _loc3_++;
         }
      }
      
      public function addNode(param1:PlanNode) : void
      {
         if(this.planNodeList == null)
         {
            this.planNodeList = new Vector.<PlanNode>();
         }
         this.planNodeList.push(param1);
      }
      
      public function createNodeByData(param1:String, param2:Array = null, param3:Number = 0, param4:int = 0, param5:String = "") : void
      {
         this.isDebug = param4;
         this.planType = param1;
         this.params = param2 == null ? [] : param2;
         this.des = param5;
         this.delay = param3;
      }
   }
}
