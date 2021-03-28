package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.model.TDGameInfo;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqDisapperTimeout extends BaseNodePvz
   {
       
      
      private var _autoDisappearTime:Number = -1;
      
      public function ReqDisapperTimeout()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(this._autoDisappearTime == -1)
         {
            this._autoDisappearTime = _loc1_ + selfObj.objectModel.staticInfo.getParam(TDConstant.Plant_Param_SurvivalTime);
         }
         if(_loc1_ > this._autoDisappearTime)
         {
            return true;
         }
         return false;
      }
   }
}
