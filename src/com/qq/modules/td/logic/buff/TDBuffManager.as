package com.qq.modules.td.logic.buff
{
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   
   public class TDBuffManager
   {
      
      private static var _instance:TDBuffManager;
       
      
      public function TDBuffManager()
      {
         super();
      }
      
      public static function getInstance() : TDBuffManager
      {
         if(_instance == null)
         {
            _instance = new TDBuffManager();
         }
         return _instance;
      }
      
      public function addGameObjectsBuffWithBuffId(param1:Array, param2:uint) : void
      {
         var _loc3_:IGameObject = null;
         for each(_loc3_ in param1)
         {
            if(_loc3_ && _loc3_.objectModel.isPermitMove())
            {
               _loc3_.objectModel.addBuff(param2,_loc3_);
            }
         }
      }
      
      public function removeZombieBuff(param1:BasicZombie, param2:int) : void
      {
         param1.zombieData.removeBuff(param2);
      }
   }
}
