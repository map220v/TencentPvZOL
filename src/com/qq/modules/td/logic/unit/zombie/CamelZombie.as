package com.qq.modules.td.logic.unit.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.unit.unitFunctor.camelGroup.CamelGroup;
   import tencent.tools.group.GroupManager;
   import tencent.tools.group.IGroupTarget;
   
   public class CamelZombie extends BasicZombie implements IGroupTarget
   {
       
      
      public function CamelZombie()
      {
         super();
         GroupManager.getInstance().setDefaultGroupClass(CamelGroup);
      }
      
      override public function start() : void
      {
         super.start();
         GroupManager.getInstance().addToGroup(this.model.groupId,this);
      }
      
      override public function setAction(param1:String = null, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:CamelGroup = null;
         if(param1 == TDConstant.ZAction_Eat)
         {
            (_loc4_ = GroupManager.getInstance().getGroupFromID(this.model.groupId) as CamelGroup).setFrozenAI(true,this);
            _loc4_.setAction(TDConstant.ZAction_Idle,param2,param3,this);
         }
         if(param1 == TDConstant.ZAction_Walk && this.isFrozenAI() == false)
         {
            (_loc4_ = GroupManager.getInstance().getGroupFromID(this.model.groupId) as CamelGroup).setFrozenAI(false);
         }
         super.setAction(param1,param2,param3);
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         var _loc2_:CamelGroup = null;
         if(!this.isFrozenAI())
         {
            _loc2_ = GroupManager.getInstance().getGroupFromID(this.model.groupId) as CamelGroup;
            _loc2_.setFrozenAI(false);
         }
         GroupManager.getInstance().removeFromGroup(this.model.groupId,this);
         super.dispose(param1);
      }
   }
}
