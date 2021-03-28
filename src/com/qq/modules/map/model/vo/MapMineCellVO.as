package com.qq.modules.map.model.vo
{
   import PVZ.Cmd.Dto_WorldMap_CellInfo;
   import PVZ.Cmd.E_MineHoldState;
   import com.tencent.protobuf.Int64;
   
   public class MapMineCellVO extends MapBasicCellVO
   {
       
      
      public var carts:Vector.<MapMineCartVO>;
      
      public function MapMineCellVO(param1:Dto_WorldMap_CellInfo = null, param2:Int64 = null)
      {
         this.carts = new Vector.<MapMineCartVO>(5,true);
         super(param1,param2);
      }
      
      public function getCart(param1:int) : MapMineCartVO
      {
         return this.carts[param1];
      }
      
      public function get isMineAlliance() : Boolean
      {
         return this.mineState == E_MineHoldState.E_MineHoldState_GuildHold;
      }
      
      public function get isFakeMine() : Boolean
      {
         return roleId != null && roleId.isZero();
      }
      
      public function get mineState() : int
      {
         return dto.mineState;
      }
      
      override public function loadDto(param1:Dto_WorldMap_CellInfo) : void
      {
         super.loadDto(param1);
      }
      
      public function addCart(param1:MapMineCartVO, param2:MapCityCellVO) : void
      {
         if(param2.pos.x < param1.pos.x)
         {
            if(param2.pos.y < param1.pos.y)
            {
               this.carts[1] = param1;
            }
            else
            {
               this.carts[3] = param1;
            }
         }
         else if(param2.pos.y < param1.pos.y)
         {
            this.carts[2] = param1;
         }
         else
         {
            this.carts[4] = param1;
         }
         dto.guildFlag = param2.guildFlag;
      }
      
      public function removeCartByFromCity(param1:MapCityCellVO) : MapMineCartVO
      {
         var _loc2_:int = 0;
         var _loc3_:MapMineCartVO = null;
         _loc2_ = 0;
         while(_loc2_ < this.carts.length)
         {
            _loc3_ = this.carts[_loc2_];
            if(_loc3_ && _loc3_.city == param1)
            {
               this.carts[_loc2_] = null;
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getCartByFromCity(param1:MapCityCellVO) : MapMineCartVO
      {
         var _loc2_:int = 0;
         var _loc3_:MapMineCartVO = null;
         _loc2_ = 0;
         while(_loc2_ < this.carts.length)
         {
            _loc3_ = this.carts[_loc2_];
            if(_loc3_ && _loc3_.city == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function resetCarts() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.carts.length)
         {
            this.carts[_loc1_] = null;
            _loc1_++;
         }
      }
   }
}
