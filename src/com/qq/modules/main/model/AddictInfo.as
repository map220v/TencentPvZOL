package com.qq.modules.main.model
{
   import PVZ.Cmd.E_AasAdultType;
   import PVZ.Cmd.E_AasState;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   
   public class AddictInfo
   {
      
      private static var _instance:AddictInfo;
       
      
      public var playerType:int;
      
      public var state:int;
      
      public var onlineTimeSecond:Number;
      
      public var isLoginCheckState:Boolean;
      
      public function AddictInfo()
      {
         super();
         this.playerType = E_AasAdultType.AasType_Adult;
         this.state = E_AasState.AasState_Health;
         this.onlineTimeSecond = 0;
         this.isLoginCheckState = false;
      }
      
      public static function getInstance() : AddictInfo
      {
         if(_instance == null)
         {
            _instance = new AddictInfo();
         }
         return _instance;
      }
      
      public function updateInfo(param1:int, param2:int) : void
      {
         this.playerType = param1;
         this.state = param2;
      }
      
      public function updateOnlineTime(param1:Number) : void
      {
         this.onlineTimeSecond = param1;
      }
      
      public function updateAddictRewardNum(param1:int, param2:int) : int
      {
         if(this.state == E_AasState.AasState_Health)
         {
            return param2;
         }
         var _loc3_:Boolean = false;
         var _loc4_:BagItemTemplate;
         if((_loc4_ = ItemTemplateFactory.instance.getBagItemTemplateById(param1)) != null && _loc4_.isAddict)
         {
            _loc3_ = true;
         }
         if(_loc3_)
         {
            switch(this.state)
            {
               case E_AasState.AasState_Tired:
                  param2 >>= 1;
                  break;
               case E_AasState.AasState_UnHealth:
                  param2 = 0;
            }
         }
         return param2;
      }
   }
}
