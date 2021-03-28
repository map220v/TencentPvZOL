package com.qq.modules.td.logic.unit.unitFunctor.camelGroup
{
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.CamelZombie;
   import tencent.tools.group.BaseGroup;
   
   public class CamelGroup extends BaseGroup
   {
       
      
      public function CamelGroup()
      {
         super();
      }
      
      public function addBuff(param1:int, param2:CamelZombie = null, param3:IGameObject = null) : void
      {
         var _loc4_:int = radioBoxVec.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(param2)
            {
               if((radioBoxVec[_loc5_] as CamelZombie).uid != param2.uid)
               {
                  (radioBoxVec[_loc5_] as CamelZombie).model.addBuff(param1,param3);
               }
            }
            else
            {
               (radioBoxVec[_loc5_] as CamelZombie).model.addBuff(param1,param3);
            }
            _loc5_++;
         }
      }
      
      public function removeBuff(param1:int, param2:CamelZombie = null) : void
      {
         var _loc3_:int = radioBoxVec.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(param2)
            {
               if((radioBoxVec[_loc4_] as CamelZombie).uid != param2.uid)
               {
                  (radioBoxVec[_loc4_] as CamelZombie).model.removeBuff(param1);
               }
            }
            else
            {
               (radioBoxVec[_loc4_] as CamelZombie).model.removeBuff(param1);
            }
            _loc4_++;
         }
      }
      
      public function setFrozenAI(param1:Boolean, param2:CamelZombie = null) : void
      {
         var _loc3_:int = radioBoxVec.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(param2)
            {
               if((radioBoxVec[_loc4_] as CamelZombie).uid != param2.uid)
               {
                  (radioBoxVec[_loc4_] as CamelZombie).setFrozenAI(param1);
               }
            }
            else
            {
               (radioBoxVec[_loc4_] as CamelZombie).setFrozenAI(param1);
            }
            _loc4_++;
         }
      }
      
      public function setAction(param1:String = null, param2:Array = null, param3:Boolean = false, param4:CamelZombie = null) : void
      {
         var _loc5_:int = radioBoxVec.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if(param4)
            {
               if((radioBoxVec[_loc6_] as CamelZombie).uid != param4.uid)
               {
                  (radioBoxVec[_loc6_] as CamelZombie).setAction(param1,param2,param3);
               }
            }
            else
            {
               (radioBoxVec[_loc6_] as CamelZombie).setAction(param1,param2,param3);
            }
            _loc6_++;
         }
      }
   }
}
