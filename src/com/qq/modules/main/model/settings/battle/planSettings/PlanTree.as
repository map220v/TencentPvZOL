package com.qq.modules.main.model.settings.battle.planSettings
{
   public class PlanTree
   {
       
      
      public var skillIdList:Array;
      
      public var planNodeList:Vector.<PlanNode>;
      
      public function PlanTree(param1:XML = null)
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:PlanNode = null;
         super();
         this.planNodeList = new Vector.<PlanNode>();
         if(param1 != null)
         {
            _loc2_ = String(param1.@skillId);
            if(_loc2_.length != 0)
            {
               this.skillIdList = _loc2_.split("|");
            }
            else
            {
               this.skillIdList = new Array();
            }
            _loc3_ = param1.children().length();
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               (_loc5_ = new PlanNode()).createByXML(param1.children()[_loc4_]);
               this.planNodeList.push(_loc5_);
               _loc4_++;
            }
         }
      }
   }
}
